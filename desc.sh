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
dpkg --print-avail $pck

}

