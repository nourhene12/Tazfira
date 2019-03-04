#! /bin/bash
#!/bin/sh
source afficher.sh
source lister.sh
source desc.sh
source sauvgarder.sh
source xhelp.sh


TITBOX=Menu
DECO=/home/ghassen/Bureau/tazfira/siflet.png
SOUND=/home/ghassen/Bureau/tazfira/b.wav
icon=/home/ghassen/Bureau/tazfira/hello.png
db_accueil()
{
yad --title=$TITBOX --text=" <span foreground='orange'><b><big><big>chosissez la commande:</big></big></b></span>" \
	--window-icon="$DECO" --image="$DECO" --image-on-top \
	  --list --radiolist --no-headers \
	--button=gtk-no:1 --button=gtk-yes:0 \
	--column 1 --column 2 --print-column=2 \
		 false "<span foreground='black'><b><big>-inclut</big></b></span>" true  "<span foreground='black'><b><big>-liste</big></b></span>" \
		 false "<span foreground='black'><b><big>-desc</big></b></span>" false "<span foreground='black'><b><big>-save</big></b></span>" false "<span foreground='black'><b><big>-help</big></b></span>"
}







db_notification()
{
aplay $SOUND &
yad  --title=$TITBOX--timeout=4 --info --text="Validée \!" \
	 --window-icon="$DECO" --image="$DECO" --image-on-top
       
}

loginn()
{
yad --width=400 --title="" --text="<span foreground='orange'><b><big><big>Please enter your details:</big></big></b></span>" \
   --image="$icon" \
--button=gtk-quit:1  --button=gtk-yes:0 \
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
	"<span foreground='black'><b><big>-inclut</big></b></span>|")
                afficher
		db_notification
	;;
	"<span foreground='black'><b><big>-liste</big></b></span>|")
		lister
	;;
	"<span foreground='black'><b><big>-desc</big></b></span>|")
		desc
		db_notification
	;;
	"<span foreground='black'><b><big>-save</big></b></span>|")
		save
		db_notification
	;;
          "<span foreground='black'><b><big>-help</big></b></span>|")
            xhelp
	;;
	
	esac
esac
done
}

programme
