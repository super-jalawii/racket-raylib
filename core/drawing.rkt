#lang racket

(require "structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Set background color (framebuffer clear color)
; void ClearBackground(Color color);
(rl clear-background [_fun _Color -> _void] #:c-id ClearBackground)

;;  Setup canvas (framebuffer) to start drawing
; void BeginDrawing(void);
(rl begin-drawing [_fun -> _void] #:c-id BeginDrawing)

;;  End canvas drawing and swap buffers (double buffering)
; void EndDrawing(void);
(rl end-drawing [_fun -> _void] #:c-id EndDrawing)

;;  Initialize 2D mode with custom camera (2D)
; void BeginMode2D(Camera2D camera);
(rl begin-mode-2d [_fun _Camera2D -> _void] #:c-id BeginMode2D)

;;  Ends 2D mode with custom camera
; void EndMode2D(void);
(rl end-mode-2d [_fun -> _void] #:c-id EndMode2D)

;;  Initializes 3D mode with custom camera (3D)
; void BeginMode3D(Camera3D camera);
(rl begin-mode-3d [_fun _Camera3D -> _void] #:c-id BeginMode3D)

;;  Ends 3D mode and returns to default 2D orthographic mode
; void EndMode3D(void);
(rl end-mode-3d [_fun -> _void] #:c-id EndMode3D)

;;  Initializes render texture for drawing
; void BeginTextureMode(RenderTexture2D target);

;;  Ends drawing to render texture
; void EndTextureMode(void);

;;  Begin scissor mode (define screen area for following drawing)
; void BeginScissorMode(int x, int y, int width, int height);

;;  End scissor mode
; void EndScissorMode(void);

