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
 dpkg -s $pck >t.txt
yad --height=1000 --width=1000 --title="despription" \
--window-icon="$DECO" --image="$DECO" --image-on-top --text-info --wrap < t.txt

#//yad  --title="despription" --text="$p"\
 #--window-icon="$DECO" --image="$DECO" --image-on-top*// 
 


}
