set (steamworks_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/sdk")

set (Steamworks_INCLUDE_DIR "${steamworks_SOURCE_DIR}/public")

if (WIN32)
	if (CMAKE_SIZEOF_VOID_P GREATER 4)
		set (Steamworks_REDISTRIBUTABLE "${steamworks_SOURCE_DIR}/redistributable_bin/win64/steam_api64.dll")
		set (Steamworks_REDISTRIBUTABLE_DIR "${steamworks_SOURCE_DIR}/redistributable_bin/win64")
		set (Steamworks_IMPLIB "${steamworks_SOURCE_DIR}/redistributable_bin/win64/steam_api64.lib")
	else()
		set (Steamworks_REDISTRIBUTABLE "${steamworks_SOURCE_DIR}/redistributable_bin/steam_api.dll")
		set (Steamworks_REDISTRIBUTABLE_DIR "${steamworks_SOURCE_DIR}/redistributable_bin")
		set (Steamworks_IMPLIB "${steamworks_SOURCE_DIR}/redistributable_bin/steam_api.lib")
	endif()
	add_library(Steamworks SHARED IMPORTED)
	set_target_properties(Steamworks PROPERTIES IMPORTED_LOCATION "${Steamworks_REDISTRIBUTABLE}")
	set_target_properties(Steamworks PROPERTIES IMPORTED_IMPLIB "${Steamworks_IMPLIB}")
	target_include_directories(Steamworks INTERFACE "${Steamworks_INCLUDE_DIR}")
else()
	message(FATAL_ERROR "Unsupported platform: ${CMAKE_GENERATOR_PLATFORM}")
endif()