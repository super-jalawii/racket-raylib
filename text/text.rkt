#lang racket

(require "structs.rkt"
         "../core/structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))


;;  Shows current FPS
;     void DrawFPS(int posX, int posY);
(rl draw-fps [_fun _int _int -> _void] #:c-id DrawFPS)

;;  Draw text (using default font)
;     void DrawText(const char *text, int posX, int posY, int fontSize, Color color);
(rl draw-text [_fun _string _int _int _int _Color -> _void] #:c-id DrawText)

;;  Draw text using font and additional parameters
;     void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);

;;  Draw text using font inside rectangle limits
;     void DrawTextRec(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);

;    void DrawTextRecEx(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint,
;;  Draw text using font inside rectangle limits with support for text selection
;                     int selectStart, int selectLength, Color selectTint, Color selectBackTint);

;;  Draw one character (codepoint)
;     void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float scale, Color tint);

;;  Measure string width for default font
;     int MeasureText(const char *text, int fontSize);

;;  Measure string size for Font
;     Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);

;;  Get index position for a unicode character on font
;     int GetGlyphIndex(Font font, int codepoint);
