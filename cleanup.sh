#!/bin/bash
printf "\nHELLO $USER\n"

# The target file
FILE=

# Target sweep directory
# TODO: Search "smartly" in other directories
DIRNAME=Downloads
DIRPATH=~/Downloads

# Trash directory
TRASH=~/.Trash

# User Response
ANS=

while :
do
    # Generate a random bit
    RAND=$(gshuf -i0-1 -n1)

    # Randomly: Either give an old file, or give a random file
    if [ $RAND = 0 ]; then
        printf "Here's a RANDOM file. Do you want to delete it?\n"
        FILE=$(ls $DIRPATH | gshuf -n 1)
    else
        printf "Here's a really OLD file! Do you want to delete it?\n"
	cd ~/Downloads
	FILE=$(ls -tr1 | head -1)
    fi

    echo $FILE

    echo "Choose the option number"
    echo "1) Yes"
    echo "2) No"
    echo "3) Later"
    echo "4) Exit"
    echo

    # Prompt USER
    read ANS

    case $ANS in
        1 )
            echo "Okay! The file $FILE is now in Trash"
            mv $DIRPATH/"{$FILE}" $TRASH                       ;;
        2 ) echo "Okay, we're keeping the file $FILE!"         ;;
        3 ) echo "Okay, we will delete the file $FILE LATER!"  ;;
	4 ) echo "Okay, see you later!"                        
	    break                                              ;; 
    esac
    echo

done

echo "Done sweeping!"