if [ "$#" -ne "1" ]; then
    echo "requires one arg!"
    exit 1
fi

fname=$1

old_tags=`exiftool -p '$Keywords' $fname`

prompt="Set tags"
new_tags=`zenity --entry --title "$prompt" --text "$prompt" --entry-text "$old_tags"`

# only change if zenity returns without error
if [ "$?" -eq 0 ]; then
    exiftool -overwrite_original_in_place -Keywords="$new_tags" $fname
fi
