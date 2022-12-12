#!/bin/bash

function main(){
    
    banner
    sleep 0.2
    
    echo -e "${blue}"
    echo -e "2 --> Instalar i3 y configurar"
    sleep 0.2
    
    echo
    echo -e "3 --> Desinstalar i3"
    sleep 0.2
    
    echo
    echo -e "4 --> Poner i3 de fábrica"
    sleep 0.2

    echo
    echo -e "5 -> Salir."
    sleep 0.2

    echo
    read -p "-> " opcion
    echo -e "${end}"

    if [ "$opcion" == "1" ]; then
	dependeces
	fi

    if [ "$opcion" == "2" ]; then
	i3
	fi

    if [ "$opcion" == "3" ]; then
	deli3
	fi

    if [ "$opcion" == "4" ]; then
	fabric
	fi

}

i3(){

	sudo pacman -Sy
	
	sudo pacman -S i3
    
    sudo pacman -S picom

	sudo pacman -S feh

	sudo pacman -S neovim

	sudo pacman -S zsh

    sudo pacman -S alacritty

	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
	git clone https://github.com/gr1m2/i3.git

	cd i3

	mkdir $HOME/$USER/.config/i3blocks

	mkdir $HOME/$USER/.config/rofithemes

	mkdir $HOME/$USER/.config/wallpapers

	mv 01.png $HOME/$USER/.config/i3/wallpapers
	
	mv arthur.rasi $HOME/$USER/.config/i3/rofithemes


}


deli3(){
    sudo apt-get --purge remove polybar

    sudo apt-get remove --auto-remove i3-wm
}

fabric(){
    sudo apt-get remove --auto-remove i3-wm

    rm -r ~/.i3

    sudo apt install i3
}

config(){
    cd $HOME

    cd ~/.i3
}

if [ "$(id -u)" == "0" ]; then
	
    echo -e "\n${red}[!] Hay que ser root para ejecutar la herramienta${end}"
	echo
	exit 1
else
	main
fi
