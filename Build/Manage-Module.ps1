﻿Clear-Host

Build-Module -ModuleName 'PSParseHTML' {
    # Usual defaults as per standard module
    $Manifest = [ordered] @{
        # Minimum version of the Windows PowerShell engine required by this module
        PowerShellVersion    = '5.1'
        # Supported PSEditions
        CompatiblePSEditions = @('Desktop', 'Core')
        # ID used to uniquely identify this module
        GUID                 = 'f0387960-7034-4918-a1e1-d5847cbf90df'
        # Version number of this module.
        ModuleVersion        = '1.0.X'
        # Author of this module
        Author               = 'Przemyslaw Klys'
        # Company or vendor of this module
        CompanyName          = 'Evotec'
        # Copyright statement for this module
        Copyright            = '(c) Przemyslaw Klys. All rights reserved.'
        # Description of the functionality provided by this module
        Description          = 'Module that allows to manipulate, parse, format and optimize HTML, JavaScript and CSS'
        # Tags applied to this module. These help with module discovery in online galleries.
        Tags                 = @('HTML', 'WWW', 'JavaScript', 'CSS', 'Windows', 'MacOS', 'Linux')
        # A URL to the main website for this project.
        ProjectUri           = 'https://github.com/EvotecIT/PSParseHTML'

            IconUri                = 'https://evotec.xyz/wp-content/uploads/2018/12/PSWriteHTML.png'

        #DotNetFrameworkVersion = '4.7.2'
    }
    New-ConfigurationManifest @Manifest
    # Add external module dependencies, using loop for simplicity
    New-ConfigurationModule -Type ExternalModule -Name 'Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility'

    # Add approved modules, that can be used as a dependency, but only when specific function from those modules is used
    # And on that time only that function and dependant functions will be copied over
    # Keep in mind it has it's limits when "copying" functions such as it should not depend on DLLs or other external files
    New-ConfigurationModule -Type ApprovedModule -Name 'PSSharedGoods', 'PSWriteColor', 'Connectimo', 'PSUnifi', 'PSWebToolbox', 'PSMyPassword'

    $ConfigurationFormat = [ordered] @{
        RemoveComments                              = $false

        PlaceOpenBraceEnable                        = $true
        PlaceOpenBraceOnSameLine                    = $true
        PlaceOpenBraceNewLineAfter                  = $true
        PlaceOpenBraceIgnoreOneLineBlock            = $true

        PlaceCloseBraceEnable                       = $true
        PlaceCloseBraceNewLineAfter                 = $false
        PlaceCloseBraceIgnoreOneLineBlock           = $false
        PlaceCloseBraceNoEmptyLineBefore            = $true

        UseConsistentIndentationEnable              = $true
        UseConsistentIndentationKind                = 'space'
        UseConsistentIndentationPipelineIndentation = 'IncreaseIndentationAfterEveryPipeline'
        UseConsistentIndentationIndentationSize     = 4

        UseConsistentWhitespaceEnable               = $true
        UseConsistentWhitespaceCheckInnerBrace      = $true
        UseConsistentWhitespaceCheckOpenBrace       = $true
        UseConsistentWhitespaceCheckOpenParen       = $true
        UseConsistentWhitespaceCheckOperator        = $true
        UseConsistentWhitespaceCheckPipe            = $true
        UseConsistentWhitespaceCheckSeparator       = $true

        AlignAssignmentStatementEnable              = $true
        AlignAssignmentStatementCheckHashtable      = $true

        UseCorrectCasingEnable                      = $true
    }
    # format PSD1 and PSM1 files when merging into a single file
    # enable formatting is not required as Configuration is provided
    New-ConfigurationFormat -ApplyTo 'OnMergePSM1', 'OnMergePSD1' -Sort None @ConfigurationFormat
    # format PSD1 and PSM1 files within the module
    # enable formatting is required to make sure that formatting is applied (with default settings)
    New-ConfigurationFormat -ApplyTo 'DefaultPSD1', 'DefaultPSM1' -Sort None @ConfigurationFormat
    # when creating PSD1 use special style without comments and with only required parameters
    New-ConfigurationFormat -ApplyTo 'DefaultPSD1', 'OnMergePSD1' -PSD1Style 'Minimal'

    # configuration for documentation, at the same time it enables documentation processing
    New-ConfigurationDocumentation -Enable:$false -StartClean -UpdateWhenNew -PathReadme 'Docs\Readme.md' -Path 'Docs'

    New-ConfigurationImportModule -ImportSelf #-ImportRequiredModules

    $newConfigurationBuildSplat = @{
        Enable                            = $true
        # lets sign module only on my machine for now
        SignModule                        = if ($Env:COMPUTERNAME -eq 'EVOMONSTER') { $true } else { $false }
        MergeModuleOnBuild                = $true
        MergeFunctionsFromApprovedModules = $true
        CertificateThumbprint             = '483292C9E317AA13B07BB7A96AE9D1A5ED9E7703'
        #DotSourceLibraries                = $true
        #DotSourceClasses                  = $false
        #SeparateFileLibraries             = $true
        #DeleteTargetModuleBeforeBuild     = $true

        ResolveBinaryConflicts            = $true
        ResolveBinaryConflictsName        = 'PSParseHTML'
        NETProjectName                    = 'PSParseHTML'
        NETConfiguration                  = 'Release'
        NETFramework                      = 'netstandard2.0' #, 'net472'
        #NETExcludeMainLibrary             = $true
        # NETExcludeLibraryFilter           = @(
        #     'System.Management.*.dll'
        # )
        DotSourceLibraries                = $true
        #DotSourceClasses                  = $true
        #SeparateFileLibraries             = $true
        DeleteTargetModuleBeforeBuild     = $true
        #MergeLibraryDebugging             = $true
    }

    New-ConfigurationBuild @newConfigurationBuildSplat

    $newConfigurationArtefactSplat = @{
        Type                = 'Unpacked'
        Enable              = $true
        Path                = "$PSScriptRoot\..\Artefacts\Unpacked"
        ModulesPath         = "$PSScriptRoot\..\Artefacts\Unpacked\Modules"
        RequiredModulesPath = "$PSScriptRoot\..\Artefacts\Unpacked\Modules"
        AddRequiredModules  = $true
        CopyFiles           = @{
            #"Examples\PublishingExample\Example-ExchangeEssentials.ps1" = "RunMe.ps1"
        }
    }
    New-ConfigurationArtefact @newConfigurationArtefactSplat -CopyFilesRelative
    $newConfigurationArtefactSplat = @{
        Type                = 'Packed'
        Enable              = $true
        Path                = "$PSScriptRoot\..\Artefacts\Packed"
        ModulesPath         = "$PSScriptRoot\..\Artefacts\Packed\Modules"
        RequiredModulesPath = "$PSScriptRoot\..\Artefacts\Packed\Modules"
        AddRequiredModules  = $true
        CopyFiles           = @{
            #"Examples\PublishingExample\Example-ExchangeEssentials.ps1" = "RunMe.ps1"
        }
        ArtefactName        = '<ModuleName>.v<ModuleVersion>.zip'
    }
    New-ConfigurationArtefact @newConfigurationArtefactSplat

    New-ConfigurationTest -TestsPath "$PSScriptRoot\..\Tests" -Enable

    # global options for publishing to github/psgallery
    #New-ConfigurationPublish -Type PowerShellGallery -FilePath 'C:\Support\Important\PowerShellGalleryAPI.txt' -Enabled:$true
    #New-ConfigurationPublish -Type GitHub -FilePath 'C:\Support\Important\GitHubAPI.txt' -UserName 'EvotecIT' -Enabled:$true
} -ExitCode