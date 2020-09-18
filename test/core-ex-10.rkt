#lang racket

(require "../core.rkt")
(require "../../datastructures/octree2.rkt")

(define [core-ex-10]
  (let ([screen-w 800]
        [screen-h 450]
        [camera   (make-Camera3D
                   (make-Vec3 0. 10. 10.)
                   (make-Vec3 0.  0.  0.)
                   (make-Vec3 0.  1.  0.)
                   45.
                   'CAMERA_PERSPECTIVE)]
        [cube-pos (make-Vec3 0.   0.  0.)])
    (init-window screen-w screen-h "raylib [core] example - 3d camera mode")
    (set-target-fps 60)
    (let loop ()
      (unless (window-should-close?)
        (begin
          (begin-drawing)
          (clear-background RAYWHITE)
          (begin
            (begin-mode-3d camera)
            (draw-cube       cube-pos 2. 2. 2. RED)
            (draw-cube-wires cube-pos 2. 2. 2. DARKGRAY)
            (draw-grid 10 1.)
            (end-mode-3d))
          (draw-text "Welcome to the third dimension!" 10 40 20 DARKGRAY)
          (draw-fps 10 10)
          (end-drawing))
        (loop)))
    (close-window)))
