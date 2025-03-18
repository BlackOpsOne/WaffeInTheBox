@echo off
set ORIGINAL_PATCH=bin\base_patch.ff
set OAT_BASE=%cd%\oat
set MOD_BASE=%cd%

if not exist "%OAT_BASE%" (
    echo Downloading OpenAssetTools...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/Laupetin/OpenAssetTools/releases/latest/download/oat-windows.zip -OutFile oat-windows.zip"
    
    echo Extracting OpenAssetTools...
    powershell -Command "Expand-Archive -Path oat-windows.zip -DestinationPath %OAT_BASE% -Force"
    
    del oat-windows.zip
    
    echo OpenAssetTools has been successfully downloaded and extracted.
    echo.
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