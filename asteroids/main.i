# 0 "main.c"
# 1 "/var/home/masterchief117/Programming/Work/Graphics/20-game-challenge/asteroids//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "main.c"
# 1 "../include/raylib.h" 1
# 82 "../include/raylib.h"
# 1 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 103 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 83 "../include/raylib.h" 2
# 197 "../include/raylib.h"
# 1 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stdbool.h" 1 3 4
# 198 "../include/raylib.h" 2







# 204 "../include/raylib.h"
typedef struct Vector2 {
    float x;
    float y;
} Vector2;


typedef struct Vector3 {
    float x;
    float y;
    float z;
} Vector3;


typedef struct Vector4 {
    float x;
    float y;
    float z;
    float w;
} Vector4;


typedef Vector4 Quaternion;


typedef struct Matrix {
    float m0, m4, m8, m12;
    float m1, m5, m9, m13;
    float m2, m6, m10, m14;
    float m3, m7, m11, m15;
} Matrix;


typedef struct Color {
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;


typedef struct Rectangle {
    float x;
    float y;
    float width;
    float height;
} Rectangle;


typedef struct Image {
    void *data;
    int width;
    int height;
    int mipmaps;
    int format;
} Image;


typedef struct Texture {
    unsigned int id;
    int width;
    int height;
    int mipmaps;
    int format;
} Texture;


typedef Texture Texture2D;


typedef Texture TextureCubemap;


typedef struct RenderTexture {
    unsigned int id;
    Texture texture;
    Texture depth;
} RenderTexture;


typedef RenderTexture RenderTexture2D;


typedef struct NPatchInfo {
    Rectangle source;
    int left;
    int top;
    int right;
    int bottom;
    int layout;
} NPatchInfo;


typedef struct GlyphInfo {
    int value;
    int offsetX;
    int offsetY;
    int advanceX;
    Image image;
} GlyphInfo;


typedef struct Font {
    int baseSize;
    int glyphCount;
    int glyphPadding;
    Texture2D texture;
    Rectangle *recs;
    GlyphInfo *glyphs;
} Font;


typedef struct Camera3D {
    Vector3 position;
    Vector3 target;
    Vector3 up;
    float fovy;
    int projection;
} Camera3D;

typedef Camera3D Camera;


typedef struct Camera2D {
    Vector2 offset;
    Vector2 target;
    float rotation;
    float zoom;
} Camera2D;


typedef struct Mesh {
    int vertexCount;
    int triangleCount;


    float *vertices;
    float *texcoords;
    float *texcoords2;
    float *normals;
    float *tangents;
    unsigned char *colors;
    unsigned short *indices;


    float *animVertices;
    float *animNormals;
    unsigned char *boneIds;
    float *boneWeights;


    unsigned int vaoId;
    unsigned int *vboId;
} Mesh;


typedef struct Shader {
    unsigned int id;
    int *locs;
} Shader;


typedef struct MaterialMap {
    Texture2D texture;
    Color color;
    float value;
} MaterialMap;


typedef struct Material {
    Shader shader;
    MaterialMap *maps;
    float params[4];
} Material;


typedef struct Transform {
    Vector3 translation;
    Quaternion rotation;
    Vector3 scale;
} Transform;


typedef struct BoneInfo {
    char name[32];
    int parent;
} BoneInfo;


typedef struct Model {
    Matrix transform;

    int meshCount;
    int materialCount;
    Mesh *meshes;
    Material *materials;
    int *meshMaterial;


    int boneCount;
    BoneInfo *bones;
    Transform *bindPose;
} Model;


typedef struct ModelAnimation {
    int boneCount;
    int frameCount;
    BoneInfo *bones;
    Transform **framePoses;
    char name[32];
} ModelAnimation;


typedef struct Ray {
    Vector3 position;
    Vector3 direction;
} Ray;


typedef struct RayCollision {
    
# 424 "../include/raylib.h" 3 4
   _Bool 
# 424 "../include/raylib.h"
        hit;
    float distance;
    Vector3 point;
    Vector3 normal;
} RayCollision;


typedef struct BoundingBox {
    Vector3 min;
    Vector3 max;
} BoundingBox;


typedef struct Wave {
    unsigned int frameCount;
    unsigned int sampleRate;
    unsigned int sampleSize;
    unsigned int channels;
    void *data;
} Wave;



typedef struct rAudioBuffer rAudioBuffer;
typedef struct rAudioProcessor rAudioProcessor;


typedef struct AudioStream {
    rAudioBuffer *buffer;
    rAudioProcessor *processor;

    unsigned int sampleRate;
    unsigned int sampleSize;
    unsigned int channels;
} AudioStream;


typedef struct Sound {
    AudioStream stream;
    unsigned int frameCount;
} Sound;


typedef struct Music {
    AudioStream stream;
    unsigned int frameCount;
    
# 470 "../include/raylib.h" 3 4
   _Bool 
# 470 "../include/raylib.h"
        looping;

    int ctxType;
    void *ctxData;
} Music;


typedef struct VrDeviceInfo {
    int hResolution;
    int vResolution;
    float hScreenSize;
    float vScreenSize;
    float vScreenCenter;
    float eyeToScreenDistance;
    float lensSeparationDistance;
    float interpupillaryDistance;
    float lensDistortionValues[4];
    float chromaAbCorrection[4];
} VrDeviceInfo;


typedef struct VrStereoConfig {
    Matrix projection[2];
    Matrix viewOffset[2];
    float leftLensCenter[2];
    float rightLensCenter[2];
    float leftScreenCenter[2];
    float rightScreenCenter[2];
    float scale[2];
    float scaleIn[2];
} VrStereoConfig;


typedef struct FilePathList {
    unsigned int capacity;
    unsigned int count;
    char **paths;
} FilePathList;


typedef struct AutomationEvent {
    unsigned int frame;
    unsigned int type;
    int params[4];
} AutomationEvent;


typedef struct AutomationEventList {
    unsigned int capacity;
    unsigned int count;
    AutomationEvent *events;
} AutomationEventList;







typedef enum {
    FLAG_VSYNC_HINT = 0x00000040,
    FLAG_FULLSCREEN_MODE = 0x00000002,
    FLAG_WINDOW_RESIZABLE = 0x00000004,
    FLAG_WINDOW_UNDECORATED = 0x00000008,
    FLAG_WINDOW_HIDDEN = 0x00000080,
    FLAG_WINDOW_MINIMIZED = 0x00000200,
    FLAG_WINDOW_MAXIMIZED = 0x00000400,
    FLAG_WINDOW_UNFOCUSED = 0x00000800,
    FLAG_WINDOW_TOPMOST = 0x00001000,
    FLAG_WINDOW_ALWAYS_RUN = 0x00000100,
    FLAG_WINDOW_TRANSPARENT = 0x00000010,
    FLAG_WINDOW_HIGHDPI = 0x00002000,
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000,
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000,
    FLAG_MSAA_4X_HINT = 0x00000020,
    FLAG_INTERLACED_HINT = 0x00010000
} ConfigFlags;



typedef enum {
    LOG_ALL = 0,
    LOG_TRACE,
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
    LOG_NONE
} TraceLogLevel;




typedef enum {
    KEY_NULL = 0,

    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,

    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,

    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336,

    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25
} KeyboardKey;







typedef enum {
    MOUSE_BUTTON_LEFT = 0,
    MOUSE_BUTTON_RIGHT = 1,
    MOUSE_BUTTON_MIDDLE = 2,
    MOUSE_BUTTON_SIDE = 3,
    MOUSE_BUTTON_EXTRA = 4,
    MOUSE_BUTTON_FORWARD = 5,
    MOUSE_BUTTON_BACK = 6,
} MouseButton;


typedef enum {
    MOUSE_CURSOR_DEFAULT = 0,
    MOUSE_CURSOR_ARROW = 1,
    MOUSE_CURSOR_IBEAM = 2,
    MOUSE_CURSOR_CROSSHAIR = 3,
    MOUSE_CURSOR_POINTING_HAND = 4,
    MOUSE_CURSOR_RESIZE_EW = 5,
    MOUSE_CURSOR_RESIZE_NS = 6,
    MOUSE_CURSOR_RESIZE_NWSE = 7,
    MOUSE_CURSOR_RESIZE_NESW = 8,
    MOUSE_CURSOR_RESIZE_ALL = 9,
    MOUSE_CURSOR_NOT_ALLOWED = 10
} MouseCursor;


typedef enum {
    GAMEPAD_BUTTON_UNKNOWN = 0,
    GAMEPAD_BUTTON_LEFT_FACE_UP,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,
    GAMEPAD_BUTTON_RIGHT_FACE_UP,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,
    GAMEPAD_BUTTON_LEFT_TRIGGER_1,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,
    GAMEPAD_BUTTON_MIDDLE_LEFT,
    GAMEPAD_BUTTON_MIDDLE,
    GAMEPAD_BUTTON_MIDDLE_RIGHT,
    GAMEPAD_BUTTON_LEFT_THUMB,
    GAMEPAD_BUTTON_RIGHT_THUMB
} GamepadButton;


typedef enum {
    GAMEPAD_AXIS_LEFT_X = 0,
    GAMEPAD_AXIS_LEFT_Y = 1,
    GAMEPAD_AXIS_RIGHT_X = 2,
    GAMEPAD_AXIS_RIGHT_Y = 3,
    GAMEPAD_AXIS_LEFT_TRIGGER = 4,
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5
} GamepadAxis;


typedef enum {
    MATERIAL_MAP_ALBEDO = 0,
    MATERIAL_MAP_METALNESS,
    MATERIAL_MAP_NORMAL,
    MATERIAL_MAP_ROUGHNESS,
    MATERIAL_MAP_OCCLUSION,
    MATERIAL_MAP_EMISSION,
    MATERIAL_MAP_HEIGHT,
    MATERIAL_MAP_CUBEMAP,
    MATERIAL_MAP_IRRADIANCE,
    MATERIAL_MAP_PREFILTER,
    MATERIAL_MAP_BRDF
} MaterialMapIndex;





typedef enum {
    SHADER_LOC_VERTEX_POSITION = 0,
    SHADER_LOC_VERTEX_TEXCOORD01,
    SHADER_LOC_VERTEX_TEXCOORD02,
    SHADER_LOC_VERTEX_NORMAL,
    SHADER_LOC_VERTEX_TANGENT,
    SHADER_LOC_VERTEX_COLOR,
    SHADER_LOC_MATRIX_MVP,
    SHADER_LOC_MATRIX_VIEW,
    SHADER_LOC_MATRIX_PROJECTION,
    SHADER_LOC_MATRIX_MODEL,
    SHADER_LOC_MATRIX_NORMAL,
    SHADER_LOC_VECTOR_VIEW,
    SHADER_LOC_COLOR_DIFFUSE,
    SHADER_LOC_COLOR_SPECULAR,
    SHADER_LOC_COLOR_AMBIENT,
    SHADER_LOC_MAP_ALBEDO,
    SHADER_LOC_MAP_METALNESS,
    SHADER_LOC_MAP_NORMAL,
    SHADER_LOC_MAP_ROUGHNESS,
    SHADER_LOC_MAP_OCCLUSION,
    SHADER_LOC_MAP_EMISSION,
    SHADER_LOC_MAP_HEIGHT,
    SHADER_LOC_MAP_CUBEMAP,
    SHADER_LOC_MAP_IRRADIANCE,
    SHADER_LOC_MAP_PREFILTER,
    SHADER_LOC_MAP_BRDF
} ShaderLocationIndex;





typedef enum {
    SHADER_UNIFORM_FLOAT = 0,
    SHADER_UNIFORM_VEC2,
    SHADER_UNIFORM_VEC3,
    SHADER_UNIFORM_VEC4,
    SHADER_UNIFORM_INT,
    SHADER_UNIFORM_IVEC2,
    SHADER_UNIFORM_IVEC3,
    SHADER_UNIFORM_IVEC4,
    SHADER_UNIFORM_SAMPLER2D
} ShaderUniformDataType;


typedef enum {
    SHADER_ATTRIB_FLOAT = 0,
    SHADER_ATTRIB_VEC2,
    SHADER_ATTRIB_VEC3,
    SHADER_ATTRIB_VEC4
} ShaderAttributeDataType;



typedef enum {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,
    PIXELFORMAT_UNCOMPRESSED_R5G6B5,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8,
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,
    PIXELFORMAT_UNCOMPRESSED_R32,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,
    PIXELFORMAT_UNCOMPRESSED_R16,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,
    PIXELFORMAT_COMPRESSED_DXT1_RGB,
    PIXELFORMAT_COMPRESSED_DXT1_RGBA,
    PIXELFORMAT_COMPRESSED_DXT3_RGBA,
    PIXELFORMAT_COMPRESSED_DXT5_RGBA,
    PIXELFORMAT_COMPRESSED_ETC1_RGB,
    PIXELFORMAT_COMPRESSED_ETC2_RGB,
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,
    PIXELFORMAT_COMPRESSED_PVRT_RGB,
    PIXELFORMAT_COMPRESSED_PVRT_RGBA,
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA
} PixelFormat;




typedef enum {
    TEXTURE_FILTER_POINT = 0,
    TEXTURE_FILTER_BILINEAR,
    TEXTURE_FILTER_TRILINEAR,
    TEXTURE_FILTER_ANISOTROPIC_4X,
    TEXTURE_FILTER_ANISOTROPIC_8X,
    TEXTURE_FILTER_ANISOTROPIC_16X,
} TextureFilter;


typedef enum {
    TEXTURE_WRAP_REPEAT = 0,
    TEXTURE_WRAP_CLAMP,
    TEXTURE_WRAP_MIRROR_REPEAT,
    TEXTURE_WRAP_MIRROR_CLAMP
} TextureWrap;


typedef enum {
    CUBEMAP_LAYOUT_AUTO_DETECT = 0,
    CUBEMAP_LAYOUT_LINE_VERTICAL,
    CUBEMAP_LAYOUT_LINE_HORIZONTAL,
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE,
    CUBEMAP_LAYOUT_PANORAMA
} CubemapLayout;


typedef enum {
    FONT_DEFAULT = 0,
    FONT_BITMAP,
    FONT_SDF
} FontType;


typedef enum {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE,
    BLEND_MULTIPLIED,
    BLEND_ADD_COLORS,
    BLEND_SUBTRACT_COLORS,
    BLEND_ALPHA_PREMULTIPLY,
    BLEND_CUSTOM,
    BLEND_CUSTOM_SEPARATE
} BlendMode;



typedef enum {
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512
} Gesture;


typedef enum {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE,
    CAMERA_ORBITAL,
    CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON
} CameraMode;


typedef enum {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC
} CameraProjection;


typedef enum {
    NPATCH_NINE_PATCH = 0,
    NPATCH_THREE_PATCH_VERTICAL,
    NPATCH_THREE_PATCH_HORIZONTAL
} NPatchLayout;



typedef void (*TraceLogCallback)(int logLevel, const char *text, va_list args);
typedef unsigned char *(*LoadFileDataCallback)(const char *fileName, int *dataSize);
typedef 
# 936 "../include/raylib.h" 3 4
       _Bool 
# 936 "../include/raylib.h"
            (*SaveFileDataCallback)(const char *fileName, void *data, int dataSize);
typedef char *(*LoadFileTextCallback)(const char *fileName);
typedef 
# 938 "../include/raylib.h" 3 4
       _Bool 
# 938 "../include/raylib.h"
            (*SaveFileTextCallback)(const char *fileName, char *text);
# 954 "../include/raylib.h"
 void InitWindow(int width, int height, const char *title);
 void CloseWindow(void);
 
# 956 "../include/raylib.h" 3 4
     _Bool 
# 956 "../include/raylib.h"
          WindowShouldClose(void);
 
# 957 "../include/raylib.h" 3 4
     _Bool 
# 957 "../include/raylib.h"
          IsWindowReady(void);
 
# 958 "../include/raylib.h" 3 4
     _Bool 
# 958 "../include/raylib.h"
          IsWindowFullscreen(void);
 
# 959 "../include/raylib.h" 3 4
     _Bool 
# 959 "../include/raylib.h"
          IsWindowHidden(void);
 
# 960 "../include/raylib.h" 3 4
     _Bool 
# 960 "../include/raylib.h"
          IsWindowMinimized(void);
 
# 961 "../include/raylib.h" 3 4
     _Bool 
# 961 "../include/raylib.h"
          IsWindowMaximized(void);
 
# 962 "../include/raylib.h" 3 4
     _Bool 
# 962 "../include/raylib.h"
          IsWindowFocused(void);
 
# 963 "../include/raylib.h" 3 4
     _Bool 
# 963 "../include/raylib.h"
          IsWindowResized(void);
 
# 964 "../include/raylib.h" 3 4
     _Bool 
# 964 "../include/raylib.h"
          IsWindowState(unsigned int flag);
 void SetWindowState(unsigned int flags);
 void ClearWindowState(unsigned int flags);
 void ToggleFullscreen(void);
 void ToggleBorderlessWindowed(void);
 void MaximizeWindow(void);
 void MinimizeWindow(void);
 void RestoreWindow(void);
 void SetWindowIcon(Image image);
 void SetWindowIcons(Image *images, int count);
 void SetWindowTitle(const char *title);
 void SetWindowPosition(int x, int y);
 void SetWindowMonitor(int monitor);
 void SetWindowMinSize(int width, int height);
 void SetWindowMaxSize(int width, int height);
 void SetWindowSize(int width, int height);
 void SetWindowOpacity(float opacity);
 void SetWindowFocused(void);
 void *GetWindowHandle(void);
 int GetScreenWidth(void);
 int GetScreenHeight(void);
 int GetRenderWidth(void);
 int GetRenderHeight(void);
 int GetMonitorCount(void);
 int GetCurrentMonitor(void);
 Vector2 GetMonitorPosition(int monitor);
 int GetMonitorWidth(int monitor);
 int GetMonitorHeight(int monitor);
 int GetMonitorPhysicalWidth(int monitor);
 int GetMonitorPhysicalHeight(int monitor);
 int GetMonitorRefreshRate(int monitor);
 Vector2 GetWindowPosition(void);
 Vector2 GetWindowScaleDPI(void);
 const char *GetMonitorName(int monitor);
 void SetClipboardText(const char *text);
 const char *GetClipboardText(void);
 void EnableEventWaiting(void);
 void DisableEventWaiting(void);


 void ShowCursor(void);
 void HideCursor(void);
 
# 1006 "../include/raylib.h" 3 4
     _Bool 
# 1006 "../include/raylib.h"
          IsCursorHidden(void);
 void EnableCursor(void);
 void DisableCursor(void);
 
# 1009 "../include/raylib.h" 3 4
     _Bool 
# 1009 "../include/raylib.h"
          IsCursorOnScreen(void);


 void ClearBackground(Color color);
 void BeginDrawing(void);
 void EndDrawing(void);
 void BeginMode2D(Camera2D camera);
 void EndMode2D(void);
 void BeginMode3D(Camera3D camera);
 void EndMode3D(void);
 void BeginTextureMode(RenderTexture2D target);
 void EndTextureMode(void);
 void BeginShaderMode(Shader shader);
 void EndShaderMode(void);
 void BeginBlendMode(int mode);
 void EndBlendMode(void);
 void BeginScissorMode(int x, int y, int width, int height);
 void EndScissorMode(void);
 void BeginVrStereoMode(VrStereoConfig config);
 void EndVrStereoMode(void);


 VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);
 void UnloadVrStereoConfig(VrStereoConfig config);



 Shader LoadShader(const char *vsFileName, const char *fsFileName);
 Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode);
 
# 1038 "../include/raylib.h" 3 4
     _Bool 
# 1038 "../include/raylib.h"
          IsShaderReady(Shader shader);
 int GetShaderLocation(Shader shader, const char *uniformName);
 int GetShaderLocationAttrib(Shader shader, const char *attribName);
 void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);
 void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count);
 void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);
 void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture);
 void UnloadShader(Shader shader);


 Ray GetMouseRay(Vector2 mousePosition, Camera camera);
 Matrix GetCameraMatrix(Camera camera);
 Matrix GetCameraMatrix2D(Camera2D camera);
 Vector2 GetWorldToScreen(Vector3 position, Camera camera);
 Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);
 Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height);
 Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);


 void SetTargetFPS(int fps);
 float GetFrameTime(void);
 double GetTime(void);
 int GetFPS(void);





 void SwapScreenBuffer(void);
 void PollInputEvents(void);
 void WaitTime(double seconds);


 void SetRandomSeed(unsigned int seed);
 int GetRandomValue(int min, int max);
 int *LoadRandomSequence(unsigned int count, int min, int max);
 void UnloadRandomSequence(int *sequence);


 void TakeScreenshot(const char *fileName);
 void SetConfigFlags(unsigned int flags);
 void OpenURL(const char *url);



 void TraceLog(int logLevel, const char *text, ...);
 void SetTraceLogLevel(int logLevel);
 void *MemAlloc(unsigned int size);
 void *MemRealloc(void *ptr, unsigned int size);
 void MemFree(void *ptr);



 void SetTraceLogCallback(TraceLogCallback callback);
 void SetLoadFileDataCallback(LoadFileDataCallback callback);
 void SetSaveFileDataCallback(SaveFileDataCallback callback);
 void SetLoadFileTextCallback(LoadFileTextCallback callback);
 void SetSaveFileTextCallback(SaveFileTextCallback callback);


 unsigned char *LoadFileData(const char *fileName, int *dataSize);
 void UnloadFileData(unsigned char *data);
 
# 1100 "../include/raylib.h" 3 4
     _Bool 
# 1100 "../include/raylib.h"
          SaveFileData(const char *fileName, void *data, int dataSize);
 
# 1101 "../include/raylib.h" 3 4
     _Bool 
# 1101 "../include/raylib.h"
          ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName);
 char *LoadFileText(const char *fileName);
 void UnloadFileText(char *text);
 
# 1104 "../include/raylib.h" 3 4
     _Bool 
# 1104 "../include/raylib.h"
          SaveFileText(const char *fileName, char *text);



 
# 1108 "../include/raylib.h" 3 4
     _Bool 
# 1108 "../include/raylib.h"
          FileExists(const char *fileName);
 
# 1109 "../include/raylib.h" 3 4
     _Bool 
# 1109 "../include/raylib.h"
          DirectoryExists(const char *dirPath);
 
# 1110 "../include/raylib.h" 3 4
     _Bool 
# 1110 "../include/raylib.h"
          IsFileExtension(const char *fileName, const char *ext);
 int GetFileLength(const char *fileName);
 const char *GetFileExtension(const char *fileName);
 const char *GetFileName(const char *filePath);
 const char *GetFileNameWithoutExt(const char *filePath);
 const char *GetDirectoryPath(const char *filePath);
 const char *GetPrevDirectoryPath(const char *dirPath);
 const char *GetWorkingDirectory(void);
 const char *GetApplicationDirectory(void);
 
# 1119 "../include/raylib.h" 3 4
     _Bool 
# 1119 "../include/raylib.h"
          ChangeDirectory(const char *dir);
 
# 1120 "../include/raylib.h" 3 4
     _Bool 
# 1120 "../include/raylib.h"
          IsPathFile(const char *path);
 FilePathList LoadDirectoryFiles(const char *dirPath);
 FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, 
# 1122 "../include/raylib.h" 3 4
                                                                                 _Bool 
# 1122 "../include/raylib.h"
                                                                                      scanSubdirs);
 void UnloadDirectoryFiles(FilePathList files);
 
# 1124 "../include/raylib.h" 3 4
     _Bool 
# 1124 "../include/raylib.h"
          IsFileDropped(void);
 FilePathList LoadDroppedFiles(void);
 void UnloadDroppedFiles(FilePathList files);
 long GetFileModTime(const char *fileName);


 unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize);
 unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize);
 char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize);
 unsigned char *DecodeDataBase64(const unsigned char *data, int *outputSize);


 AutomationEventList LoadAutomationEventList(const char *fileName);
 void UnloadAutomationEventList(AutomationEventList *list);
 
# 1138 "../include/raylib.h" 3 4
     _Bool 
# 1138 "../include/raylib.h"
          ExportAutomationEventList(AutomationEventList list, const char *fileName);
 void SetAutomationEventList(AutomationEventList *list);
 void SetAutomationEventBaseFrame(int frame);
 void StartAutomationEventRecording(void);
 void StopAutomationEventRecording(void);
 void PlayAutomationEvent(AutomationEvent event);






 
# 1150 "../include/raylib.h" 3 4
     _Bool 
# 1150 "../include/raylib.h"
          IsKeyPressed(int key);
 
# 1151 "../include/raylib.h" 3 4
     _Bool 
# 1151 "../include/raylib.h"
          IsKeyPressedRepeat(int key);
 
# 1152 "../include/raylib.h" 3 4
     _Bool 
# 1152 "../include/raylib.h"
          IsKeyDown(int key);
 
# 1153 "../include/raylib.h" 3 4
     _Bool 
# 1153 "../include/raylib.h"
          IsKeyReleased(int key);
 
# 1154 "../include/raylib.h" 3 4
     _Bool 
# 1154 "../include/raylib.h"
          IsKeyUp(int key);
 int GetKeyPressed(void);
 int GetCharPressed(void);
 void SetExitKey(int key);


 
# 1160 "../include/raylib.h" 3 4
     _Bool 
# 1160 "../include/raylib.h"
          IsGamepadAvailable(int gamepad);
 const char *GetGamepadName(int gamepad);
 
# 1162 "../include/raylib.h" 3 4
     _Bool 
# 1162 "../include/raylib.h"
          IsGamepadButtonPressed(int gamepad, int button);
 
# 1163 "../include/raylib.h" 3 4
     _Bool 
# 1163 "../include/raylib.h"
          IsGamepadButtonDown(int gamepad, int button);
 
# 1164 "../include/raylib.h" 3 4
     _Bool 
# 1164 "../include/raylib.h"
          IsGamepadButtonReleased(int gamepad, int button);
 
# 1165 "../include/raylib.h" 3 4
     _Bool 
# 1165 "../include/raylib.h"
          IsGamepadButtonUp(int gamepad, int button);
 int GetGamepadButtonPressed(void);
 int GetGamepadAxisCount(int gamepad);
 float GetGamepadAxisMovement(int gamepad, int axis);
 int SetGamepadMappings(const char *mappings);


 
# 1172 "../include/raylib.h" 3 4
     _Bool 
# 1172 "../include/raylib.h"
          IsMouseButtonPressed(int button);
 
# 1173 "../include/raylib.h" 3 4
     _Bool 
# 1173 "../include/raylib.h"
          IsMouseButtonDown(int button);
 
# 1174 "../include/raylib.h" 3 4
     _Bool 
# 1174 "../include/raylib.h"
          IsMouseButtonReleased(int button);
 
# 1175 "../include/raylib.h" 3 4
     _Bool 
# 1175 "../include/raylib.h"
          IsMouseButtonUp(int button);
 int GetMouseX(void);
 int GetMouseY(void);
 Vector2 GetMousePosition(void);
 Vector2 GetMouseDelta(void);
 void SetMousePosition(int x, int y);
 void SetMouseOffset(int offsetX, int offsetY);
 void SetMouseScale(float scaleX, float scaleY);
 float GetMouseWheelMove(void);
 Vector2 GetMouseWheelMoveV(void);
 void SetMouseCursor(int cursor);


 int GetTouchX(void);
 int GetTouchY(void);
 Vector2 GetTouchPosition(int index);
 int GetTouchPointId(int index);
 int GetTouchPointCount(void);




 void SetGesturesEnabled(unsigned int flags);
 
# 1198 "../include/raylib.h" 3 4
     _Bool 
# 1198 "../include/raylib.h"
          IsGestureDetected(unsigned int gesture);
 int GetGestureDetected(void);
 float GetGestureHoldDuration(void);
 Vector2 GetGestureDragVector(void);
 float GetGestureDragAngle(void);
 Vector2 GetGesturePinchVector(void);
 float GetGesturePinchAngle(void);




 void UpdateCamera(Camera *camera, int mode);
 void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom);







 void SetShapesTexture(Texture2D texture, Rectangle source);


 void DrawPixel(int posX, int posY, Color color);
 void DrawPixelV(Vector2 position, Color color);
 void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
 void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
 void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
 void DrawLineStrip(Vector2 *points, int pointCount, Color color);
 void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
 void DrawCircle(int centerX, int centerY, float radius, Color color);
 void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
 void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
 void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
 void DrawCircleV(Vector2 center, float radius, Color color);
 void DrawCircleLines(int centerX, int centerY, float radius, Color color);
 void DrawCircleLinesV(Vector2 center, float radius, Color color);
 void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
 void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
 void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
 void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
 void DrawRectangle(int posX, int posY, int width, int height, Color color);
 void DrawRectangleV(Vector2 position, Vector2 size, Color color);
 void DrawRectangleRec(Rectangle rec, Color color);
 void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
 void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
 void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
 void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
 void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
 void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);
 void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
 void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color);
 void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
 void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
 void DrawTriangleFan(Vector2 *points, int pointCount, Color color);
 void DrawTriangleStrip(Vector2 *points, int pointCount, Color color);
 void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
 void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);
 void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color);


 void DrawSplineLinear(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineBasis(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineCatmullRom(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineBezierQuadratic(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineBezierCubic(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color);
 void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color);
 void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color);
 void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color);
 void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color);


 Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t);
 Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);
 Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);
 Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t);
 Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t);


 
# 1278 "../include/raylib.h" 3 4
     _Bool 
# 1278 "../include/raylib.h"
          CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
 
# 1279 "../include/raylib.h" 3 4
     _Bool 
# 1279 "../include/raylib.h"
          CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
 
# 1280 "../include/raylib.h" 3 4
     _Bool 
# 1280 "../include/raylib.h"
          CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
 
# 1281 "../include/raylib.h" 3 4
     _Bool 
# 1281 "../include/raylib.h"
          CheckCollisionPointRec(Vector2 point, Rectangle rec);
 
# 1282 "../include/raylib.h" 3 4
     _Bool 
# 1282 "../include/raylib.h"
          CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
 
# 1283 "../include/raylib.h" 3 4
     _Bool 
# 1283 "../include/raylib.h"
          CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);
 
# 1284 "../include/raylib.h" 3 4
     _Bool 
# 1284 "../include/raylib.h"
          CheckCollisionPointPoly(Vector2 point, Vector2 *points, int pointCount);
 
# 1285 "../include/raylib.h" 3 4
     _Bool 
# 1285 "../include/raylib.h"
          CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint);
 
# 1286 "../include/raylib.h" 3 4
     _Bool 
# 1286 "../include/raylib.h"
          CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);
 Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);







 Image LoadImage(const char *fileName);
 Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);
 Image LoadImageSvg(const char *fileNameOrString, int width, int height);
 Image LoadImageAnim(const char *fileName, int *frames);
 Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize);
 Image LoadImageFromTexture(Texture2D texture);
 Image LoadImageFromScreen(void);
 
# 1302 "../include/raylib.h" 3 4
     _Bool 
# 1302 "../include/raylib.h"
          IsImageReady(Image image);
 void UnloadImage(Image image);
 
# 1304 "../include/raylib.h" 3 4
     _Bool 
# 1304 "../include/raylib.h"
          ExportImage(Image image, const char *fileName);
 unsigned char *ExportImageToMemory(Image image, const char *fileType, int *fileSize);
 
# 1306 "../include/raylib.h" 3 4
     _Bool 
# 1306 "../include/raylib.h"
          ExportImageAsCode(Image image, const char *fileName);


 Image GenImageColor(int width, int height, Color color);
 Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end);
 Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
 Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer);
 Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
 Image GenImageWhiteNoise(int width, int height, float factor);
 Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);
 Image GenImageCellular(int width, int height, int tileSize);
 Image GenImageText(int width, int height, const char *text);


 Image ImageCopy(Image image);
 Image ImageFromImage(Image image, Rectangle rec);
 Image ImageText(const char *text, int fontSize, Color color);
 Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);
 void ImageFormat(Image *image, int newFormat);
 void ImageToPOT(Image *image, Color fill);
 void ImageCrop(Image *image, Rectangle crop);
 void ImageAlphaCrop(Image *image, float threshold);
 void ImageAlphaClear(Image *image, Color color, float threshold);
 void ImageAlphaMask(Image *image, Image alphaMask);
 void ImageAlphaPremultiply(Image *image);
 void ImageBlurGaussian(Image *image, int blurSize);
 void ImageResize(Image *image, int newWidth, int newHeight);
 void ImageResizeNN(Image *image, int newWidth,int newHeight);
 void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill);
 void ImageMipmaps(Image *image);
 void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);
 void ImageFlipVertical(Image *image);
 void ImageFlipHorizontal(Image *image);
 void ImageRotate(Image *image, int degrees);
 void ImageRotateCW(Image *image);
 void ImageRotateCCW(Image *image);
 void ImageColorTint(Image *image, Color color);
 void ImageColorInvert(Image *image);
 void ImageColorGrayscale(Image *image);
 void ImageColorContrast(Image *image, float contrast);
 void ImageColorBrightness(Image *image, int brightness);
 void ImageColorReplace(Image *image, Color color, Color replace);
 Color *LoadImageColors(Image image);
 Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount);
 void UnloadImageColors(Color *colors);
 void UnloadImagePalette(Color *colors);
 Rectangle GetImageAlphaBorder(Image image, float threshold);
 Color GetImageColor(Image image, int x, int y);



 void ImageClearBackground(Image *dst, Color color);
 void ImageDrawPixel(Image *dst, int posX, int posY, Color color);
 void ImageDrawPixelV(Image *dst, Vector2 position, Color color);
 void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color);
 void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);
 void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);
 void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);
 void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color);
 void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color);
 void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);
 void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);
 void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);
 void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);
 void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
 void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color);
 void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);



 Texture2D LoadTexture(const char *fileName);
 Texture2D LoadTextureFromImage(Image image);
 TextureCubemap LoadTextureCubemap(Image image, int layout);
 RenderTexture2D LoadRenderTexture(int width, int height);
 
# 1380 "../include/raylib.h" 3 4
     _Bool 
# 1380 "../include/raylib.h"
          IsTextureReady(Texture2D texture);
 void UnloadTexture(Texture2D texture);
 
# 1382 "../include/raylib.h" 3 4
     _Bool 
# 1382 "../include/raylib.h"
          IsRenderTextureReady(RenderTexture2D target);
 void UnloadRenderTexture(RenderTexture2D target);
 void UpdateTexture(Texture2D texture, const void *pixels);
 void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels);


 void GenTextureMipmaps(Texture2D *texture);
 void SetTextureFilter(Texture2D texture, int filter);
 void SetTextureWrap(Texture2D texture, int wrap);


 void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
 void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
 void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
 void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);
 void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint);
 void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint);


 Color Fade(Color color, float alpha);
 int ColorToInt(Color color);
 Vector4 ColorNormalize(Color color);
 Color ColorFromNormalized(Vector4 normalized);
 Vector3 ColorToHSV(Color color);
 Color ColorFromHSV(float hue, float saturation, float value);
 Color ColorTint(Color color, Color tint);
 Color ColorBrightness(Color color, float factor);
 Color ColorContrast(Color color, float contrast);
 Color ColorAlpha(Color color, float alpha);
 Color ColorAlphaBlend(Color dst, Color src, Color tint);
 Color GetColor(unsigned int hexValue);
 Color GetPixelColor(void *srcPtr, int format);
 void SetPixelColor(void *dstPtr, Color color, int format);
 int GetPixelDataSize(int width, int height, int format);






 Font GetFontDefault(void);
 Font LoadFont(const char *fileName);
 Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointCount);
 Font LoadFontFromImage(Image image, Color key, int firstChar);
 Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount);
 
# 1427 "../include/raylib.h" 3 4
     _Bool 
# 1427 "../include/raylib.h"
          IsFontReady(Font font);
 GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount, int type);
 Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod);
 void UnloadFontData(GlyphInfo *glyphs, int glyphCount);
 void UnloadFont(Font font);
 
# 1432 "../include/raylib.h" 3 4
     _Bool 
# 1432 "../include/raylib.h"
          ExportFontAsCode(Font font, const char *fileName);


 void DrawFPS(int posX, int posY);
 void DrawText(const char *text, int posX, int posY, int fontSize, Color color);
 void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);
 void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint);
 void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint);
 void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint);


 void SetTextLineSpacing(int spacing);
 int MeasureText(const char *text, int fontSize);
 Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);
 int GetGlyphIndex(Font font, int codepoint);
 GlyphInfo GetGlyphInfo(Font font, int codepoint);
 Rectangle GetGlyphAtlasRec(Font font, int codepoint);


 char *LoadUTF8(const int *codepoints, int length);
 void UnloadUTF8(char *text);
 int *LoadCodepoints(const char *text, int *count);
 void UnloadCodepoints(int *codepoints);
 int GetCodepointCount(const char *text);
 int GetCodepoint(const char *text, int *codepointSize);
 int GetCodepointNext(const char *text, int *codepointSize);
 int GetCodepointPrevious(const char *text, int *codepointSize);
 const char *CodepointToUTF8(int codepoint, int *utf8Size);



 int TextCopy(char *dst, const char *src);
 
# 1464 "../include/raylib.h" 3 4
     _Bool 
# 1464 "../include/raylib.h"
          TextIsEqual(const char *text1, const char *text2);
 unsigned int TextLength(const char *text);
 const char *TextFormat(const char *text, ...);
 const char *TextSubtext(const char *text, int position, int length);
 char *TextReplace(char *text, const char *replace, const char *by);
 char *TextInsert(const char *text, const char *insert, int position);
 const char *TextJoin(const char **textList, int count, const char *delimiter);
 const char **TextSplit(const char *text, char delimiter, int *count);
 void TextAppend(char *text, const char *append, int *position);
 int TextFindIndex(const char *text, const char *find);
 const char *TextToUpper(const char *text);
 const char *TextToLower(const char *text);
 const char *TextToPascal(const char *text);
 int TextToInteger(const char *text);






 void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
 void DrawPoint3D(Vector3 position, Color color);
 void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
 void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);
 void DrawTriangleStrip3D(Vector3 *points, int pointCount, Color color);
 void DrawCube(Vector3 position, float width, float height, float length, Color color);
 void DrawCubeV(Vector3 position, Vector3 size, Color color);
 void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
 void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
 void DrawSphere(Vector3 centerPos, float radius, Color color);
 void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);
 void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);
 void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
 void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color);
 void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
 void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color);
 void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color);
 void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color);
 void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
 void DrawRay(Ray ray, Color color);
 void DrawGrid(int slices, float spacing);






 Model LoadModel(const char *fileName);
 Model LoadModelFromMesh(Mesh mesh);
 
# 1513 "../include/raylib.h" 3 4
     _Bool 
# 1513 "../include/raylib.h"
          IsModelReady(Model model);
 void UnloadModel(Model model);
 BoundingBox GetModelBoundingBox(Model model);


 void DrawModel(Model model, Vector3 position, float scale, Color tint);
 void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
 void DrawModelWires(Model model, Vector3 position, float scale, Color tint);
 void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
 void DrawBoundingBox(BoundingBox box, Color color);
 void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint);
 void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint);
 void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint);


 void UploadMesh(Mesh *mesh, 
# 1528 "../include/raylib.h" 3 4
                                 _Bool 
# 1528 "../include/raylib.h"
                                      dynamic);
 void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset);
 void UnloadMesh(Mesh mesh);
 void DrawMesh(Mesh mesh, Material material, Matrix transform);
 void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances);
 
# 1533 "../include/raylib.h" 3 4
     _Bool 
# 1533 "../include/raylib.h"
          ExportMesh(Mesh mesh, const char *fileName);
 BoundingBox GetMeshBoundingBox(Mesh mesh);
 void GenMeshTangents(Mesh *mesh);


 Mesh GenMeshPoly(int sides, float radius);
 Mesh GenMeshPlane(float width, float length, int resX, int resZ);
 Mesh GenMeshCube(float width, float height, float length);
 Mesh GenMeshSphere(float radius, int rings, int slices);
 Mesh GenMeshHemiSphere(float radius, int rings, int slices);
 Mesh GenMeshCylinder(float radius, float height, int slices);
 Mesh GenMeshCone(float radius, float height, int slices);
 Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);
 Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);
 Mesh GenMeshHeightmap(Image heightmap, Vector3 size);
 Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);


 Material *LoadMaterials(const char *fileName, int *materialCount);
 Material LoadMaterialDefault(void);
 
# 1553 "../include/raylib.h" 3 4
     _Bool 
# 1553 "../include/raylib.h"
          IsMaterialReady(Material material);
 void UnloadMaterial(Material material);
 void SetMaterialTexture(Material *material, int mapType, Texture2D texture);
 void SetModelMeshMaterial(Model *model, int meshId, int materialId);


 ModelAnimation *LoadModelAnimations(const char *fileName, int *animCount);
 void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);
 void UnloadModelAnimation(ModelAnimation anim);
 void UnloadModelAnimations(ModelAnimation *animations, int animCount);
 
# 1563 "../include/raylib.h" 3 4
     _Bool 
# 1563 "../include/raylib.h"
          IsModelAnimationValid(Model model, ModelAnimation anim);


 
# 1566 "../include/raylib.h" 3 4
     _Bool 
# 1566 "../include/raylib.h"
          CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2);
 
# 1567 "../include/raylib.h" 3 4
     _Bool 
# 1567 "../include/raylib.h"
          CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);
 
# 1568 "../include/raylib.h" 3 4
     _Bool 
# 1568 "../include/raylib.h"
          CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);
 RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius);
 RayCollision GetRayCollisionBox(Ray ray, BoundingBox box);
 RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);
 RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
 RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4);




typedef void (*AudioCallback)(void *bufferData, unsigned int frames);


 void InitAudioDevice(void);
 void CloseAudioDevice(void);
 
# 1583 "../include/raylib.h" 3 4
     _Bool 
# 1583 "../include/raylib.h"
          IsAudioDeviceReady(void);
 void SetMasterVolume(float volume);
 float GetMasterVolume(void);


 Wave LoadWave(const char *fileName);
 Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize);
 
# 1590 "../include/raylib.h" 3 4
     _Bool 
# 1590 "../include/raylib.h"
          IsWaveReady(Wave wave);
 Sound LoadSound(const char *fileName);
 Sound LoadSoundFromWave(Wave wave);
 Sound LoadSoundAlias(Sound source);
 
# 1594 "../include/raylib.h" 3 4
     _Bool 
# 1594 "../include/raylib.h"
          IsSoundReady(Sound sound);
 void UpdateSound(Sound sound, const void *data, int sampleCount);
 void UnloadWave(Wave wave);
 void UnloadSound(Sound sound);
 void UnloadSoundAlias(Sound alias);
 
# 1599 "../include/raylib.h" 3 4
     _Bool 
# 1599 "../include/raylib.h"
          ExportWave(Wave wave, const char *fileName);
 
# 1600 "../include/raylib.h" 3 4
     _Bool 
# 1600 "../include/raylib.h"
          ExportWaveAsCode(Wave wave, const char *fileName);


 void PlaySound(Sound sound);
 void StopSound(Sound sound);
 void PauseSound(Sound sound);
 void ResumeSound(Sound sound);
 
# 1607 "../include/raylib.h" 3 4
     _Bool 
# 1607 "../include/raylib.h"
          IsSoundPlaying(Sound sound);
 void SetSoundVolume(Sound sound, float volume);
 void SetSoundPitch(Sound sound, float pitch);
 void SetSoundPan(Sound sound, float pan);
 Wave WaveCopy(Wave wave);
 void WaveCrop(Wave *wave, int initSample, int finalSample);
 void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels);
 float *LoadWaveSamples(Wave wave);
 void UnloadWaveSamples(float *samples);


 Music LoadMusicStream(const char *fileName);
 Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize);
 
# 1620 "../include/raylib.h" 3 4
     _Bool 
# 1620 "../include/raylib.h"
          IsMusicReady(Music music);
 void UnloadMusicStream(Music music);
 void PlayMusicStream(Music music);
 
# 1623 "../include/raylib.h" 3 4
     _Bool 
# 1623 "../include/raylib.h"
          IsMusicStreamPlaying(Music music);
 void UpdateMusicStream(Music music);
 void StopMusicStream(Music music);
 void PauseMusicStream(Music music);
 void ResumeMusicStream(Music music);
 void SeekMusicStream(Music music, float position);
 void SetMusicVolume(Music music, float volume);
 void SetMusicPitch(Music music, float pitch);
 void SetMusicPan(Music music, float pan);
 float GetMusicTimeLength(Music music);
 float GetMusicTimePlayed(Music music);


 AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels);
 
# 1637 "../include/raylib.h" 3 4
     _Bool 
# 1637 "../include/raylib.h"
          IsAudioStreamReady(AudioStream stream);
 void UnloadAudioStream(AudioStream stream);
 void UpdateAudioStream(AudioStream stream, const void *data, int frameCount);
 
# 1640 "../include/raylib.h" 3 4
     _Bool 
# 1640 "../include/raylib.h"
          IsAudioStreamProcessed(AudioStream stream);
 void PlayAudioStream(AudioStream stream);
 void PauseAudioStream(AudioStream stream);
 void ResumeAudioStream(AudioStream stream);
 
# 1644 "../include/raylib.h" 3 4
     _Bool 
# 1644 "../include/raylib.h"
          IsAudioStreamPlaying(AudioStream stream);
 void StopAudioStream(AudioStream stream);
 void SetAudioStreamVolume(AudioStream stream, float volume);
 void SetAudioStreamPitch(AudioStream stream, float pitch);
 void SetAudioStreamPan(AudioStream stream, float pan);
 void SetAudioStreamBufferSizeDefault(int size);
 void SetAudioStreamCallback(AudioStream stream, AudioCallback callback);

 void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor);
 void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor);

 void AttachAudioMixedProcessor(AudioCallback processor);
 void DetachAudioMixedProcessor(AudioCallback processor);
# 2 "main.c" 2
# 1 "../include/raygui.h" 1
# 322 "../include/raygui.h"
# 1 "../include/raylib.h" 1
# 323 "../include/raygui.h" 2
# 447 "../include/raygui.h"
typedef struct GuiStyleProp {
    unsigned short controlId;
    unsigned short propertyId;
    int propertyValue;
} GuiStyleProp;
# 467 "../include/raygui.h"
typedef enum {
    STATE_NORMAL = 0,
    STATE_FOCUSED,
    STATE_PRESSED,
    STATE_DISABLED
} GuiState;


typedef enum {
    TEXT_ALIGN_LEFT = 0,
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_RIGHT
} GuiTextAlignment;



typedef enum {
    TEXT_ALIGN_TOP = 0,
    TEXT_ALIGN_MIDDLE,
    TEXT_ALIGN_BOTTOM
} GuiTextAlignmentVertical;



typedef enum {
    TEXT_WRAP_NONE = 0,
    TEXT_WRAP_CHAR,
    TEXT_WRAP_WORD
} GuiTextWrapMode;


typedef enum {

    DEFAULT = 0,


    LABEL,
    BUTTON,
    TOGGLE,
    SLIDER,
    PROGRESSBAR,
    CHECKBOX,
    COMBOBOX,
    DROPDOWNBOX,
    TEXTBOX,
    VALUEBOX,
    SPINNER,
    LISTVIEW,
    COLORPICKER,
    SCROLLBAR,
    STATUSBAR
} GuiControl;



typedef enum {
    BORDER_COLOR_NORMAL = 0,
    BASE_COLOR_NORMAL,
    TEXT_COLOR_NORMAL,
    BORDER_COLOR_FOCUSED,
    BASE_COLOR_FOCUSED,
    TEXT_COLOR_FOCUSED,
    BORDER_COLOR_PRESSED,
    BASE_COLOR_PRESSED,
    TEXT_COLOR_PRESSED,
    BORDER_COLOR_DISABLED,
    BASE_COLOR_DISABLED,
    TEXT_COLOR_DISABLED,
    BORDER_WIDTH,



    TEXT_PADDING,
    TEXT_ALIGNMENT,

} GuiControlProperty;
# 556 "../include/raygui.h"
typedef enum {
    TEXT_SIZE = 16,
    TEXT_SPACING,
    LINE_COLOR,
    BACKGROUND_COLOR,
    TEXT_LINE_SPACING,
    TEXT_ALIGNMENT_VERTICAL,
    TEXT_WRAP_MODE


} GuiDefaultProperty;
# 579 "../include/raygui.h"
typedef enum {
    GROUP_PADDING = 16,
} GuiToggleProperty;


typedef enum {
    SLIDER_WIDTH = 16,
    SLIDER_PADDING
} GuiSliderProperty;


typedef enum {
    PROGRESS_PADDING = 16,
} GuiProgressBarProperty;


typedef enum {
    ARROWS_SIZE = 16,
    ARROWS_VISIBLE,
    SCROLL_SLIDER_PADDING,
    SCROLL_SLIDER_SIZE,
    SCROLL_PADDING,
    SCROLL_SPEED,
} GuiScrollBarProperty;


typedef enum {
    CHECK_PADDING = 16
} GuiCheckBoxProperty;


typedef enum {
    COMBO_BUTTON_WIDTH = 16,
    COMBO_BUTTON_SPACING
} GuiComboBoxProperty;


typedef enum {
    ARROW_PADDING = 16,
    DROPDOWN_ITEMS_SPACING
} GuiDropdownBoxProperty;


typedef enum {
    TEXT_READONLY = 16,
} GuiTextBoxProperty;


typedef enum {
    SPIN_BUTTON_WIDTH = 16,
    SPIN_BUTTON_SPACING,
} GuiSpinnerProperty;


typedef enum {
    LIST_ITEMS_HEIGHT = 16,
    LIST_ITEMS_SPACING,
    SCROLLBAR_WIDTH,
    SCROLLBAR_SIDE,
} GuiListViewProperty;


typedef enum {
    COLOR_SELECTOR_SIZE = 16,
    HUEBAR_WIDTH,
    HUEBAR_PADDING,
    HUEBAR_SELECTOR_HEIGHT,
    HUEBAR_SELECTOR_OVERFLOW
} GuiColorPickerProperty;
# 666 "../include/raygui.h"
 void GuiEnable(void);
 void GuiDisable(void);
 void GuiLock(void);
 void GuiUnlock(void);
 
# 670 "../include/raygui.h" 3 4
         _Bool 
# 670 "../include/raygui.h"
              GuiIsLocked(void);
 void GuiSetAlpha(float alpha);
 void GuiSetState(int state);
 int GuiGetState(void);


 void GuiSetFont(Font font);
 Font GuiGetFont(void);


 void GuiSetStyle(int control, int property, int value);
 int GuiGetStyle(int control, int property);


 void GuiLoadStyle(const char *fileName);
 void GuiLoadStyleDefault(void);


 void GuiEnableTooltip(void);
 void GuiDisableTooltip(void);
 void GuiSetTooltip(const char *tooltip);


 const char *GuiIconText(int iconId, const char *text);

 void GuiSetIconScale(int scale);
 unsigned int *GuiGetIcons(void);
 char **GuiLoadIcons(const char *fileName, 
# 697 "../include/raygui.h" 3 4
                                                   _Bool 
# 697 "../include/raygui.h"
                                                        loadIconsName);
 void GuiDrawIcon(int iconId, int posX, int posY, int pixelSize, Color color);






 int GuiWindowBox(Rectangle bounds, const char *title);
 int GuiGroupBox(Rectangle bounds, const char *text);
 int GuiLine(Rectangle bounds, const char *text);
 int GuiPanel(Rectangle bounds, const char *text);
 int GuiTabBar(Rectangle bounds, const char **text, int count, int *active);
 int GuiScrollPanel(Rectangle bounds, const char *text, Rectangle content, Vector2 *scroll, Rectangle *view);


 int GuiLabel(Rectangle bounds, const char *text);
 int GuiButton(Rectangle bounds, const char *text);
 int GuiLabelButton(Rectangle bounds, const char *text);
 int GuiToggle(Rectangle bounds, const char *text, 
# 716 "../include/raygui.h" 3 4
                                                           _Bool 
# 716 "../include/raygui.h"
                                                                *active);
 int GuiToggleGroup(Rectangle bounds, const char *text, int *active);
 int GuiToggleSlider(Rectangle bounds, const char *text, int *active);
 int GuiCheckBox(Rectangle bounds, const char *text, 
# 719 "../include/raygui.h" 3 4
                                                             _Bool 
# 719 "../include/raygui.h"
                                                                  *checked);
 int GuiComboBox(Rectangle bounds, const char *text, int *active);

 int GuiDropdownBox(Rectangle bounds, const char *text, int *active, 
# 722 "../include/raygui.h" 3 4
                                                                             _Bool 
# 722 "../include/raygui.h"
                                                                                  editMode);
 int GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, 
# 723 "../include/raygui.h" 3 4
                                                                                                    _Bool 
# 723 "../include/raygui.h"
                                                                                                         editMode);
 int GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, 
# 724 "../include/raygui.h" 3 4
                                                                                                     _Bool 
# 724 "../include/raygui.h"
                                                                                                          editMode);
 int GuiTextBox(Rectangle bounds, char *text, int textSize, 
# 725 "../include/raygui.h" 3 4
                                                                    _Bool 
# 725 "../include/raygui.h"
                                                                         editMode);

 int GuiSlider(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue);
 int GuiSliderBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue);
 int GuiProgressBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue);
 int GuiStatusBar(Rectangle bounds, const char *text);
 int GuiDummyRec(Rectangle bounds, const char *text);
 int GuiGrid(Rectangle bounds, const char *text, float spacing, int subdivs, Vector2 *mouseCell);


 int GuiListView(Rectangle bounds, const char *text, int *scrollIndex, int *active);
 int GuiListViewEx(Rectangle bounds, const char **text, int count, int *scrollIndex, int *active, int *focus);
 int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *buttons);
 int GuiTextInputBox(Rectangle bounds, const char *title, const char *message, const char *buttons, char *text, int textMaxSize, 
# 738 "../include/raygui.h" 3 4
                                                                                                                                         _Bool 
# 738 "../include/raygui.h"
                                                                                                                                              *secretViewActive);
 int GuiColorPicker(Rectangle bounds, const char *text, Color *color);
 int GuiColorPanel(Rectangle bounds, const char *text, Color *color);
 int GuiColorBarAlpha(Rectangle bounds, const char *text, float *alpha);
 int GuiColorBarHue(Rectangle bounds, const char *text, float *value);
 int GuiColorPickerHSV(Rectangle bounds, const char *text, Vector3 *colorHsv);
 int GuiColorPanelHSV(Rectangle bounds, const char *text, Vector3 *colorHsv);
# 754 "../include/raygui.h"
typedef enum {
    ICON_NONE = 0,
    ICON_FOLDER_FILE_OPEN = 1,
    ICON_FILE_SAVE_CLASSIC = 2,
    ICON_FOLDER_OPEN = 3,
    ICON_FOLDER_SAVE = 4,
    ICON_FILE_OPEN = 5,
    ICON_FILE_SAVE = 6,
    ICON_FILE_EXPORT = 7,
    ICON_FILE_ADD = 8,
    ICON_FILE_DELETE = 9,
    ICON_FILETYPE_TEXT = 10,
    ICON_FILETYPE_AUDIO = 11,
    ICON_FILETYPE_IMAGE = 12,
    ICON_FILETYPE_PLAY = 13,
    ICON_FILETYPE_VIDEO = 14,
    ICON_FILETYPE_INFO = 15,
    ICON_FILE_COPY = 16,
    ICON_FILE_CUT = 17,
    ICON_FILE_PASTE = 18,
    ICON_CURSOR_HAND = 19,
    ICON_CURSOR_POINTER = 20,
    ICON_CURSOR_CLASSIC = 21,
    ICON_PENCIL = 22,
    ICON_PENCIL_BIG = 23,
    ICON_BRUSH_CLASSIC = 24,
    ICON_BRUSH_PAINTER = 25,
    ICON_WATER_DROP = 26,
    ICON_COLOR_PICKER = 27,
    ICON_RUBBER = 28,
    ICON_COLOR_BUCKET = 29,
    ICON_TEXT_T = 30,
    ICON_TEXT_A = 31,
    ICON_SCALE = 32,
    ICON_RESIZE = 33,
    ICON_FILTER_POINT = 34,
    ICON_FILTER_BILINEAR = 35,
    ICON_CROP = 36,
    ICON_CROP_ALPHA = 37,
    ICON_SQUARE_TOGGLE = 38,
    ICON_SYMMETRY = 39,
    ICON_SYMMETRY_HORIZONTAL = 40,
    ICON_SYMMETRY_VERTICAL = 41,
    ICON_LENS = 42,
    ICON_LENS_BIG = 43,
    ICON_EYE_ON = 44,
    ICON_EYE_OFF = 45,
    ICON_FILTER_TOP = 46,
    ICON_FILTER = 47,
    ICON_TARGET_POINT = 48,
    ICON_TARGET_SMALL = 49,
    ICON_TARGET_BIG = 50,
    ICON_TARGET_MOVE = 51,
    ICON_CURSOR_MOVE = 52,
    ICON_CURSOR_SCALE = 53,
    ICON_CURSOR_SCALE_RIGHT = 54,
    ICON_CURSOR_SCALE_LEFT = 55,
    ICON_UNDO = 56,
    ICON_REDO = 57,
    ICON_REREDO = 58,
    ICON_MUTATE = 59,
    ICON_ROTATE = 60,
    ICON_REPEAT = 61,
    ICON_SHUFFLE = 62,
    ICON_EMPTYBOX = 63,
    ICON_TARGET = 64,
    ICON_TARGET_SMALL_FILL = 65,
    ICON_TARGET_BIG_FILL = 66,
    ICON_TARGET_MOVE_FILL = 67,
    ICON_CURSOR_MOVE_FILL = 68,
    ICON_CURSOR_SCALE_FILL = 69,
    ICON_CURSOR_SCALE_RIGHT_FILL = 70,
    ICON_CURSOR_SCALE_LEFT_FILL = 71,
    ICON_UNDO_FILL = 72,
    ICON_REDO_FILL = 73,
    ICON_REREDO_FILL = 74,
    ICON_MUTATE_FILL = 75,
    ICON_ROTATE_FILL = 76,
    ICON_REPEAT_FILL = 77,
    ICON_SHUFFLE_FILL = 78,
    ICON_EMPTYBOX_SMALL = 79,
    ICON_BOX = 80,
    ICON_BOX_TOP = 81,
    ICON_BOX_TOP_RIGHT = 82,
    ICON_BOX_RIGHT = 83,
    ICON_BOX_BOTTOM_RIGHT = 84,
    ICON_BOX_BOTTOM = 85,
    ICON_BOX_BOTTOM_LEFT = 86,
    ICON_BOX_LEFT = 87,
    ICON_BOX_TOP_LEFT = 88,
    ICON_BOX_CENTER = 89,
    ICON_BOX_CIRCLE_MASK = 90,
    ICON_POT = 91,
    ICON_ALPHA_MULTIPLY = 92,
    ICON_ALPHA_CLEAR = 93,
    ICON_DITHERING = 94,
    ICON_MIPMAPS = 95,
    ICON_BOX_GRID = 96,
    ICON_GRID = 97,
    ICON_BOX_CORNERS_SMALL = 98,
    ICON_BOX_CORNERS_BIG = 99,
    ICON_FOUR_BOXES = 100,
    ICON_GRID_FILL = 101,
    ICON_BOX_MULTISIZE = 102,
    ICON_ZOOM_SMALL = 103,
    ICON_ZOOM_MEDIUM = 104,
    ICON_ZOOM_BIG = 105,
    ICON_ZOOM_ALL = 106,
    ICON_ZOOM_CENTER = 107,
    ICON_BOX_DOTS_SMALL = 108,
    ICON_BOX_DOTS_BIG = 109,
    ICON_BOX_CONCENTRIC = 110,
    ICON_BOX_GRID_BIG = 111,
    ICON_OK_TICK = 112,
    ICON_CROSS = 113,
    ICON_ARROW_LEFT = 114,
    ICON_ARROW_RIGHT = 115,
    ICON_ARROW_DOWN = 116,
    ICON_ARROW_UP = 117,
    ICON_ARROW_LEFT_FILL = 118,
    ICON_ARROW_RIGHT_FILL = 119,
    ICON_ARROW_DOWN_FILL = 120,
    ICON_ARROW_UP_FILL = 121,
    ICON_AUDIO = 122,
    ICON_FX = 123,
    ICON_WAVE = 124,
    ICON_WAVE_SINUS = 125,
    ICON_WAVE_SQUARE = 126,
    ICON_WAVE_TRIANGULAR = 127,
    ICON_CROSS_SMALL = 128,
    ICON_PLAYER_PREVIOUS = 129,
    ICON_PLAYER_PLAY_BACK = 130,
    ICON_PLAYER_PLAY = 131,
    ICON_PLAYER_PAUSE = 132,
    ICON_PLAYER_STOP = 133,
    ICON_PLAYER_NEXT = 134,
    ICON_PLAYER_RECORD = 135,
    ICON_MAGNET = 136,
    ICON_LOCK_CLOSE = 137,
    ICON_LOCK_OPEN = 138,
    ICON_CLOCK = 139,
    ICON_TOOLS = 140,
    ICON_GEAR = 141,
    ICON_GEAR_BIG = 142,
    ICON_BIN = 143,
    ICON_HAND_POINTER = 144,
    ICON_LASER = 145,
    ICON_COIN = 146,
    ICON_EXPLOSION = 147,
    ICON_1UP = 148,
    ICON_PLAYER = 149,
    ICON_PLAYER_JUMP = 150,
    ICON_KEY = 151,
    ICON_DEMON = 152,
    ICON_TEXT_POPUP = 153,
    ICON_GEAR_EX = 154,
    ICON_CRACK = 155,
    ICON_CRACK_POINTS = 156,
    ICON_STAR = 157,
    ICON_DOOR = 158,
    ICON_EXIT = 159,
    ICON_MODE_2D = 160,
    ICON_MODE_3D = 161,
    ICON_CUBE = 162,
    ICON_CUBE_FACE_TOP = 163,
    ICON_CUBE_FACE_LEFT = 164,
    ICON_CUBE_FACE_FRONT = 165,
    ICON_CUBE_FACE_BOTTOM = 166,
    ICON_CUBE_FACE_RIGHT = 167,
    ICON_CUBE_FACE_BACK = 168,
    ICON_CAMERA = 169,
    ICON_SPECIAL = 170,
    ICON_LINK_NET = 171,
    ICON_LINK_BOXES = 172,
    ICON_LINK_MULTI = 173,
    ICON_LINK = 174,
    ICON_LINK_BROKE = 175,
    ICON_TEXT_NOTES = 176,
    ICON_NOTEBOOK = 177,
    ICON_SUITCASE = 178,
    ICON_SUITCASE_ZIP = 179,
    ICON_MAILBOX = 180,
    ICON_MONITOR = 181,
    ICON_PRINTER = 182,
    ICON_PHOTO_CAMERA = 183,
    ICON_PHOTO_CAMERA_FLASH = 184,
    ICON_HOUSE = 185,
    ICON_HEART = 186,
    ICON_CORNER = 187,
    ICON_VERTICAL_BARS = 188,
    ICON_VERTICAL_BARS_FILL = 189,
    ICON_LIFE_BARS = 190,
    ICON_INFO = 191,
    ICON_CROSSLINE = 192,
    ICON_HELP = 193,
    ICON_FILETYPE_ALPHA = 194,
    ICON_FILETYPE_HOME = 195,
    ICON_LAYERS_VISIBLE = 196,
    ICON_LAYERS = 197,
    ICON_WINDOW = 198,
    ICON_HIDPI = 199,
    ICON_FILETYPE_BINARY = 200,
    ICON_HEX = 201,
    ICON_SHIELD = 202,
    ICON_FILE_NEW = 203,
    ICON_FOLDER_ADD = 204,
    ICON_ALARM = 205,
    ICON_CPU = 206,
    ICON_ROM = 207,
    ICON_STEP_OVER = 208,
    ICON_STEP_INTO = 209,
    ICON_STEP_OUT = 210,
    ICON_RESTART = 211,
    ICON_BREAKPOINT_ON = 212,
    ICON_BREAKPOINT_OFF = 213,
    ICON_BURGER_MENU = 214,
    ICON_CASE_SENSITIVE = 215,
    ICON_REG_EXP = 216,
    ICON_FOLDER = 217,
    ICON_FILE = 218,
    ICON_SAND_TIMER = 219,
    ICON_220 = 220,
    ICON_221 = 221,
    ICON_222 = 222,
    ICON_223 = 223,
    ICON_224 = 224,
    ICON_225 = 225,
    ICON_226 = 226,
    ICON_227 = 227,
    ICON_228 = 228,
    ICON_229 = 229,
    ICON_230 = 230,
    ICON_231 = 231,
    ICON_232 = 232,
    ICON_233 = 233,
    ICON_234 = 234,
    ICON_235 = 235,
    ICON_236 = 236,
    ICON_237 = 237,
    ICON_238 = 238,
    ICON_239 = 239,
    ICON_240 = 240,
    ICON_241 = 241,
    ICON_242 = 242,
    ICON_243 = 243,
    ICON_244 = 244,
    ICON_245 = 245,
    ICON_246 = 246,
    ICON_247 = 247,
    ICON_248 = 248,
    ICON_249 = 249,
    ICON_250 = 250,
    ICON_251 = 251,
    ICON_252 = 252,
    ICON_253 = 253,
    ICON_254 = 254,
    ICON_255 = 255,
} GuiIconName;
# 3 "main.c" 2
# 1 "../include/raymath.h" 1
# 158 "../include/raymath.h"
typedef struct float3 {
    float v[3];
} float3;

typedef struct float16 {
    float v[16];
} float16;

# 1 "/usr/include/math.h" 1 3 4
# 27 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 402 "/usr/include/features.h" 3 4
# 1 "/usr/include/features-time64.h" 1 3 4
# 20 "/usr/include/features-time64.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 21 "/usr/include/features-time64.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 19 "/usr/include/bits/timesize.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 20 "/usr/include/bits/timesize.h" 2 3 4
# 22 "/usr/include/features-time64.h" 2 3 4
# 403 "/usr/include/features.h" 2 3 4
# 511 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 730 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 731 "/usr/include/sys/cdefs.h" 2 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 732 "/usr/include/sys/cdefs.h" 2 3 4
# 512 "/usr/include/features.h" 2 3 4
# 535 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 3 4
# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/gnu/stubs.h" 2 3 4
# 536 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/bits/libc-header-start.h" 2 3 4
# 28 "/usr/include/math.h" 2 3 4









# 1 "/usr/include/bits/types.h" 1 3 4
# 27 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 19 "/usr/include/bits/timesize.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 20 "/usr/include/bits/timesize.h" 2 3 4
# 29 "/usr/include/bits/types.h" 2 3 4



# 31 "/usr/include/bits/types.h" 3 4
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 142 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/time64.h" 1 3 4
# 143 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef long int __suseconds64_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 38 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/bits/math-vector.h" 1 3 4
# 25 "/usr/include/bits/math-vector.h" 3 4
# 1 "/usr/include/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/bits/math-vector.h" 2 3 4
# 41 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/bits/floatn.h" 1 3 4
# 119 "/usr/include/bits/floatn.h" 3 4
# 1 "/usr/include/bits/floatn-common.h" 1 3 4
# 24 "/usr/include/bits/floatn-common.h" 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 25 "/usr/include/bits/floatn-common.h" 2 3 4
# 120 "/usr/include/bits/floatn.h" 2 3 4
# 44 "/usr/include/math.h" 2 3 4
# 152 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/flt-eval-method.h" 1 3 4
# 153 "/usr/include/math.h" 2 3 4
# 163 "/usr/include/math.h" 3 4
typedef float float_t;
typedef double double_t;
# 204 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/fp-logb.h" 1 3 4
# 205 "/usr/include/math.h" 2 3 4
# 247 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/fp-fast.h" 1 3 4
# 248 "/usr/include/math.h" 2 3 4
# 312 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 313 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4
 extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




 extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/bits/mathcalls.h" 3 4
 extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));





 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 134 "/usr/include/bits/mathcalls.h" 3 4
 extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));




 extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));






 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));



 extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));




 extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
# 192 "/usr/include/bits/mathcalls.h" 3 4
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));




extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
# 228 "/usr/include/bits/mathcalls.h" 3 4
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));





extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));





 extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
 extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));




extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));







extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 290 "/usr/include/bits/mathcalls.h" 3 4
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
# 308 "/usr/include/bits/mathcalls.h" 3 4
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
# 450 "/usr/include/bits/mathcalls.h" 3 4
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 314 "/usr/include/math.h" 2 3 4
# 329 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 330 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4
 extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




 extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/bits/mathcalls.h" 3 4
 extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));





 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 134 "/usr/include/bits/mathcalls.h" 3 4
 extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




 extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));






 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));




 extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
# 192 "/usr/include/bits/mathcalls.h" 3 4
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));




extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
# 228 "/usr/include/bits/mathcalls.h" 3 4
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));





extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));





 extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
 extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));




extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));







extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 290 "/usr/include/bits/mathcalls.h" 3 4
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
# 308 "/usr/include/bits/mathcalls.h" 3 4
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));
# 450 "/usr/include/bits/mathcalls.h" 3 4
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 331 "/usr/include/math.h" 2 3 4
# 398 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 399 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4
 extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




 extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/bits/mathcalls.h" 3 4
 extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 134 "/usr/include/bits/mathcalls.h" 3 4
 extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




 extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));






 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));




 extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 192 "/usr/include/bits/mathcalls.h" 3 4
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));




extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
# 228 "/usr/include/bits/mathcalls.h" 3 4
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));





extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));





 extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
 extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));




extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));







extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 290 "/usr/include/bits/mathcalls.h" 3 4
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
# 308 "/usr/include/bits/mathcalls.h" 3 4
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
# 450 "/usr/include/bits/mathcalls.h" 3 4
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 400 "/usr/include/math.h" 2 3 4
# 481 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinff128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __finitef128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __isnanf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));


extern int __iseqsigf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 482 "/usr/include/math.h" 2 3 4
# 854 "/usr/include/math.h" 3 4
extern int signgam;
# 934 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 1472 "/usr/include/math.h" 3 4

# 167 "../include/raymath.h" 2







# 173 "../include/raymath.h"
inline float Clamp(float value, float min, float max)
{
    float result = (value < min)? min : value;

    if (result > max) result = max;

    return result;
}


inline float Lerp(float start, float end, float amount)
{
    float result = start + amount*(end - start);

    return result;
}


inline float Normalize(float value, float start, float end)
{
    float result = (value - start)/(end - start);

    return result;
}


inline float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd)
{
    float result = (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;

    return result;
}


inline float Wrap(float value, float min, float max)
{
    float result = value - (max - min)*floorf((value - min)/(max - min));

    return result;
}


inline int FloatEquals(float x, float y)
{




    int result = (fabsf(x - y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(x), fabsf(y))));

    return result;
}






inline Vector2 Vector2Zero(void)
{
    Vector2 result = { 0.0f, 0.0f };

    return result;
}


inline Vector2 Vector2One(void)
{
    Vector2 result = { 1.0f, 1.0f };

    return result;
}


inline Vector2 Vector2Add(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x + v2.x, v1.y + v2.y };

    return result;
}


inline Vector2 Vector2AddValue(Vector2 v, float add)
{
    Vector2 result = { v.x + add, v.y + add };

    return result;
}


inline Vector2 Vector2Subtract(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x - v2.x, v1.y - v2.y };

    return result;
}


inline Vector2 Vector2SubtractValue(Vector2 v, float sub)
{
    Vector2 result = { v.x - sub, v.y - sub };

    return result;
}


inline float Vector2Length(Vector2 v)
{
    float result = sqrtf((v.x*v.x) + (v.y*v.y));

    return result;
}


inline float Vector2LengthSqr(Vector2 v)
{
    float result = (v.x*v.x) + (v.y*v.y);

    return result;
}


inline float Vector2DotProduct(Vector2 v1, Vector2 v2)
{
    float result = (v1.x*v2.x + v1.y*v2.y);

    return result;
}


inline float Vector2Distance(Vector2 v1, Vector2 v2)
{
    float result = sqrtf((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y));

    return result;
}


inline float Vector2DistanceSqr(Vector2 v1, Vector2 v2)
{
    float result = ((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y));

    return result;
}



inline float Vector2Angle(Vector2 v1, Vector2 v2)
{
    float result = 0.0f;

    float dot = v1.x*v2.x + v1.y*v2.y;
    float det = v1.x*v2.y - v1.y*v2.x;

    result = atan2f(det, dot);

    return result;
}




inline float Vector2LineAngle(Vector2 start, Vector2 end)
{
    float result = 0.0f;


    result = -atan2f(end.y - start.y, end.x - start.x);

    return result;
}


inline Vector2 Vector2Scale(Vector2 v, float scale)
{
    Vector2 result = { v.x*scale, v.y*scale };

    return result;
}


inline Vector2 Vector2Multiply(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x*v2.x, v1.y*v2.y };

    return result;
}


inline Vector2 Vector2Negate(Vector2 v)
{
    Vector2 result = { -v.x, -v.y };

    return result;
}


inline Vector2 Vector2Divide(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x/v2.x, v1.y/v2.y };

    return result;
}


inline Vector2 Vector2Normalize(Vector2 v)
{
    Vector2 result = { 0 };
    float length = sqrtf((v.x*v.x) + (v.y*v.y));

    if (length > 0)
    {
        float ilength = 1.0f/length;
        result.x = v.x*ilength;
        result.y = v.y*ilength;
    }

    return result;
}


inline Vector2 Vector2Transform(Vector2 v, Matrix mat)
{
    Vector2 result = { 0 };

    float x = v.x;
    float y = v.y;
    float z = 0;

    result.x = mat.m0*x + mat.m4*y + mat.m8*z + mat.m12;
    result.y = mat.m1*x + mat.m5*y + mat.m9*z + mat.m13;

    return result;
}


inline Vector2 Vector2Lerp(Vector2 v1, Vector2 v2, float amount)
{
    Vector2 result = { 0 };

    result.x = v1.x + amount*(v2.x - v1.x);
    result.y = v1.y + amount*(v2.y - v1.y);

    return result;
}


inline Vector2 Vector2Reflect(Vector2 v, Vector2 normal)
{
    Vector2 result = { 0 };

    float dotProduct = (v.x*normal.x + v.y*normal.y);

    result.x = v.x - (2.0f*normal.x)*dotProduct;
    result.y = v.y - (2.0f*normal.y)*dotProduct;

    return result;
}


inline Vector2 Vector2Rotate(Vector2 v, float angle)
{
    Vector2 result = { 0 };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.x = v.x*cosres - v.y*sinres;
    result.y = v.x*sinres + v.y*cosres;

    return result;
}


inline Vector2 Vector2MoveTowards(Vector2 v, Vector2 target, float maxDistance)
{
    Vector2 result = { 0 };

    float dx = target.x - v.x;
    float dy = target.y - v.y;
    float value = (dx*dx) + (dy*dy);

    if ((value == 0) || ((maxDistance >= 0) && (value <= maxDistance*maxDistance))) return target;

    float dist = sqrtf(value);

    result.x = v.x + dx/dist*maxDistance;
    result.y = v.y + dy/dist*maxDistance;

    return result;
}


inline Vector2 Vector2Invert(Vector2 v)
{
    Vector2 result = { 1.0f/v.x, 1.0f/v.y };

    return result;
}



inline Vector2 Vector2Clamp(Vector2 v, Vector2 min, Vector2 max)
{
    Vector2 result = { 0 };

    result.x = fminf(max.x, fmaxf(min.x, v.x));
    result.y = fminf(max.y, fmaxf(min.y, v.y));

    return result;
}


inline Vector2 Vector2ClampValue(Vector2 v, float min, float max)
{
    Vector2 result = v;

    float length = (v.x*v.x) + (v.y*v.y);
    if (length > 0.0f)
    {
        length = sqrtf(length);

        if (length < min)
        {
            float scale = min/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
        }
        else if (length > max)
        {
            float scale = max/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
        }
    }

    return result;
}


inline int Vector2Equals(Vector2 p, Vector2 q)
{




    int result = ((fabsf(p.x - q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                  ((fabsf(p.y - q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y)))));

    return result;
}






inline Vector3 Vector3Zero(void)
{
    Vector3 result = { 0.0f, 0.0f, 0.0f };

    return result;
}


inline Vector3 Vector3One(void)
{
    Vector3 result = { 1.0f, 1.0f, 1.0f };

    return result;
}


inline Vector3 Vector3Add(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x + v2.x, v1.y + v2.y, v1.z + v2.z };

    return result;
}


inline Vector3 Vector3AddValue(Vector3 v, float add)
{
    Vector3 result = { v.x + add, v.y + add, v.z + add };

    return result;
}


inline Vector3 Vector3Subtract(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x - v2.x, v1.y - v2.y, v1.z - v2.z };

    return result;
}


inline Vector3 Vector3SubtractValue(Vector3 v, float sub)
{
    Vector3 result = { v.x - sub, v.y - sub, v.z - sub };

    return result;
}


inline Vector3 Vector3Scale(Vector3 v, float scalar)
{
    Vector3 result = { v.x*scalar, v.y*scalar, v.z*scalar };

    return result;
}


inline Vector3 Vector3Multiply(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x*v2.x, v1.y*v2.y, v1.z*v2.z };

    return result;
}


inline Vector3 Vector3CrossProduct(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.y*v2.z - v1.z*v2.y, v1.z*v2.x - v1.x*v2.z, v1.x*v2.y - v1.y*v2.x };

    return result;
}


inline Vector3 Vector3Perpendicular(Vector3 v)
{
    Vector3 result = { 0 };

    float min = (float) fabs(v.x);
    Vector3 cardinalAxis = {1.0f, 0.0f, 0.0f};

    if (fabsf(v.y) < min)
    {
        min = (float) fabs(v.y);
        Vector3 tmp = {0.0f, 1.0f, 0.0f};
        cardinalAxis = tmp;
    }

    if (fabsf(v.z) < min)
    {
        Vector3 tmp = {0.0f, 0.0f, 1.0f};
        cardinalAxis = tmp;
    }


    result.x = v.y*cardinalAxis.z - v.z*cardinalAxis.y;
    result.y = v.z*cardinalAxis.x - v.x*cardinalAxis.z;
    result.z = v.x*cardinalAxis.y - v.y*cardinalAxis.x;

    return result;
}


inline float Vector3Length(const Vector3 v)
{
    float result = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);

    return result;
}


inline float Vector3LengthSqr(const Vector3 v)
{
    float result = v.x*v.x + v.y*v.y + v.z*v.z;

    return result;
}


inline float Vector3DotProduct(Vector3 v1, Vector3 v2)
{
    float result = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);

    return result;
}


inline float Vector3Distance(Vector3 v1, Vector3 v2)
{
    float result = 0.0f;

    float dx = v2.x - v1.x;
    float dy = v2.y - v1.y;
    float dz = v2.z - v1.z;
    result = sqrtf(dx*dx + dy*dy + dz*dz);

    return result;
}


inline float Vector3DistanceSqr(Vector3 v1, Vector3 v2)
{
    float result = 0.0f;

    float dx = v2.x - v1.x;
    float dy = v2.y - v1.y;
    float dz = v2.z - v1.z;
    result = dx*dx + dy*dy + dz*dz;

    return result;
}


inline float Vector3Angle(Vector3 v1, Vector3 v2)
{
    float result = 0.0f;

    Vector3 cross = { v1.y*v2.z - v1.z*v2.y, v1.z*v2.x - v1.x*v2.z, v1.x*v2.y - v1.y*v2.x };
    float len = sqrtf(cross.x*cross.x + cross.y*cross.y + cross.z*cross.z);
    float dot = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);
    result = atan2f(len, dot);

    return result;
}


inline Vector3 Vector3Negate(Vector3 v)
{
    Vector3 result = { -v.x, -v.y, -v.z };

    return result;
}


inline Vector3 Vector3Divide(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x/v2.x, v1.y/v2.y, v1.z/v2.z };

    return result;
}


inline Vector3 Vector3Normalize(Vector3 v)
{
    Vector3 result = v;

    float length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length != 0.0f)
    {
        float ilength = 1.0f/length;

        result.x *= ilength;
        result.y *= ilength;
        result.z *= ilength;
    }

    return result;
}


inline Vector3 Vector3Project(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    float v1dv2 = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);
    float v2dv2 = (v2.x*v2.x + v2.y*v2.y + v2.z*v2.z);

    float mag = v1dv2/v2dv2;

    result.x = v2.x*mag;
    result.y = v2.y*mag;
    result.z = v2.z*mag;

    return result;
}


inline Vector3 Vector3Reject(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    float v1dv2 = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);
    float v2dv2 = (v2.x*v2.x + v2.y*v2.y + v2.z*v2.z);

    float mag = v1dv2/v2dv2;

    result.x = v1.x - (v2.x*mag);
    result.y = v1.y - (v2.y*mag);
    result.z = v1.z - (v2.z*mag);

    return result;
}




inline void Vector3OrthoNormalize(Vector3 *v1, Vector3 *v2)
{
    float length = 0.0f;
    float ilength = 0.0f;


    Vector3 v = *v1;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    v1->x *= ilength;
    v1->y *= ilength;
    v1->z *= ilength;


    Vector3 vn1 = { v1->y*v2->z - v1->z*v2->y, v1->z*v2->x - v1->x*v2->z, v1->x*v2->y - v1->y*v2->x };


    v = vn1;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    vn1.x *= ilength;
    vn1.y *= ilength;
    vn1.z *= ilength;


    Vector3 vn2 = { vn1.y*v1->z - vn1.z*v1->y, vn1.z*v1->x - vn1.x*v1->z, vn1.x*v1->y - vn1.y*v1->x };

    *v2 = vn2;
}


inline Vector3 Vector3Transform(Vector3 v, Matrix mat)
{
    Vector3 result = { 0 };

    float x = v.x;
    float y = v.y;
    float z = v.z;

    result.x = mat.m0*x + mat.m4*y + mat.m8*z + mat.m12;
    result.y = mat.m1*x + mat.m5*y + mat.m9*z + mat.m13;
    result.z = mat.m2*x + mat.m6*y + mat.m10*z + mat.m14;

    return result;
}


inline Vector3 Vector3RotateByQuaternion(Vector3 v, Quaternion q)
{
    Vector3 result = { 0 };

    result.x = v.x*(q.x*q.x + q.w*q.w - q.y*q.y - q.z*q.z) + v.y*(2*q.x*q.y - 2*q.w*q.z) + v.z*(2*q.x*q.z + 2*q.w*q.y);
    result.y = v.x*(2*q.w*q.z + 2*q.x*q.y) + v.y*(q.w*q.w - q.x*q.x + q.y*q.y - q.z*q.z) + v.z*(-2*q.w*q.x + 2*q.y*q.z);
    result.z = v.x*(-2*q.w*q.y + 2*q.x*q.z) + v.y*(2*q.w*q.x + 2*q.y*q.z)+ v.z*(q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z);

    return result;
}


inline Vector3 Vector3RotateByAxisAngle(Vector3 v, Vector3 axis, float angle)
{



    Vector3 result = v;


    float length = sqrtf(axis.x*axis.x + axis.y*axis.y + axis.z*axis.z);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f / length;
    axis.x *= ilength;
    axis.y *= ilength;
    axis.z *= ilength;

    angle /= 2.0f;
    float a = sinf(angle);
    float b = axis.x*a;
    float c = axis.y*a;
    float d = axis.z*a;
    a = cosf(angle);
    Vector3 w = { b, c, d };


    Vector3 wv = { w.y*v.z - w.z*v.y, w.z*v.x - w.x*v.z, w.x*v.y - w.y*v.x };


    Vector3 wwv = { w.y*wv.z - w.z*wv.y, w.z*wv.x - w.x*wv.z, w.x*wv.y - w.y*wv.x };


    a *= 2;
    wv.x *= a;
    wv.y *= a;
    wv.z *= a;


    wwv.x *= 2;
    wwv.y *= 2;
    wwv.z *= 2;

    result.x += wv.x;
    result.y += wv.y;
    result.z += wv.z;

    result.x += wwv.x;
    result.y += wwv.y;
    result.z += wwv.z;

    return result;
}


inline Vector3 Vector3Lerp(Vector3 v1, Vector3 v2, float amount)
{
    Vector3 result = { 0 };

    result.x = v1.x + amount*(v2.x - v1.x);
    result.y = v1.y + amount*(v2.y - v1.y);
    result.z = v1.z + amount*(v2.z - v1.z);

    return result;
}


inline Vector3 Vector3Reflect(Vector3 v, Vector3 normal)
{
    Vector3 result = { 0 };





    float dotProduct = (v.x*normal.x + v.y*normal.y + v.z*normal.z);

    result.x = v.x - (2.0f*normal.x)*dotProduct;
    result.y = v.y - (2.0f*normal.y)*dotProduct;
    result.z = v.z - (2.0f*normal.z)*dotProduct;

    return result;
}


inline Vector3 Vector3Min(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    result.x = fminf(v1.x, v2.x);
    result.y = fminf(v1.y, v2.y);
    result.z = fminf(v1.z, v2.z);

    return result;
}


inline Vector3 Vector3Max(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    result.x = fmaxf(v1.x, v2.x);
    result.y = fmaxf(v1.y, v2.y);
    result.z = fmaxf(v1.z, v2.z);

    return result;
}



inline Vector3 Vector3Barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c)
{
    Vector3 result = { 0 };

    Vector3 v0 = { b.x - a.x, b.y - a.y, b.z - a.z };
    Vector3 v1 = { c.x - a.x, c.y - a.y, c.z - a.z };
    Vector3 v2 = { p.x - a.x, p.y - a.y, p.z - a.z };
    float d00 = (v0.x*v0.x + v0.y*v0.y + v0.z*v0.z);
    float d01 = (v0.x*v1.x + v0.y*v1.y + v0.z*v1.z);
    float d11 = (v1.x*v1.x + v1.y*v1.y + v1.z*v1.z);
    float d20 = (v2.x*v0.x + v2.y*v0.y + v2.z*v0.z);
    float d21 = (v2.x*v1.x + v2.y*v1.y + v2.z*v1.z);

    float denom = d00*d11 - d01*d01;

    result.y = (d11*d20 - d01*d21)/denom;
    result.z = (d00*d21 - d01*d20)/denom;
    result.x = 1.0f - (result.z + result.y);

    return result;
}



inline Vector3 Vector3Unproject(Vector3 source, Matrix projection, Matrix view)
{
    Vector3 result = { 0 };


    Matrix matViewProj = {
        view.m0*projection.m0 + view.m1*projection.m4 + view.m2*projection.m8 + view.m3*projection.m12,
        view.m0*projection.m1 + view.m1*projection.m5 + view.m2*projection.m9 + view.m3*projection.m13,
        view.m0*projection.m2 + view.m1*projection.m6 + view.m2*projection.m10 + view.m3*projection.m14,
        view.m0*projection.m3 + view.m1*projection.m7 + view.m2*projection.m11 + view.m3*projection.m15,
        view.m4*projection.m0 + view.m5*projection.m4 + view.m6*projection.m8 + view.m7*projection.m12,
        view.m4*projection.m1 + view.m5*projection.m5 + view.m6*projection.m9 + view.m7*projection.m13,
        view.m4*projection.m2 + view.m5*projection.m6 + view.m6*projection.m10 + view.m7*projection.m14,
        view.m4*projection.m3 + view.m5*projection.m7 + view.m6*projection.m11 + view.m7*projection.m15,
        view.m8*projection.m0 + view.m9*projection.m4 + view.m10*projection.m8 + view.m11*projection.m12,
        view.m8*projection.m1 + view.m9*projection.m5 + view.m10*projection.m9 + view.m11*projection.m13,
        view.m8*projection.m2 + view.m9*projection.m6 + view.m10*projection.m10 + view.m11*projection.m14,
        view.m8*projection.m3 + view.m9*projection.m7 + view.m10*projection.m11 + view.m11*projection.m15,
        view.m12*projection.m0 + view.m13*projection.m4 + view.m14*projection.m8 + view.m15*projection.m12,
        view.m12*projection.m1 + view.m13*projection.m5 + view.m14*projection.m9 + view.m15*projection.m13,
        view.m12*projection.m2 + view.m13*projection.m6 + view.m14*projection.m10 + view.m15*projection.m14,
        view.m12*projection.m3 + view.m13*projection.m7 + view.m14*projection.m11 + view.m15*projection.m15 };



    float a00 = matViewProj.m0, a01 = matViewProj.m1, a02 = matViewProj.m2, a03 = matViewProj.m3;
    float a10 = matViewProj.m4, a11 = matViewProj.m5, a12 = matViewProj.m6, a13 = matViewProj.m7;
    float a20 = matViewProj.m8, a21 = matViewProj.m9, a22 = matViewProj.m10, a23 = matViewProj.m11;
    float a30 = matViewProj.m12, a31 = matViewProj.m13, a32 = matViewProj.m14, a33 = matViewProj.m15;

    float b00 = a00*a11 - a01*a10;
    float b01 = a00*a12 - a02*a10;
    float b02 = a00*a13 - a03*a10;
    float b03 = a01*a12 - a02*a11;
    float b04 = a01*a13 - a03*a11;
    float b05 = a02*a13 - a03*a12;
    float b06 = a20*a31 - a21*a30;
    float b07 = a20*a32 - a22*a30;
    float b08 = a20*a33 - a23*a30;
    float b09 = a21*a32 - a22*a31;
    float b10 = a21*a33 - a23*a31;
    float b11 = a22*a33 - a23*a32;


    float invDet = 1.0f/(b00*b11 - b01*b10 + b02*b09 + b03*b08 - b04*b07 + b05*b06);

    Matrix matViewProjInv = {
        (a11*b11 - a12*b10 + a13*b09)*invDet,
        (-a01*b11 + a02*b10 - a03*b09)*invDet,
        (a31*b05 - a32*b04 + a33*b03)*invDet,
        (-a21*b05 + a22*b04 - a23*b03)*invDet,
        (-a10*b11 + a12*b08 - a13*b07)*invDet,
        (a00*b11 - a02*b08 + a03*b07)*invDet,
        (-a30*b05 + a32*b02 - a33*b01)*invDet,
        (a20*b05 - a22*b02 + a23*b01)*invDet,
        (a10*b10 - a11*b08 + a13*b06)*invDet,
        (-a00*b10 + a01*b08 - a03*b06)*invDet,
        (a30*b04 - a31*b02 + a33*b00)*invDet,
        (-a20*b04 + a21*b02 - a23*b00)*invDet,
        (-a10*b09 + a11*b07 - a12*b06)*invDet,
        (a00*b09 - a01*b07 + a02*b06)*invDet,
        (-a30*b03 + a31*b01 - a32*b00)*invDet,
        (a20*b03 - a21*b01 + a22*b00)*invDet };


    Quaternion quat = { source.x, source.y, source.z, 1.0f };


    Quaternion qtransformed = {
        matViewProjInv.m0*quat.x + matViewProjInv.m4*quat.y + matViewProjInv.m8*quat.z + matViewProjInv.m12*quat.w,
        matViewProjInv.m1*quat.x + matViewProjInv.m5*quat.y + matViewProjInv.m9*quat.z + matViewProjInv.m13*quat.w,
        matViewProjInv.m2*quat.x + matViewProjInv.m6*quat.y + matViewProjInv.m10*quat.z + matViewProjInv.m14*quat.w,
        matViewProjInv.m3*quat.x + matViewProjInv.m7*quat.y + matViewProjInv.m11*quat.z + matViewProjInv.m15*quat.w };


    result.x = qtransformed.x/qtransformed.w;
    result.y = qtransformed.y/qtransformed.w;
    result.z = qtransformed.z/qtransformed.w;

    return result;
}


inline float3 Vector3ToFloatV(Vector3 v)
{
    float3 buffer = { 0 };

    buffer.v[0] = v.x;
    buffer.v[1] = v.y;
    buffer.v[2] = v.z;

    return buffer;
}


inline Vector3 Vector3Invert(Vector3 v)
{
    Vector3 result = { 1.0f/v.x, 1.0f/v.y, 1.0f/v.z };

    return result;
}



inline Vector3 Vector3Clamp(Vector3 v, Vector3 min, Vector3 max)
{
    Vector3 result = { 0 };

    result.x = fminf(max.x, fmaxf(min.x, v.x));
    result.y = fminf(max.y, fmaxf(min.y, v.y));
    result.z = fminf(max.z, fmaxf(min.z, v.z));

    return result;
}


inline Vector3 Vector3ClampValue(Vector3 v, float min, float max)
{
    Vector3 result = v;

    float length = (v.x*v.x) + (v.y*v.y) + (v.z*v.z);
    if (length > 0.0f)
    {
        length = sqrtf(length);

        if (length < min)
        {
            float scale = min/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
            result.z = v.z*scale;
        }
        else if (length > max)
        {
            float scale = max/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
            result.z = v.z*scale;
        }
    }

    return result;
}


inline int Vector3Equals(Vector3 p, Vector3 q)
{




    int result = ((fabsf(p.x - q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                 ((fabsf(p.y - q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))) &&
                 ((fabsf(p.z - q.z)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z)))));

    return result;
}






inline Vector3 Vector3Refract(Vector3 v, Vector3 n, float r)
{
    Vector3 result = { 0 };

    float dot = v.x*n.x + v.y*n.y + v.z*n.z;
    float d = 1.0f - r*r*(1.0f - dot*dot);

    if (d >= 0.0f)
    {
        d = sqrtf(d);
        v.x = r*v.x - (r*dot + d)*n.x;
        v.y = r*v.y - (r*dot + d)*n.y;
        v.z = r*v.z - (r*dot + d)*n.z;

        result = v;
    }

    return result;
}






inline float MatrixDeterminant(Matrix mat)
{
    float result = 0.0f;


    float a00 = mat.m0, a01 = mat.m1, a02 = mat.m2, a03 = mat.m3;
    float a10 = mat.m4, a11 = mat.m5, a12 = mat.m6, a13 = mat.m7;
    float a20 = mat.m8, a21 = mat.m9, a22 = mat.m10, a23 = mat.m11;
    float a30 = mat.m12, a31 = mat.m13, a32 = mat.m14, a33 = mat.m15;

    result = a30*a21*a12*a03 - a20*a31*a12*a03 - a30*a11*a22*a03 + a10*a31*a22*a03 +
             a20*a11*a32*a03 - a10*a21*a32*a03 - a30*a21*a02*a13 + a20*a31*a02*a13 +
             a30*a01*a22*a13 - a00*a31*a22*a13 - a20*a01*a32*a13 + a00*a21*a32*a13 +
             a30*a11*a02*a23 - a10*a31*a02*a23 - a30*a01*a12*a23 + a00*a31*a12*a23 +
             a10*a01*a32*a23 - a00*a11*a32*a23 - a20*a11*a02*a33 + a10*a21*a02*a33 +
             a20*a01*a12*a33 - a00*a21*a12*a33 - a10*a01*a22*a33 + a00*a11*a22*a33;

    return result;
}


inline float MatrixTrace(Matrix mat)
{
    float result = (mat.m0 + mat.m5 + mat.m10 + mat.m15);

    return result;
}


inline Matrix MatrixTranspose(Matrix mat)
{
    Matrix result = { 0 };

    result.m0 = mat.m0;
    result.m1 = mat.m4;
    result.m2 = mat.m8;
    result.m3 = mat.m12;
    result.m4 = mat.m1;
    result.m5 = mat.m5;
    result.m6 = mat.m9;
    result.m7 = mat.m13;
    result.m8 = mat.m2;
    result.m9 = mat.m6;
    result.m10 = mat.m10;
    result.m11 = mat.m14;
    result.m12 = mat.m3;
    result.m13 = mat.m7;
    result.m14 = mat.m11;
    result.m15 = mat.m15;

    return result;
}


inline Matrix MatrixInvert(Matrix mat)
{
    Matrix result = { 0 };


    float a00 = mat.m0, a01 = mat.m1, a02 = mat.m2, a03 = mat.m3;
    float a10 = mat.m4, a11 = mat.m5, a12 = mat.m6, a13 = mat.m7;
    float a20 = mat.m8, a21 = mat.m9, a22 = mat.m10, a23 = mat.m11;
    float a30 = mat.m12, a31 = mat.m13, a32 = mat.m14, a33 = mat.m15;

    float b00 = a00*a11 - a01*a10;
    float b01 = a00*a12 - a02*a10;
    float b02 = a00*a13 - a03*a10;
    float b03 = a01*a12 - a02*a11;
    float b04 = a01*a13 - a03*a11;
    float b05 = a02*a13 - a03*a12;
    float b06 = a20*a31 - a21*a30;
    float b07 = a20*a32 - a22*a30;
    float b08 = a20*a33 - a23*a30;
    float b09 = a21*a32 - a22*a31;
    float b10 = a21*a33 - a23*a31;
    float b11 = a22*a33 - a23*a32;


    float invDet = 1.0f/(b00*b11 - b01*b10 + b02*b09 + b03*b08 - b04*b07 + b05*b06);

    result.m0 = (a11*b11 - a12*b10 + a13*b09)*invDet;
    result.m1 = (-a01*b11 + a02*b10 - a03*b09)*invDet;
    result.m2 = (a31*b05 - a32*b04 + a33*b03)*invDet;
    result.m3 = (-a21*b05 + a22*b04 - a23*b03)*invDet;
    result.m4 = (-a10*b11 + a12*b08 - a13*b07)*invDet;
    result.m5 = (a00*b11 - a02*b08 + a03*b07)*invDet;
    result.m6 = (-a30*b05 + a32*b02 - a33*b01)*invDet;
    result.m7 = (a20*b05 - a22*b02 + a23*b01)*invDet;
    result.m8 = (a10*b10 - a11*b08 + a13*b06)*invDet;
    result.m9 = (-a00*b10 + a01*b08 - a03*b06)*invDet;
    result.m10 = (a30*b04 - a31*b02 + a33*b00)*invDet;
    result.m11 = (-a20*b04 + a21*b02 - a23*b00)*invDet;
    result.m12 = (-a10*b09 + a11*b07 - a12*b06)*invDet;
    result.m13 = (a00*b09 - a01*b07 + a02*b06)*invDet;
    result.m14 = (-a30*b03 + a31*b01 - a32*b00)*invDet;
    result.m15 = (a20*b03 - a21*b01 + a22*b00)*invDet;

    return result;
}


inline Matrix MatrixIdentity(void)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}


inline Matrix MatrixAdd(Matrix left, Matrix right)
{
    Matrix result = { 0 };

    result.m0 = left.m0 + right.m0;
    result.m1 = left.m1 + right.m1;
    result.m2 = left.m2 + right.m2;
    result.m3 = left.m3 + right.m3;
    result.m4 = left.m4 + right.m4;
    result.m5 = left.m5 + right.m5;
    result.m6 = left.m6 + right.m6;
    result.m7 = left.m7 + right.m7;
    result.m8 = left.m8 + right.m8;
    result.m9 = left.m9 + right.m9;
    result.m10 = left.m10 + right.m10;
    result.m11 = left.m11 + right.m11;
    result.m12 = left.m12 + right.m12;
    result.m13 = left.m13 + right.m13;
    result.m14 = left.m14 + right.m14;
    result.m15 = left.m15 + right.m15;

    return result;
}


inline Matrix MatrixSubtract(Matrix left, Matrix right)
{
    Matrix result = { 0 };

    result.m0 = left.m0 - right.m0;
    result.m1 = left.m1 - right.m1;
    result.m2 = left.m2 - right.m2;
    result.m3 = left.m3 - right.m3;
    result.m4 = left.m4 - right.m4;
    result.m5 = left.m5 - right.m5;
    result.m6 = left.m6 - right.m6;
    result.m7 = left.m7 - right.m7;
    result.m8 = left.m8 - right.m8;
    result.m9 = left.m9 - right.m9;
    result.m10 = left.m10 - right.m10;
    result.m11 = left.m11 - right.m11;
    result.m12 = left.m12 - right.m12;
    result.m13 = left.m13 - right.m13;
    result.m14 = left.m14 - right.m14;
    result.m15 = left.m15 - right.m15;

    return result;
}



inline Matrix MatrixMultiply(Matrix left, Matrix right)
{
    Matrix result = { 0 };

    result.m0 = left.m0*right.m0 + left.m1*right.m4 + left.m2*right.m8 + left.m3*right.m12;
    result.m1 = left.m0*right.m1 + left.m1*right.m5 + left.m2*right.m9 + left.m3*right.m13;
    result.m2 = left.m0*right.m2 + left.m1*right.m6 + left.m2*right.m10 + left.m3*right.m14;
    result.m3 = left.m0*right.m3 + left.m1*right.m7 + left.m2*right.m11 + left.m3*right.m15;
    result.m4 = left.m4*right.m0 + left.m5*right.m4 + left.m6*right.m8 + left.m7*right.m12;
    result.m5 = left.m4*right.m1 + left.m5*right.m5 + left.m6*right.m9 + left.m7*right.m13;
    result.m6 = left.m4*right.m2 + left.m5*right.m6 + left.m6*right.m10 + left.m7*right.m14;
    result.m7 = left.m4*right.m3 + left.m5*right.m7 + left.m6*right.m11 + left.m7*right.m15;
    result.m8 = left.m8*right.m0 + left.m9*right.m4 + left.m10*right.m8 + left.m11*right.m12;
    result.m9 = left.m8*right.m1 + left.m9*right.m5 + left.m10*right.m9 + left.m11*right.m13;
    result.m10 = left.m8*right.m2 + left.m9*right.m6 + left.m10*right.m10 + left.m11*right.m14;
    result.m11 = left.m8*right.m3 + left.m9*right.m7 + left.m10*right.m11 + left.m11*right.m15;
    result.m12 = left.m12*right.m0 + left.m13*right.m4 + left.m14*right.m8 + left.m15*right.m12;
    result.m13 = left.m12*right.m1 + left.m13*right.m5 + left.m14*right.m9 + left.m15*right.m13;
    result.m14 = left.m12*right.m2 + left.m13*right.m6 + left.m14*right.m10 + left.m15*right.m14;
    result.m15 = left.m12*right.m3 + left.m13*right.m7 + left.m14*right.m11 + left.m15*right.m15;

    return result;
}


inline Matrix MatrixTranslate(float x, float y, float z)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, x,
                      0.0f, 1.0f, 0.0f, y,
                      0.0f, 0.0f, 1.0f, z,
                      0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}



inline Matrix MatrixRotate(Vector3 axis, float angle)
{
    Matrix result = { 0 };

    float x = axis.x, y = axis.y, z = axis.z;

    float lengthSquared = x*x + y*y + z*z;

    if ((lengthSquared != 1.0f) && (lengthSquared != 0.0f))
    {
        float ilength = 1.0f/sqrtf(lengthSquared);
        x *= ilength;
        y *= ilength;
        z *= ilength;
    }

    float sinres = sinf(angle);
    float cosres = cosf(angle);
    float t = 1.0f - cosres;

    result.m0 = x*x*t + cosres;
    result.m1 = y*x*t + z*sinres;
    result.m2 = z*x*t - y*sinres;
    result.m3 = 0.0f;

    result.m4 = x*y*t - z*sinres;
    result.m5 = y*y*t + cosres;
    result.m6 = z*y*t + x*sinres;
    result.m7 = 0.0f;

    result.m8 = x*z*t + y*sinres;
    result.m9 = y*z*t - x*sinres;
    result.m10 = z*z*t + cosres;
    result.m11 = 0.0f;

    result.m12 = 0.0f;
    result.m13 = 0.0f;
    result.m14 = 0.0f;
    result.m15 = 1.0f;

    return result;
}



inline Matrix MatrixRotateX(float angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.m5 = cosres;
    result.m6 = sinres;
    result.m9 = -sinres;
    result.m10 = cosres;

    return result;
}



inline Matrix MatrixRotateY(float angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.m0 = cosres;
    result.m2 = -sinres;
    result.m8 = sinres;
    result.m10 = cosres;

    return result;
}



inline Matrix MatrixRotateZ(float angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.m0 = cosres;
    result.m1 = sinres;
    result.m4 = -sinres;
    result.m5 = cosres;

    return result;
}




inline Matrix MatrixRotateXYZ(Vector3 angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosz = cosf(-angle.z);
    float sinz = sinf(-angle.z);
    float cosy = cosf(-angle.y);
    float siny = sinf(-angle.y);
    float cosx = cosf(-angle.x);
    float sinx = sinf(-angle.x);

    result.m0 = cosz*cosy;
    result.m1 = (cosz*siny*sinx) - (sinz*cosx);
    result.m2 = (cosz*siny*cosx) + (sinz*sinx);

    result.m4 = sinz*cosy;
    result.m5 = (sinz*siny*sinx) + (cosz*cosx);
    result.m6 = (sinz*siny*cosx) - (cosz*sinx);

    result.m8 = -siny;
    result.m9 = cosy*sinx;
    result.m10= cosy*cosx;

    return result;
}



inline Matrix MatrixRotateZYX(Vector3 angle)
{
    Matrix result = { 0 };

    float cz = cosf(angle.z);
    float sz = sinf(angle.z);
    float cy = cosf(angle.y);
    float sy = sinf(angle.y);
    float cx = cosf(angle.x);
    float sx = sinf(angle.x);

    result.m0 = cz*cy;
    result.m4 = cz*sy*sx - cx*sz;
    result.m8 = sz*sx + cz*cx*sy;
    result.m12 = 0;

    result.m1 = cy*sz;
    result.m5 = cz*cx + sz*sy*sx;
    result.m9 = cx*sz*sy - cz*sx;
    result.m13 = 0;

    result.m2 = -sy;
    result.m6 = cy*sx;
    result.m10 = cy*cx;
    result.m14 = 0;

    result.m3 = 0;
    result.m7 = 0;
    result.m11 = 0;
    result.m15 = 1;

    return result;
}


inline Matrix MatrixScale(float x, float y, float z)
{
    Matrix result = { x, 0.0f, 0.0f, 0.0f,
                      0.0f, y, 0.0f, 0.0f,
                      0.0f, 0.0f, z, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}


inline Matrix MatrixFrustum(double left, double right, double bottom, double top, double near, double far)
{
    Matrix result = { 0 };

    float rl = (float)(right - left);
    float tb = (float)(top - bottom);
    float fn = (float)(far - near);

    result.m0 = ((float)near*2.0f)/rl;
    result.m1 = 0.0f;
    result.m2 = 0.0f;
    result.m3 = 0.0f;

    result.m4 = 0.0f;
    result.m5 = ((float)near*2.0f)/tb;
    result.m6 = 0.0f;
    result.m7 = 0.0f;

    result.m8 = ((float)right + (float)left)/rl;
    result.m9 = ((float)top + (float)bottom)/tb;
    result.m10 = -((float)far + (float)near)/fn;
    result.m11 = -1.0f;

    result.m12 = 0.0f;
    result.m13 = 0.0f;
    result.m14 = -((float)far*(float)near*2.0f)/fn;
    result.m15 = 0.0f;

    return result;
}



inline Matrix MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
{
    Matrix result = { 0 };

    double top = nearPlane*tan(fovY*0.5);
    double bottom = -top;
    double right = top*aspect;
    double left = -right;


    float rl = (float)(right - left);
    float tb = (float)(top - bottom);
    float fn = (float)(farPlane - nearPlane);

    result.m0 = ((float)nearPlane*2.0f)/rl;
    result.m5 = ((float)nearPlane*2.0f)/tb;
    result.m8 = ((float)right + (float)left)/rl;
    result.m9 = ((float)top + (float)bottom)/tb;
    result.m10 = -((float)farPlane + (float)nearPlane)/fn;
    result.m11 = -1.0f;
    result.m14 = -((float)farPlane*(float)nearPlane*2.0f)/fn;

    return result;
}


inline Matrix MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
{
    Matrix result = { 0 };

    float rl = (float)(right - left);
    float tb = (float)(top - bottom);
    float fn = (float)(farPlane - nearPlane);

    result.m0 = 2.0f/rl;
    result.m1 = 0.0f;
    result.m2 = 0.0f;
    result.m3 = 0.0f;
    result.m4 = 0.0f;
    result.m5 = 2.0f/tb;
    result.m6 = 0.0f;
    result.m7 = 0.0f;
    result.m8 = 0.0f;
    result.m9 = 0.0f;
    result.m10 = -2.0f/fn;
    result.m11 = 0.0f;
    result.m12 = -((float)left + (float)right)/rl;
    result.m13 = -((float)top + (float)bottom)/tb;
    result.m14 = -((float)farPlane + (float)nearPlane)/fn;
    result.m15 = 1.0f;

    return result;
}


inline Matrix MatrixLookAt(Vector3 eye, Vector3 target, Vector3 up)
{
    Matrix result = { 0 };

    float length = 0.0f;
    float ilength = 0.0f;


    Vector3 vz = { eye.x - target.x, eye.y - target.y, eye.z - target.z };


    Vector3 v = vz;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    vz.x *= ilength;
    vz.y *= ilength;
    vz.z *= ilength;


    Vector3 vx = { up.y*vz.z - up.z*vz.y, up.z*vz.x - up.x*vz.z, up.x*vz.y - up.y*vz.x };


    v = vx;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    vx.x *= ilength;
    vx.y *= ilength;
    vx.z *= ilength;


    Vector3 vy = { vz.y*vx.z - vz.z*vx.y, vz.z*vx.x - vz.x*vx.z, vz.x*vx.y - vz.y*vx.x };

    result.m0 = vx.x;
    result.m1 = vy.x;
    result.m2 = vz.x;
    result.m3 = 0.0f;
    result.m4 = vx.y;
    result.m5 = vy.y;
    result.m6 = vz.y;
    result.m7 = 0.0f;
    result.m8 = vx.z;
    result.m9 = vy.z;
    result.m10 = vz.z;
    result.m11 = 0.0f;
    result.m12 = -(vx.x*eye.x + vx.y*eye.y + vx.z*eye.z);
    result.m13 = -(vy.x*eye.x + vy.y*eye.y + vy.z*eye.z);
    result.m14 = -(vz.x*eye.x + vz.y*eye.y + vz.z*eye.z);
    result.m15 = 1.0f;

    return result;
}


inline float16 MatrixToFloatV(Matrix mat)
{
    float16 result = { 0 };

    result.v[0] = mat.m0;
    result.v[1] = mat.m1;
    result.v[2] = mat.m2;
    result.v[3] = mat.m3;
    result.v[4] = mat.m4;
    result.v[5] = mat.m5;
    result.v[6] = mat.m6;
    result.v[7] = mat.m7;
    result.v[8] = mat.m8;
    result.v[9] = mat.m9;
    result.v[10] = mat.m10;
    result.v[11] = mat.m11;
    result.v[12] = mat.m12;
    result.v[13] = mat.m13;
    result.v[14] = mat.m14;
    result.v[15] = mat.m15;

    return result;
}






inline Quaternion QuaternionAdd(Quaternion q1, Quaternion q2)
{
    Quaternion result = {q1.x + q2.x, q1.y + q2.y, q1.z + q2.z, q1.w + q2.w};

    return result;
}


inline Quaternion QuaternionAddValue(Quaternion q, float add)
{
    Quaternion result = {q.x + add, q.y + add, q.z + add, q.w + add};

    return result;
}


inline Quaternion QuaternionSubtract(Quaternion q1, Quaternion q2)
{
    Quaternion result = {q1.x - q2.x, q1.y - q2.y, q1.z - q2.z, q1.w - q2.w};

    return result;
}


inline Quaternion QuaternionSubtractValue(Quaternion q, float sub)
{
    Quaternion result = {q.x - sub, q.y - sub, q.z - sub, q.w - sub};

    return result;
}


inline Quaternion QuaternionIdentity(void)
{
    Quaternion result = { 0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}


inline float QuaternionLength(Quaternion q)
{
    float result = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);

    return result;
}


inline Quaternion QuaternionNormalize(Quaternion q)
{
    Quaternion result = { 0 };

    float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f/length;

    result.x = q.x*ilength;
    result.y = q.y*ilength;
    result.z = q.z*ilength;
    result.w = q.w*ilength;

    return result;
}


inline Quaternion QuaternionInvert(Quaternion q)
{
    Quaternion result = q;

    float lengthSq = q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w;

    if (lengthSq != 0.0f)
    {
        float invLength = 1.0f/lengthSq;

        result.x *= -invLength;
        result.y *= -invLength;
        result.z *= -invLength;
        result.w *= invLength;
    }

    return result;
}


inline Quaternion QuaternionMultiply(Quaternion q1, Quaternion q2)
{
    Quaternion result = { 0 };

    float qax = q1.x, qay = q1.y, qaz = q1.z, qaw = q1.w;
    float qbx = q2.x, qby = q2.y, qbz = q2.z, qbw = q2.w;

    result.x = qax*qbw + qaw*qbx + qay*qbz - qaz*qby;
    result.y = qay*qbw + qaw*qby + qaz*qbx - qax*qbz;
    result.z = qaz*qbw + qaw*qbz + qax*qby - qay*qbx;
    result.w = qaw*qbw - qax*qbx - qay*qby - qaz*qbz;

    return result;
}


inline Quaternion QuaternionScale(Quaternion q, float mul)
{
    Quaternion result = { 0 };

    result.x = q.x*mul;
    result.y = q.y*mul;
    result.z = q.z*mul;
    result.w = q.w*mul;

    return result;
}


inline Quaternion QuaternionDivide(Quaternion q1, Quaternion q2)
{
    Quaternion result = { q1.x/q2.x, q1.y/q2.y, q1.z/q2.z, q1.w/q2.w };

    return result;
}


inline Quaternion QuaternionLerp(Quaternion q1, Quaternion q2, float amount)
{
    Quaternion result = { 0 };

    result.x = q1.x + amount*(q2.x - q1.x);
    result.y = q1.y + amount*(q2.y - q1.y);
    result.z = q1.z + amount*(q2.z - q1.z);
    result.w = q1.w + amount*(q2.w - q1.w);

    return result;
}


inline Quaternion QuaternionNlerp(Quaternion q1, Quaternion q2, float amount)
{
    Quaternion result = { 0 };


    result.x = q1.x + amount*(q2.x - q1.x);
    result.y = q1.y + amount*(q2.y - q1.y);
    result.z = q1.z + amount*(q2.z - q1.z);
    result.w = q1.w + amount*(q2.w - q1.w);


    Quaternion q = result;
    float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f/length;

    result.x = q.x*ilength;
    result.y = q.y*ilength;
    result.z = q.z*ilength;
    result.w = q.w*ilength;

    return result;
}


inline Quaternion QuaternionSlerp(Quaternion q1, Quaternion q2, float amount)
{
    Quaternion result = { 0 };





    float cosHalfTheta = q1.x*q2.x + q1.y*q2.y + q1.z*q2.z + q1.w*q2.w;

    if (cosHalfTheta < 0)
    {
        q2.x = -q2.x; q2.y = -q2.y; q2.z = -q2.z; q2.w = -q2.w;
        cosHalfTheta = -cosHalfTheta;
    }

    if (fabsf(cosHalfTheta) >= 1.0f) result = q1;
    else if (cosHalfTheta > 0.95f) result = QuaternionNlerp(q1, q2, amount);
    else
    {
        float halfTheta = acosf(cosHalfTheta);
        float sinHalfTheta = sqrtf(1.0f - cosHalfTheta*cosHalfTheta);

        if (fabsf(sinHalfTheta) < 0.000001f)
        {
            result.x = (q1.x*0.5f + q2.x*0.5f);
            result.y = (q1.y*0.5f + q2.y*0.5f);
            result.z = (q1.z*0.5f + q2.z*0.5f);
            result.w = (q1.w*0.5f + q2.w*0.5f);
        }
        else
        {
            float ratioA = sinf((1 - amount)*halfTheta)/sinHalfTheta;
            float ratioB = sinf(amount*halfTheta)/sinHalfTheta;

            result.x = (q1.x*ratioA + q2.x*ratioB);
            result.y = (q1.y*ratioA + q2.y*ratioB);
            result.z = (q1.z*ratioA + q2.z*ratioB);
            result.w = (q1.w*ratioA + q2.w*ratioB);
        }
    }

    return result;
}


inline Quaternion QuaternionFromVector3ToVector3(Vector3 from, Vector3 to)
{
    Quaternion result = { 0 };

    float cos2Theta = (from.x*to.x + from.y*to.y + from.z*to.z);
    Vector3 cross = { from.y*to.z - from.z*to.y, from.z*to.x - from.x*to.z, from.x*to.y - from.y*to.x };

    result.x = cross.x;
    result.y = cross.y;
    result.z = cross.z;
    result.w = 1.0f + cos2Theta;



    Quaternion q = result;
    float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f/length;

    result.x = q.x*ilength;
    result.y = q.y*ilength;
    result.z = q.z*ilength;
    result.w = q.w*ilength;

    return result;
}


inline Quaternion QuaternionFromMatrix(Matrix mat)
{
    Quaternion result = { 0 };

    float fourWSquaredMinus1 = mat.m0 + mat.m5 + mat.m10;
    float fourXSquaredMinus1 = mat.m0 - mat.m5 - mat.m10;
    float fourYSquaredMinus1 = mat.m5 - mat.m0 - mat.m10;
    float fourZSquaredMinus1 = mat.m10 - mat.m0 - mat.m5;

    int biggestIndex = 0;
    float fourBiggestSquaredMinus1 = fourWSquaredMinus1;
    if (fourXSquaredMinus1 > fourBiggestSquaredMinus1)
    {
        fourBiggestSquaredMinus1 = fourXSquaredMinus1;
        biggestIndex = 1;
    }

    if (fourYSquaredMinus1 > fourBiggestSquaredMinus1)
    {
        fourBiggestSquaredMinus1 = fourYSquaredMinus1;
        biggestIndex = 2;
    }

    if (fourZSquaredMinus1 > fourBiggestSquaredMinus1)
    {
        fourBiggestSquaredMinus1 = fourZSquaredMinus1;
        biggestIndex = 3;
    }

    float biggestVal = sqrtf(fourBiggestSquaredMinus1 + 1.0f)*0.5f;
    float mult = 0.25f / biggestVal;

    switch (biggestIndex)
    {
        case 0:
            result.w = biggestVal;
            result.x = (mat.m6 - mat.m9)*mult;
            result.y = (mat.m8 - mat.m2)*mult;
            result.z = (mat.m1 - mat.m4)*mult;
            break;
        case 1:
            result.x = biggestVal;
            result.w = (mat.m6 - mat.m9)*mult;
            result.y = (mat.m1 + mat.m4)*mult;
            result.z = (mat.m8 + mat.m2)*mult;
            break;
        case 2:
            result.y = biggestVal;
            result.w = (mat.m8 - mat.m2)*mult;
            result.x = (mat.m1 + mat.m4)*mult;
            result.z = (mat.m6 + mat.m9)*mult;
            break;
        case 3:
            result.z = biggestVal;
            result.w = (mat.m1 - mat.m4)*mult;
            result.x = (mat.m8 + mat.m2)*mult;
            result.y = (mat.m6 + mat.m9)*mult;
            break;
    }

    return result;
}


inline Matrix QuaternionToMatrix(Quaternion q)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float a2 = q.x*q.x;
    float b2 = q.y*q.y;
    float c2 = q.z*q.z;
    float ac = q.x*q.z;
    float ab = q.x*q.y;
    float bc = q.y*q.z;
    float ad = q.w*q.x;
    float bd = q.w*q.y;
    float cd = q.w*q.z;

    result.m0 = 1 - 2*(b2 + c2);
    result.m1 = 2*(ab + cd);
    result.m2 = 2*(ac - bd);

    result.m4 = 2*(ab - cd);
    result.m5 = 1 - 2*(a2 + c2);
    result.m6 = 2*(bc + ad);

    result.m8 = 2*(ac + bd);
    result.m9 = 2*(bc - ad);
    result.m10 = 1 - 2*(a2 + b2);

    return result;
}



inline Quaternion QuaternionFromAxisAngle(Vector3 axis, float angle)
{
    Quaternion result = { 0.0f, 0.0f, 0.0f, 1.0f };

    float axisLength = sqrtf(axis.x*axis.x + axis.y*axis.y + axis.z*axis.z);

    if (axisLength != 0.0f)
    {
        angle *= 0.5f;

        float length = 0.0f;
        float ilength = 0.0f;


        Vector3 v = axis;
        length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
        if (length == 0.0f) length = 1.0f;
        ilength = 1.0f/length;
        axis.x *= ilength;
        axis.y *= ilength;
        axis.z *= ilength;

        float sinres = sinf(angle);
        float cosres = cosf(angle);

        result.x = axis.x*sinres;
        result.y = axis.y*sinres;
        result.z = axis.z*sinres;
        result.w = cosres;


        Quaternion q = result;
        length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
        if (length == 0.0f) length = 1.0f;
        ilength = 1.0f/length;
        result.x = q.x*ilength;
        result.y = q.y*ilength;
        result.z = q.z*ilength;
        result.w = q.w*ilength;
    }

    return result;
}


inline void QuaternionToAxisAngle(Quaternion q, Vector3 *outAxis, float *outAngle)
{
    if (fabsf(q.w) > 1.0f)
    {

        float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
        if (length == 0.0f) length = 1.0f;
        float ilength = 1.0f/length;

        q.x = q.x*ilength;
        q.y = q.y*ilength;
        q.z = q.z*ilength;
        q.w = q.w*ilength;
    }

    Vector3 resAxis = { 0.0f, 0.0f, 0.0f };
    float resAngle = 2.0f*acosf(q.w);
    float den = sqrtf(1.0f - q.w*q.w);

    if (den > 0.000001f)
    {
        resAxis.x = q.x/den;
        resAxis.y = q.y/den;
        resAxis.z = q.z/den;
    }
    else
    {


        resAxis.x = 1.0f;
    }

    *outAxis = resAxis;
    *outAngle = resAngle;
}



inline Quaternion QuaternionFromEuler(float pitch, float yaw, float roll)
{
    Quaternion result = { 0 };

    float x0 = cosf(pitch*0.5f);
    float x1 = sinf(pitch*0.5f);
    float y0 = cosf(yaw*0.5f);
    float y1 = sinf(yaw*0.5f);
    float z0 = cosf(roll*0.5f);
    float z1 = sinf(roll*0.5f);

    result.x = x1*y0*z0 - x0*y1*z1;
    result.y = x0*y1*z0 + x1*y0*z1;
    result.z = x0*y0*z1 - x1*y1*z0;
    result.w = x0*y0*z0 + x1*y1*z1;

    return result;
}



inline Vector3 QuaternionToEuler(Quaternion q)
{
    Vector3 result = { 0 };


    float x0 = 2.0f*(q.w*q.x + q.y*q.z);
    float x1 = 1.0f - 2.0f*(q.x*q.x + q.y*q.y);
    result.x = atan2f(x0, x1);


    float y0 = 2.0f*(q.w*q.y - q.z*q.x);
    y0 = y0 > 1.0f ? 1.0f : y0;
    y0 = y0 < -1.0f ? -1.0f : y0;
    result.y = asinf(y0);


    float z0 = 2.0f*(q.w*q.z + q.x*q.y);
    float z1 = 1.0f - 2.0f*(q.y*q.y + q.z*q.z);
    result.z = atan2f(z0, z1);

    return result;
}


inline Quaternion QuaternionTransform(Quaternion q, Matrix mat)
{
    Quaternion result = { 0 };

    result.x = mat.m0*q.x + mat.m4*q.y + mat.m8*q.z + mat.m12*q.w;
    result.y = mat.m1*q.x + mat.m5*q.y + mat.m9*q.z + mat.m13*q.w;
    result.z = mat.m2*q.x + mat.m6*q.y + mat.m10*q.z + mat.m14*q.w;
    result.w = mat.m3*q.x + mat.m7*q.y + mat.m11*q.z + mat.m15*q.w;

    return result;
}


inline int QuaternionEquals(Quaternion p, Quaternion q)
{




    int result = (((fabsf(p.x - q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                  ((fabsf(p.y - q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))) &&
                  ((fabsf(p.z - q.z)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z))))) &&
                  ((fabsf(p.w - q.w)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w)))))) ||
                 (((fabsf(p.x + q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                  ((fabsf(p.y + q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))) &&
                  ((fabsf(p.z + q.z)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z))))) &&
                  ((fabsf(p.w + q.w)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w))))));

    return result;
}
# 4 "main.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 28 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 29 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stddef.h" 1 3 4
# 214 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stddef.h" 3 4

# 214 "/usr/lib/gcc/x86_64-redhat-linux/14/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 35 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/include/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 44 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  struct _IO_FILE **_prevchain;
  int _mode;

  char _unused2[15 * sizeof (int) - 5 * sizeof (void *)];
};
# 45 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/bits/types/cookie_io_functions_t.h" 1 3 4
# 27 "/usr/include/bits/types/cookie_io_functions_t.h" 3 4
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);







typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);







typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);


typedef int cookie_close_function_t (void *__cookie);






typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
# 48 "/usr/include/stdio.h" 2 3 4
# 64 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;
# 78 "/usr/include/stdio.h" 3 4
typedef __ssize_t ssize_t;






typedef __fpos_t fpos_t;
# 129 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 130 "/usr/include/stdio.h" 2 3 4
# 149 "/usr/include/stdio.h" 3 4
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));
# 184 "/usr/include/stdio.h" 3 4
extern int fclose (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 194 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
# 211 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char[20]) __attribute__ ((__nothrow__ , __leaf__)) ;




extern char *tmpnam_r (char __s[20]) __attribute__ ((__nothrow__ , __leaf__)) ;
# 228 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
   __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (__builtin_free, 1)));






extern int fflush (FILE *__stream);
# 245 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 264 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) __attribute__ ((__nonnull__ (3)));
# 299 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
# 334 "/usr/include/stdio.h" 3 4
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__nonnull__ (1)));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...) __attribute__ ((__nonnull__ (1)));




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nonnull__ (1)));




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));





extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) __attribute__ ((__nonnull__ (1)));




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 463 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                                __attribute__ ((__nonnull__ (1)));
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 490 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__nonnull__ (1)));





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 540 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__nonnull__ (1)));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 575 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream) __attribute__ ((__nonnull__ (1)));
extern int getc (FILE *__stream) __attribute__ ((__nonnull__ (1)));





extern int getchar (void);






extern int getc_unlocked (FILE *__stream) __attribute__ ((__nonnull__ (1)));
extern int getchar_unlocked (void);
# 600 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 611 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));
extern int putc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));





extern int putchar (int __c);
# 627 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));







extern int putc_unlocked (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream) __attribute__ ((__nonnull__ (1)));


extern int putw (int __w, FILE *__stream) __attribute__ ((__nonnull__ (2)));







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__access__ (__write_only__, 1, 2))) __attribute__ ((__nonnull__ (3)));
# 689 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) __attribute__ ((__nonnull__ (4)));
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) __attribute__ ((__nonnull__ (4)));


extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) __attribute__ ((__nonnull__ (3)));







extern int fputs (const char *__restrict __s, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (2)));





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) __attribute__ ((__nonnull__ (4)));
# 756 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));







extern int fseek (FILE *__stream, long int __off, int __whence)
  __attribute__ ((__nonnull__ (1)));




extern long int ftell (FILE *__stream) __attribute__ ((__nonnull__ (1)));




extern void rewind (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 793 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence)
  __attribute__ ((__nonnull__ (1)));




extern __off_t ftello (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 819 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos)
  __attribute__ ((__nonnull__ (1)));




extern int fsetpos (FILE *__stream, const fpos_t *__pos) __attribute__ ((__nonnull__ (1)));
# 850 "/usr/include/stdio.h" 3 4
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern void perror (const char *__s) __attribute__ ((__cold__));




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 887 "/usr/include/stdio.h" 3 4
extern int pclose (FILE *__stream) __attribute__ ((__nonnull__ (1)));





extern FILE *popen (const char *__command, const char *__modes)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (pclose, 1))) ;






extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__access__ (__write_only__, 1)));
# 931 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 949 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
# 973 "/usr/include/stdio.h" 3 4

# 5 "main.c" 2







# 11 "main.c"
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
} Player;

typedef enum Asteroid_Type {
    ONE = 0x53bd05d4,
    TWO = 0x796e1384,
    THREE = 0xa9b0788f,
    FOUR = 0xd865d80c,
    NUM_OF_SEEDS = 4,
} Asteroid_Type;

typedef enum Asteroid_Size {
    LARGE = 24,
    MEDIUM = 12,
    SMALL = 6,

} Asteroid_Size;




typedef struct Asteroid {
    Vector2 position;
    Vector2 points[10];
    Vector2 velocity;
    float radius;
    unsigned int alive;
    Asteroid_Type seed;
    Asteroid_Size size;
} Asteroid;

typedef struct Bullet {
    Vector2 position;
    Vector2 velocity;
    float ttl;
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

    float explotion_ttl;
    unsigned int explotion_buf_idx;

    int player_lives;

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
        for (int j = 0; j < 8; j++) {
            e[i].particles_pos[j].x += e->velocity[j].x;
            e[i].particles_pos[j].y += e->velocity[j].y;

            DrawCircleV(e[i].particles_pos[j], 1.0f, (Color){ 255, 255, 255, 255 });
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

    gs->asteroids_alive = 4 + 2 * (gs->waves);

    gs->explotion_ttl = 1;
    gs->explotion_buf_idx = 0;

    float angle = 3.14159265358979323846f / 4;
    for (int i = 0; i < (20 + 1); i++) {
        for (int j = 0; j < 8; j++) {
            explosions[i].velocity[j] = (Vector2){cos(j*angle), sin(j*angle)};
        }
    }

    player->height = 32;
    player->base = 20;
    player->angle = 270;
}

void ResetGame(Player *player, Asteroid *asteroids, Bullet *bullets, GameState *gs) {
    gs->waves = 0;
    gs->bullets_buf_pos = 0;
    gs->player_lives = 2;

    player->position.x = 400;
    player->position.y = 300;

    player->acceleration = (Vector2){0.0f, 0.0f};
    player->velocity = (Vector2){0.0f, 0.0f};
    player->direction = (Vector2){cos(player->angle * (3.14159265358979323846f/180.0f)), sin(player->angle * (3.14159265358979323846f/180.0f))};

    for (int i = 0; i < 20; i++) {
        bullets[i].ttl = 0.5f;
        bullets[i].alive_time = 0.0f;
        bullets[i].alive = 0;
    }

    gs->asteroids_alive = 4 + 2 * (gs->waves);
    if (gs->asteroids_alive > 11) {
        gs->asteroids_alive = 11;
    }


    for (int i = 0; i < 44; i++) {
        Asteroid a = {0};
        asteroids[i] = a;
    }

    SetRandomSeed((unsigned int)GetTime());
    for (unsigned int i = 0; i < gs->asteroids_alive; i++) {
        asteroids[i].position.x = GetRandomValue(750, 800);
        asteroids[i].position.y = GetRandomValue(550, 600);
        int angle = GetRandomValue(0, 360);
        asteroids[i].velocity.x = 4 * cos(angle * (3.14159265358979323846f/180.0f));
        asteroids[i].velocity.y = 4 * sin(angle * (3.14159265358979323846f/180.0f));
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

    for (int i = 0; i < 20; i++) {
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
            asteroids[i + 11].velocity = Vector2Rotate(a.velocity, angle * (3.14159265358979323846f/180.0f));
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
            asteroids[i + 22].velocity = Vector2Rotate(a.velocity, angle * (3.14159265358979323846f/180.0f));
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
            for (int j = 0; j < 10; j++) {
                int radius = 32 + GetRandomValue(0, 12);
                if (GetRandomValue(0, 100) < 24.0f) {
                    radius -= 12;
                }
                float random_float = GetRandomValue(0, 100) / 100.0f;
                float angle = ((j * (2 * 3.14159265358979323846f)) / 10) + (3.14159265358979323846f * 0.1f * random_float);
                float scale = radius * (asteroids[i].size * 0.1f);
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

            for (int j = 0; j < 10; j++) {
                DrawLineV(asteroids[i].points[j], asteroids[i].points[(j + 1) % 10], (Color){ 255, 255, 255, 255 });
            }
        }
    }
}

void DrawPlayer(Player *player, unsigned int frames) {
    player->direction = (Vector2){cos(player->angle * (3.14159265358979323846f/180.0f)), sin(player->angle * (3.14159265358979323846f/180.0f))};


    player->vertices[0].x = player->position.x + (player->direction.x * player->height);
    player->vertices[0].y = player->position.y + (player->direction.y * player->height);

    Vector2 direction_perpendicular = {
        .x = -sin(player->angle * (3.14159265358979323846f/180.0f)),
        .y = cos(player->angle * (3.14159265358979323846f/180.0f)),
    };

    player->vertices[1].x = player->position.x + ((player->base * 0.5f) * direction_perpendicular.x);
    player->vertices[1].y = player->position.y + ((player->base * 0.5f) * direction_perpendicular.y);

    player->vertices[2].x = player->position.x - ((player->base * 0.5f) * direction_perpendicular.x);
    player->vertices[2].y = player->position.y - ((player->base * 0.5f) * direction_perpendicular.y);


    Vector2 v01 = Vector2Subtract(player->vertices[1], player->vertices[0]);
    float v01_length = Vector2Length(v01);
    v01 = Vector2Normalize(v01);
    v01 = Vector2Scale(v01, v01_length * 0.25f);
    player->vertices[3].x = (player->vertices[1].x + v01.x);
    player->vertices[3].y = (player->vertices[1].y + v01.y);

    player->vertices[4].x = (player->vertices[1].x - (0.105f * player->base * direction_perpendicular.x));
    player->vertices[4].y = (player->vertices[1].y - (0.105f * player->base * direction_perpendicular.y));


    Vector2 v02 = Vector2Subtract(player->vertices[2], player->vertices[0]);
    float v02_length = Vector2Length(v02);
    v02 = Vector2Normalize(v02);
    v02 = Vector2Scale(v02, v02_length * 0.25f);
    player->vertices[5].x = (player->vertices[2].x + v02.x);
    player->vertices[5].y = (player->vertices[2].y + v02.y);

    player->vertices[6].x = (player->vertices[2].x + (0.105f * player->base * direction_perpendicular.x));
    player->vertices[6].y = (player->vertices[2].y + (0.105f * player->base * direction_perpendicular.y));


    player->vertices[7].x = (player->position.x + (0.2f * player->base * direction_perpendicular.x));
    player->vertices[7].y = (player->position.y + (0.2f * player->base * direction_perpendicular.y));

    player->vertices[8].x = (player->position.x - (0.2f * player->base * direction_perpendicular.x));
    player->vertices[8].y = (player->position.y - (0.2f * player->base * direction_perpendicular.y));

    player->vertices[9].x = (player->position.x - (0.4f * player->height * player->direction.x));
    player->vertices[9].y = (player->position.y - (0.4f * player->height * player->direction.y));

    DrawTriangleLines(player->vertices[0], player->vertices[1], player->vertices[2], (Color){ 255, 255, 255, 255 });
    DrawTriangleLines(player->vertices[1], player->vertices[3], player->vertices[4], (Color){ 255, 255, 255, 255 });
    DrawTriangleLines(player->vertices[2], player->vertices[5], player->vertices[6], (Color){ 255, 255, 255, 255 });

    if ((player->acceleration.x != 0.0f || player->acceleration.y != 0.0f) && (frames % 3 == 0)) {
        DrawTriangleLines(player->vertices[7], player->vertices[8], player->vertices[9], (Color){ 255, 255, 255, 255 });
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
        if (gs->bullets_buf_pos > (20) - 1) {
            gs->bullets_buf_pos = 0;
        }
    }
}

void Draw_Bullets(Bullet *bullets) {
    for (int i = 0; i < 20; i++) {
        if (bullets[i].alive == 1) {
            DrawCircle(bullets[i].position.x, bullets[i].position.y, 1.0f, (Color){ 255, 255, 255, 255 });
        }
    }
}

int main() {
    InitWindow(800, 600, "Asteroids");

    Player player;
    Asteroid asteroids[44];
    Bullet bullets[20];
    Explosion explosions[(20 + 1)];
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
        Update_Movements(&player, asteroids, 44, bullets);

        for (int i = 0; i < 44; i++) {
            if (asteroids[i].alive == 1) {
                float dist_pa = Vector2Distance(player.position, asteroids[i].position);
                if (dist_pa < asteroids[i].radius && gs.player_lives > -1) {
                    Break_Asteroids(asteroids, i, &gs);
                    gs.player_lives--;
                    printf("LOG: player lives: %d\n", gs.player_lives);
                }
                for (int j = 0; j < 20; j++) {
                    if (bullets[j].alive == 1) {
                        float dist_ba = Vector2Distance(bullets[j].position, asteroids[i].position);
                        if (dist_ba < asteroids[i].radius) {
                            bullets[j].alive = 0;
                            for (int k = 0; k < 8; k++) {
                                int _idx = gs.explotion_buf_idx;
                                explosions[_idx].particles_pos[k].x = bullets[j].position.x;
                                explosions[_idx].particles_pos[k].y = bullets[j].position.y;
                            }
                            gs.explotion_buf_idx++;
                            if (gs.explotion_buf_idx >= (20 + 1)) {
                                gs.explotion_buf_idx = 0;
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
                    text_pos.x = (800/2) - (text_width/2);
                    text_pos.y = 100;
                    DrawText(game_title, text_pos.x, text_pos.y, font_size, (Color){ 255, 255, 255, 255 });

                    font_size = 64;
                    const char *button_title = "New Game";
                    text_width = MeasureText(button_title, font_size);
                    text_pos.x = (800/2) - (text_width/2);
                    text_pos.y = (600/2);
                    padding = 10;

                    button_rec.x = text_pos.x - (padding/2);
                    button_rec.y = text_pos.y - (padding/2);
                    button_rec.width = text_width + padding;
                    button_rec.height = font_size + padding;

                    ClearBackground((Color){ 0, 0, 0, 255 });
                    DrawRectangleLines(button_rec.x, button_rec.y, button_rec.width, button_rec.height, (Color){ 255, 255, 255, 255 });
                    DrawText(button_title, text_pos.x, text_pos.y, font_size, (Color){ 255, 255, 255, 255 });

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
                    ClearBackground((Color){ 0, 0, 0, 255 });

                    DrawPlayer(&player, gs.frames);
                    Draw_Asteroids(asteroids, 44);
                    Draw_Bullets(bullets);
                    Draw_Explosion(explosions, delta_time, gs.explotion_buf_idx);
                    break;
                case PAUSED:
                    break;
                case GAME_OVER:
                    ClearBackground((Color){ 0, 0, 0, 255 });

                    const char *game_over_txt = "GAME OVER";
                    font_size = 64;
                    text_width = MeasureText(game_over_txt, font_size);
                    text_pos.x = 400 - (text_width/2);
                    text_pos.y = 600/2 - (font_size/2);
                    DrawText(game_over_txt, text_pos.x, text_pos.y, font_size, (Color){ 255, 255, 255, 255 });

                    const char *new_game_txt = "New Game";
                    font_size = 64;
                    text_width = MeasureText(new_game_txt, font_size);
                    text_pos.x = 400 - (text_width/2);
                    text_pos.y = 600/1.2f - (font_size/2);

                    padding = 10;
                    button_rec.x = text_pos.x - (padding/2);
                    button_rec.y = text_pos.y - (padding/2);
                    button_rec.width = text_width + padding;
                    button_rec.height = font_size + padding;

                    DrawText(new_game_txt, text_pos.x, text_pos.y, font_size, (Color){ 255, 255, 255, 255 });
                    if (IsMouseButtonReleased(0)) {
                        Vector2 mouse_pos = GetMousePosition();
                        if (CheckCollisionPointRec(mouse_pos, button_rec)) {
                            gs.currentScreen = TITLE;
                            gs.waves = 0;
                            ResetGame(&player, asteroids, bullets, &gs);
                        }
                    }

                    Draw_Asteroids(asteroids, 44);
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

        for (int i = 0; i < 20; i++) {
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
