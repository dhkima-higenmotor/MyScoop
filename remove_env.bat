@ECHO OFF

reg delete HKCU\Environment /v BASE_PATH /f
reg delete HKCU\Environment /v GH_TOKEN /f
reg delete HKCU\Environment /v GH_TOKEN /f
reg delete HKCU\Environment /v GH_EMAIL /f
reg delete HKCU\Environment /v GH_USERNAME /f

call refresh_env.bat
