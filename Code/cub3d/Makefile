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
		srcs/libft/ft_isalpha.c\
		srcs/libft/ft_isdigit.c\
		srcs/libft/ft_isalnum.c\
		srcs/libft/ft_isascii.c\
		srcs/libft/ft_isprint.c\
		srcs/libft/ft_is_space.c\
		srcs/libft/ft_strlen.c\
		srcs/libft/ft_memset.c\
		srcs/libft/ft_bzero.c\
		srcs/libft/ft_memcpy.c\
		srcs/libft/ft_memmove.c\
		srcs/libft/ft_strlcpy.c\
		srcs/libft/ft_strlcat.c\
		srcs/libft/ft_toupper.c\
		srcs/libft/ft_tolower.c\
		srcs/libft/ft_strchr.c\
		srcs/libft/ft_strrchr.c\
		srcs/libft/ft_strncmp.c\
		srcs/libft/ft_memchr.c\
		srcs/libft/ft_memcmp.c\
		srcs/libft/ft_strnstr.c\
		srcs/libft/ft_atoi.c\
		srcs/libft/ft_atol.c\
		srcs/libft/ft_atoi_base.c\
		srcs/libft/ft_calloc.c\
		srcs/libft/ft_strdup.c\
		srcs/libft/ft_free_tab.c\
		srcs/libft/ft_substr.c\
		srcs/libft/ft_strjoin.c\
		srcs/libft/ft_strtrim.c\
		srcs/libft/ft_split.c\
		srcs/libft/ft_itoa.c\
		srcs/libft/ft_strmapi.c\
		srcs/libft/ft_striteri.c\
		srcs/libft/ft_putchar_fd.c\
		srcs/libft/ft_putstr_fd.c\
		srcs/libft/ft_putendl_fd.c\
		srcs/libft/ft_putnbr_fd.c\
		srcs/libft/ft_lstnew.c\
		srcs/libft/ft_lstadd_front.c\
		srcs/libft/ft_lstsize.c\
		srcs/libft/ft_lstlast.c\
		srcs/libft/ft_lstadd_back.c\
		srcs/libft/ft_lstdelone.c\
		srcs/libft/ft_lstclear.c\
		srcs/libft/ft_lst_create_and_addback.c\
		srcs/libft/ft_lst_sort.c\
		srcs/libft/ft_lstiter.c\
		srcs/libft/ft_lstmap.c\
		srcs/libft/ft_print_char.c\
		srcs/libft/ft_printf.c\
		srcs/libft/ft_print_int.c\
		srcs/libft/ft_size.c\
		srcs/libft/get_next_line.c\
		srcs/libft/get_next_line_utils.c\
		\
		srcs/main.c\
		srcs/main_cut.c\
		\
		srcs/utils/lstenv.c\
		srcs/utils/other_split.c\
		srcs/utils/print_struc.c\
		srcs/utils/utils.c\
		\
		srcs/builtin/cd.c\
		srcs/builtin/echo.c\
		srcs/builtin/env.c\
		srcs/builtin/exit.c\
		srcs/builtin/export.c\
		srcs/builtin/export_utils.c\
		srcs/builtin/orchestrator.c\
		srcs/builtin/pwd.c\
		srcs/builtin/unset.c\
		srcs/builtin/utils.c\
		\
		srcs/execution/env.c\
		srcs/execution/env_utils.c\
		srcs/execution/exec_cmd.c\
		srcs/execution/exec_line.c\
		srcs/execution/path.c\
		srcs/execution/pipe.c\
		srcs/execution/and.c\
		srcs/execution/or.c\
		srcs/execution/redir.c\
		srcs/execution/redir_heredoc.c\
		srcs/execution/redir_heredoc_utils.c\
		srcs/execution/wildcard.c\
		srcs/execution/wildcard_utils.c\
		srcs/execution/utils.c\
		\
		srcs/lexer/lexer.c\
		srcs/lexer/lexer_utils.c\
		srcs/lexer/lexer_cut.c\
		srcs/lexer/lexer_checker_main.c\
		srcs/lexer/lexer_checker_sep_redir.c\
		srcs/lexer/lexer_checker_bracket.c\
		\
		srcs/parser/parser.c\
		srcs/parser/parser_cut.c\
		srcs/parser/parser_utils.c\
		srcs/parser/parser_free.c\
		\
		srcs/expand/expand.c\
		srcs/expand/expand_dollards.c\
		srcs/expand/expand_quotes.c\
		srcs/expand/expand_concatenate.c\
		\
		srcs/signal/signal.c\

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


#===========================================# proubleme "ASSII"
#  ___       _      ___          _ _ 	   ||
# / _ \     | |    / _ \        (_|_)	   ||
#/ /_\ \_ __| |_  / /_\ \___ ___ _ _ 	   ||
#|  _  | '__| __| |  _  / __/ __| | |	   ||
#| | | | |  | |_  | | | \__ \__ \ | |	   ||
#\_| |_/_|   \__| \_| |_/___/___/_|_|	   ||
#===========================================#

COLOR_FILE	= .last_colors
COLOR_MAX	:= $(call get_random_color)$(GRAS)
COLOR_MAT	:= $(call get_random_color)$(GRAS)


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
#	@printf "$(call get_random_color)$(GRAS)"
	@printf "                                                                                         _______     ___    _  _______      .-'''-.    ______     \n"
	@printf "                                                                                        /   __  \  .'   |  | |\  ____  \   /   _   \  |    $(COL5)_$(RESET) '''. \n"
	@printf "                                                                                       | $(COL1),_$(RESET)/  \__) |   .'  | || |    \ |  |__/' '.  | | $(COL5)_ | ) _ $(RESET) \ \n"
	@printf "                                                                                     $(COL1),-./  )$(RESET)       .'  '$(COL2)_$(RESET)  | || |____/ /     .--'  /  |$(COL5)( ''_'  )$(RESET) |\n"
	@printf "                                                                                     $(COL1)\  '_ '')$(RESET)     |   $(COL2)( \.-.$(RESET)||   $(COL3)_ _$(RESET) '.  ___'--$(COL4)._ _\$(RESET)  | $(COL5). (_) '.$(RESET) |\n"
	@printf "                                                                                      $(COL1)> (_)  )$(RESET)  __ | $(COL2)('. _' /$(RESET)||  $(COL3)( ' )$(RESET)  \|   |  $(COL4)( ' )$(RESET) |$(COL5)(_    ._)$(RESET) '\n"
	@printf "                                                                                     $(COL1)(  .  .-'$(RESET)_/  )| $(COL2)(_ (_) _)$(RESET)| $(COL3)(_{;}_)$(RESET) ||   '-$(COL4)(_{;}_)$(RESET)|  $(COL5)(_.\.'$(RESET) / \n"
	@printf "                                                                                      $(COL1)'-''-'$(RESET)     /  \ $(COL2)/  . \ /$(RESET)|  $(COL3)(_,_)$(RESET)  / \     $(COL4)(_,_)$(RESET) |       .'  \n"
	@printf "                                                                                        '._____.'    '$(COL2)'-''-''$(RESET) /_______.'   '-..__.-'  '-----''    $(RESET)\n"

COLOR_MMUSQUER = $(shell NEW=$$(($$RANDOM % 6 + 1)); printf "\033[1;3%dm" $$NEW)
COLOR_MVIGNES  = $(shell NEW=$$(($$RANDOM % 6 + 1)); printf "\033[1;3%dm" $$NEW)

#
#
#
#
#
#
#


#$(COL16)
#	@printf "   | ,_|       \   \   /  /.'  __ '. \  ____  \   .'_ _   \ |  _ _   \    '_( )_   \    .'_ _   \              ( ' )         |    \  /    ||   /  |   |\ .-.') '_( )_   \  |    \  |  |  .'_ _   \   / $(COL1)_$(RESET)     \  \n"
#	@printf " ,-./  )        \  _. /  '/   '  \  \| |    \ |  / ( ' )   '| ( ' )  |   |(_ o _)|  '  / ( ' )   '            (_{;}_)        |  ,  \/  ,  ||  |   |  .'/ '-' \|(_ o _)|  ' |  ,  \ |  | / ( ' )   ' $(COL1)('' )$(RESET)/'--'  \n"
#	@printf " \  '_ '')       _( )_ .' |___|  /  || |____/ / . (_ o _)  ||(_ o _) /   . (_,_)/___| . (_ o _)  |             (_,_)         |  |\_   /|  ||  | _ |  |  '-''"'. (_,_)/___| |  |\_ \|  |. (_ o _)  |$(COL1)(_ o _)$(RESET).     \n"
#	@printf "  > (_)  )   ___(_ o _)'     _.-'   ||   _ _ '. |  (_,_)___|| (_,_).' __ |  |  .-----.|  (_,_)___|             //            |  _( )_/ |  ||  _( )_  |  .---. |  |  .-----.|  _( )_\  ||  (_,_)___| $(COL1)(_,_)$(RESET). '.   \n"

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
