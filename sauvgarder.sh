fichier()
{
yad \
   --entry \
    --entry-label="tapez le nom du fichier" \
     --editable \
    --entry-text="$fc" 
}
paquet()
{
yad \
   --entry \
    --entry-label="tapez le nom du paquet" \
     --editable \
    --entry-text="$fc" 
}
function save
{

 fichier=`fichier`
pq=`paquet`    
#echo "tapez le nom de fichier que vous voulez afficher"
dpkg --get-selections "$pq" >$fichier
}
