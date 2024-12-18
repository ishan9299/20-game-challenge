if not exist build mkdir build

setlocal

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

pushd build
cl /Z7 /nologo /MD ..\main.c /I ..\..\include ..\..\lib\raylib.lib winmm.lib gdi32.lib opengl32.lib user32.lib shell32.lib
popd

endlocal
