param([int]$X, [int]$Y)
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32Click {
  [StructLayout(LayoutKind.Sequential)] public struct RECT { public int Left; public int Top; public int Right; public int Bottom; }
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);
  [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);
  [DllImport("user32.dll")] public static extern void mouse_event(uint f, uint dx, uint dy, uint d, UIntPtr e);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

$proc = Get-Process | Where-Object { $_.MainWindowTitle -eq 'Bulkut' } | Sort-Object StartTime -Descending | Select-Object -First 1
if (-not $proc) { Write-Output 'no Bulkut window'; exit 1 }

$rect = New-Object Win32Click+RECT
[Win32Click]::GetWindowRect($proc.MainWindowHandle, [ref]$rect) | Out-Null
[Win32Click]::SetForegroundWindow($proc.MainWindowHandle) | Out-Null
Start-Sleep -Milliseconds 300
$pointX = $rect.Left + $X
$pointY = $rect.Top + $Y
[Win32Click]::SetCursorPos($pointX, $pointY) | Out-Null
[Win32Click]::mouse_event(2, 0, 0, 0, [UIntPtr]::Zero)
[Win32Click]::mouse_event(4, 0, 0, 0, [UIntPtr]::Zero)
Start-Sleep -Milliseconds 700
Write-Output "clicked $pointX,$pointY"
