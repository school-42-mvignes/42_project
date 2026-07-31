/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_again.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mvignes <mvignes@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/07/08 01:09:09 by lyaberge          #+#    #+#             */
/*   Updated: 2026/07/31 16:45:03 by mvignes          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cube.h"

int	init_texture_mona(t_game *game)
{
	if (laod_texture(game, &game->mona.anim_img[0],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_0.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[1],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_1.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[2],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_2.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[3],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_3.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[4],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_4.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[5],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_5.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[6],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_6.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->mona.anim_img[7],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/wall_mona/wall_mona_7.xpm") == ERROR)
		return (ERROR);
	return (OK);
}

int	init_mona(t_game *game)
{
	game->mona.nb_of_img = 8;
	game->mona.time_frame = TIME_FRAME_MONA;
	game->mona.frame_id = 0;
	game->mona.nb_of_loop = 0;
	if (init_texture_mona(game) == ERROR)
		return (ERROR);
	return (OK);
}

int	init_texture_munch(t_game *game)
{
	if (laod_texture(game, &game->munch.anim_img[0],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_0.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->munch.anim_img[1],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_1.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->munch.anim_img[2],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_2.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->munch.anim_img[3],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_3.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->munch.anim_img[4],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_4.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->munch.anim_img[5],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_5.xpm") == ERROR)
		return (ERROR);
	if (laod_texture(game, &game->munch.anim_img[6],
			"/home/mvignes/.local/42_project/srcs/cub3d_textures/texture_gall/munch/wall_anim_6.xpm") == ERROR)
		return (ERROR);
	return (OK);
}

int	init_munch(t_game *game)
{
	game->munch.nb_of_img = 7;
	game->munch.time_frame = TIME_FRAME_MUNCH;
	game->munch.frame_id = 0;
	game->munch.nb_of_loop = 0;
	if (init_texture_munch(game) == ERROR)
		return (ERROR);
	return (OK);
}
