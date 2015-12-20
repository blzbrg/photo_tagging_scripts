# view photos from given directory with the given tag\
# $PHOTO_VIEWER
# if one argument given, view from current directory photos with that tag
# if two arguments given, view from first argument directory photos with tag of second argument

if [ "$#" -eq "1" ]; then
    target=$1
    dir="."
else
    target=$1
    target=$2
fi

exiftool -qq -ignoreMinorErrors -p '$filename:$Keywords' $dir | grep -E --ignore-case ".*:.*$target.*"  | sed -r 's/(.*):.*/\1/'
