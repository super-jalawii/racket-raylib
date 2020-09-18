#lang racket

(require "../core.rkt")

(define [core-ex-11]
  (let ([screen-w 800]
        [screen-h 450]
        [camera   (make-Camera3D
                   (make-Vec3 10. 10. 10.)
                   (make-Vec3  0.  0.  0.)
                   (make-Vec3  0.  1.  0.)
                   45.
                   'CAMERA_PERSPECTIVE)]
        [cube-pos (make-Vec3 0.   0.  0.)])
    (init-window screen-w screen-h "raylib [core] example - 3d camera mode")
    (set-target-fps 60)
    (set-camera-mode camera 'CAMERA_FREE)
    (let loop ()
      (unless (window-should-close?)
        (update-camera camera)
        (when (key-down? 'KEY_Z)
          (set-Camera3D-target! camera (make-Vec3 0. 0. 0.)))
        (begin
          (begin-drawing)
          (clear-background RAYWHITE)
          (begin
            (begin-mode-3d camera)
            (draw-cube       cube-pos 2. 2. 2. RED)
            (draw-cube-wires cube-pos 2. 2. 2. DARKGRAY)
            (draw-grid 10 1.)
            (end-mode-3d))

          (draw-rect 10 10 320 133 (fade SKYBLUE 0.5))
          (draw-rect-lines 10 10 320 133 BLUE)

          (draw-text "Free camera default controls" 20 20 10 BLACK)
          (draw-text "- Mouse wheel to zoom in/out" 40 40 10 DARKGRAY)
          (draw-text "- Mouse wheel pressed to pan" 40 60 10 DARKGRAY)
          (draw-text "- Alt + Mouse wheel pressed to rotate" 40 80 10 DARKGRAY)
          (draw-text "- Alt + Ctrl + Mouse wheel pressed for smooth zoom" 40 100 10 DARKGRAY)
          (draw-text "- Z to zoom to (0, 0, 0)" 40 120 10 DARKGRAY)

          ;; (draw-fps 10 10)
          (end-drawing))
        (loop)))
    (close-window)))
