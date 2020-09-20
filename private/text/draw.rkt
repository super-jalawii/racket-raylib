#lang racket

(require "../struct/text.rkt"
         "../struct/core.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))


;; Shows current FPS
;  void DrawFPS(int posX, int posY);
(rl draw-fps [_fun _int _int -> _void] #:c-id DrawFPS)

;; Draw text (using default font)
;  void DrawText(const char *text, int posX, int posY, int fontSize, Color color);
(rl draw-text [_fun _string _int _int _int _Color -> _void] #:c-id DrawText)

;; Draw text using font and additional parameters
;  void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);

;; Draw text using font inside rectangle limits
;  void DrawTextRec(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);

;; Draw text using font inside rectangle limits with support for text selection
;  void DrawTextRecEx(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint, int selectStart, int selectLength, Color selectTint, Color selectBackTint);
