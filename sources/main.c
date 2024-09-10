/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aconceic <aconceic@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/09 21:36:04 by aconceic          #+#    #+#             */
/*   Updated: 2024/09/10 19:07:43 by aconceic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/cube.h"

int	main(int argc, char **argv)
{
	printf("Ready to start! \n");
	t_gm	game;

	ft_bzero(&game, sizeof(t_gm));
	if (argc != 2)
		return(err_msg("Bad Usage", EXIT_FAILURE));
	if (run_mlx(&game))
		return (err_msg("Error Mlx Init", EXIT_FAILURE));
	
	(void)argc;
	(void)argv;
	return (0);
}