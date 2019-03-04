 loulou()
{
yad \
   --entry \
    --entry-label="entrez le nom du package que vous voulez lister" \
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
