#ifndef PHYSICS_ENGINE_H
#define PHYSICS_ENGINE_H

#include "raymath.h"

typedef enum Shape {
    CIRCLE;
    REC;
} Shape;

typedef struct Body {
    Vector2 position;
    Vector2 velocity;
    Vector2 force;
    f32 mass;
    Shape shape;
    float width;
    float height;
    float radius;
} Body;

typedef struct World {
    Body *bodies;
};

#endif
