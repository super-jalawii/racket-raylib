#lang racket

(require "structs.rkt"
         "../input/structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Set camera mode (multiple camera modes available)
; void SetCameraMode(Camera camera, int mode);
(rl set-camera-mode [_fun _Camera3D _CameraMode -> _void] #:c-id SetCameraMode)

;;  Update camera position for selected mode
; void UpdateCamera(Camera *camera);
(rl update-camera [_fun _pointer -> _void] #:c-id UpdateCamera)

;;  Set camera pan key to combine with mouse movement (free camera)
; void SetCameraPanControl(int panKey);
(rl set-camera-pan-control [_fun _KeyboardKey -> _void] #:c-id SetCameraPanControl)

;;  Set camera alt key to combine with mouse movement (free camera)
; void SetCameraAltControl(int altKey);
(rl set-camera-alt-control [_fun _KeyboardKey -> _void] #:c-id SetCameraAltControl)

;;  Set camera smooth zoom key to combine with mouse (free camera)
; void SetCameraSmoothZoomControl(int szKey);
(rl set-camera-smooth-zoom-control [_fun _KeyboardKey -> _void] #:c-id SetCameraSmoothZoomControl)

;void SetCameraMoveControls(int frontKey, int backKey,
;                           int rightKey, int leftKey,
;;  Set camera move controls (1st person and 3rd person cameras)
;                             int upKey, int downKey);
(rl set-camera-move-controls [_fun _KeyboardKey _KeyboardKey _KeyboardKey _KeyboardKey _KeyboardKey _KeyboardKey -> _void] #:c-id SetCameraMoveControls)
