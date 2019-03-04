#! /bin/bash
source afficher.sh
source lister.sh
source desc.sh
source sauvgarder.sh
testbin()
{
if [ ! -x /usr/bin/$1 ]
then 
	echo "Veuillez installer $1."
	exit 0
fi
}
testbin yad
testbin aplay

# Variables #

TITBOX=Menu
DECO=/home/nourhene/Desktop/tazfira/index.png
SOUND=/home/nourhene/Desktop/tazfira/b.wav

# Boite d'accueil #

db_accueil()
{
yad --title=$TITBOX --text=" Choisissez la commande !" \
	--window-icon="$DECO" --image="$DECO" --image-on-top \
	--height=185 --list --radiolist --no-headers \
	--column 1 --column 2 --print-column=2 \
		 false "Inclut" true  "List" \
		 false "Desc" false "Save"
}

# Boite choix temps autre #
db_autre()
{
yad --title=$TITBOX --text="Choisissez le temps d'infusion (min)." \
	--geometry=400x35 \
	--window-icon="$DECO" --image="$DECO" --image-on-top \
	--scale --min-value=120 --max-value=600 --value=300 \
	--mark=2:120 --mark="":150 --mark=3:180 --mark="":210 \
	--mark=4:240 --mark="":270 --mark=5:300 --mark="":330 \
	--mark=6:360 --mark="":390 --mark=7:420 --mark="":450 \
	--mark=8:480 --mark="":510 --mark=9:540 --mark="":570 \
	--mark=10:600  --hide-value
}



# Boite de notification #

db_notification()
{
aplay $SOU ND &
yad  --title=$TITBOX--timeout=4 --info --text="C'est prêt \!" \
	 --window-icon="$DECO" --image="$DECO" --image-on-top
}

# Programme #

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
	"Autre|")
		CHOIX=`db_autre`
		case $? in
252) # An error occured or the box was closed
			exit 0
		;;
		1) # Cancel/No pressed
 			programme
		;;
		0) # All OK
			sleep "$CHOIX"s
			db_notification
		;;
		esac
	;;
	esac
;;
esac
done
}

# Lancement effectif #
programme
