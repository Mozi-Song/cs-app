start "" "%PROGRAMFILES%\Git\bin\sh.exe" --login
git add .
git commit -m "update chapter notes"
git push
ECHO "git push done."
PAUSE