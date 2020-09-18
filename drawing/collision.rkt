#lang racket

(require "../core/structs.rkt"
         "structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Check collision between two rectangles
; bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
(rl rects-colliding? [_fun _Rect _Rect -> _bool] #:c-id CheckCollisionRecs)

;;  Check collision between two circles
; bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
(rl circles-colliding? [_fun _Vec2 _float _Vec2 _float -> _bool] #:c-id CheckCollisionCircles)

;;  Check collision between circle and rectangle
; bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
(rl circ-rect-colliding? [_fun _Vec2 _float _Rect -> _bool] #:c-id CheckCollisionCircleRec)

;;  Get collision rectangle for two rectangles collision
; Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);
(rl get-collision-rect [_fun _Rect _Rect -> _Rect] #:c-id GetCollisionRec)

;;  Check if point is inside rectangle
; bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
(rl pnt-rect-colliding? [_fun _Vec2 _Rect -> _bool] #:c-id CheckCollisionPointRec)

;;  Check if point is inside circle
; bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
(rl pnt-circ-colliding? [_fun _Vec2 _Vec2 _float -> _bool] #:c-id CheckCollisionPointCircle)

;;  Check if point is inside a triangle
; bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);
(rl pnt-tri-colliding? [_fun _Vec2 _Vec2 _Vec2 -> _bool] #:c-id CheckCollisionPointTriangle)
