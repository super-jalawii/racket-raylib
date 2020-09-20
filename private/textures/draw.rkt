#lang racket

(require "../struct/core.rkt"
         "../core/color.rkt"
         "../struct/shapes.rkt"
         "../struct/textures.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Draw a Texture2D
; void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
(rl draw-tex [_fun _Texture2D _int _int _Color -> _void] #:c-id DrawTexture)

;;  Draw a Texture2D with position defined as Vector2
; void DrawTextureV(Texture2D texture, Vector2 position, Color tint);

;;  Draw a Texture2D with extended parameters
; void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);

;;  Draw a part of a texture defined by a rectangle
; void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);

;;  Draw texture quad with tiling and offset parameters
; void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);

;;  Draw a part of a texture defined by a rectangle with 'pro' parameters
; void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);
(rl draw-tex-pro [_fun _Texture2D _Rect _Rect _Vec2 _float _Color -> _void] #:c-id DrawTexturePro)

;;  Draws a texture (or part of it) that stretches or shrinks nicely
; void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);
