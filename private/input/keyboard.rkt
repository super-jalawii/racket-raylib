#lang racket

(require "../struct/input.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Detect if a key has been pressed once
; bool IsKeyPressed(int key);
(rl key-pressed? [_fun _KeyboardKey -> _bool] #:c-id IsKeyPressed)

;;  Detect if a key is being pressed
; bool IsKeyDown(int key);
(rl key-down? [_fun _KeyboardKey -> _bool] #:c-id IsKeyDown)

;;  Detect if a key has been released once
; bool IsKeyReleased(int key);
(rl key-released? [_fun _KeyboardKey -> _bool] #:c-id IsKeyReleased)

;;  Detect if a key is NOT being pressed
; bool IsKeyUp(int key);
(rl key-up? [_fun _KeyboardKey -> _bool] #:c-id IsKeyUp)

;;  Get latest key pressed
; int GetKeyPressed(void);
(rl key-pressed [_fun -> _KeyboardKey] #:c-id GetKeyPressed)

;;  Set a custom key to exit program (default is ESC)
; void SetExitKey(int key);
(rl set-exit-key! [_fun _KeyboardKey -> _void] #:c-id SetExitKey)

