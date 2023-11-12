using System;
using System.Collections.Generic;
using System.IO;
using System.Management.Automation;
using System.Reflection;

public class OnModuleImportAndRemove : IModuleAssemblyInitializer, IModuleAssemblyCleanup {
    public void OnImport() {
        //#if FRAMEWORK
        AppDomain.CurrentDomain.AssemblyResolve += MyResolveEventHandler;
        //#endif
    }

    public void OnRemove(PSModuleInfo module) {
        //#if FRAMEWORK
        AppDomain.CurrentDomain.AssemblyResolve -= MyResolveEventHandler;
        //#endif
    }

    private static Assembly MyResolveEventHandler(object sender, ResolveEventArgs args) {
        //if (args.Name.StartsWith("AngleSharp,")) {
        //    string binPath = Path.Combine(Path.GetDirectoryName(typeof(OnModuleImportAndRemove).Assembly.Location), "AngleSharp.dll");
        //    return Assembly.LoadFile(binPath);
        //} else if (args.Name.StartsWith("AngleSharp.Css,")) {
        //    string binPath = Path.Combine(Path.GetDirectoryName(typeof(OnModuleImportAndRemove).Assembly.Location), "AngleSharp.Css.dll");
        //    return Assembly.LoadFile(binPath);
        //}


        var assemblyList = new List<(string, string)>
        {
            ("AngleSharp,", "AngleSharp.dll"),
            ("AngleSharp.Css,", "AngleSharp.Css.dll"),
            ("System.Text.Encoding.CodePages,", "System.Text.Encoding.CodePages.dll")
        };

        foreach (var assembly in assemblyList) {
            if (args.Name.StartsWith(assembly.Item1)) {
                var binaryPath = Path.Combine(Path.GetDirectoryName(typeof(OnModuleImportAndRemove).Assembly.Location), assembly.Item2);
                return Assembly.LoadFile(binaryPath);
            }
        }
        return null;
    }
}