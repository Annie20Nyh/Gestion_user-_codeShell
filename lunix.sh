#!/bin/bash

saisir_utilisateur() {
	read -p "Entrez le nom de l'utilisateur : " utilisateur
}

utilisateur_existe() {
	id "$1" &>/dev/null
}

verifier_existences() {
	saisir_utilisateur
	if utilisateur_existe "$utilisateur"; then
		echo " L'utilisateur '$utilisateur' existe."
	else
		echo " l'utilisateur '$utilisateur' n'existe pas. "
	fi
}

connaitre_uid () {
	saisir_utilisateur
	if utilisateur_existe "$utilisateur"; then
		echo " L'UID de '$utilisateur' est : $(id -u "$utilisateur")"
	else
		echo "L'utilisateur '$utilisateur'  n'existe pas "
	fi
}

while true ; do
	echo
	echo "selectionnez :"
	echo " 1 - Verifier l'existances d'un utilisateur"
	echo " 2 - Connaitre l'UID d'un utilisateur"
	echo " q - Quitter "
	read -p "votre choix : " choix

	case "$choix" in 
		1) verifier_existences ;;
		2) connaitre_uid ;;
		q|Q) echo "Au revoir !"; exit 0;;
		*) echo "choix invalide, veuillez reessayer.";;
	esac
done
