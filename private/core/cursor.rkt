#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Shows cursor
; void ShowCursor(void);
(rl show-cursor [_fun -> _void] #:c-id ShowCursor)

;;  Hides cursor
; void HideCursor(void);
(rl hide-cursor [_fun -> _void] #:c-id HideCursor)

;;  Check if cursor is not visible
; bool IsCursorHidden(void);
(rl cursor-hidden? [_fun -> _bool] #:c-id IsCursorHidden)

;;  Enables cursor (unlock cursor)
; void EnableCursor(void);
(rl enable-cursor [_fun -> _void] #:c-id EnableCursor)

;;  Disables cursor (lock cursor)
; void DisableCursor(void);
(rl disable-cursor [_fun -> _void] #:c-id DisableCursor)

