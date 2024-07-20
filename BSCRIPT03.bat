@echo off
cls

:MAIN_MENU
echo.
echo  Windows Utilities Menu
echo  ----------------------
echo  1. Display IP Configuration
echo  2. Display Task List
echo  3. Check Disk (chkdsk)
echo  4. Format (with confirmation)
echo  5. Defragment (defrag)
echo  6. Find
echo  7. Modify File Attributes (attrib)
echo  8. Exit
echo.
set /p choice=Enter your choice:

if %choice%==1 ipconfig /all & pause & goto MAIN_MENU
if %choice%==2 tasklist & pause & goto MAIN_MENU
if %choice%==3 set /p drive=Enter drive letter: & chkdsk %drive% & pause & goto MAIN_MENU
if %choice%==4 set /p drive=Enter drive letter: & echo Warning: Formatting this drive will erase all data. Are you sure? (y/n) & set /p confirm= & if /i "%confirm%" neq "y" goto MAIN_MENU & format %drive% & pause & goto MAIN_MENU
if %choice%==5 set /p drive=Enter drive letter: & defrag %drive% & pause & goto MAIN_MENU
if %choice%==6 set /p searchterm=Enter search term: & find /i "%searchterm%" * & pause & goto MAIN_MENU
if %choice%==7 set /p file=Enter file name: & set /p attribs=Enter attributes (+r, -h, etc.): & attrib %attribs% %file% & pause & goto MAIN_MENU
if %choice%==8 exit

echo Invalid choice. Please try again.
pause
goto MAIN_MENU