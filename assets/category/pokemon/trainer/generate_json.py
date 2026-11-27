import json
import os
import urllib.parse
import webbrowser
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

BASE_URL = (
    "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/"
    "refs/heads/master/assets/category/pokemon/trainer"
)
DEFAULT_OUTPUT_FILE = "level_trainers.json"
MAX_LEVEL = 100  # Niveaux générés : 1, 5, 10, 15, ..., 100


def get_levels() -> list[int]:
    return [1] + list(range(5, MAX_LEVEL + 1, 5))


def list_png_files(directory: Path) -> list[str]:
    return sorted(
        p.name
        for p in directory.iterdir()
        if p.is_file() and p.suffix.lower() == ".png"
    )


def build_html_page(png_files: list[str], levels: list[int], default_file: str) -> str:
    data_json = json.dumps(
        {
            "pngFiles": png_files,
            "levels": levels,
            "baseUrl": BASE_URL,
            "defaultOutputFile": default_file,
        },
        ensure_ascii=False,
    ).replace("</", "<\\/")

    return f"""<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8" />
<title>Éditeur de Sprites - Niveaux &amp; Autres</title>
<style>
  * {{ box-sizing: border-box; }}
  body {{
    margin: 0;
    font-family: system-ui, -apple-system, sans-serif;
    background: #121417;
    color: #eef1f4;
    display: flex;
    flex-direction: column;
    height: 100vh;
  }}
  header {{
    background: #1b1f24;
    border-bottom: 1px solid #2d333b;
    padding: 10px 16px;
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    align-items: center;
    justify-content: space-between;
  }}
  .file-bar {{
    display: flex;
    gap: 8px;
    align-items: center;
    flex-wrap: wrap;
  }}
  .file-bar input[type="text"] {{
    width: 220px;
    padding: 6px 9px;
    font-size: 13px;
  }}
  .actions {{
    display: flex;
    gap: 8px;
    align-items: center;
    flex-wrap: wrap;
  }}
  button {{
    font-family: inherit;
    cursor: pointer;
    border-radius: 6px;
    font-size: 13px;
  }}
  button.primary {{
    background: #238636;
    color: #fff;
    border: none;
    padding: 7px 13px;
    font-weight: 600;
  }}
  button.primary:hover {{ background: #2ea043; }}
  button.secondary {{
    background: #24292f;
    color: #e6edf3;
    border: 1px solid #3b434d;
    padding: 7px 11px;
  }}
  button.secondary:hover {{ background: #2d333b; }}
  button.danger {{
    background: #3d181c;
    color: #ffa198;
    border: 1px solid #8e242c;
    padding: 5px 9px;
    font-size: 12px;
  }}
  .main-layout {{
    display: grid;
    grid-template-columns: 360px 1fr;
    flex: 1;
    min-height: 0;
  }}
  aside {{
    background: #181c20;
    border-right: 1px solid #2d333b;
    padding: 14px;
    display: flex;
    flex-direction: column;
    gap: 12px;
    overflow-y: auto;
  }}
  .mode-switch {{
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 6px;
    background: #11151a;
    padding: 4px;
    border-radius: 8px;
    border: 1px solid #2d333b;
  }}
  .mode-btn {{
    padding: 7px;
    border: none;
    background: transparent;
    color: #9da7b3;
    font-weight: 600;
  }}
  .mode-btn.active {{
    background: #1f6feb;
    color: #fff;
  }}
  .level-list {{
    display: flex;
    gap: 5px;
    flex-wrap: wrap;
  }}
  .lvl-btn {{
    background: #24292f;
    color: #c9d1d9;
    border: 1px solid #373e47;
    border-radius: 6px;
    padding: 4px 7px;
    font-size: 12px;
  }}
  .lvl-btn.done {{
    border-color: #2ea043;
    color: #7ee787;
  }}
  .lvl-btn.active {{
    background: #1f6feb;
    border-color: #58a6ff;
    color: #fff;
    font-weight: 700;
  }}
  label {{
    font-size: 12px;
    color: #9da7b3;
    display: block;
    margin-bottom: 4px;
  }}
  input[type="text"], input[type="number"], select {{
    width: 100%;
    padding: 7px 10px;
    border-radius: 6px;
    border: 1px solid #373e47;
    background: #0d1117;
    color: #f0f6fc;
    font-size: 13px;
  }}
  .selected-preview {{
    background: #11151a;
    border: 1px solid #2d333b;
    border-radius: 8px;
    padding: 10px;
    text-align: center;
  }}
  .selected-preview img {{
    max-width: 84px;
    max-height: 84px;
    image-rendering: pixelated;
    display: block;
    margin: 0 auto 6px;
  }}
  .other-list {{
    display: flex;
    flex-direction: column;
    gap: 6px;
    max-height: 220px;
    overflow-y: auto;
  }}
  .other-item {{
    background: #11151a;
    border: 1px solid #2d333b;
    border-radius: 6px;
    padding: 8px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 8px;
    cursor: pointer;
  }}
  .other-item.active {{
    border-color: #58a6ff;
    background: #17263b;
  }}
  .other-meta {{
    font-size: 12px;
    line-height: 1.3;
  }}
  .other-sub {{
    font-size: 11px;
    color: #8b949e;
  }}
  .grid-panel {{
    display: flex;
    flex-direction: column;
    min-height: 0;
    padding: 14px 18px;
  }}
  .search-bar {{
    display: flex;
    gap: 8px;
    margin-bottom: 12px;
    align-items: center;
  }}
  .search-bar input {{
    flex: 1;
  }}
  .count-badge {{
    font-size: 13px;
    color: #9da7b3;
    white-space: nowrap;
  }}
  .grid {{
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(116px, 1fr));
    gap: 10px;
    overflow-y: auto;
    padding-right: 4px;
  }}
  .tile {{
    background: #1b1f24;
    border: 2px solid #2b3139;
    border-radius: 8px;
    padding: 8px 6px;
    text-align: center;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 6px;
  }}
  .tile:hover {{ border-color: #6e7681; }}
  .tile.selected {{
    border-color: #58a6ff;
    background: #17263b;
  }}
  .tile img {{
    width: 64px;
    height: 64px;
    object-fit: contain;
    image-rendering: pixelated;
  }}
  .tile .fname {{
    font-size: 11px;
    word-break: break-word;
    color: #d0d7de;
    line-height: 1.25;
  }}
  .status {{
    font-size: 12px;
    color: #7ee787;
    min-height: 16px;
  }}
  .hidden {{ display: none !important; }}
</style>
</head>
<body>
<header>
  <div class="file-bar">
    <label for="filePathInput" style="margin:0;">Fichier JSON :</label>
    <input type="text" id="filePathInput" />
    <button class="secondary" id="loadDiskBtn" type="button">Charger ce fichier</button>
    <input type="file" id="uploadFileInput" accept=".json,application/json" style="display:none;" />
    <button class="secondary" id="pickLocalFileBtn" type="button">Importer un JSON…</button>
  </div>
  <div class="actions">
    <button class="primary" id="saveBtn" type="button">Enregistrer le JSON</button>
  </div>
</header>

<div class="main-layout">
  <aside>
    <div class="mode-switch">
      <button type="button" class="mode-btn active" id="modeLevelBtn">Niveaux (1, 5, 10…)</button>
      <button type="button" class="mode-btn" id="modeOtherBtn">Autres (<span id="otherCount">0</span>)</button>
    </div>

    <div id="levelSection">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;">
        <strong id="currentLevelTitle">Niveau 1</strong>
        <div style="display:flex;gap:4px;">
          <button class="secondary" id="prevLevelBtn" type="button">←</button>
          <button class="secondary" id="nextLevelBtn" type="button">→</button>
        </div>
      </div>
      <div class="level-list" id="levelButtons"></div>
    </div>

    <div id="otherSection" class="hidden">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;">
        <strong>Entrées Autres (challenge / shop)</strong>
        <button class="primary" id="addOtherBtn" type="button">+ Ajouter</button>
      </div>
      <div class="other-list" id="otherList"></div>
    </div>

    <div id="editorCard">
      <div class="selected-preview">
        <img id="previewImg" src="" alt="" />
        <div id="previewFile" style="font-size:12px;color:#8b949e;word-break:break-all;">Aucune image sélectionnée</div>
      </div>

      <div style="margin-top:10px;">
        <label for="nameFrInput">NameFR</label>
        <input type="text" id="nameFrInput" placeholder="Nom FR" />
      </div>

      <div style="margin-top:8px;">
        <label for="nameEnInput">NameEn</label>
        <input type="text" id="nameEnInput" placeholder="Nom EN" />
      </div>

      <div id="otherFields" class="hidden" style="margin-top:8px;">
        <label for="unlockTypeSelect">Type de déblocage</label>
        <select id="unlockTypeSelect">
          <option value="challenge">challenge</option>
          <option value="shop">shop</option>
        </select>

        <div style="margin-top:8px;">
          <label for="unlockValueInput" id="unlockValueLabel">ID du challenge</label>
          <input type="text" id="unlockValueInput" placeholder="ex: 6 ou venimous-1" />
        </div>

        <div style="margin-top:8px;">
          <label for="customIdInput">ID de l'entrée</label>
          <input type="text" id="customIdInput" placeholder="ex: challenge-venimous-1" />
        </div>
      </div>

      <div style="margin-top:10px;display:flex;gap:6px;">
        <button class="primary" id="validateBtn" type="button" style="flex:1;">Valider</button>
        <button class="danger hidden" id="deleteOtherBtn" type="button">Supprimer</button>
      </div>
    </div>

    <div class="status" id="statusMsg"></div>
  </aside>

  <section class="grid-panel">
    <div class="search-bar">
      <input type="text" id="searchInput" placeholder="Rechercher un fichier .png (ex: bugcatcher, gen1, ace)..." autofocus />
      <button class="secondary" id="clearSearchBtn" type="button">Rechercher / Effacer</button>
      <span class="count-badge" id="countBadge"></span>
    </div>
    <div class="grid" id="spriteGrid"></div>
  </section>
</div>

<script>
const APP_DATA = {data_json};

let mode = "level"; // "level" | "other"
let currentLevelIdx = 0;
let levelEntries = {{}}; // level -> {{ ID, NameFR, NameEn, file }}
let otherEntries = []; // [ {{ ID, NameFR, NameEn, file, unlockType, unlockValue }} ]
let selectedOtherIdx = null;
let selectedFile = null;

function defaultName(filename) {{
  const stem = (filename || "").replace(/\\.png$/i, "").replace(/-/g, " ").trim();
  if (!stem) return "";
  return stem.charAt(0).toUpperCase() + stem.slice(1);
}}

function filenameFromPath(p) {{
  if (!p) return "";
  try {{
    const clean = p.split("?")[0];
    return decodeURIComponent(clean.split("/").pop() || "");
  }} catch {{
    return p.split("/").pop() || "";
  }}
}}

function parseLoadedJson(rawArray) {{
  levelEntries = {{}};
  otherEntries = [];
  if (!Array.isArray(rawArray)) return;

  for (const item of rawArray) {{
    if (!item || typeof item !== "object") continue;
    const fname = filenameFromPath(item.path || "");
    const conditions = Array.isArray(item.UnlockConditions) ? item.UnlockConditions : [];
    const levelCond = conditions.find(c => c && c.Type === "level");
    const itemId = String(item.ID || "");

    if (levelCond !== undefined || itemId.startsWith("level-")) {{
      let lvl = Number(levelCond?.Value);
      if (!Number.isFinite(lvl) && itemId.startsWith("level-")) {{
        lvl = Number(itemId.split("-", 1)[1]);
      }}
      if (Number.isFinite(lvl)) {{
        levelEntries[lvl] = {{
          ID: itemId || `level-${{lvl}}`,
          NameFR: item.NameFR ?? defaultName(fname),
          NameEn: item.NameEn ?? defaultName(fname),
          file: fname,
        }};
      }}
    }} else {{
      const firstCond = conditions[0] || {{}};
      const uType = firstCond.Type === "shop" ? "shop" : "challenge";
      otherEntries.push({{
        ID: itemId || `${{uType}}-${{otherEntries.length + 1}}`,
        NameFR: item.NameFR ?? defaultName(fname),
        NameEn: item.NameEn ?? defaultName(fname),
        file: fname,
        unlockType: uType,
        unlockValue: firstCond.Value !== undefined ? String(firstCond.Value) : "",
      }});
    }}
  }}

  selectedOtherIdx = otherEntries.length > 0 ? 0 : null;
  refreshAllUI();
}}

function syncUnlockLabel() {{
  const t = document.getElementById("unlockTypeSelect").value;
  const lbl = document.getElementById("unlockValueLabel");
  const inp = document.getElementById("unlockValueInput");
  if (t === "shop") {{
    lbl.textContent = "Prix (shop)";
    inp.placeholder = "ex: 25";
  }} else {{
    lbl.textContent = "ID / valeur du challenge";
    inp.placeholder = "ex: 6 ou venimous-1";
  }}
}}

function setMode(newMode) {{
  mode = newMode;
  document.getElementById("modeLevelBtn").classList.toggle("active", mode === "level");
  document.getElementById("modeOtherBtn").classList.toggle("active", mode === "other");
  document.getElementById("levelSection").classList.toggle("hidden", mode !== "level");
  document.getElementById("otherSection").classList.toggle("hidden", mode !== "other");
  document.getElementById("otherFields").classList.toggle("hidden", mode !== "other");
  document.getElementById("deleteOtherBtn").classList.toggle("hidden", mode !== "other" || selectedOtherIdx === null);
  loadEditorFromSelection();
}}

function loadEditorFromSelection() {{
  if (mode === "level") {{
    const lvl = APP_DATA.levels[currentLevelIdx];
    document.getElementById("currentLevelTitle").textContent = `Niveau ${{lvl}}`;
    const entry = levelEntries[lvl];
    selectedFile = entry?.file || null;
    document.getElementById("nameFrInput").value = entry?.NameFR || "";
    document.getElementById("nameEnInput").value = entry?.NameEn || "";
  }} else {{
    const hasItem = selectedOtherIdx !== null && otherEntries[selectedOtherIdx];
    document.getElementById("deleteOtherBtn").classList.toggle("hidden", !hasItem);
    if (!hasItem) {{
      selectedFile = null;
      document.getElementById("nameFrInput").value = "";
      document.getElementById("nameEnInput").value = "";
      document.getElementById("unlockTypeSelect").value = "challenge";
      document.getElementById("unlockValueInput").value = "";
      document.getElementById("customIdInput").value = "";
      syncUnlockLabel();
    }} else {{
      const item = otherEntries[selectedOtherIdx];
      selectedFile = item.file || null;
      document.getElementById("nameFrInput").value = item.NameFR || "";
      document.getElementById("nameEnInput").value = item.NameEn || "";
      document.getElementById("unlockTypeSelect").value = item.unlockType || "challenge";
      document.getElementById("unlockValueInput").value = item.unlockValue ?? "";
      document.getElementById("customIdInput").value = item.ID || "";
      syncUnlockLabel();
    }}
  }}
  updatePreview();
  renderGrid();
  renderLevelButtons();
  renderOtherList();
}}

function applyEditorChanges() {{
  const nameFr = document.getElementById("nameFrInput").value;
  const nameEn = document.getElementById("nameEnInput").value;

  if (mode === "level") {{
    const lvl = APP_DATA.levels[currentLevelIdx];
    if (!selectedFile && !nameFr && !nameEn) return;
    levelEntries[lvl] = {{
      ID: `level-${{lvl}}`,
      NameFR: nameFr || defaultName(selectedFile || ""),
      NameEn: nameEn || defaultName(selectedFile || ""),
      file: selectedFile || "",
    }};
    renderLevelButtons();
    setStatus(`Niveau ${{lvl}} enregistré en mémoire.`);
  }} else {{
    if (selectedOtherIdx === null || !otherEntries[selectedOtherIdx]) return;
    const uType = document.getElementById("unlockTypeSelect").value;
    const uVal = document.getElementById("unlockValueInput").value.trim();
    const customId = document.getElementById("customIdInput").value.trim();
    otherEntries[selectedOtherIdx] = {{
      ID: customId || `${{uType}}-${{selectedOtherIdx + 1}}`,
      NameFR: nameFr || defaultName(selectedFile || ""),
      NameEn: nameEn || defaultName(selectedFile || ""),
      file: selectedFile || "",
      unlockType: uType,
      unlockValue: uVal,
    }};
    renderOtherList();
    setStatus("Entrée 'Autre' mise à jour en mémoire.");
  }}
}}

function addOtherEntry() {{
  const newItem = {{
    ID: `challenge-${{otherEntries.length + 1}}`,
    NameFR: "",
    NameEn: "",
    file: "",
    unlockType: "challenge",
    unlockValue: "",
  }};
  otherEntries.push(newItem);
  selectedOtherIdx = otherEntries.length - 1;
  setMode("other");
}}

function deleteOtherEntry() {{
  if (selectedOtherIdx === null || !otherEntries[selectedOtherIdx]) return;
  otherEntries.splice(selectedOtherIdx, 1);
  selectedOtherIdx = otherEntries.length > 0 ? Math.min(selectedOtherIdx, otherEntries.length - 1) : null;
  loadEditorFromSelection();
}}

function selectFile(filename) {{
  selectedFile = filename;
  const def = defaultName(filename);
  document.getElementById("nameFrInput").value = def;
  document.getElementById("nameEnInput").value = def;
  if (mode === "other" && selectedOtherIdx !== null && otherEntries[selectedOtherIdx]) {{
    const uType = document.getElementById("unlockTypeSelect").value;
    const idInp = document.getElementById("customIdInput");
    if (!idInp.value.trim()) {{
      const slug = filename.replace(/\\.png$/i, "").toLowerCase();
      idInp.value = `${{uType}}-${{slug}}-${{selectedOtherIdx + 1}}`;
    }}
  }}
  updatePreview();
  applyEditorChanges();
  renderGrid();
}}

function updatePreview() {{
  const img = document.getElementById("previewImg");
  const label = document.getElementById("previewFile");
  if (selectedFile) {{
    img.src = "/img/" + encodeURIComponent(selectedFile);
    img.alt = selectedFile;
    label.textContent = selectedFile;
  }} else {{
    img.removeAttribute("src");
    img.alt = "";
    label.textContent = "Aucune image sélectionnée";
  }}
}}

function renderLevelButtons() {{
  const container = document.getElementById("levelButtons");
  container.innerHTML = "";
  APP_DATA.levels.forEach((lvl, idx) => {{
    const btn = document.createElement("button");
    btn.type = "button";
    btn.className = "lvl-btn";
    if (levelEntries[lvl] && levelEntries[lvl].file) btn.classList.add("done");
    if (idx === currentLevelIdx) btn.classList.add("active");
    btn.textContent = `Nv.${{lvl}}`;
    btn.addEventListener("click", () => {{
      applyEditorChanges();
      currentLevelIdx = idx;
      loadEditorFromSelection();
    }});
    container.appendChild(btn);
  }});
}}

function renderOtherList() {{
  document.getElementById("otherCount").textContent = String(otherEntries.length);
  const list = document.getElementById("otherList");
  list.innerHTML = "";
  otherEntries.forEach((item, idx) => {{
    const div = document.createElement("div");
    div.className = "other-item" + (idx === selectedOtherIdx ? " active" : "");
    const labelVal = item.unlockType === "shop" ? `Prix: ${{item.unlockValue || "?"}}` : `Challenge: ${{item.unlockValue || "?"}}`;
    div.innerHTML = `
      <div class="other-meta">
        <div><strong>${{escapeHtml(item.NameFR || item.ID || "(Sans nom)")}}</strong></div>
        <div class="other-sub">${{escapeHtml(item.ID)}} · ${{escapeHtml(labelVal)}}</div>
      </div>
    `;
    div.addEventListener("click", () => {{
      applyEditorChanges();
      selectedOtherIdx = idx;
      loadEditorFromSelection();
    }});
    list.appendChild(div);
  }});
}}

function renderGrid() {{
  const query = document.getElementById("searchInput").value.trim().toLowerCase();
  const grid = document.getElementById("spriteGrid");
  grid.innerHTML = "";

  const filtered = APP_DATA.pngFiles.filter(f => f.toLowerCase().includes(query));
  document.getElementById("countBadge").textContent = `${{filtered.length}} / ${{APP_DATA.pngFiles.length}} images`;

  for (const fname of filtered) {{
    const tile = document.createElement("div");
    tile.className = "tile" + (fname === selectedFile ? " selected" : "");
    tile.title = fname;

    const img = document.createElement("img");
    img.src = "/img/" + encodeURIComponent(fname);
    img.alt = fname;
    img.loading = "lazy";

    const cap = document.createElement("div");
    cap.className = "fname";
    cap.textContent = fname;

    tile.appendChild(img);
    tile.appendChild(cap);
    tile.addEventListener("click", () => selectFile(fname));
    grid.appendChild(tile);
  }}
}}

function escapeHtml(str) {{
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}}

function buildOutputJson() {{
  applyEditorChanges();
  const out = [];

  for (const lvl of APP_DATA.levels) {{
    const e = levelEntries[lvl];
    if (!e || !e.file) continue;
    out.push({{
      ID: `level-${{lvl}}`,
      NameFR: e.NameFR,
      NameEn: e.NameEn,
      path: `${{APP_DATA.baseUrl}}/${{e.file}}`,
      UnlockConditions: [
        {{
          Type: "level",
          Value: lvl
        }}
      ]
    }});
  }}

  for (const item of otherEntries) {{
    if (!item.file && !item.NameFR && !item.NameEn && !item.unlockValue) continue;
    const rawVal = item.unlockValue;
    const numericVal = rawVal !== "" && !Number.isNaN(Number(rawVal)) ? Number(rawVal) : rawVal;
    out.push({{
      ID: item.ID,
      NameFR: item.NameFR,
      NameEn: item.NameEn,
      path: item.file ? `${{APP_DATA.baseUrl}}/${{item.file}}` : "",
      UnlockConditions: [
        {{
          Type: item.unlockType || "challenge",
          Value: numericVal
        }}
      ]
    }});
  }}

  return out;
}}

async function loadFromDisk() {{
  const filePath = document.getElementById("filePathInput").value.trim();
  if (!filePath) return;
  const res = await fetch("/load?path=" + encodeURIComponent(filePath));
  if (!res.ok) {{
    setStatus("Impossible de charger ce fichier JSON.");
    return;
  }}
  const payload = await res.json();
  parseLoadedJson(payload.data);
  setStatus(`Chargé depuis ${{payload.resolvedPath}}`);
}}

async function saveJson() {{
  const filePath = document.getElementById("filePathInput").value.trim() || APP_DATA.defaultOutputFile;
  const data = buildOutputJson();
  const res = await fetch("/save", {{
    method: "POST",
    headers: {{ "Content-Type": "application/json" }},
    body: JSON.stringify({{ path: filePath, data }})
  }});
  if (res.ok) {{
    const info = await res.json();
    setStatus(`Enregistré (${{info.count}} entrées) dans ${{info.resolvedPath}}`);
  }} else {{
    setStatus("Erreur lors de l'enregistrement.");
  }}
}}

function setStatus(msg) {{
  document.getElementById("statusMsg").textContent = msg;
}}

function refreshAllUI() {{
  loadEditorFromSelection();
}}

document.getElementById("filePathInput").value = APP_DATA.defaultOutputFile;
document.getElementById("modeLevelBtn").addEventListener("click", () => setMode("level"));
document.getElementById("modeOtherBtn").addEventListener("click", () => setMode("other"));
document.getElementById("addOtherBtn").addEventListener("click", addOtherEntry);
document.getElementById("deleteOtherBtn").addEventListener("click", deleteOtherEntry);
document.getElementById("unlockTypeSelect").addEventListener("change", () => {{
  syncUnlockLabel();
  applyEditorChanges();
}});
document.getElementById("validateBtn").addEventListener("click", () => {{
  applyEditorChanges();
  if (mode === "level" && currentLevelIdx < APP_DATA.levels.length - 1) {{
    currentLevelIdx++;
    loadEditorFromSelection();
  }}
}});
document.getElementById("prevLevelBtn").addEventListener("click", () => {{
  applyEditorChanges();
  if (currentLevelIdx > 0) {{
    currentLevelIdx--;
    loadEditorFromSelection();
  }}
}});
document.getElementById("nextLevelBtn").addEventListener("click", () => {{
  applyEditorChanges();
  if (currentLevelIdx < APP_DATA.levels.length - 1) {{
    currentLevelIdx++;
    loadEditorFromSelection();
  }}
}});
document.getElementById("searchInput").addEventListener("input", renderGrid);
document.getElementById("clearSearchBtn").addEventListener("click", () => {{
  const input = document.getElementById("searchInput");
  input.value = "";
  input.focus();
  renderGrid();
}});
document.getElementById("loadDiskBtn").addEventListener("click", loadFromDisk);
document.getElementById("pickLocalFileBtn").addEventListener("click", () => {{
  document.getElementById("uploadFileInput").click();
}});
document.getElementById("uploadFileInput").addEventListener("change", async (e) => {{
  const file = e.target.files?.[0];
  if (!file) return;
  const text = await file.text();
  try {{
    const parsed = JSON.parse(text);
    parseLoadedJson(parsed);
    setStatus(`JSON importé : ${{file.name}}`);
  }} catch {{
    setStatus("Fichier JSON invalide.");
  }}
  e.target.value = "";
}});
document.getElementById("saveBtn").addEventListener("click", saveJson);

refreshAllUI();
loadFromDisk();
</script>
</body>
</html>
"""


def make_handler(cwd: Path, html_content: str):
    class Handler(BaseHTTPRequestHandler):
        def log_message(self, format, *args):
            return

        def resolve_json_path(self, raw_path: str) -> Path:
            p = Path(raw_path)
            if not p.is_absolute():
                p = (cwd / p).resolve()
            return p

        def do_GET(self):
            parsed = urllib.parse.urlparse(self.path)
            if parsed.path in ("/", "/index.html"):
                body = html_content.encode("utf-8")
                self.send_response(200)
                self.send_header("Content-Type", "text/html; charset=utf-8")
                self.send_header("Content-Length", str(len(body)))
                self.end_headers()
                self.wfile.write(body)
                return

            if parsed.path == "/load":
                qs = urllib.parse.parse_qs(parsed.query)
                raw_path = (qs.get("path") or [DEFAULT_OUTPUT_FILE])[0]
                target = self.resolve_json_path(raw_path)
                if not target.is_file():
                    self.send_response(404)
                    self.end_headers()
                    return
                data = json.loads(target.read_text(encoding="utf-8"))
                payload = json.dumps(
                    {"ok": True, "resolvedPath": str(target), "data": data},
                    ensure_ascii=False,
                ).encode("utf-8")
                self.send_response(200)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.send_header("Content-Length", str(len(payload)))
                self.end_headers()
                self.wfile.write(payload)
                return

            if parsed.path.startswith("/img/"):
                rel_name = urllib.parse.unquote(parsed.path[len("/img/"):])
                safe_name = os.path.basename(rel_name)
                img_path = cwd / safe_name
                if img_path.is_file() and img_path.suffix.lower() == ".png":
                    data = img_path.read_bytes()
                    self.send_response(200)
                    self.send_header("Content-Type", "image/png")
                    self.send_header("Content-Length", str(len(data)))
                    self.end_headers()
                    self.wfile.write(data)
                    return

            self.send_response(404)
            self.end_headers()

        def do_POST(self):
            if self.path == "/save":
                length = int(self.headers.get("Content-Length", "0"))
                raw = self.rfile.read(length)
                body = json.loads(raw.decode("utf-8"))
                raw_path = body.get("path") or DEFAULT_OUTPUT_FILE
                data = body.get("data", [])
                target = self.resolve_json_path(raw_path)
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(
                    json.dumps(data, ensure_ascii=False, indent=4) + "\n",
                    encoding="utf-8",
                )
                resp = json.dumps(
                    {"ok": True, "count": len(data), "resolvedPath": str(target)},
                    ensure_ascii=False,
                ).encode("utf-8")
                self.send_response(200)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.send_header("Content-Length", str(len(resp)))
                self.end_headers()
                self.wfile.write(resp)
                return

            self.send_response(404)
            self.end_headers()

    return Handler


def main():
    cwd = Path(".").resolve()
    png_files = list_png_files(cwd)
    if not png_files:
        print("Aucun fichier .png trouvé dans le dossier courant.")
        return

    levels = get_levels()
    html_content = build_html_page(png_files, levels, DEFAULT_OUTPUT_FILE)
    server = ThreadingHTTPServer(("127.0.0.1", 0), make_handler(cwd, html_content))
    port = server.server_address[1]
    url = f"http://127.0.0.1:{port}/"

    print(f"Serveur lancé sur {url}")
    print(f"{len(png_files)} images .png chargées.")
    print("Appuie sur Ctrl+C dans le terminal pour quitter.")

    webbrowser.open(url)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nArrêt du serveur.")
    finally:
        server.server_close()


if __name__ == "__main__":
    main()