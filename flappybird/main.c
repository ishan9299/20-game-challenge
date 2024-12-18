#include "raylib.h"
#include <stdio.h>
#include <stdbool.h>

#define MAX_TUBES 20

typedef enum GAME_STATE {
	TITLE = 0,
	GAMEPLAY,
	GAMEOVER,
} GAME_STATE;

void print_player_positions(Vector2 position, float displacement) {
	printf("player->position: [x: %f, y: %f];\n", position.x, position.y);
	printf("player->total_displacement: [%f];\n", displacement);
}

typedef struct Player {
	Texture2D spritesheet;
	Rectangle texture_coords;
	Rectangle hitbox;
	Vector2 position;
	Vector2 size;

	int frame_counter;
	int frame_speed;
	int current_frame;

	float vert_velocity;
	float curr_vert_velocity;
	float fall_constant;
} Player;

typedef struct Ground {
	Rectangle texture_coords;
	int num_of_grounds;

	float scroll_velocity;
	float scroll_amt;

	int tex_width;
	int tex_height;
} Ground;

typedef struct Pipe {
	Rectangle texture_coords;
	Vector2 position;

	int height;
	int width;

	float scroll_velocity;
	float scroll_amt;

	int tex_width;
	int tex_height;
} Pipe;

typedef struct Obstacle {
	Texture2D spritesheet;
	Ground ground;
	Pipe pipes[100];
} Obstacle;

void obstacle_generate_pipes(Obstacle *obstacle, Rectangle *obstacle_pipe_tex_in_atlas, int screen_width) {
	for (int i = 0; i < 100; i+=2) {
		obstacle->pipes[i].texture_coords = *obstacle_pipe_tex_in_atlas;
		obstacle->pipes[i].tex_width = 32;
		obstacle->pipes[i].tex_height = 200;

		obstacle->pipes[i].scroll_velocity = 1.0f;
		obstacle->pipes[i].scroll_amt = 0.0f;

		obstacle->pipes[i].height = 400.0f;
		obstacle->pipes[i].width = 96.0f;
		obstacle->pipes[i].position.x = (screen_width/1.2) + (i * obstacle->pipes[i].width);
		obstacle->pipes[i].position.y = -GetRandomValue(48, 348);

		obstacle->pipes[i + 1].texture_coords = *obstacle_pipe_tex_in_atlas;
		obstacle->pipes[i + 1].tex_width = 32;
		obstacle->pipes[i + 1].tex_height = 200;

		obstacle->pipes[i + 1].scroll_velocity = 1.0f;
		obstacle->pipes[i + 1].scroll_amt = 0.0f;

		obstacle->pipes[i + 1].height = 400.0f;
		obstacle->pipes[i + 1].width = 96.0f;
		obstacle->pipes[i + 1].position.x = obstacle->pipes[i].position.x;
		obstacle->pipes[i + 1].position.y = obstacle->pipes[i].position.y + 128 + obstacle->pipes[i].height;

	}
}

void draw_player(Player *player) {
	player->frame_counter++;

	if (player->frame_counter >= (60/player->frame_speed)) {
		player->frame_counter = 0;
		player->current_frame += 1;

		if (player->current_frame > 3) {
			player->current_frame = 0;
		}

		player->texture_coords.x = (float)player->current_frame * (float)player->spritesheet.width/4;
	}


	Rectangle player_destination = {
		.x = player->position.x,
		.y = player->position.y,
		.width = player->size.x,
		.height = player->size.y,
	};

	player->hitbox = player_destination;

	DrawTexturePro(player->spritesheet, player->texture_coords, player_destination, (Vector2){0.0f, 0.0f}, 0.0f, WHITE);
}

int main(void) {

	GAME_STATE game_state = TITLE;

	const int screen_width = 512;
	const int screen_height = 512;

	InitWindow(screen_width, screen_height, "flappybird");

	const Vector2 player_size = {
		.x = 32,
		.y = 32,
	};

	Vector2 player_position = {
		.x = screen_width/2.5 - player_size.x,
		.y = screen_height/2.0 - player_size.y,
	};

	Texture2D player_atlas = LoadTexture("textures/Flappy Bird Assets/Player/StyleBird1/Bird1-3.png");

	Rectangle player_texture_coords = {
		0.0f, 0.0f,
		(float)player_atlas.width/4,
		(float)player_atlas.height
	};

	Player player;
	player.spritesheet = player_atlas;
	player.texture_coords = player_texture_coords;
	player.position = player_position;
	player.size = player_size;
	player.current_frame = 0;
	player.frame_counter = 0;
	player.frame_speed = 8;
	player.vert_velocity = -250.0f;
	player.curr_vert_velocity = 0.0f;
	player.fall_constant = 600.0f;

	// ground length 64
	// ground breadth 32
	// pipe length 200
	// pipe breadth 32

	Obstacle obstacle;

	Texture2D obstacle_atlas = LoadTexture("textures/Flappy Bird Assets/Tiles/Style 1/SimpleStyle1_Edited.png");

	obstacle.spritesheet = obstacle_atlas;

	obstacle.ground.texture_coords.x = 0.0f;
	obstacle.ground.texture_coords.y = 200.0f;
	obstacle.ground.texture_coords.width = 64.0f;
	obstacle.ground.texture_coords.height = 32.0f;
	obstacle.ground.scroll_velocity = 1.0f;
	obstacle.ground.scroll_amt = 0.0f;

	obstacle.ground.tex_width = 64;
	obstacle.ground.tex_height = 32;
	obstacle.ground.num_of_grounds = screen_width / obstacle.ground.tex_width;

	Rectangle obstacle_ground_tex_in_atlas = {0.0f, 200.0f, obstacle.ground.tex_width, obstacle.ground.tex_height};
	int num_times_ground_tex_draw = (screen_width / (obstacle_atlas.width / 2)) + 1;

	Rectangle obstacle_pipe_tex_in_atlas = {0.0f, 0.0f, 32.0f, 200.0f};



	Texture2D background_texture = LoadTexture("textures/Flappy Bird Assets/Background/Background3.png");

	SetTargetFPS(60);

	while(!WindowShouldClose()) {
		switch(game_state) {
		case TITLE: {
			if (IsKeyPressed(KEY_SPACE)) {
				game_state = GAMEPLAY;
				player.curr_vert_velocity = player.vert_velocity;
				obstacle_generate_pipes(&obstacle, &obstacle_pipe_tex_in_atlas, screen_width);
			}
		}
			break;
		case GAMEPLAY: {
			if (IsKeyPressed(KEY_SPACE)) {
				player.curr_vert_velocity = player.vert_velocity;
			}
		}
		break;
		case GAMEOVER: {
			DrawText("Game Over", 0, 0, 32, RED);
			if (IsKeyPressed(KEY_SPACE)) {
				game_state = TITLE;
			}
		}
		break;
		default: break;
		}
		BeginDrawing();
		{
			ClearBackground(RAYWHITE);

			float delta_time = GetFrameTime();

			switch(game_state) {
			case TITLE: {
				DrawTextureEx(background_texture, (Vector2){0.0f, 0.0f}, 0.0f, 2.0f, WHITE);

				draw_player(&player);

				obstacle.ground.scroll_amt -= obstacle.ground.scroll_velocity;

				if (obstacle.ground.scroll_amt <= -64.0f) {
					obstacle.ground.scroll_amt = 0.0f;
				}

				for (int i = 0; i < num_times_ground_tex_draw; i++) {
					Rectangle ground_destination = {
						.x = (i * 64) + obstacle.ground.scroll_amt,
						.y = screen_height - 32,
						.width = 64,
						.height = 32,
					};

					DrawTexturePro(obstacle_atlas, obstacle_ground_tex_in_atlas,
								   ground_destination, (Vector2){0.0f, 0.0f}, 0.0f, WHITE);
				}
			}
				break;
			case GAMEPLAY: {
				DrawTextureEx(background_texture, (Vector2){0.0f, 0.0f}, 0.0f, 2.0f, WHITE);

				player.position.y += player.curr_vert_velocity * delta_time;
				player.curr_vert_velocity += player.fall_constant * delta_time;
				draw_player(&player);

				obstacle.ground.scroll_amt -= obstacle.ground.scroll_velocity;

				if (obstacle.ground.scroll_amt <= -64.0f) {
					obstacle.ground.scroll_amt = 0.0f;
				}

				for (int i = 0; i < 100; i++) {
					obstacle.pipes[i].scroll_amt -= obstacle.pipes[i].scroll_velocity;
					Rectangle pipe_destination = {
						.x = obstacle.pipes[i].position.x + obstacle.pipes[i].scroll_amt,
						.y = obstacle.pipes[i].position.y,
						.width = obstacle.pipes[i].width,
						.height = obstacle.pipes[i].height,
					};

					DrawTexturePro(obstacle_atlas, obstacle_pipe_tex_in_atlas,
								   pipe_destination, (Vector2){0.0f, 0.0f}, 0.0f, WHITE);

					if(CheckCollisionRecs(pipe_destination, player.hitbox)) {
						game_state = GAMEOVER;
					}
				}

				for (int i = 0; i < num_times_ground_tex_draw; i++) {
					Rectangle ground_destination = {
						.x = (i * 64) + obstacle.ground.scroll_amt,
						.y = screen_height - 32,
						.width = 64,
						.height = 32,
					};

					DrawTexturePro(obstacle_atlas, obstacle_ground_tex_in_atlas,
								   ground_destination, (Vector2){0.0f, 0.0f}, 0.0f, WHITE);
				}
			}
			break;
			case GAMEOVER: {
			}
			break;
			default: break;
			}
		}
		EndDrawing();
	}

	UnloadTexture(background_texture);
	UnloadTexture(player_atlas);
	UnloadTexture(obstacle_atlas);
	CloseWindow();

	return 0;
}
