#lang racket

(require "structs.rkt"
         "../core/structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Detect if a mouse button has been pressed once
; bool IsMouseButtonPressed(int button);
(rl mouse-btn-pressed? [_fun _MouseButton -> _bool] #:c-id IsMouseButtonPressed)

;;  Detect if a mouse button is being pressed
; bool IsMouseButtonDown(int button);
(rl mouse-btn-down? [_fun _MouseButton -> _bool] #:c-id IsMouseButtonDown)

;;  Detect if a mouse button has been released once
; bool IsMouseButtonReleased(int button);
(rl mouse-btn-released? [_fun _MouseButton -> _bool] #:c-id IsMouseButtonReleased)

;;  Detect if a mouse button is NOT being pressed
; bool IsMouseButtonUp(int button);
(rl mouse-btn-up? [_fun _MouseButton -> _bool] #:c-id IsMouseButtonUp)

;;  Returns mouse position X
; int GetMouseX(void);
(rl get-mouse-x [_fun -> _int] #:c-id GetMouseX)

;;  Returns mouse position Y
; int GetMouseY(void);
(rl get-mouse-y [_fun -> _int] #:c-id GetMouseY)

;;  Returns mouse position XY
; Vector2 GetMousePosition(void);
(rl get-mouse-position [_fun -> _Vec2] #:c-id GetMousePosition)

;;  Set mouse position XY
; void SetMousePosition(int x, int y);
(rl set-mouse-position [_fun _int _int -> _void] #:c-id SetMousePosition)

;;  Set mouse offset
; void SetMouseOffset(int offsetX, int offsetY);
(rl set-mouse-offset [_fun _int _int -> _void] #:c-id SetMouseOffset)

;;  Set mouse scaling
; void SetMouseScale(float scaleX, float scaleY);
(rl set-mouse-scale [_fun _float _float -> _void] #:c-id SetMouseScale)

;;  Returns mouse wheel movement Y
; int GetMouseWheelMove(void);
(rl get-mouse-wheel-move [_fun -> _int] #:c-id GetMouseWheelMove)

