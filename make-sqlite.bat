@echo off
::
:: This script builds "compress.dll", a Windows sqlite3 load extension providing
:: the extension functions compress() and uncompress(), which compress and
:: uncompress BLOBs in the Lightroom catalog using zlib.
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Remove the \source directory that's created by VS 2017.  VsDevCmd.bat insists
:: on cd-ing there if it exists.
rmdir /s/q %homedrive%\%homepath%\source

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat"

del /q sqlite3.exe
cl -I. compress.c shell.c sqlite3.c zlib.lib -Fesqlite3.exe

mkdir dist
move /y sqlite3.exe dist\
copy /y zlib1.dll dist\
