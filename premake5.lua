workspace "DirectX tutorial"
    architecture ("x86_64")

    startproject "DirectX tutorial"

    configurations
    {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["DirectX"] = "libraries/DirectX/include/directx"

LibDir = {}
LibDir["DirectX"] = "C:/Program Files (x86)/Windows Kits/10/Redist/D3D/x64"

project "DirectX tutorial"
    location "DirectX tutorial"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "On"

    targetdir ("bin/".. outputdir .. "/%{prj.name}")
    objdir ("bin-int/".. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/**.h",
        "%{prj.name}/**.cpp",
    }

    includedirs
    {
        "%{IncludeDir.DirectX}"
    }

    libdirs
    {
        "%{LibDir.DirectX}"
    }

    links
    {
        "dxcompiler"
    }

    filter "system:windows"
        staticruntime "On"
        systemversion "latest"

    filter "configurations:Debug"
        defines 
        {
            "_DEBUG",
            "_CONSOLE",
            "_LIB"
        }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines 
        {
            "NDEBUG",
            "_CONSOLE",
            "_LIB"
        }
        runtime "Release"
        optimize "On"
