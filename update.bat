@Echo off

REM scoop
call scoop update --all
call scoop reset *
call scoop cleanup *
call scoop cache rm *

REM conda
call %userprofile%\scoop\apps\miniconda3\current\Scripts\activate.bat
call conda install -y brotlipy urllib3 pandas openpyxl psutil numpy matplotlib ezdxf pysimplegui img2pdf
call conda update --all

REM pip
call yes | pip install -r pdf2pptx PyMuPDF pySW
call copy /Y D:\github\xlsx2sw\patch\commSW.py %userprofile%\scoop\apps\miniconda3\current\Lib\site-packages\pySW\commSW.py

echo Finished.
pause
