#!/bin/bash
 xhelp()
{
echo "vous avez besion de notre aide ? "
read aide
	case $aide in
	1 )
               echo "-inclut vous permet d afficher le nom du package"
  	2 )
		echo " -list vous permet de lister les composantes du package"
	3 ) 
		echo " -desc vous permet de faire la description du package "
	4 ) 
		echo "  -save vous permet de sauvgarder les noms de package installer"
	esac
}
