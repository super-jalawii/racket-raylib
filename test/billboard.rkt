#lang racket

(require "../core.rkt")

(define [billboard]
  (let ([screen-w  800]
        [screen-h  450]
        [camera    (make-Camera3D
                    (make-Vec3  5.  4.  5.)
                    (make-Vec3  0.  2.  0.)
                    (make-Vec3  0.  1.  0.)
                    45.
                    'CAMERA_PERSPECTIVE)]
        [bill-pos  (make-Vec3 0. 2. 0.)])
    (init-window screen-w screen-h "raylib [models] example - drawing billboards")
    (set-target-fps 60)
    (set-camera-mode camera 'CAMERA_ORBITAL)
    (let ([tex-bill (load-tex "resources/billboard.png")])
      (let loop ()
        (unless (window-should-close?)
          (update-camera camera)
          (begin
            (begin-drawing)
            (clear-background RAYWHITE)
            (begin
              (begin-mode-3d camera)
              (draw-grid 10 1.)
              (draw-billboard camera tex-bill bill-pos 2. WHITE)
              (end-mode-3d))
            (draw-fps 10 10)
            (end-drawing))
          (loop)))
      (unload-tex tex-bill))
    (close-window)))

(billboard)
