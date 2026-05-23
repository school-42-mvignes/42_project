
#flatpak list | grep -i code

# Fonction pour lancer Born2beroot
born()
{
	local DISK_PATH="/run/media/mvignes/KINGSTON/42/vm/born2beroot/b2b"
	local VM_NAME="b2b"

	if [ -d "$DISK_PATH" ]; then
		echo "✅ Disque détecté. Lancement de $VM_NAME..."
		VBoxManage startvm "$VM_NAME"
	else
		echo "❌ Erreur : Le disque dur n'est pas branché ou le dossier est inaccessible."
		echo "Vérifie le chemin : $DISK_PATH"
	fi
}

# Fonction pour lancer Born2beroot
inc()
{
        local DISK_PATH="/run/media/mvignes/KINGSTON/42/vm/inception/Inception"
        local VM_NAME="Inception"

        if [ -d "$DISK_PATH" ]; then
                echo "✅ Disque détecté. Lancement de $VM_NAME..."
                VBoxManage startvm "$VM_NAME"
        else
                echo "❌ Erreur : Le disque dur n'est pas branché ou le dossier est inaccessible."
                echo "Vérifie le chemin : $DISK_PATH"
        fi
}


### creation d'alias
BASE_PATH="/home/mvignes/.local/42_project/Code"
PROJECTS="push_swap pipex fdf philosophers philo philo_bonus minishell cub3d project project_code cub3d"
CMD="cd code tree ls PWD bat"

for c in $CMD; do
	echo "       Alias ${c}"
	for p in $PROJECTS; do
		if [ "$p" = "philo" ] || [ "$p" = "philo_bonus" ]; then
			CHEMIN_PROJECT="$BASE_PATH/philosophers/$p"
		elif [ "$p" = "project" ]; then
			CHEMIN_PROJECT="/home/mvignes/.local/42_project"
		elif [ "$p" = "project_code" ]; then
			CHEMIN_PROJECT="/home/mvignes/.local/42_project/Code"
		else
			CHEMIN_PROJECT="$BASE_PATH/$p"
		fi
		if [ "$c" = "PWD" ]; then
			alias "${c}_${p}"="(cd ${CHEMIN_PROJECT} && pwd)"
		elif [ "$c" = "bat" ]; then
			alias "${c}_${p}"="(cd ${CHEMIN_PROJECT} && bat */*)"
		else
			alias "${c}_${p}"="${c} ${CHEMIN_PROJECT}"
		fi
		#echo "Alias creer : ${c}_${p}"
	done
	#echo ""
done

alias "terminal"="/home/mvignes/.local/42_project/srcs/lancer_terminal.sh"
alias "cd_exam"="cd /home/mvignes/Documents/github/Exam/rank03"

export PATH=$PATH:/home/mvignes/.local/42_project:/home/mvignes/.local/funcheck/host

