#lang racket

(require "../struct/input.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Detect if a gamepad is available
; bool IsGamepadAvailable(int gamepad);
(rl gamepad-available? [_fun _GamepadNumber -> _bool] #:c-id IsGamepadAvailable)

;;  Check gamepad name (if available)
; bool IsGamepadName(int gamepad const char *name);
(rl gamepad-name? [_fun _GamepadNumber _string -> _bool] #:c-id IsGamepadName)

;;  Return gamepad internal name id
; const char *GetGamepadName(int gamepad);
(rl gamepad-name [_fun _GamepadNumber -> _string] #:c-id GetGamepadName)

;;  Detect if a gamepad button has been pressed once
; bool IsGamepadButtonPressed(int gamepad int button);
(rl gamepad-btn-pressed? [_fun _GamepadNumber _GamepadButton -> _bool] #:c-id IsGamepadButtonPressed)

;;  Detect if a gamepad button is being pressed
; bool IsGamepadButtonDown(int gamepad int button);
(rl gamepad-btn-down? [_fun _GamepadNumber _GamepadButton -> _bool] #:c-id IsGamepadButtonDown)

;;  Detect if a gamepad button has been released once
; bool IsGamepadButtonReleased(int gamepad int button);
(rl gamepad-btn-released? [_fun _GamepadNumber _GamepadButton -> _bool] #:c-id IsGamepadButtonReleased)

;;  Detect if a gamepad button is NOT being pressed
; bool IsGamepadButtonUp(int gamepad int button);
(rl gamepad-btn-up? [_fun _GamepadNumber _GamepadButton -> _bool] #:c-id IsGamepadButtonUp)

;;  Get the last gamepad button pressed
; int GetGamepadButtonPressed(void);
(rl gamepad-btn-pressed [_fun -> _GamepadButton] #:c-id GetGamepadButtonPressed)

;;  Return gamepad axis count for a gamepad
; int GetGamepadAxisCount(int gamepad);
(rl gamepad-axis-count [_fun _GamepadNumber -> _int] #:c-id GetGamepadAxisCount)

;;  Return axis movement value for a gamepad axis
; float GetGamepadAxisMovement(int gamepad int axis);
(rl gamepad-axis-movement [_fun _GamepadNumber _GamepadAxis -> _float] #:c-id GetGamepadAxisMovement)
