source menu.sh
source help.sh
source exit.sh
source liste.sh
source afficher.sh
while true
do 
#clear
menu
case "$answer" in 
 1 )xaffiche;;
 2 )xliste;;
 3 );;
 4 );;
 5 ) xxhelp ;;
 q ) xexit ;;
esac
#echo -e "entrer return pour continuer "
#read input 
done

