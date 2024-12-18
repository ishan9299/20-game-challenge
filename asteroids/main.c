#include "raylib.h"
#include "raygui.h"
#include "raymath.h"
#include <stdio.h>

// TODO: Add iframes for the player

#define SCREEN_WIDTH  800
#define SCREEN_HEIGHT 600
#define BULLETS_BUF_SIZE 20
#define EXPLOSIONS_BUF_SIZE (BULLETS_BUF_SIZE + 1)

typedef struct Player {
    Vector2 vertices[10];
    Vector2 position;
    Vector2 velocity;
    Vector2 direction;
    Vector2 acceleration;
    Vector2 drag;
    float height;
    float base;
    int angle;
    unsigned int has_iframes;
    float iframe_time;
} Player;

typedef enum Asteroid_Type {
    ONE   = 0x53bd05d4,
    TWO   = 0x796e1384,
    THREE = 0xa9b0788f,
    FOUR  = 0xd865d80c,
    NUM_OF_SEEDS = 4,
} Asteroid_Type;

typedef enum Asteroid_Size {
    LARGE = 24,
    MEDIUM = 12,
    SMALL = 6,
    /*DIVIDE_BY_TEN = 10,*/
} Asteroid_Size;

#define ASTEROIDS_BUF_SIZE 44
#define VERTICES_IN_ASTEROIDS 10

typedef struct Asteroid {
    Vector2 position;
    Vector2 points[VERTICES_IN_ASTEROIDS];
    Vector2 velocity;
    float radius;
    unsigned int alive;
    Asteroid_Type seed;
    Asteroid_Size size;
} Asteroid;

typedef struct Bullet {
    Vector2 position;
    Vector2 velocity;
    float ttl; // time to live
    float alive_time;
    unsigned int alive;
} Bullet;

typedef enum GameScreen {
    TITLE,
    RUNNING,
    PAUSED,
    GAME_OVER,
} GameScreen;

typedef struct GameState {
    unsigned int waves;
    unsigned int frames;
    unsigned int score;

    unsigned int bullets_alive;
    unsigned int bullets_buf_pos;

    float asteroid_size_scale_factor;
    unsigned int asteroids_alive;

    float explosion_ttl;
    unsigned int explosion_buf_idx;

    int player_lives;
    float player_iframe_time_limit;

    GameScreen currentScreen;
} GameState;

typedef struct Explosion {
    Vector2 particles_pos[8];
    Vector2 velocity[8];
    float elapsed_time;
    unsigned int active;
} Explosion;

void Draw_Explosion(Explosion *e, float delta_time, unsigned int idx) {
    e->elapsed_time += delta_time;

    for (unsigned int i = 0; i < idx; i++) {
        if (e[i].active == 1) {
            for (int j = 0; j < 8; j++) {
                e[i].particles_pos[j].x += e->velocity[j].x;
                e[i].particles_pos[j].y += e->velocity[j].y;

                DrawCircleV(e[i].particles_pos[j], 1.0f, WHITE);
            }
        }
    }
}

void InitializeGame(Player *player, Explosion *explosions, GameState *gs) {
    gs->currentScreen = TITLE;
    gs->waves = 0;
    gs->frames = 0;
    gs->asteroid_size_scale_factor = 0.1f;
    gs->bullets_buf_pos = 0;
    gs->player_lives = 2;
    gs->asteroid_size_scale_factor = 0.1f;
    gs->player_iframe_time_limit = 1.2f;

    gs->asteroids_alive = 4 + 2 * (gs->waves);

    gs->explosion_ttl = 0.5f;
    gs->explosion_buf_idx = 0;

    float angle = PI / 4;
    for (int i = 0; i < EXPLOSIONS_BUF_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            explosions[i].velocity[j] = (Vector2){cos(j*angle), sin(j*angle)};
        }
    }

    player->height = 32;
    player->base = 20;
    player->angle = 270;
    player->has_iframes = 0;
    player->iframe_time = 0;
}

void ResetGame(Player *player, Asteroid *asteroids, Bullet *bullets, GameState *gs) {
    if (gs->waves == 0) {
        gs->bullets_buf_pos = 0;
        gs->player_lives = 2;
        gs->score = 0;
    }

    player->position.x = 400;
    player->position.y = 300;

    player->acceleration = (Vector2){0.0f, 0.0f};
    player->velocity = (Vector2){0.0f, 0.0f};
    player->direction = (Vector2){cos(player->angle * DEG2RAD), sin(player->angle * DEG2RAD)};

    for (int i = 0; i < BULLETS_BUF_SIZE; i++) {
        bullets[i].ttl = 0.5f;
        bullets[i].alive_time = 0.0f;
        bullets[i].alive = 0;
    }

    gs->asteroids_alive = 4 + 2 * (gs->waves);
    if (gs->asteroids_alive > 11) {
        gs->asteroids_alive = 11;
    }


    for (int i = 0; i < ASTEROIDS_BUF_SIZE; i++) {
        Asteroid a = {0};
        asteroids[i] = a;
    }

    SetRandomSeed((unsigned int)GetTime());
    for (unsigned int i = 0; i < gs->asteroids_alive; i++) {
        asteroids[i].position.x = GetRandomValue(750, 800);
        asteroids[i].position.y = GetRandomValue(550, 600);
        int angle = GetRandomValue(0, 360);
        asteroids[i].velocity.x = 4 * cos(angle * DEG2RAD);
        asteroids[i].velocity.y = 4 * sin(angle * DEG2RAD);
        asteroids[i].size = LARGE;
        asteroids[i].alive = 1;
        int type = GetRandomValue(0, NUM_OF_SEEDS);
        switch(type) {
            case 0:
                asteroids[i].seed = ONE;
                break;
            case 1:
                asteroids[i].seed = TWO;
                break;
            case 2:
                asteroids[i].seed = THREE;
                break;
            case 3:
                asteroids[i].seed = FOUR;
                break;
        }
    }
}

void Update_Movements(Player *player, Asteroid *asteroids, int num_of_asteroids, Bullet *bullets) {
    player->position.x += player->velocity.x;
    player->position.y += player->velocity.y;

    if (player->position.y < 0.0f) {
        player->position.y = 600.0f;
    }

    if (player->position.y > 600.0f) {
        player->position.y = 0.0f;
    }

    if (player->position.x < 0.0f) {
        player->position.x = 800.0f;
    }

    if (player->position.x > 800.0f) {
        player->position.x = 0.0f;
    }

    for (int i = 0; i < num_of_asteroids; i++) {
        if (asteroids[i].alive == 1) {
            asteroids[i].position.x += asteroids[i].velocity.x;
            asteroids[i].position.y += asteroids[i].velocity.y;
            if (asteroids[i].position.x > (800 + asteroids[i].radius)) {
                asteroids[i].position.x = 0;
            }
            if (asteroids[i].position.y > (600 + asteroids[i].radius)) {
                asteroids[i].position.y = 0;
            }
            if (asteroids[i].position.x < (0 - asteroids[i].radius)) {
                asteroids[i].position.x = 800;
            }
            if (asteroids[i].position.y < (0 - asteroids[i].radius)) {
                asteroids[i].position.y = 600;
            }
        }
    }

    for (int i = 0; i < BULLETS_BUF_SIZE; i++) {
        if (bullets[i].alive == 1) {
            bullets[i].position.x += bullets[i].velocity.x;
            bullets[i].position.y += bullets[i].velocity.y;
            if (bullets[i].position.x > 800) {
                bullets[i].position.x = 0.0f;
            }
            if (bullets[i].position.y > 600) {
                bullets[i].position.y = 0.0f;
            }
            if (bullets[i].position.x < 0) {
                bullets[i].position.x = 800.0f;
            }
            if (bullets[i].position.y < 0) {
                bullets[i].position.y = 600.0f;
            }
        }
    }

}

void Break_Asteroids(Asteroid *asteroids, int idx, GameState *gs) {
    int i = idx;
    Asteroid a = asteroids[i];
    int angle = 10;

    int type = GetRandomValue(0, NUM_OF_SEEDS);
    Asteroid_Type seed;
    switch(type) {
        case 0:
            seed = ONE;
            break;
        case 1:
            seed = TWO;
            break;
        case 2:
            seed = THREE;
            break;
        case 3:
            seed = FOUR;
            break;
    }

    switch(a.size) {
        case LARGE:
            a.size = MEDIUM;
            asteroids[i + 11].alive = 1;
            asteroids[i + 11].size = a.size;
            asteroids[i + 11].position = a.position;
            asteroids[i + 11].velocity = Vector2Rotate(a.velocity, angle * DEG2RAD);
            asteroids[i + 11].seed = seed;
            printf("Large broken now the sizes are: %d %d\n", a.size, asteroids[i + 11].size);
            gs->asteroids_alive++;
            gs->score += 20;
            break;
        case MEDIUM:
            a.size = SMALL;
            asteroids[i + 22].alive = 1;
            asteroids[i + 22].size = a.size;
            asteroids[i + 22].position = a.position;
            asteroids[i + 22].velocity = Vector2Rotate(a.velocity, angle * DEG2RAD);
            asteroids[i + 22].seed = seed;
            printf("Medium broken now the sizes are: %d %d\n", a.size, asteroids[i + 22].size);
            gs->asteroids_alive++;
            gs->score += 50;
            break;
        case SMALL:
            a.alive = 0;
            printf("Small Destroyed\n");
            gs->asteroids_alive--;
            gs->score += 100;
            break;
    }
    asteroids[i] = a;
}

void Draw_Asteroids(Asteroid *asteroids, int num_of_asteroids) {
    for (int i = 0; i < num_of_asteroids; i++) {
        if (asteroids[i].alive == 1) {
            SetRandomSeed(asteroids[i].seed);
            for (int j = 0; j < VERTICES_IN_ASTEROIDS; j++) {
                int radius = 32 + GetRandomValue(0, 12);
                if (GetRandomValue(0, 100) < 24.0f) {
                    radius -= 12;
                }
                float random_float = GetRandomValue(0, 100) / 100.0f;
                float angle = ((j * (2 * PI)) / VERTICES_IN_ASTEROIDS) + (PI * 0.1f * random_float);
                float scale = radius * (asteroids[i].size * 0.1f); // make it 2.4, 1.2, 0.6
                Vector2 point = {
                    .x = asteroids[i].position.x + scale * cos(angle),
                    .y = asteroids[i].position.y + scale * sin(angle),
                };
                asteroids[i].points[j] = point;
                asteroids[i].radius = 32 * asteroids[i].size * 0.1f;
            }
        }
    }

    for (int i = 0; i < num_of_asteroids; i++) {
        if (asteroids[i].alive == 1) {
            /*DrawCircleLines(asteroids[i].position.x, asteroids[i].position.y, asteroids[i].radius, WHITE);*/
            for (int j = 0; j < VERTICES_IN_ASTEROIDS; j++) {
                DrawLineV(asteroids[i].points[j], asteroids[i].points[(j + 1) % VERTICES_IN_ASTEROIDS], WHITE);
            }
        }
    }
}

void DrawPlayer(Player *player, unsigned int frames) {
    player->direction = (Vector2){cos(player->angle * DEG2RAD), sin(player->angle * DEG2RAD)};

    // top
    player->vertices[0].x = player->position.x + (player->direction.x * player->height);
    player->vertices[0].y = player->position.y + (player->direction.y * player->height);

    Vector2 direction_perpendicular = {
        .x = -sin(player->angle * DEG2RAD),
        .y = cos(player->angle * DEG2RAD),
    };

    player->vertices[1].x = player->position.x + ((player->base * 0.5f) * direction_perpendicular.x);
    player->vertices[1].y = player->position.y + ((player->base * 0.5f) * direction_perpendicular.y);

    player->vertices[2].x = player->position.x - ((player->base * 0.5f) * direction_perpendicular.x);
    player->vertices[2].y = player->position.y - ((player->base * 0.5f) * direction_perpendicular.y);

    /*// left fin*/
    Vector2 v01 = Vector2Subtract(player->vertices[1], player->vertices[0]);
    float v01_length = Vector2Length(v01);
    v01 = Vector2Normalize(v01);
    v01 = Vector2Scale(v01, v01_length * 0.25f);
    player->vertices[3].x = (player->vertices[1].x + v01.x);
    player->vertices[3].y = (player->vertices[1].y + v01.y);

    player->vertices[4].x = (player->vertices[1].x - (0.105f * player->base * direction_perpendicular.x));
    player->vertices[4].y = (player->vertices[1].y - (0.105f * player->base * direction_perpendicular.y));

    // right fin
    Vector2 v02 = Vector2Subtract(player->vertices[2], player->vertices[0]);
    float v02_length = Vector2Length(v02);
    v02 = Vector2Normalize(v02);
    v02 = Vector2Scale(v02, v02_length * 0.25f);
    player->vertices[5].x = (player->vertices[2].x + v02.x);
    player->vertices[5].y = (player->vertices[2].y + v02.y);

    player->vertices[6].x = (player->vertices[2].x + (0.105f * player->base * direction_perpendicular.x));
    player->vertices[6].y = (player->vertices[2].y + (0.105f * player->base * direction_perpendicular.y));

    // thrust
    player->vertices[7].x = (player->position.x + (0.2f * player->base * direction_perpendicular.x));
    player->vertices[7].y = (player->position.y + (0.2f * player->base * direction_perpendicular.y));

    player->vertices[8].x = (player->position.x - (0.2f * player->base * direction_perpendicular.x));
    player->vertices[8].y = (player->position.y - (0.2f * player->base * direction_perpendicular.y));

    player->vertices[9].x = (player->position.x - (0.4f * player->height * player->direction.x));
    player->vertices[9].y = (player->position.y - (0.4f * player->height * player->direction.y));


    if ((player->acceleration.x != 0.0f || player->acceleration.y != 0.0f) && (frames % 3 == 0)) {
        DrawTriangleLines(player->vertices[7], player->vertices[8], player->vertices[9], WHITE);
    }

    if (player->has_iframes == 0) {
        DrawTriangleLines(player->vertices[0], player->vertices[1], player->vertices[2], WHITE);
        DrawTriangleLines(player->vertices[1], player->vertices[3], player->vertices[4], WHITE);
        DrawTriangleLines(player->vertices[2], player->vertices[5], player->vertices[6], WHITE);
    }

    if (player->has_iframes == 1 && (frames % 20 == 0)) {
        DrawTriangleLines(player->vertices[0], player->vertices[1], player->vertices[2], WHITE);
        DrawTriangleLines(player->vertices[1], player->vertices[3], player->vertices[4], WHITE);
        DrawTriangleLines(player->vertices[2], player->vertices[5], player->vertices[6], WHITE);
    }
}

void Input(Player *player, Bullet *bullets, GameState *gs) {
    if (IsKeyDown(KEY_UP)) {
        player->acceleration = Vector2Scale(player->direction, 0.5);
        if (Vector2Length(player->velocity) < 10.0f) {
            player->velocity.x += player->acceleration.x;
            player->velocity.y += player->acceleration.y;
        }
    }

    if (IsKeyDown(KEY_RIGHT)) {
        player->angle += 5;

        if (player->angle > 360) {
            player->angle -= 360;
        }
    }

    if (IsKeyDown(KEY_LEFT)) {
        player->angle -= 5;

        if (player->angle < 0) {
            player->angle += 360;
        }
    }

    if (IsKeyPressed(KEY_Z)) {
        bullets[gs->bullets_buf_pos].position = player->vertices[0];
        bullets[gs->bullets_buf_pos].velocity.x = player->velocity.x + 16.0f * player->direction.x;
        bullets[gs->bullets_buf_pos].velocity.y = player->velocity.y + 16.0f * player->direction.y;
        bullets[gs->bullets_buf_pos].alive = 1;
        (gs->bullets_buf_pos)++;
        if (gs->bullets_buf_pos > (BULLETS_BUF_SIZE) - 1) {
            gs->bullets_buf_pos = 0;
        }
    }
}

void Draw_Bullets(Bullet *bullets) {
    for (int i = 0; i < BULLETS_BUF_SIZE; i++) {
        if (bullets[i].alive == 1) {
            DrawCircle(bullets[i].position.x, bullets[i].position.y, 1.0f, WHITE);
        }
    }
}

int main() {
    InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Asteroids");

    Player player;
    Asteroid asteroids[ASTEROIDS_BUF_SIZE];
    Bullet bullets[BULLETS_BUF_SIZE];
    Explosion explosions[EXPLOSIONS_BUF_SIZE];
    GameState gs;

    InitializeGame(&player, explosions, &gs);

    SetTargetFPS(60);

    while(!WindowShouldClose()) {

        gs.frames++;
        if (gs.frames > 60) {
            gs.frames = 0;
        }
        float delta_time = GetFrameTime();

        Input(&player, bullets, &gs);
        Update_Movements(&player, asteroids, ASTEROIDS_BUF_SIZE, bullets);

        for (int i = 0; i < ASTEROIDS_BUF_SIZE; i++) {
            if (asteroids[i].alive == 1) {
                float dist_pa = Vector2Distance(player.position, asteroids[i].position);
                if (dist_pa < asteroids[i].radius && gs.player_lives > -1 && player.has_iframes == 0) {
                    Break_Asteroids(asteroids, i, &gs);
                    gs.player_lives--;
                    player.has_iframes = 1;
                    player.angle = 270;
                    player.acceleration = (Vector2){0.0f, 0.0f};
                    player.velocity = (Vector2){0.0f, 0.0f};
                    player.direction = (Vector2){cos(player.angle * DEG2RAD), sin(player.angle * DEG2RAD)};
                    player.position.x = 400;
                    player.position.y = 300;
                    printf("LOG: player lives: %d\n", gs.player_lives);
                }
                for (int j = 0; j < BULLETS_BUF_SIZE; j++) {
                    if (bullets[j].alive == 1) {
                        float dist_ba = Vector2Distance(bullets[j].position, asteroids[i].position);
                        if (dist_ba < asteroids[i].radius) {
                            bullets[j].alive = 0;
                            for (int k = 0; k < 8; k++) {
                                int _idx = gs.explosion_buf_idx;
                                explosions[_idx].active = 1;
                                explosions[_idx].particles_pos[k].x = bullets[j].position.x;
                                explosions[_idx].particles_pos[k].y = bullets[j].position.y;
                            }
                            gs.explosion_buf_idx++;
                            if (gs.explosion_buf_idx >= EXPLOSIONS_BUF_SIZE) {
                                gs.explosion_buf_idx = 0;
                            }
                            Break_Asteroids(asteroids, i, &gs);
                        }
                    }
                }
            }
        }

        if (gs.player_lives < 0) {
            gs.currentScreen = GAME_OVER;
            printf("you ded\n");
        }

        if (gs.asteroids_alive == 0) {
            printf("GENERATING MORE STUFF FOR YOU TO SHOOT AT\n");
            gs.waves++;
            ResetGame(&player, asteroids, bullets, &gs);
        }

        BeginDrawing();
        {
            switch(gs.currentScreen) {
                int font_size;
                int text_width;
                Vector2 text_pos;
                int padding;
                Rectangle button_rec;
                case TITLE:
                    printf("TITLE\n");
                    const char *game_title = "Asteroids";
                    font_size = 128;
                    text_width = MeasureText(game_title, font_size);
                    text_pos.x = (SCREEN_WIDTH/2) - (text_width/2);
                    text_pos.y = 100;
                    DrawText(game_title, text_pos.x, text_pos.y, font_size, WHITE);

                    font_size = 64;
                    const char *button_title = "New Game";
                    text_width = MeasureText(button_title, font_size);
                    text_pos.x = (SCREEN_WIDTH/2) - (text_width/2);
                    text_pos.y = (SCREEN_HEIGHT/2);
                    padding = 10;

                    button_rec.x = text_pos.x - (padding/2);
                    button_rec.y = text_pos.y - (padding/2);
                    button_rec.width = text_width + padding;
                    button_rec.height = font_size + padding;

                    ClearBackground(BLACK);
                    DrawRectangleLines(button_rec.x, button_rec.y, button_rec.width, button_rec.height, WHITE);
                    DrawText(button_title, text_pos.x, text_pos.y, font_size, WHITE);

                    if (IsMouseButtonReleased(0)) {
                        Vector2 mouse_pos = GetMousePosition();
                        if (CheckCollisionPointRec(mouse_pos, button_rec)) {
                            gs.waves = 0;
                            ResetGame(&player, asteroids, bullets, &gs);
                            gs.currentScreen = RUNNING;
                        }
                    }
                    break;
                case RUNNING:
                    ClearBackground(BLACK);

                    // TODO: add score board and lives
                    const char *score_board_text = TextFormat(
                        "SCORE: %d\n\n"
                        "LIVES: %d\n", gs.score, gs.player_lives
                        );
                    DrawText(score_board_text, 0, 0, 32, WHITE);
                    DrawPlayer(&player, gs.frames);
                    Draw_Asteroids(asteroids, ASTEROIDS_BUF_SIZE);
                    Draw_Bullets(bullets);
                    Draw_Explosion(explosions, delta_time, gs.explosion_buf_idx);
                    break;
                case PAUSED:
                    break;
                case GAME_OVER:
                    ClearBackground(BLACK);

                    const char *game_over_txt = "GAME OVER";
                    font_size = 64;
                    text_width = MeasureText(game_over_txt, font_size);
                    text_pos.x = 400 - (text_width/2);
                    text_pos.y = SCREEN_HEIGHT/2 - (font_size/2);
                    DrawText(game_over_txt, text_pos.x, text_pos.y, font_size, WHITE);

                    const char *new_game_txt = "New Game";
                    font_size = 64;
                    text_width = MeasureText(new_game_txt, font_size);
                    text_pos.x = 400 - (text_width/2);
                    text_pos.y = SCREEN_HEIGHT/1.2f - (font_size/2);

                    padding = 10;
                    button_rec.x = text_pos.x - (padding/2);
                    button_rec.y = text_pos.y - (padding/2);
                    button_rec.width = text_width + padding;
                    button_rec.height = font_size + padding;

                    DrawText(new_game_txt, text_pos.x, text_pos.y, font_size, WHITE);
                    if (IsMouseButtonReleased(0)) {
                        Vector2 mouse_pos = GetMousePosition();
                        if (CheckCollisionPointRec(mouse_pos, button_rec)) {
                            gs.currentScreen = TITLE;
                            gs.waves = 0;
                            ResetGame(&player, asteroids, bullets, &gs);
                        }
                    }

                    Draw_Asteroids(asteroids, ASTEROIDS_BUF_SIZE);
                    break;
            }
        }

        EndDrawing();

        if (player.velocity.x != 0 || player.velocity.y != 0) {
            const float drag_rate = 0.025f;
            player.drag = (Vector2){-player.velocity.x * drag_rate, -player.velocity.y * drag_rate};
            player.velocity.x += player.drag.x;
            player.velocity.y += player.drag.y;

            float dot_prod = Vector2DotProduct(player.velocity, player.drag);
            if (dot_prod >= 0) {
                player.velocity.x = 0;
                player.velocity.y = 0;
            }
        }

        player.acceleration.x = 0;
        player.acceleration.y = 0;

        for (int i = 0; i < EXPLOSIONS_BUF_SIZE; i++) {
            if (explosions[i].active == 1) {
                explosions[i].elapsed_time += delta_time;
                if (explosions[i].elapsed_time > gs.explosion_ttl) {
                    explosions[i].active = 0;
                    explosions[i].elapsed_time = 0.0f;
                }
            }
        }

        if (player.has_iframes == 1) {
            player.iframe_time += delta_time;
            if (player.iframe_time > gs.player_iframe_time_limit) {
                player.has_iframes = 0;
                player.iframe_time = 0;
            }
        }

        for (int i = 0; i < BULLETS_BUF_SIZE; i++) {
            if (bullets[i].alive == 1) {
                bullets[i].alive_time += delta_time;
                if (bullets[i].alive_time > bullets[i].ttl) {
                    bullets[i].alive_time = 0.0f;
                    bullets[i].alive = 0;
                }
            }
        }

    }

    CloseWindow();
    return 0;
}
