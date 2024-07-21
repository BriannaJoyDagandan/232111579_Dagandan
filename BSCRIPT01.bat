@echo off
rem Open five websites
start https://uc-bcf.instructure.com/
start https://www.youtube.com/
start https://facebook.com/
start https://www.google.com/maps/
start https://outlook.office.com/

rem Launch calculator and notepad
start calc
start notepad

rem Wait for 30 seconds before shutdown
timeout /t 30

rem Shutdown the system
shutdown /s /f /t 0
