doudou()
{
yad \
   --entry \
    --entry-label="tapez le nom du fichier" \
     --editable \
    --entry-text="$pck" 
}


desc()
{
pck=`doudou` 
s=(dpkg --print-avail $pck)

yad  --title="desc" --info --text="$x" \
	 --window-icon="$DECO" --image="$DECO" --image-on-top 
}

