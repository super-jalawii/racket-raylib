#lang racket

(require "structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Enable a set of gestures using flags
; void SetGesturesEnabled(unsigned int gestureFlags);

;;  Check if a gesture have been detected
; bool IsGestureDetected(int gesture);

;;  Get latest detected gesture
; int GetGestureDetected(void);

;;  Get touch points count
; int GetTouchPointsCount(void);

;;  Get gesture hold time in milliseconds
; float GetGestureHoldDuration(void);

;;  Get gesture drag vector
; Vector2 GetGestureDragVector(void);

;;  Get gesture drag angle
; float GetGestureDragAngle(void);

;;  Get gesture pinch delta
; Vector2 GetGesturePinchVector(void);

;;  Get gesture pinch angle
; float GetGesturePinchAngle(void);

