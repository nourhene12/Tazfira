source menu.sh
source afficher.sh
source lister.sh
source desc.sh
source sauvgarder.sh
source xhelp.sh
test=1
menuagain=0
while [[ $test == 1 ]]
do
        if [[ $* ]]; then
                        case $* in
                    -inclut)
                                   afficher ;;
                    -list)
                                    lister;;
                    -desc)
                                    desc;;
                    -save)
                                    sauvgarder;;
                    -help)
                                    xhelp;;
                    esac
                    menuagain=1
                    test=2
           else   
                    menu
                    if [[ $choix == 0 ]]; then
                    test=2
                    else 
                    case $choix in 
                    1 )
                            afficher;;
                    2 )
                            lister;;
                   3 )
                            desc;;
                   4 )
                            sauvgarder;; 
                   5 )
                            xhelp;;
		esac
                menuagain=1
                test=2
	fi
	fi
done



