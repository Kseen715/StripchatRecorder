@ECHO OFF
TITLE WAIT !
:: ASSIGN THE FILE PATH OF BATCH FILE TO A VARIABLE
SET "sourceDir=%CD%\captures"
:: GET THE NAME OF THE FOLDER WHICH THE BATCH FILE IS IN
FOR %%a IN (.) DO SET currentFolder=%%~na
:: GO UP ONE DIRECTORY
::CD ..
:: MAKE A DYNAMIC FOLDER NAME
::SET folderName=Copied From %currentFolder%
SET "folderName=Moved from captures"
:: CREATE A FOLDER TO PUT THE COPIED FILES IN
:: IF FOLDER ALREADY EXISTS DELETE IT
IF EXIST "%folderName%" RMDIR "%folderName%" /S /Q
MKDIR "%folderName%"
:: ASSIGN DESTINATION FOLDER TO A VARIABLE
SET "destinationFolder=%CD%\%folderName%"
:: CREATE A LOG FILE IN DESTINATION FOLDER
SET "_report=%destinationFolder%\logxcopy.txt"
:: CREATE ERROR MESSAGE
IF NOT EXIST "%sourceDir%" (ECHO.Could not find %sourceDir% &GoTo:DONE)
:: OVERWRITE PREVIOUS LOG
>"%_report%" (
echo.%date% – %time%
echo.—————————————————
echo.
)
:: COPY FILES
FOR /F "Delims=" %%! IN ('DIR "%sourceDir%\" /b /s /a-d 2^>NUL') DO (
@ECHO.%%! &(
@MOVE /Y "%%!" "%destinationFolder%\")
)
:DONE
TITLE,Done…….
ECHO.&PAUSE>NUL