#lang racket

(require "../core/structs.rkt"
         "../core/color.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Measure string width for default font
; int MeasureText(const char *text, int fontSize);
(rl measure-text [_fun _string _int -> _int] #:c-id MeasureText)

;;  Measure string size for Font
; Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);

; int GetGlyphIndex(Font font, int codepoint);
