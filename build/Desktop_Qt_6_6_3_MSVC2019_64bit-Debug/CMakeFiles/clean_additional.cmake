# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appsystem_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appsystem_autogen.dir\\ParseCache.txt"
  "appsystem_autogen"
  )
endif()
