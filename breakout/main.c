#include "raylib.h"
#include "raymath.h"
#include <stdio.h>

typedef int i32;
typedef float f32;
typedef unsigned int u32;

#define ASSERT(condition) if (!(condition)) {*(char*)0 = 0;}

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600

#define PADDING_X 8
#define PADDING_Y 10

#define BLOCK_ROWS 16
#define BLOCK_COLS 8
#define BLOCK_SIZE_X 41
#define BLOCK_SIZE_Y 26

#define PLAYER_SIZE_WIDTH BLOCK_SIZE_X
#define PLAYER_SIZE_HEIGHT BLOCK_SIZE_Y

typedef enum Game_State {
    MENU,
    STARTED,
    PAUSED,
    GAME_OVER,
} Game_State;

typedef struct Player {
    Rectangle r;
    Color c;
} Player;

typedef struct Block {
    Rectangle r;
    Color c;
    u32 destroyed;
} Block;

typedef struct Ball {
    Color c;
    Vector2 position;
    Vector2 velocity;
    float radius;
} Ball;

void clamp_f32(float min, float max, float *value) {
    ASSERT(min <= max);
    float v = *value;
    if (v < min) {
        v = min;
    }

    if (v > max) {
        v = max;
    }

    *value = v;
}


void Breakout_Initialize(Player *player, Block *block, Ball *ball) {
    player->r.x = (SCREEN_WIDTH / 2) - (BLOCK_SIZE_X / 2);
    player->r.y = (SCREEN_HEIGHT) - (PADDING_Y + BLOCK_SIZE_Y);
    player->r.width = PLAYER_SIZE_WIDTH;
    player->r.height = PLAYER_SIZE_HEIGHT;
    player->c.r = 0xFF;
    player->c.g = 0xFF;
    player->c.b = 0xFF;
    player->c.a = 0xFF;

    for (u32 Y = 0; Y < BLOCK_COLS; Y++) {
        for (u32 X = 0; X < BLOCK_ROWS; X++) {
            block[(Y * BLOCK_ROWS) + X].r.x = PADDING_X + ((PADDING_X + BLOCK_SIZE_X) * X);
            block[(Y * BLOCK_ROWS) + X].r.y = PADDING_Y + ((PADDING_Y + BLOCK_SIZE_Y) * Y);
            /*block[(Y * BLOCK_ROWS) + X].r.x = ((PADDING_X + BLOCK_SIZE_X) * X);*/
            /*block[(Y * BLOCK_ROWS) + X].r.y = PADDING_Y + ((PADDING_Y + BLOCK_SIZE_Y) * Y);*/
            block[(Y * BLOCK_ROWS) + X].r.width = BLOCK_SIZE_X;
            block[(Y * BLOCK_ROWS) + X].r.height = BLOCK_SIZE_Y;

            block[(Y * BLOCK_ROWS) + X].c.r = 0xff;
            block[(Y * BLOCK_ROWS) + X].c.g = 0x00;
            block[(Y * BLOCK_ROWS) + X].c.b = 0x00;
            block[(Y * BLOCK_ROWS) + X].c.a = 0xff;

            block[(Y * BLOCK_ROWS) + X].destroyed = 0;
        }
    }

    ball->radius = 10;
    ball->c.r = 0xff;
    ball->c.g = 0xff;
    ball->c.b = 0xff;
    ball->position.x = (SCREEN_WIDTH / 2);
    ball->position.y = player->r.y - (1.2 * ball->radius);
    ball->velocity.x = 0.0f;
    ball->velocity.y = 0.0f;
}


int main() {

    Player player;
    Block block[BLOCK_COLS * BLOCK_ROWS];
    Ball ball;

    Breakout_Initialize(&player, block, &ball);

    Game_State gs = MENU;

    InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Breakout");

    SetTargetFPS(60);
    while(!WindowShouldClose()) {

        switch(gs) {
        case MENU:
            if (IsKeyDown(KEY_SPACE)) {
                gs = STARTED;
                int angle = GetRandomValue(225, 315);
                ball.velocity.x = cos(DEG2RAD * angle);
                ball.velocity.y = -sin(DEG2RAD * 45);
                ball.velocity = Vector2Scale(ball.velocity, 3.0f);
            }
            break;
        case STARTED:
            if (IsKeyDown(KEY_A)) {
                player.r.x -= 3;
            }
            if (IsKeyDown(KEY_D)) {
                player.r.x += 3;
            }

            if (IsKeyDown(KEY_SPACE)) {
                gs = PAUSED;
            }

            // RESET
            if (IsKeyDown(KEY_R)) {
                gs = MENU;
                Breakout_Initialize(&player, block, &ball);
            }

            ball.position.x += ball.velocity.x;
            ball.position.y += ball.velocity.y;

            clamp_f32(0.0f, SCREEN_WIDTH - BLOCK_SIZE_X, &player.r.x);
            break;
        case PAUSED:
            if (IsKeyDown(KEY_SPACE)) {
                gs = STARTED;
            }

        case GAME_OVER:
        }


        BeginDrawing();

        ClearBackground(BLACK);

        if (gs != PAUSED) {
            for (u32 Y = 0; Y < BLOCK_COLS; Y++) {
                for (u32 X = 0; X < BLOCK_ROWS; X++) {

                    u32 idx = (Y * BLOCK_ROWS) + X;
                    if (block[idx].destroyed == 0) {
                        DrawRectangleRec(block[idx].r, block[idx].c);
                        if (CheckCollisionCircleRec(ball.position, ball.radius, block[idx].r)) {
                            ball.velocity.y = (-1.0f * ball.velocity.y);
                            block[idx].destroyed = 1;
                        }
                    }
                }
            }

            if (CheckCollisionCircleRec(ball.position, ball.radius, player.r)) {
                if (ball.position.y > player.r.y - ball.radius) {
                    ball.position.y = player.r.y - ball.radius;
                }
                if (ball.velocity.y > 0) {
                    ball.velocity.y = (-1.0f * ball.velocity.y);
                }
            }

            // check the paddle and the ball collision for the next frame
            Vector2 next_frame_pos = Vector2Add(ball.position, ball.velocity);
            if (CheckCollisionCircleRec(next_frame_pos, ball.radius, player.r)) {
                if (ball.position.y > player.r.y - ball.radius) {
                    ball.position.y = player.r.y - ball.radius;
                }
                if (ball.velocity.y > 0) {
                    ball.velocity.y = (-1.0f * ball.velocity.y);
                }
            }


            if ((ball.position.x < 0) || (ball.position.x > 800)) {
                ball.velocity.x = (-1.0f * ball.velocity.x);
            }

            DrawRectangleRec(player.r, player.c);
            DrawCircle(ball.position.x, ball.position.y, ball.radius, player.c);
            DrawLine(0, player.r.y, 800, player.r.y, YELLOW);
            DrawLine(player.r.x, 0, player.r.x, 600, YELLOW);
        }
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
