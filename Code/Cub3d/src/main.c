/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mvignes <mvignes@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/06/09 14:48:41 by mvignes           #+#    #+#             */
/*   Updated: 2026/07/31 17:40:18 by mvignes          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cube.h"

static bool	posibility_search_my_path(char *path)
{
	if (!ft_strcmp(path, "complete") ||
		!ft_strcmp(path, "big") ||
		!ft_strcmp(path, "cheese") ||
		!ft_strcmp(path, "cheese2") ||
		!ft_strcmp(path, "creepy") ||
		!ft_strcmp(path, "matrix") ||
		!ft_strcmp(path, "subject"))
		return (true);
	return (false);
}

static char	*search_my_path(char *path)
{
	if (!ft_strcmp(path, "complete"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/complete_map.cub");
	if (!ft_strcmp(path, "big"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/big_map.cub");
	if (!ft_strcmp(path, "cheese"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/cheese_maze.cub");
	if (!ft_strcmp(path, "cheese2"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/cheese_maze2.cub");
	if (!ft_strcmp(path, "creepy"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/creepy.cub");
	if (!ft_strcmp(path, "matrix"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/matrix.cub");
	if (!ft_strcmp(path, "subject"))
		return ("/home/mvignes/.local/42_project/srcs/cub3d_map/good/subject_map.cub");
}

/// @brief The main for the best project "Cub3D" of all 42 !
/// @param ac 
/// @param av 
/// @return exit status
int	main(int ac, char **av)
{
	t_game	game;

	if (ac != 2)
		return (ft_putstr_fd("Error: Wrong number of args\n", 2), ERROR);

	if (posibility_search_my_path(av[1]))
		av[1] = search_my_path(av[1]);

	ft_memset(&game, 0, sizeof(game));
	if (parsing(&game, av) == ERROR)
		return (exit_game(&game, ERROR));
	if (init_img(&game) == ERROR)
		return (exit_game(&game, ERROR));
	init_key(&game);
	game.start_anim_wall = false;
	if (display_check(&game) == ERROR)
		return (exit_game(&game, ERROR));
	mlx_hook(game.win, 2, 1L << 0, ((t_mlx_func)(uintptr_t)keywee), &game);
	mlx_hook(game.win, 3, 1L << 1, ((t_mlx_func)(uintptr_t)keyno), &game);
	mlx_hook(game.win, 17, 0, ((t_mlx_func)(uintptr_t)exit_game), &game);
	mlx_loop_hook(game.mlx, ((t_mlx_func)(uintptr_t)game_loop), &game);
	mlx_loop(game.mlx);
	return (OK);
}
