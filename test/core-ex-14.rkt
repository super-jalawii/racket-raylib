#lang racket

(require "../core.rkt")

(define [core-ex-14]
  (let ([screen-w  800]
        [screen-h  450]
        [camera    (make-Camera3D
                    (make-Vec3 10. 10. 10.)
                    (make-Vec3  0.  0.  0.)
                    (make-Vec3  0.  1.  0.)
                    45.
                    'CAMERA_PERSPECTIVE)]
        [cube-pos  (make-Vec3 0. 0. 0.)]
        [cube-screen-pos (make-Vec2 0. 0.)])
    (init-window screen-w screen-h "raylib [core] example - 3d camera free")
    (set-target-fps 60)
    (set-camera-mode camera 'CAMERA_FREE)
    (let loop ()
      (unless (window-should-close?)
        (update-camera camera)
        (set! cube-screen-pos
              (get-world->screen
               (make-Vec3
                (Vec3-x cube-pos)
                (+ 2.5 (Vec3-y cube-pos))
                (Vec3-z cube-pos))
               camera))
        (begin
          (begin-drawing)
          (clear-background RAYWHITE)
          (begin
            (begin-mode-3d camera)

            (draw-cube cube-pos 2. 2. 2. RED)
            (draw-cube-wires cube-pos 2. 2. 2. MAROON)
            (draw-grid 10 1.)

            (end-mode-3d))

          (draw-text "Enemy: 100 / 100"
                     (exact-truncate
                      (- (Vec2-x cube-screen-pos)
                         (/ (measure-text "Enemy: 100/100" 20) 2)))
                     (exact-truncate
                      (Vec2-y cube-screen-pos))
                     20
                     BLACK)

          (draw-fps 10 10)
          (end-drawing))
        (loop)))
    (close-window)))
