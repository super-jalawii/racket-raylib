#lang racket

(require "../struct/core.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Returns a ray trace from mouse position
; Ray GetMouseRay(Vector2 mousePosition, Camera camera);
(rl mouse-ray [_fun _Vec2 _Camera3D -> _Ray] #:c-id GetMouseRay)

;;  Returns camera transform matrix (view matrix)
; Matrix GetCameraMatrix(Camera camera);
(rl camera-matrix [_fun _Camera3D -> _Mat4] #:c-id GetCameraMatrix)

;;  Returns camera 2d transform matrix
; Matrix GetCameraMatrix2D(Camera2D camera);
(rl camera-matrix-2d [_fun _Camera2D -> _Mat4] #:c-id GetCameraMatrix2D)

;;  Returns the screen space position for a 3d world space position
; Vector2 GetWorldToScreen(Vector3 position, Camera camera);
(rl world->screen [_fun _Vec3 _Camera3D -> _Vec2] #:c-id GetWorldToScreen)

;;  Returns size position for a 3d world space position
; Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height);
(rl world->screen* [_fun _Vec3 _Camera3D _int _int -> _Vec2] #:c-id GetWorldToScreenEx)

;;  Returns the screen space position for a 2d camera world space position
; Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);
(rl world->screen-2d [_fun _Vec2 _Camera2D -> _Vec2] #:c-id GetWorldToScreen2D)

;;  Returns the world space position for a 2d camera screen space position
; Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);
(rl screen->world-2d [_fun _Vec2 _Camera2D -> _Vec2] #:c-id GetScreenToWorld2D)
