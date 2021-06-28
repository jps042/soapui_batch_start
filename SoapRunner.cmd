@echo off 
setlocal EnableDelayedExpansion

REM Start SoapRunner Script %DATE%
echo Start SoapRunner Script on %DATE% at %TIME%

REM Get current directory
set current_dir = %~dp0

REM Check if environment argument is set
echo.
echo Application ENV: %1
echo.
echo Test Case Name: %2
echo.
echo Data Profile: %3
echo.

IF NOT EXIST "./config.properties" (
  echo config file not found in this directory %current_dir%
  echo.  
)

IF "%1"=="" (
echo app environment argument 1 is not set. Options are 'test' or 'stage'
goto :ProcessError
) 
IF "%2"=="" (
 echo test case name argument 2 is not set. Option must match exact test case name in SoapUI project.
 goto :ProcessError
) 

rem for tokens in a file separated by '=' in a key=value format. set each key to a variable with the assignment equal to the value
for /f "tokens=1,2 delims==" %%a in (./config.properties) do set %%a=%%b


IF "%3"=="" (
 echo.  
 echo data profile is not set
 goto :Success
) 
IF not "%3"=="" (
 echo.  
 echo data profile is set   
)

REM failure when something has gone wrong
:ProcessError
exit /b 1

REM successful exit
:Success
exit /b 0






