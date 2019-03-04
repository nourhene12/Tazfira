#!/bin/bash
 xhelp()
{

yad  --title="Help" --info --text="  la commande -inclut vous permet d afficher le nom du fichier
                                   la commande -list pour lister les packages
				   la commande -desc pour décrire les packages
				   la commande -save pour sauvgarder" \
                                                                      
	 --window-icon="$DECO" --image="$DECO" --image-on-top 
}
