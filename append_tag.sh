# prompt for a tag to add to photo named by first argument
# first argument: name of photo
if [ "$#" -ne "1" ]; then
    echo "requires one arg!"
    exit 1
fi

fname=$1

prompt="Append tag"
new_tag=`zenity --entry --title "$prompt" --text "$prompt"`

exiftool -overwrite_original_in_place -Keywords+="$new_tag" $fname
