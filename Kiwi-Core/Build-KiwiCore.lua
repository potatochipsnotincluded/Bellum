project "Kiwi-Core"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"

   files { "Source/**.h", "Source/**.cpp" }
   
   includedirs
   {
      "Source",
      "../Vendor/glfw/include",
      "../Vendor/NVRHI/include",
      "../Vendor/Assimp/include",
      "../Vendor/glm"
   }
   

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
      systemversion "latest"
      links
      {
         "../Vendor/Assimp/assimp-vc143-mt.lib",
         "../Vendor/glfw/glfw3.lib",
         "../Vendor/NVRHI/nvrhi.lib",
         "../Vendor/NVRHI/nvrhi_d3d11.lib",
         "../Vendor/NVRHI/nvrhi_d3d12.lib",
         "../Vendor/NVRHI/nvrhi_vk.lib",
         "opengl32.lib",
         "shlwapi.lib",
         "user32.lib",
         "gdi32.lib",
         "shell32.lib",
         "advapi32.lib",
         "ws2_32.lib",
         "winmm.lib",
         "setupapi.lib",
         "version.lib",
         "imm32.lib",
         "cfgmgr32.lib"
      }

   filter "configurations:Debug"
      defines { "DEBUG" }
      runtime "Debug"
      symbols "On"

   filter "configurations:Release"
      defines { "RELEASE" }
      runtime "Release"
      optimize "On"
      symbols "On"

   filter "configurations:Dist"
      defines { "DIST" }
      runtime "Release"
      optimize "On"
      symbols "Off"
