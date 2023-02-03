^2::
Gui, Add, Text, x10 y10 w100 h30, Tiedostojen sijainti:
Gui, Add, Edit, x120 y10 w200 h30 vFolderLocation
Gui, Add, Button, x330 y10 w80 h30 gBrowse, selaa...
Gui, Add, Text, x10 y50 w100 h30, Kansion nimi:
Gui, Add, Edit, x120 y50 w200 h30 vFolderName
Gui, Add, Text, x10 y90 w100 h30, Montako tiedostoa:
Gui, Add, Edit, x120 y90 w200 h30 vNumFolders, 1
Gui, Add, Button, x330 y90 w80 h30 gCreate, Luo
Gui, Show

return

Browse:
    Gui, Submit, NoHide
    FileSelectFolder, FolderLocation, 3, , %FolderLocation%
    GuiControl,, FolderLocation, %FolderLocation%
    Gui, Show
return

Create:
    Gui, Submit, NoHide
    NumFolders := Abs(NumFolders)
    Loop, %NumFolders% {
        i := A_Index - 1
        NewFolderName := FolderName . (i = 0 ? "" : i)
        Loop {
            If !FileExist(FolderLocation . "\" . NewFolderName)
                break
            NewFolderName := FolderName . ++i
        }
        FileCreateDir, %FolderLocation%\%NewFolderName%
    }
    MsgBox, %NumFolders% kansiota luotu paikassa %FolderLocation%
    Gui, Destroy

return
