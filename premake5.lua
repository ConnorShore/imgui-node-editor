project "imgui-node-editor"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "off"
    
    multiprocessorcompile "On"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imgui_canvas.cpp",
        "imgui_canvas.h",
        "imgui_extra_math.inl",
        "imgui_extra_math.h",
        "imgui_node_editor_api.cpp",
        "imgui_node_editor_internal.h",
        "imgui_node_editor.h",
        'imgui_node_editor.cpp',

        "crude_json.h",                  -- Required for editor state saving
        "crude_json.cpp"
    }

    includedirs
    {
        ".",
        "%{wks.location}/Ember/vendor/imgui"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines "EB_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "EB_RELEASE"
        runtime "Release"
        optimize "on"
        
    filter "configurations:Dist"
        runtime "Release"
        staticruntime "on"
        optimize "on"