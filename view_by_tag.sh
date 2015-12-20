# view photos from given directory with the given tag
# if one argument given, view from current directory photos with that tag
# if two arguments given, view from first argument directory photos with tag of second argument

if [ "$#" -eq "1" ]; then
    target=$1
    dir="."
else
    target=$1
    target=$2
fi

# get genuine absolute path to folder containing myself, from http://stackoverflow.com/questions/242538/unix-shell-script-find-out-which-directory-the-script-file-resides
script=`readlink -f "$0"`
scriptpath=`dirname $script`

# modfy path as seen by children (so that feh has modified path for when it tries to call append_tag)
PATH="$PATH"":$scriptpath"

exiftool -qq -ignoreMinorErrors -p '$filename:$Keywords' $dir | grep -E --ignore-case ".*:.*$target.*"  | sed -r 's/(.*):.*/\1/' | feh --scale-down --info "exiftool -qq -p '[\$Keywords]' %F" --action ";append_tag.sh %F"  --filelist -
