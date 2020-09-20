#lang racket

(require "../struct/core.rkt"
         "../core/color.rkt"
         "../struct/shapes.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Draw a pixel
; void DrawPixel(int posX, int posY, Color color);
(rl draw-pixel [_fun _int _int _Color -> _void] #:c-id DrawPixel)

;;  Draw a pixel (Vector version)
; void DrawPixelV(Vector2 position, Color color);
(rl draw-pixel-vec [_fun _Vec2 _Color -> _void] #:c-id DrawPixelV)

;;  Draw a line
; void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
(rl draw-line [_fun _int _int _int _int _Color -> _void] #:c-id DrawLine)

;;  Draw a line (Vector version)
; void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
(rl draw-line-vec [_fun _Vec2 _Vec2 _Color -> _void] #:c-id DrawLineV)

;;  Draw a line defining thickness
; void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
(rl draw-line-ex [_fun _Vec2 _Vec2 _float _Color -> _void] #:c-id DrawLineEx)

;;  Draw a line using cubic-bezier curves in-out
; void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
(rl draw-line-bezier [_fun _Vec2 _Vec2 _float _Color -> _void] #:c-id DrawLineBezier)

;;  Draw lines sequence
; void DrawLineStrip(Vector2 *points, int numPoints, Color color);
(rl draw-line-strip [_fun _Vec2 _int _Color -> _void] #:c-id DrawLineStrip)

;;  Draw a color-filled circle
; void DrawCircle(int centerX, int centerY, float radius, Color color);
(rl draw-circle [_fun _int _int _float _Color -> _void] #:c-id DrawCircle)

;;  Draw a piece of a circle
; void DrawCircleSector(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
(rl draw-circle-sector [_fun _Vec2 _float _int _int _int _Color -> _void] #:c-id DrawCircleSector)

;;  Draw circle sector outline
; void DrawCircleSectorLines(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
(rl draw-circle-sector-lines [_fun _Vec2 _float _int _int _int _Color -> _void] #:c-id DrawCircleSectorLines)

;;  Draw a gradient-filled circle
; void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
(rl draw-circle-gradient [_fun _int _int _float _Color _Color -> _void] #:c-id DrawCircleGradient)

;;  Draw a color-filled circle (Vector version)
; void DrawCircleV(Vector2 center, float radius, Color color);
(rl draw-circle-vec [_fun _Vec2 _float _Color -> _void] #:c-id DrawCircleV)

;;  Draw circle outline
; void DrawCircleLines(int centerX, int centerY, float radius, Color color);
(rl draw-circle-lines [_fun _int _int _float _Color -> _void] #:c-id DrawCircleLines)

;;  Draw ellipse
; void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
(rl draw-ellipse [_fun _int _int _float _float _Color -> _void] #:c-id DrawEllipse)

;;  Draw ellipse outline
; void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
(rl draw-ellipse-lines [_fun _int _int _float _float _Color -> _void] #:c-id DrawEllipseLines)

;;  Draw ring
; void DrawRing(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
(rl draw-ring [_fun _Vec2 _float _float _int _int _int _Color -> _void] #:c-id DrawRing)

;;  Draw ring outline
; void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
(rl draw-ring-lines [_fun _Vec2 _float _float _int _int _int _Color -> _void] #:c-id DrawRingLines)

;;  Draw a color-filled rectangle
; void DrawRectangle(int posX, int posY, int width, int height, Color color);
(rl draw-rect [_fun _int _int _int _int _Color -> _void] #:c-id DrawRectangle)

;;  Draw a color-filled rectangle (Vector version)
; void DrawRectangleV(Vector2 position, Vector2 size, Color color);
(rl draw-rect-vec [_fun _Vec2 _Vec2 _Color -> _void] #:c-id DrawRectangleV)

;;  Draw a color-filled rectangle
; void DrawRectangleRec(Rectangle rec, Color color);
(rl draw-Rect [_fun _Rect _Color -> _void] #:c-id DrawRectangleRec)

;;  Draw a color-filled rectangle with pro parameters
; void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
(rl draw-rect-ex [_fun _Rect _Vec2 _float _Color -> _void] #:c-id DrawRectanglePro)

;;  Draw a vertical-gradient-filled rectangle
; void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
(rl draw-rect-gradient-vec [_fun _int _int _int _int _Color _Color -> _void] #:c-id DrawRectangleGradientV)

;;  Draw a horizontal-gradient-filled rectangle
; void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
(rl draw-rect-gradient-hz [_fun _int _int _int _int _Color _Color -> _void] #:c-id DrawRectangleGradientH)

;;  Draw a gradient-filled rectangle with custom vertex colors
; void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
(rl draw-rect-gradient-ex [_fun _Rect _Color _Color _Color _Color -> _void] #:c-id DrawRectangleGradientEx)

;;  Draw rectangle outline
; void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
(rl draw-rect-lines [_fun _int _int _int _int _Color -> _void] #:c-id DrawRectangleLines)

;;  Draw rectangle outline with extended parameters
; void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);
(rl draw-rect-lines-ex [_fun _Rect _int _Color -> _void] #:c-id DrawRectangleLinesEx)

;;  Draw rectangle with rounded edges
; void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
(rl draw-rect-rnd [_fun _Rect _float _int _Color -> _void] #:c-id DrawRectangleRounded)

;;  Draw rectangle with rounded edges outline
; void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color);
(rl draw-rect-rnd-lines [_fun _Rect _float _int _int _int _Color -> _void] #:c-id DrawRectangleRoundedLines)

;;  Draw a color-filled triangle (vertex in counter-clockwise order!)
; void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
(rl draw-tri [_fun _Vec2 _Vec2 _Vec2 _Color -> _void] #:c-id DrawTriangle)

;;  Draw triangle outline (vertex in counter-clockwise order!)
; void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
(rl draw-tri-lines [_fun _Vec2 _Vec2 _Vec2 _Color -> _void] #:c-id DrawTriangleLines)

;;  Draw a triangle fan defined by points (first vertex is the center)
; void DrawTriangleFan(Vector2 *points, int numPoints, Color color);
(rl draw-tri-fan [_fun _pointer _int _Color -> _void] #:c-id DrawTriangleFan)

;;  Draw a triangle strip defined by points
; void DrawTriangleStrip(Vector2 *points, int pointsCount, Color color);
(rl draw-tri-strip [_fun _pointer _int _Color -> _void] #:c-id DrawTriangleStrip)

;;  Draw a regular polygon (Vector version)
; void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
(rl draw-poly [_fun _Vec2 _int _float _float _Color -> _void] #:c-id DrawPoly)

;;  Draw a polygon outline of n sides
; void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);
(rl draw-poly-lines [_fun _Vec2 _int _float _float _Color -> _void] #:c-id DrawPolyLines)

