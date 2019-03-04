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
    --entry-label="<span foreground='red'><b>donner le nom du paquet:</b></span>" \
     --editable \
    --entry-text="$fc" 
}
function save
{

pq=`paquet`    
#echo "tapez le nom de fichier que vous voulez afficher"
dpkg --get-selections "$pq" >packages_distribution_date.txt
}
