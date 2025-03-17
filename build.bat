@echo off
set ORIGINAL_PATCH=bin\base_patch.ff
set OAT_BASE=%cd%\oat
set MOD_BASE=%cd%

if not exist "%OAT_BASE%" (
    echo The latest OpenAssetTools release is not in the "oat" folder.
    echo Download it from: https://github.com/Laupetin/OpenAssetTools/releases/latest/download/oat-windows.zip
    echo.
    pause
    exit
)

"%OAT_BASE%\Linker.exe" ^
-v ^
--load "%ORIGINAL_PATCH%" ^
--base-folder "%OAT_BASE%" ^
--asset-search-path "%MOD_BASE%\zone_source" ^
--source-search-path "%MOD_BASE%\zone_source" ^
--output-folder "%MOD_BASE%\bin" zombie_coast_patch

echo.
echo Compiled patch at: %MOD_BASE%\bin\zombie_coast_patch.ff
echo.

pause