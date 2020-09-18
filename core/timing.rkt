#lang racket

(require "structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Set target FPS (maximum)
; void SetTargetFPS(int fps);
(rl set-target-fps [_fun _int -> _void] #:c-id SetTargetFPS)

;;  Returns current FPS
; int GetFPS(void);
(rl get-fps [_fun -> _int] #:c-id GetFPS)

;;  Returns time in seconds for last frame drawn
; float GetFrameTime(void);
(rl get-frame-time [_fun -> _float] #:c-id GetFrameTime)

;;  Returns elapsed time in seconds since InitWindow()
; double GetTime(void);
(rl get-time [_fun -> _double] #:c-id GetTime)
