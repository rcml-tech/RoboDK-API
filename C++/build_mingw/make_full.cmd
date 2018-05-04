cmake -E make_directory build
cmake -E chdir build cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE || exit /b 1
cmake --build build --target install --clean-first || exit /b 1
cmake -E chdir build cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=DEBUG || exit /b 1
cmake --build build --target install --clean-first || exit /b 1