#**************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmusquer <mmusquer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/01/22 14:39:19 by mvignes           #+#    #+#              #
#    Updated: 2026/04/10 16:05:55 by mmusquer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#================================================#
#                 _       _     _           	||
#                (_)     | |   | |          	||
#__   ____ _ _ __ _  __ _| |__ | | ___  ___ 	||
#\ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|	||
# \ V / (_| | |  | | (_| | |_) | |  __/\__ \	||
#  \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/	||
#================================================#

NAME		= cub3d
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g3 -MMD -MP
VALGRIND	= valgrind --suppressions=readline.supp --leak-check=full --show-leak-kinds=all --track-fds=yes #--trace-children=yes
RM			= rm -f

MAKEFLAGS	+= --no-print-directory

BLACK		= \033[0;30m
RED			= \033[0;31m
GREEN		= \033[0;32m
YELLOW		= \033[0;33m
BLUE		= \033[0;34m
MAGENTA		= \033[0;35m
CYAN		= \033[0;36m
GRAS		= \033[1m
RESET		= \033[0m

SRCS_DIR	= srcs
OBJS_DIR	= .objects

SRCS	= \

OBJS		= $(SRCS:$(SRCS_DIR)/%.c=$(OBJS_DIR)/%.o)
DEPS		= $(OBJS:.o=.d)
INCLUDES	= -I ./includes


#================================#
#______           _           	||
#| ___ \         | |          	||
#| |_/ /___  __ _| | ___  ___ 	||
#|    // _ \/ _` | |/ _ \/ __|	||
#| |\ \  __/ (_| | |  __/\__ \	||
#\_| \_\___|\__, |_|\___||___/	||
#            __/ |            	||
#           |___/             	||
#================================#

MOUV	:= $(shell mv $(NAME) ../../)
TOTAL	= $(words $(SRCS) $(SRCS_BONUS))

all: $(NAME)

$(NAME): $(OBJS)
	@printf "\n"
	@$(CC) $(CFLAGS) $(OBJS) -lreadline -o $(NAME); \
	$(MAKE) name_ascii; \
	$(MAKE) user42; \
	printf "$(GREEN)$(GRAS)👌 Compilation terminée !$(RESET)\n\n"; \
	$(MOUV)\

clean:
	@$(RM) -r $(OBJS_DIR)
	@$(RM) vgcore.*
	@printf "$(RED)Dossier .objects supprimé$(RESET)\n"

fclean: clean
	@$(RM) $(NAME) .last_colors extract.awk
	@printf "$(RED)$(NAME) supprimé$(RESET)\n"

re: fclean all


#============================================================#
# _____                       _ _       _   _             	||
#/  __ \                     (_) |     | | (_)            	||
#| /  \/ ___  _ __ ___  _ __  _| | __ _| |_ _  ___  _ __  	||
#| |    / _ \| '_ ` _ \| '_ \| | |/ _` | __| |/ _ \| '_ \ 	||
#| \__/\ (_) | | | | | | |_) | | | (_| | |_| | (_) | | | |	||
# \____/\___/|_| |_| |_| .__/|_|_|\__,_|\__|_|\___/|_| |_|	||
#                      | |                                	||
#                      |_|                                	||
#============================================================#

INDEX = 0

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(eval INDEX=$(shell echo $$(($(INDEX)+1))))
	@printf "\r$(BLUE)$(GRAS)[$(INDEX)/$(TOTAL)]$(RESET) $(GRAS)Compilation: %-30s$(RESET)" "$<"
	@$(CC) $(CFLAGS) $(INCLUDES) -MMD -MP -c $< -o $@


#============================#
# _____       _   _ _     	||
#|  _  |     | | (_) |    	||
#| | | |_   _| |_ _| |___ 	||
#| | | | | | | __| | / __|	||
#\ \_/ / |_| | |_| | \__ \	||
# \___/ \__,_|\__|_|_|___/	||
#============================#

# Lance bash posix
bash:
	@bash --posix

# Statistiques du projet
stats:
	@printf "$(CYAN)Statistiques du projet:$(RESET)\n"
	@printf "	Fichiers .c	: %d\n" $(TOTAL)
	@printf "	Lignes code	: %d\n" $$(cat $(SRCS) $(SRCS_BONUS) | wc -l)
	@printf "	Headers		: %d\n" $$(find includes -name "*.h" | wc -l)

# Description des fonctions du projet
des:
	@printf "$(CYAN)$(GRAS)Description des fonctions du projet :$(RESET)\n\n\n\n"
	@find srcs -name "*.c" -exec awk '/^\/\/\// { c=1; print; next } c\
	 && /\(/ { print; print ""; print ""; c=0 }' {} +

# Fait un make re et lance valgrind avec les flags
val:
	@make re
	@$(VALGRIND) ./cub3d

# Fait un make re et lance cub3d
mi:
	@make re
	@./cub3d

# Fait un make re et lance un test funcheck pour etre sur de ne avoir laisser des ouvertures a des mallocs non proteger
fun:
	@make re
	@funcheck ./cub3d -c maps/test_map.cub

# Variables pour les couleurs (optionnel, pour la lisibilité)
GREEN  := \033[0;32m
RESET  := \033[0m

git:
	@echo "$(GREEN)Analyse des changements...$(RESET)"
	@git add .
	$(eval MSG := $(shell git status --porcelain | awk '\
		{ \
			n = split($$2, path, "/"); \
			name = path[n]; \
			if ($$1 == "A" || $$1 == "??") new = new name " "; \
			else if ($$1 == "M") mod = mod name " "; \
			else if ($$1 == "D") del = del name " "; \
		} \
		END { \
			res = ""; \
			if (new) res = res "New: " new "; "; \
			if (mod) res = res "Mod: " mod "; "; \
			if (del) res = res "Del: " del "; "; \
			if (res == "") res = "Auto-push: no changes"; \
			print res; \
		}'))
	@git commit -m "$(MSG)"
	@git push -u origin $(shell git rev-parse --abbrev-ref HEAD)

#===========================================# proubleme "ASSII"
#  ___       _      ___          _ _ 	   ||
# / _ \     | |    / _ \        (_|_)	   ||
#/ /_\ \_ __| |_  / /_\ \___ ___ _ _ 	   ||
#|  _  | '__| __| |  _  / __/ __| | |	   ||
#| | | | |  | |_  | | | \__ \__ \ | |	   ||
#\_| |_/_|   \__| \_| |_/___/___/_|_|	   ||
#===========================================#

COLOR_FILE	= .last_colors


# Fonction pour obtenir une couleur différente de la précédente
define get_random_color
$(shell \
	LAST=$$(cat $(COLOR_FILE) 2>/dev/null | head -1 || echo 0); \
	NEW=$$(od -An -N1 -tu1 /dev/urandom | tr -d ' '); \
	NEW=$$((NEW % 6 + 1)); \
	COUNT=0; \
	while [ "$$NEW" = "$$LAST" ] && [ $$COUNT -lt 10 ]; do \
		NEW=$$(od -An -N1 -tu1 /dev/urandom | tr -d ' '); \
		NEW=$$((NEW % 6 + 1)); \
		COUNT=$$((COUNT + 1)); \
	done; \
	echo $$NEW > $(COLOR_FILE); \
	printf "\033[0;3%dm" $$NEW \
)
endef


name_ascii:
	@$(eval COL1=$(call get_random_color))
	@$(eval COL2=$(call get_random_color))
	@$(eval COL3=$(call get_random_color))
	@$(eval COL4=$(call get_random_color))
	@$(eval COL5=$(call get_random_color))
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"
	@printf "\n"



user42:
	@$(eval COL1=$(call get_random_color))
	@$(eval COL2=$(call get_random_color))
	@$(eval COL3=$(call get_random_color))
	@$(eval COL4=$(call get_random_color))
	@$(eval COL5=$(call get_random_color))
	@$(eval COL6=$(call get_random_color))
	@$(eval COL7=$(call get_random_color))
	@$(eval COL8=$(call get_random_color))
	@$(eval COL9=$(call get_random_color))
	@$(eval COL10=$(call get_random_color))
	@$(eval COL11=$(call get_random_color))
	@$(eval COL12=$(call get_random_color))
	@$(eval COL13=$(call get_random_color))
	@$(eval COL14=$(call get_random_color))
	@$(eval COL15=$(call get_random_color))
	@$(eval COL16=$(call get_random_color))
	@printf "   .---.       ____     __   ____     _______       .-''-.  .-------.      .-$(COL8)_$(RESET)'''-.       .-''-.                $(COL10)_ _$(RESET)          ,---.    ,---.,---.  ,---.$(COL13).-./')$(RESET)   .-$(COL14)_$(RESET)'''-.   ,---.   .--.    .-''-.     .-'''-.   \n"
	@printf "   | $(COL2),_$(RESET)|       \\\\   \\\\   /  /.'  __ '. \\\\  ____  \\\\   .'$(COL6)_ _$(RESET)   \\\\ |  $(COL7)_ _$(RESET)   \\\\    '$(COL8)_( )_$(RESET)   \\\\    .'$(COL9)_ _$(RESET)   \\\\              $(COL10)( ' )$(RESET)         |    \\\\  /    ||   /  |   |$(COL13)\\\\ .-.')$(RESET) '$(COL14)_( )_$(RESET)   \\\\  |    \\\\  |  |  .'$(COL15)_ _$(RESET)   \\\\   / $(COL16)_ $(RESET)    \\\\  \n"
	@printf "$(COL2) ,-./  )$(RESET)        \\\\  $(COL3)_$(RESET). /  '/   '  \\\\  \\\\| |    \\\\ |  / $(COL6)( ' )$(RESET)   '| $(COL7)( ' )$(RESET)  |   |$(COL8)(_ o _)$(RESET)|  '  / $(COL9)( ' )$(RESET)   '            $(COL10)(_{;}_)$(RESET)        |  ,  \\\\/  ,  ||  |   |  .'$(COL13)/ '-' \\\\$(RESET)|$(COL14)(_ o _)$(RESET)|  ' |  ,  \\\\ |  | / $(COL15)( ' )$(RESET)   ' $(COL16)('' )$(RESET)/'--'  \n"
	@printf "$(COL2) \\\\  '_ '')$(RESET)       $(COL3)_( )_$(RESET) .' |___|  /  || |____/ / . $(COL6)(_ o _)$(RESET)  ||$(COL7)(_ o _)$(RESET) /   . $(COL8)(_,_)$(RESET)/___| . $(COL9)(_ o _)$(RESET)  |             $(COL10)(_,_)$(RESET)         |  |\\\\$(COL11)_$(RESET)   /|  ||  | $(COL12)_$(RESET) |  |  $(COL13)'-''\\\"'$(RESET). $(COL14)(_,_)$(RESET)/___| |  |\\\\$(COL14)_$(RESET) \\\\|  |. $(COL15)(_ o _)$(RESET)  |$(COL16)(_ o _)$(RESET).     \n"
	@printf "$(COL2)  > (_)  )$(RESET)   ___$(COL3)(_ o _)$(RESET)'     _.-'   ||   $(COL5)_ _$(RESET) '. |  $(COL6)(_,_)$(RESET)___|| $(COL7)(_,_)$(RESET).' __ |  |  .-----.|  $(COL9)(_,_)$(RESET)___|             //            |  $(COL11)_( )_$(RESET)/ |  ||  $(COL12)_( )_$(RESET)  |  .---. |  |  .-----.|  $(COL14)_( )_$(RESET)\\\\  ||  $(COL15)(_,_)$(RESET)___| $(COL16)(_,_)$(RESET). '.   \n"
	@printf "$(COL2) (  .  .-'$(RESET)  |   |$(COL3)(_,_)$(RESET)'   .'   $(COL4)_$(RESET)    ||  $(COL5)( ' )$(RESET)  \\\\'  \\\\   .---.|  |\\\\ \\\\  |  |'  \\\\  '-   .''  \\\\   .---.            //             | $(COL11)(_ o _)$(RESET) |  |\\\\ $(COL12)(_ o._)$(RESET) /  |   | '  \\\\  '-   .'| $(COL14)(_ o _)$(RESET)  |'  \\\\   .---..---.  \\\\  :  \n"
	@printf "$(COL2)  '-''-'$(RESET)|___|   '-'  /    |  $(COL4)_( )_$(RESET)  || $(COL5)(_{;}_)$(RESET) | \\\\  '-'    /|  | \\\\ ''   / \\\\  '-''   |  \\\\  '-'    /         ,-'/              |  $(COL11)(_,_)$(RESET)  |  | \\\\ $(COL12)(_,_)$(RESET) /   |   |  \\\\  '-''   | |  $(COL14)(_,_)$(RESET)\\\\  | \\\\  '-'    /\\\\    '-'  |  \n"
	@printf "   |        \\\\\\\\      /     \\\\ $(COL4)(_ o _)$(RESET) /|  $(COL5)(_,_)$(RESET)  /  \\\\       / |  |  \\\\    /   \\\\        /   \\\\       /         )  (               |  |      |  |  \\\\     /    |   |   \\\\        / |  |    |  |  \\\\       /  \\\\       /   \n"
	@printf "   '--------' '-..-'       '.$(COL4)(_,_)$(RESET).' /_______.'    ''-..-'  ''-'   ''-'     ''-...-'     ''-..-'          '---'              '--'      '--'   '---'     '---'    ''-...-'  '--'    '--'   ''-..-'    '-...-'    \n"
	@printf "$(RESET)\n"

#====================================#
#  ____  _   _  ___  _   ___   __	||
# |  _ \| | | |/ _ \| \ | \ \ / /	||
# | |_) | |_| | | | |  \| |\ V / 	||
# |  __/|  _  | |_| | |\  | | |  	||
# |_|   |_| |_|\___/|_| \_| |_|  	||
#====================================#


-include $(DEPS)

.PHONY: all clean fclean re bash stats des val mi fun name_ascii user42
