#lang racket

(require "../core.rkt")

(define [core-ex-13]
  (let ([screen-w  800]
        [screen-h  450]
        [camera    (make-Camera3D
                    (make-Vec3 10. 10. 10.)
                    (make-Vec3  0.  0.  0.)
                    (make-Vec3  0.  1.  0.)
                    45.
                    'CAMERA_PERSPECTIVE)]
        [cube-pos  (make-Vec3 0. 0. 0.)]
        [cube-size (make-Vec3 2. 2. 2.)]
        [collision #f]
        [ray       #f])
    (init-window screen-w screen-h "raylib [core] example - 3d picking")
    (set-target-fps 60)
    (set-camera-mode camera 'CAMERA_FREE)
    (let loop ()
      (unless (window-should-close?)
        (update-camera camera)
        (when (mouse-btn-pressed? 'MOUSE_LEFT_BUTTON)
          (if (not collision)
              (begin
                (set! ray (get-mouse-ray (get-mouse-position) camera))
                (set! collision (check-coll-ray-box
                                 ray
                                 (make-BoundingBox
                                  (make-Vec3
                                   (- (Vec3-x cube-pos) (/ (Vec3-x cube-size) 2))
                                   (- (Vec3-y cube-pos) (/ (Vec3-y cube-size) 2))
                                   (- (Vec3-z cube-pos) (/ (Vec3-z cube-size) 2)))
                                  (make-Vec3
                                   (+ (Vec3-x cube-pos) (/ (Vec3-x cube-size) 2))
                                   (+ (Vec3-y cube-pos) (/ (Vec3-y cube-size) 2))
                                   (+ (Vec3-z cube-pos) (/ (Vec3-z cube-size) 2)))))))
              (set! collision #f)))
        (begin
          (begin-drawing)
          (clear-background RAYWHITE)
          (begin
            (begin-mode-3d camera)

            (if collision
                (begin
                  (draw-cube
                   cube-pos
                   (Vec3-x cube-size)
                   (Vec3-y cube-size)
                   (Vec3-z cube-size)
                   RED)
                  (draw-cube-wires
                   cube-pos
                   (Vec3-x cube-size)
                   (Vec3-y cube-size)
                   (Vec3-z cube-size)
                   MAROON)
                  (draw-cube-wires
                   cube-pos
                   (+ 0.2 (Vec3-x cube-size))
                   (+ 0.2 (Vec3-y cube-size))
                   (+ 0.2 (Vec3-z cube-size))
                   GREEN))
                (begin
                  (draw-cube
                   cube-pos
                   (Vec3-x cube-size)
                   (Vec3-y cube-size)
                   (Vec3-z cube-size)
                   GRAY)
                  (draw-cube-wires
                   cube-pos
                   (Vec3-x cube-size)
                   (Vec3-y cube-size)
                   (Vec3-z cube-size)
                   DARKGRAY)))

            (when ray
              (draw-ray ray MAROON))

            (draw-grid 10 1.)
            (end-mode-3d))

          (draw-text "Try selecting the box with the mouse!" 240 10 20 DARKGRAY)

          (when collision
            (draw-text "BOX SELECTED"
                       (inexact->exact (/ (- screen-w (measure-text "BOX SELECTED" 30)) 2))
                       (inexact->exact (* screen-h 0.1))
                       30
                       GREEN))

          (draw-fps 10 10)
          (end-drawing))
        (loop)))
    (close-window)))
