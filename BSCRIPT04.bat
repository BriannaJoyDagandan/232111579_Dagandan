@echo off
cls

:: Set the source and destination drives
set src=C:
set dest=Z:\Archive

:: Sort text files on Drive C: by date
echo Sorting text files on Drive C: by date...
forfiles /P %src% /S /M *.txt /C "cmd /c echo @file @fdate" > filelist.txt

:: Archive older files to a folder on Drive Z:
echo Archiving older files to %dest%...
for /f "tokens=*" %%f in (filelist.txt) do (
    set "file=%%~nf"
    set "date=%%~tf"
    if %date% lss 30 (
        move /y "%%f" "%dest%\%%f"
    )
)

:: Sort the archived files by size
echo Sorting archived files by size...
dir /b /o:s "%dest%\*.txt" > archived_filelist.txt

:: Prompt the user for permission to delete old, large files
echo The following files are old and large:
for /f "tokens=*" %%f in (archived_filelist.txt) do (
    set "filesize=%%~zf"
    if %filesize% gtr 1000000 (
        echo %%f (%filesize% bytes)
        set /p confirm=Do you want to delete this file? (y/n) 
        if /i "%confirm%"=="y" (
            del /q "%%f"
        )
    )
)

pause