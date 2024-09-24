/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   move.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vivaccar <vivaccar@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/22 16:23:40 by vivaccar          #+#    #+#             */
/*   Updated: 2024/09/23 16:25:54 by vivaccar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/cube.h"

void	move_up(t_gm *game)
{
	double new_x;
	double new_y;

	new_x = game->ray->plyr_x + (game->ray->dirX * game->ray->mov_speed);
	new_y = game->ray->plyr_y + (game->ray->dirY * game->ray->mov_speed);

	if (game->map->matriz[(int)new_y][(int)new_x] != '1')
	{
		game->ray->plyr_y = new_y;
		game->ray->plyr_x = new_x;
	}
}

void	move_down(t_gm *game)
{
	double new_x;
	double new_y;

	new_x = game->ray->plyr_x - (game->ray->dirX * game->ray->mov_speed);
	new_y = game->ray->plyr_y - (game->ray->dirY * game->ray->mov_speed);

	if (game->map->matriz[(int)new_y][(int)new_x] != '1')
	{
		game->ray->plyr_y = new_y;
		game->ray->plyr_x = new_x;
	}
}

void	move_left(t_gm *game)
{
	double new_x;
	double new_y;

	new_x = game->ray->plyr_x - (game->ray->plane_x * game->ray->mov_speed);
	new_y = game->ray->plyr_y - (game->ray->plane_y * game->ray->mov_speed);

	if (game->map->matriz[(int)new_y][(int)new_x] != '1')
	{
		game->ray->plyr_y = new_y;
		game->ray->plyr_x = new_x;
	}
}

void	move_right(t_gm *game)
{
	double new_x;
	double new_y;

	new_x = game->ray->plyr_x + (game->ray->plane_x * game->ray->mov_speed);
	new_y = game->ray->plyr_y + (game->ray->plane_y * game->ray->mov_speed);

	if (game->map->matriz[(int)new_y][(int)new_x] != '1')
	{
		game->ray->plyr_y = new_y;
		game->ray->plyr_x = new_x;
	}
}