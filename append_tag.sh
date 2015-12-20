# prompt for a tag to add to photo named by first argument
# first argument: name of photo
if [ "$#" -ne "1" ]; then
    echo "requires one arg!"
    exit 1
fi

fname=$1

prompt="Append tag"
new_tag=`zenity --entry --title "$prompt" --text "$prompt"`

# only change if zenity returns without error, even if appending an empty string
# should do nothing, it is better to not even ask exiftool to touch the file if
# we know we want nothing done
if [ "$?" -eq 0 ]; then
    exiftool -overwrite_original_in_place -Keywords+="$new_tag" $fname
fi
