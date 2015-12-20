#Tag and view photos in feh

These are some silly little scripts to view all photos with a tag and append new tags to a photo
from feh. exiftool does all the heavy lifting.

append and set have no dependence on feh, they use only zenity and exiftool. view by tag uses
exiftool and feh.

##Dependencies
* zenity: for showing a gui prompt box
* feh: image viewer
* exiftool: all the actual metadata manipulation
