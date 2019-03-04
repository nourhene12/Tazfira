#! /bin/bash
source afficher.sh
source lister.sh
source desc.sh
source sauvgarder.sh
source xhelp.sh 
source calendrier.sh




TITBOX=Menu
DECO=/home/nourhene/Desktop/tazfira/index.png
SOUND=/home/nourhene/Desktop/tazfira/b.wav



db_accueil()
{
yad --title=$TITBOX --text=" Choisissez la commande !" \
	--button=gtk-no:1 --button=gtk-yes:0 \
	--color \
	--window-icon="$DECO" --image="$DECO" --image-on-top \
	--height=300 --list --radiolist --no-headers \
	--column 1 --column 2 --print-column=2 \
		 false "Inclut" true  "List" \
		 false "Desc" false "Save" false "help"  false "Calendrier" 
	

}






db_notification()
{
aplay $SOUND &
yad  --title=$TITBOX--timeout=4 --info --text="Validée \!" \
	 --window-icon="$DECO" --image="$DECO" --image-on-top
}


programme()
{
while true
do
CHOIX=`db_accueil`
case $? in
252|1) # An error occured or the box was closed | Cancel/No pressed
	exit 0
;;
0) # All OK
	case $CHOIX in
	"Inclut|")
                afficher
		db_notification
	;;
	"List|")
		lister
	;;
	"Desc|")
		desc
		db_notification
	;;
	"Save|")
		save
		db_notification
	;;
	"help|")
		xhelp
		db_notification
	;;
	"Calendrier|")
		calendrier
		db_notification
	;;
	

esac		
esac
done
}

# Lancement effectif #
programme
