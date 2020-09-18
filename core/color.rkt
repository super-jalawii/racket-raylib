#lang racket

(require "structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Returns hexadecimal value for a Color
; int ColorToInt(Color color);
(rl color->hex [_fun _Color -> _int] #:c-id ColorToInt)

;;  Returns color normalized as float [0..1]
; Vector4 ColorNormalize(Color color);
(rl color->vec4 [_fun _Color -> _Vec4] #:c-id ColorNormalize)

;;  Returns color from normalized values [0..1]
; Color ColorFromNormalized(Vector4 normalized);
(rl vec4->color [_fun _Vec4 -> _Color] #:c-id ColorFromNormalized)

;;  Returns HSV values for a Color
; Vector3 ColorToHSV(Color color);
(rl color->hsv [_fun _Color -> _Vec3] #:c-id ColorToHSV)

;;  Returns a Color from HSV values
; Color ColorFromHSV(Vector3 hsv);
(rl hsv->color [_fun _Vec3 -> _Color] #:c-id ColorFromHSV)

;;  Returns a Color struct from hexadecimal value
; Color GetColor(int hexValue);
(rl hex->color [_fun _int -> _Color] #:c-id GetColor)

;;  Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
; Color Fade(Color color, float alpha);
(rl fade [_fun _Color _float -> _Color] #:c-id Fade)

;;; Custom raylib color palette for amazing visuals
(define LIGHTGRAY (make-Color 200 200 200 255))
(define GRAY (make-Color 130 130 130 255))
(define DARKGRAY (make-Color 80 80 80 255))
(define YELLOW (make-Color 253 249 0 255))
(define GOLD (make-Color 255 203 0 255))
(define ORANGE (make-Color 255 161 0 255))
(define PINK (make-Color 255 109 194 255))
(define RED (make-Color 230 41 55 255))
(define MAROON (make-Color 190 33 55 255))
(define GREEN (make-Color 0 228 48 255))
(define LIME (make-Color 0 158 47 255))
(define DARKGREEN (make-Color 0 117 44 255))
(define SKYBLUE (make-Color 102 191 255 255))
(define BLUE (make-Color 0 121 241 255))
(define DARKBLUE (make-Color 0 82 172 255))
(define PURPLE (make-Color 200 122 255 255))
(define VIOLET (make-Color 135 60 190 255))
(define DARKPURPLE (make-Color 112 31 126 255))
(define BEIGE (make-Color 211 176 131 255))
(define BROWN (make-Color 127 106 79 255))
(define DARKBROWN (make-Color 76 63 47 255))
(define WHITE (make-Color 255 255 255 255))
(define BLACK (make-Color 0 0 0 255))
(define BLANK (make-Color 0 0 0 0))
(define MAGENTA (make-Color 255 0 255 255))
(define RAYWHITE (make-Color 245 245 245 255))
