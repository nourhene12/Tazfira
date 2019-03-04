#! /bin/bash
source afficher.sh
source lister.sh
source desc.sh
source sauvgarder.sh
source xhelp.sh 

TITBOX=Menu
DECO=/home/nourhene/Desktop/tazfira/index.png
SOUND=/home/nourhene/Desktop/tazfira/b.wav
icon=/home/nourhene/Desktop/tazfira/hello.png



db_accueil()
{
yad     --title=$TITBOX --text=" <span foreground='orange'><b><big><big>Choisissez la commande !</big></big></b></span>" \
	--button=gtk-no:1 --button=gtk-yes:0 \
	--window-icon="$DECO" --image="$DECO" --image-on-top \
	--height=300 --list --radiolist --no-headers \
	--column 1 --column 2 --print-column=2 \
		 false "Inclut" true  "List" \
		 false "Desc" false "Save" false "help"  
 
	

}






db_notification()
{
aplay $SOUND 
yad  --title=$TITBOX--timeout=4 --info --text="Validée \!" \
	 --window-icon="$DECO" --image="$DECO" --image-on-top
}
loginn()
{ 
yad    --width=400 --title="" --text="Please enter your details:" \
	--image="$icon" \
--form \
--field="Last name" \
--field="First name" \
--field="Date of birth":DT
w
}
	



programme()
{
l=`loginn`
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
	
	
esac		
esac
done
}


programme
