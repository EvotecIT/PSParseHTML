using System;
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
        //var assemblyList = new List<(string, string)>
        //{
        //    ("AngleSharp.Css,", "AngleSharp.Css.dll"),
        //    ("AngleSharp,", "AngleSharp.dll"),
        //    ("System.Text.Encoding.CodePages,", "System.Text.Encoding.CodePages.dll"),
        //    ("System.Buffers,", "System.Buffers.dll"),
        //    ("Microsoft.Bcl.AsyncInterfaces,", "Microsoft.Bcl.AsyncInterfaces.dll"),
        //    ("System.Memory,", "System.Memory.dll"),
        //    ("System.Numerics.Vectors,", "System.Numerics.Vectors.dll"),
        //    ("System.Runtime.CompilerServices.Unsafe,", "System.Runtime.CompilerServices.Unsafe.dll"),
        //    ("System.Threading.Tasks.Extensions,", "System.Threading.Tasks.Extensions.dll"),
        //    ("System.Memory,", "System.Memory.dll"),
        //};

        //foreach (var assembly in assemblyList) {
        //    if (args.Name.StartsWith(assembly.Item1)) {
        //        var binaryPath = Path.Combine(Path.GetDirectoryName(typeof(OnModuleImportAndRemove).Assembly.Location), assembly.Item2);
        //        return Assembly.LoadFile(binaryPath);
        //    }
        //}

        //return null;

        //This code is used to resolve the assemblies
        //Console.WriteLine($"Resolving {args.Name}");
        var directoryPath = Path.GetDirectoryName(typeof(OnModuleImportAndRemove).Assembly.Location);
        var filesInDirectory = Directory.GetFiles(directoryPath);

        foreach (var file in filesInDirectory) {
            var fileName = Path.GetFileName(file);
            var assemblyName = Path.GetFileNameWithoutExtension(file);

            if (args.Name.StartsWith(assemblyName)) {
                //Console.WriteLine($"Loading {args.Name} assembly {fileName}");
                return Assembly.LoadFile(file);
            }
        }

        return null;
    }
}