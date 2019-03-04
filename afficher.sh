#!/bin/bash
fichier()
{
yad \
   --entry \
    --entry-label="tapez le nom du fichier" \
     --editable \
    --entry-text="$fichier" 
}
function afficher
{

 fichier=`fichier`   
#echo "tapez le nom de fichier que vous voulez afficher"
dpkg --get-selections '*' >$fichier
}

