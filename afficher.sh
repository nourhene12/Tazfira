#!/bin/bash
fichier()
{
yad \
   --entry \
    --entry-label="<span foreground='red'>tapez le nom du fichier:</span>" \
     --editable \
    --entry-text="$fichier" 
}
function afficher
{

 fichier=`fichier`   
#echo "tapez le nom de fichier que vous voulez afficher"
dpkg --get-selections '*' >$fichier
yad --height=1000 --width=1000 --title="despription" \
--window-icon="$DECO" --image="$DECO" --image-on-top --text-info --wrap <$fichier
}

