#!/bin/bash
 xhelp()
{
yad  --title="help" --text-align=center --info --text="<span foreground='orange'><b>-pour afficher un fichier dans un fichier -inclut
                                     -pour lister -l
                                     -pour faire la desription -desc
                                     -pour sauvergarder -help</b></span>     " \
	 --window-icon="$DECO" --image="$DECO" --image-on-top 
}
