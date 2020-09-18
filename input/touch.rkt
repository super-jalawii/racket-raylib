#lang racket

(require "structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Returns touch position X for touch point 0 (relative to screen size)
; int GetTouchX(void);

;;  Returns touch position Y for touch point 0 (relative to screen size)
; int GetTouchY(void);

;;  Returns touch position XY for a touch point index (relative to screen size)
; Vector2 GetTouchPosition(int index);

