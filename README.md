*This project has been created as part of the 42 curriculum by mvignes.*

# 42_project

## objective
Launch all completed projects from anywhere in the terminal

## Description


### Features
- **Command Execution:** Full project execute ; born, push_swap, pipex, fdf, philo, philo_bonus, minishell.


### Challenges
- **Adapter au lancement general:** For several projects, especially graphics, hard code is written by giving the location of an image, so the code had to be modified to avoid segfault. The change on Fedora complicated my task because the minifiai no longer wanted to compile properly.


### Project Structure
```bash
42_project/
├──	Makefile				# Master Makefile
├──	fdf						# Execute fdf
├──	Fdf						# Execute fdf by esouhail
├──	minishell				# Execute minishell
├──	philo					# Execute philo
├──	philo_bonus				# Execute philo_bonus
├──	pipex					# Execute pipex
├──	push_swap				# Execute push_swap
├──	srcs/					# Resources for tests project distance
│	└── fdf_maps/
├──	Code/					# Source code all project
│	├── fdf/				# Directory all code for project fdf
│	├── minishell/			# Directory all code for project minishell
│	├── philosohpers/		# Directory all code for project philo and philo_bonus
│	├── pipex/				# Directory all code for project pipex
│	└── push_swap/			# Directory all code for project push_swap
└──	README.md				# Readme
```

### file .bashrc
```bash
#flatpak list | grep -i code

# Fonction pour lancer Born2beroot
born()
{
	local DISK_PATH="/run/media/mvignes/KINGSTON/born2beroot/b2b"
	local VM_NAME="b2b"

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
PROJECTS="push_swap pipex fdf philosophers philo philo_bonus minishell cub3d project project_code "
CMD="cd code tree ls PWD"

for c in $CMD; do
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
		else
			alias "${c}_${p}"="${c} ${CHEMIN_PROJECT}"
		fi
		echo "Alias creer : ${c}_${p}"
	done
done

export PATH=$PATH:/home/mvignes/.local/42_project:/home/mvignes/.local/funcheck/host
```
---

## Instructions

### Execution
```bash
born

push_swap #list of numbers that can be separated by spaces and have several strings

pipex infile "cmd1" "cmd2" "cmd3" "cmd..." outfile
or
pipex here_doc eof "cmd1" "cmd2" "cmd3" "cmd..." outfile

fdf ~/.local/42_project/srcs/fdf_maps/t1.fdf

philo nb_philo time_to_die time_to_eat time_to_sleep (nb_eating)
philo_bonus nb_philo time_to_die time_to_eat time_to_sleep (nb_eating)

minishell
```

---

## Resources
- [Manual bash](https://www.justice.gov/epstein/files/DataSet%209/EFTA00315849.pdf)
- [Doc code sh](https://pubs.opengroup.org/onlinepubs/009695399/utilities/sh.html)
- [Open group](https://pubs.opengroup.org/onlinepubs/)
- [die.net](https://www.die.net/)
- [koor](https://koor.fr/)
- [IBM](https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=SSFKSJ_9.2.0/com.ibm.mq.ref.dev.doc/q093670_.html)
- [forum dev](https://www.developpez.net/forums/d235094/c-cpp/c/fonction-opendir/)
- [toturiel hostinger](https://www.hostinger.com/fr/tutoriels)


#### Artificial intelligence (Gemini) was used for the following tasks : Understanding of the subject and help with the translation into English of the README.

	No.
