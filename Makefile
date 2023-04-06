NAME = minishell

CFLAGS = -Wall -Wextra -Werror -L/usr/local/lib -I/usr/local/include -lreadline

DIR_SRC =	sources/

LST_SRC =	main.c				\
			error.c				\
			utils.c				\
			env/env_init.c		\
			env/env_creat.c		\
			env/env_check.c		\
			env/env_export.c	\
			env/env_unset.c		\
			env/env_utils.c		\
			env/env_lst.c		\
			env/env_cd.c		\
			parsing/parsing.c	\
			parsing/split_pipes.c \
			parsing/x_dollar.c 	\
			parsing/free_cmd.c 	\
			parsing/check_input.c \
			parsing/check_chevron.c \
			process.c			\
			s_access.c 			\
			child.c				\
			get_arg_path.c		\
			signal.c			\
			builtin.c			\
			
SOURCES	=	$(addprefix $(DIR_SRC), $(LST_SRC))

DIR_OBJ	=	objects/
OBJECTS = 	$(patsubst $(DIR_SRC)%.c, $(DIR_OBJ)%.o, $(SOURCES))

HEADERS =	$(DIR_SRC)minishell.h

LIBRARY = 	$(DIR_SRC)libft/libft.a

#  ==============================  RULES  ==============================  #

all: lib 
	$(MAKE) $(NAME)

lib :
	@$(MAKE) -C $(DIR_SRC)libft

clean:
	@rm -rf $(DIR_OBJ)
	@$(MAKE) -C $(DIR_SRC)libft clean

fclean: clean
	@rm -rf $(NAME)
	@$(MAKE) -C $(DIR_SRC)libft fclean
	@printf "$(RED)$(NAME) fclean done!\n$(END)"

re: fclean
	@$(MAKE) all

.PHONY: all clean fclean re lib

#  ===========================  COMPILATION  ===========================  #

$(NAME): $(DIR_OBJ) $(OBJECTS)
	cc $(OBJECTS) $(CFLAGS) $(LIBRARY) -o $(NAME)

$(DIR_OBJ)	:
	@mkdir -p $(DIR_OBJ)
	@mkdir -p $(DIR_OBJ)/env
	@mkdir -p $(DIR_OBJ)/parsing

$(DIR_OBJ)%.o: $(DIR_SRC)%.c $(HEADERS) $(LIBRARY)
	cc $(CFLAGS) -c $< -o $@

#  =============================  OPTIONS  =============================  #

ERASE		= 	\033[2K
RERASE		= 	\r\033[2K
BLACK		=	\033[0;30m
RED			=	\033[0;31m
GREEN		=	\033[0;32m
ORANGE		=	\033[0;33m
BLUE		=	\033[0;34m
PURPLE		=	\033[0;35m
CYAN		=	\033[0;36m
GRAY_LIGHT	=	\033[0;37m
GRAY_DARK	=	\033[1;30m
RED_LIGHT	=	\033[1;31m
GREEN_LIGHT	=	\033[1;32m
YELLOW 		=	\033[1;33m
BLUE_LIGHT	=	\033[1;34m
VIOLET		=	\033[1;35m
CYAN		=	\033[1;36m
WHITE		=	\033[1;37m
END			=	\033[0m