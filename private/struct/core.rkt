#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(provide (all-defined-out))

(define-cstruct _Color ([r _ubyte] [g _ubyte] [b _ubyte] [a _ubyte]))


(define-cstruct _Vec2 ([x _float] [y _float]))
(define-cstruct _Vec3 ([x _float] [y _float] [z _float]))
(define-cstruct _Vec4 ([x _float] [y _float] [z _float] [w _float]))

(define-cstruct _Mat4 (
                       [m0 _float] [m4 _float] [m8  _float] [m12 _float]
                       [m1 _float] [m5 _float] [m9  _float] [m13 _float]
                       [m2 _float] [m6 _float] [m10 _float] [m14 _float]
                       [m3 _float] [m7 _float] [m11 _float] [m15 _float]))


(define-cstruct _Camera2D ([offset   _Vec2]
                           [target   _Vec2]
                           [rotation _float]
                           [zoom     _float]))

(define _CameraType (_enum '(
                             CAMERA_PERSPECTIVE  = 0
                             CAMERA_ORTHOGRAPHIC = 1)))

(define _CameraMode (_enum '(
                             CAMERA_CUSTOM       = 0
                             CAMERA_FREE         = 1
                             CAMERA_ORBITAL      = 2
                             CAMERA_FIRST_PERSON = 3
                             CAMERA_THIRD_PERSON = 4)))

(define-cstruct _Camera3D ([position _Vec3]
                           [target   _Vec3]
                           [up       _Vec3]
                           [fovy     _float]
                           [type     _CameraType]))

(define-cstruct _Ray ([position _Vec3] [direction _Vec3]))

(define-cstruct _BoundingBox
  ([min _Vec3]
   [max _Vec3]))

(define _WindowFlags (_bitmask '(
                                 FLAG_NONE            = 0
                                 FLAG_RESERVED           = 1
                                 FLAG_FULLSCREEN_MODE    = 2
                                 FLAG_WINDOW_RESIZABLE   = 4
                                 FLAG_WINDOW_UNDECORATED = 8
                                 FLAG_WINDOW_TRANSPARENT = 16
                                 FLAG_WINDOW_HIDDEN      = 128
                                 FLAG_WINDOW_ALWAYS_RUN  = 256
                                 FLAG_MSAA_4X_HINT       = 32
                                 FLAG_VSYNC_HINT         = 64)))

(define window::none 'FLAG_NONE)
(define window::reserved 'FLAG_RESERVED)
(define window::fullscreen 'FLAG_FULLSCREEN_MODE)
(define window::resizable 'FLAG_WINDOW_RESIZABLE)
(define window::undecorated 'FLAG_WINDOW_UNDECORATED)
(define window::transparent 'FLAG_WINDOW_TRANSPARENT)
(define window::hidden 'FLAG_WINDOW_HIDDEN)
(define window::always-run 'FLAG_WINDOW_ALWAYS_RUN)
(define window::msaa4x 'FLAG_MSAA_4X_HINT)
(define window::vsync 'FLAG_VSYNC_HINT)

(define _LogType (_enum '(
                          LOG_ALL = 0
                          LOG_TRACE
                          LOG_DEBUG
                          LOG_INFO
                          LOG_WARNING
                          LOG_ERROR
                          LOG_FATAL
                          LOG_NONE)))

(define log::all 'LOG_ALL)
(define log::trace 'LOG_TRACE)
(define log::debug 'LOG_DEBUG)
(define log::info 'LOG_INFO)
(define log::warning 'LOG_WARNING)
(define log::error 'LOG_ERROR)
(define log::fatal 'LOG_FATAL)
(define log::none 'LOG_NONE)
