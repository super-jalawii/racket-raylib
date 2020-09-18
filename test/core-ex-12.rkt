#lang racket

(require "../core.rkt")

(define [random-color]
  (make-Color
   (get-random-value 20 255)
   (get-random-value 10 55)
   30
   255))


(define [make-column]
  (let* ([height (exact->inexact (get-random-value 1 12))]
         [position (make-Vec3
                    (exact->inexact (get-random-value -15 15))
                    (/ height 2)
                    (exact->inexact (get-random-value -15 15)))]
         [color (random-color)])
    (cons height (cons position color))))

(define [init-columns max-columns]
  (for/list ([i (in-range max-columns)])
    (make-column)))

(define [core-ex-12]
  (let* ([screen-w    800]
         [screen-h    450]
         [max-columns 20]
         [camera   (make-Camera3D
                    (make-Vec3  4.  2.  4.)
                    (make-Vec3  0.  1.8 0.)
                    (make-Vec3  0.  1.  0.)
                    60.
                    'CAMERA_PERSPECTIVE)]
         [columns (init-columns max-columns)])
    (init-window screen-w screen-h "raylib [core] example - 3d camera first person")
    (set-target-fps 60)
    (set-camera-mode camera 'CAMERA_FIRST_PERSON)
    (let loop ()
      (unless (window-should-close?)
        (update-camera camera)
        (begin
          (begin-drawing)
          (clear-background RAYWHITE)
          (begin
            (begin-mode-3d camera)

            (draw-plane (make-Vec3  0.  0.   0.) (make-Vec2 32. 32.) LIGHTGRAY)
            (draw-cube (make-Vec3 -16.0 2.5  0.)   1. 5. 32. BLUE)
            (draw-cube (make-Vec3  16.0 2.5  0.)   1. 5. 32. LIME)
            (draw-cube (make-Vec3   0.  2.5 16.0) 32. 5.  1. GOLD)

            (map (lambda (c)
                   (draw-cube
                    (car (cdr c))
                    2.
                    (car c)
                    2.
                    (cdr (cdr c)))
                   (draw-cube-wires
                    (car (cdr c))
                    2.
                    (car c)
                    2.
                    MAROON))
                 columns)

            (end-mode-3d))

          (draw-rect 10 10 320 133 (fade SKYBLUE 0.5))
          (draw-rect-lines 10 10 320 133 BLUE)

          (draw-fps 10 10)

          (end-drawing))
        (loop)))
    (close-window)))
