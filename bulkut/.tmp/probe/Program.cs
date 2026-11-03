using System;
using System.Linq;
using System.Reflection;

var asm = Assembly.Load("Avalonia.Base");
foreach (var t in asm.GetTypes().Where(t => t.IsPublic && (t.Name.Contains("DataTransfer") || t.Name.Contains("Drag") || t.Name.Contains("DataFormat"))))
{
    Console.WriteLine("== " + t.FullName);
    foreach (var m in t.GetMethods(BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
        Console.WriteLine("  " + m);
}
