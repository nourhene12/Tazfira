 loulou()
{
yad \
   --entry \
    --entry-label="<span foreground='red'>entrer le nom du package:</span>" \
     --editable \
    --entry-text="$package" 
}


lister()
{
package=`loulou`
x=$(dpkg --list $package)
yad  --title="lister" --info --text="$x" \
	 --window-icon="$DECO" --image="$DECO" --image-on-top 
}
