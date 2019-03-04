 doudou()
{
yad \
   --entry \
    --entry-label="<span foreground='red'>tapez le nom du paquet:</span>" \
     --editable \
    --entry-text="$pck" 
}

desc()
{
pck=`doudou` 
p=$( dpkg -s $pck) 
yad  --title="despription" --info --text="$p" \
 --window-icon="$DECO" --image="$DECO" --image-on-top 
}
