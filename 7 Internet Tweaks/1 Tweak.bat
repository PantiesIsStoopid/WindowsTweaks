@echo off
echo Disabling TCP heuristics...
netsh interface tcp set heuristics disabled
echo TCP heuristics have been disabled.
pause
