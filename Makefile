# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aconceic <aconceic@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/09 21:54:54 by aconceic          #+#    #+#              #
#    Updated: 2024/09/10 19:55:22 by aconceic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# linux link
# https://cdn.intra.42.fr/document/document/25858/minilibx-linux.tgz

# WSL link
# https://cdn.intra.42.fr/document/document/25859/minilibx_opengl.tgz

# openGL link
# https://cdn.intra.42.fr/document/document/25859/minilibx_opengl.tgz

##############################################
#                 MAIN SOURCES               #
##############################################
#Libraries
LIBFT_DIR = libraries/libft/
LIBFT_LIB = $(LIBFT_DIR)libft.a
PRINTF_DIR = $(LIBFT_DIR)/ft_printf
GNL_DIR = $(LIBFT_DIR)get_next_line/
GNL_LIB = $(GNL_DIR)gnl.a

### Project
NAME = cube
OBJ_DIR = ./objs/
OBJ = $(addprefix $(OBJ_DIR), $(notdir $(SRC:.c=.o)))
SRC_DIR = ./sources/
SRC = main.c free.c init.c map_parsing.c

### MiniLibX
##DIR FOR MLX HAVING IN CONSIDERATION THE OS
MLX_DIR = libraries/minilibx-linux/
##FLAGS FOR MLX HAVING IN CONSIDERATION THE OS
MLXFLAGS = -L$(MLX_DIR) -lmlx -lXext -lX11 -lm

### Compilation
CC = cc
GCC = cc -g
CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

### RULES
all : download mlx_compile $(NAME)

mlx_compile :
	@echo "$(ORANGE)[!]$(RESET) Working on MiniLibX ..."
	@$(MAKE) -C $(MLX_DIR) > /dev/null 2>&1

$(OBJ_DIR):
	@echo "$(ORANGE)[!]$(RESET) Creating directory for objects ..."
	mkdir -p $@

$(NAME) : $(OBJ) $(LIBFT_LIB)
	@echo "$(ORANGE)[!]$(RESET) Working on project ... "
	$(GCC) $(CFLAGS) $(OBJ) $(LIBFT_LIB) $(GNL_LIB) $(MLXFLAGS) -o $(NAME) > /dev/null 2>&1
	@echo "$(GREEN)[✔]$(RESET) $(BLUE)Ok!$(RESET) "

$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(OBJ_DIR)
	@echo "$(ORANGE)[!]$(RESET) Creating objects ..."
	$(GCC) $(CFLAGS) -c $< -o $@
	@echo "$(GREEN)[✔]$(RESET) $(BLUE)Objects Ok!$(RESET) "

$(LIBFT_LIB) : $(LIBFT_DIR) $(PRINTF_DIR) $(GNL_DIR)
	@echo "$(ORANGE)[!]$(RESET) Working on LIBFT_LIB ..."
	@make -C $(LIBFT_DIR) bonus > /dev/null 2>&1
	@make -C $(PRINTF_DIR) > /dev/null 2>&1
	@make -C $(GNL_DIR) > /dev/null 2>&1
	@echo "$(GREEN)[✔]$(RESET) $(BLUE)LIBFT Ok!$(RESET)"

clean:
	@echo "$(ORANGE)[!]$(RESET) Executing cleaning ..."
	$(RM) -rf $(OBJ_DIR) > /dev/null 2>&1
	$(MAKE) clean -C $(LIBFT_DIR) > /dev/null 2>&1
	$(MAKE) clean -C $(MLX_DIR) > /dev/null 2>&1
	@echo "$(GREEN)[✔]$(RESET) $(BLUE)Cleaning Ok!$(RESET)"

fclean:
	@echo "$(ORANGE)[!]$(RESET) Executing full cleaning..."
	$(RM) $(NAME) > /dev/null 2>&1
	$(RM) -rf $(OBJ_DIR) > /dev/null 2>&1
	$(RM) -rf libraries/minilibx-linux > /dev/null 2>&1
	make fclean -C $(LIBFT_DIR) > /dev/null 2>&1
	@echo "$(GREEN)[✔]$(RESET) $(BLUE)full cleaning!$(RESET)"


re : fclean download all
	@echo "$(GREEN)[✔]$(RESET) $(MAGENTA)Refresh Ok!$(RESET) "

download:
	@wget https://cdn.intra.42.fr/document/document/25858/minilibx-linux.tgz
	@tar -xzf minilibx-linux.tgz -C libraries
	@rm minilibx-linux.tgz
