# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/library/hungpd/np/knights-2.5.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/library/hungpd/np/knights-2.5.0/build

# Utility rule file for it-handbook.

# Include the progress variables for this target.
include doc/it/CMakeFiles/it-handbook.dir/progress.make

doc/it/CMakeFiles/it-handbook: doc/it/index.cache.bz2

doc/it/index.cache.bz2: ../doc/it/index.docbook
doc/it/index.cache.bz2: /usr/share/kde4/apps/ksgmltools2/customization/kde-chunk.xsl
	$(CMAKE_COMMAND) -E cmake_progress_report /home/library/hungpd/np/knights-2.5.0/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating index.cache.bz2"
	cd /home/library/hungpd/np/knights-2.5.0/doc/it && /usr/bin/meinproc4 --check --cache /home/library/hungpd/np/knights-2.5.0/build/doc/it/index.cache.bz2 /home/library/hungpd/np/knights-2.5.0/doc/it/index.docbook

it-handbook: doc/it/CMakeFiles/it-handbook
it-handbook: doc/it/index.cache.bz2
it-handbook: doc/it/CMakeFiles/it-handbook.dir/build.make
.PHONY : it-handbook

# Rule to build all files generated by this target.
doc/it/CMakeFiles/it-handbook.dir/build: it-handbook
.PHONY : doc/it/CMakeFiles/it-handbook.dir/build

doc/it/CMakeFiles/it-handbook.dir/clean:
	cd /home/library/hungpd/np/knights-2.5.0/build/doc/it && $(CMAKE_COMMAND) -P CMakeFiles/it-handbook.dir/cmake_clean.cmake
.PHONY : doc/it/CMakeFiles/it-handbook.dir/clean

doc/it/CMakeFiles/it-handbook.dir/depend:
	cd /home/library/hungpd/np/knights-2.5.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/library/hungpd/np/knights-2.5.0 /home/library/hungpd/np/knights-2.5.0/doc/it /home/library/hungpd/np/knights-2.5.0/build /home/library/hungpd/np/knights-2.5.0/build/doc/it /home/library/hungpd/np/knights-2.5.0/build/doc/it/CMakeFiles/it-handbook.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/it/CMakeFiles/it-handbook.dir/depend
