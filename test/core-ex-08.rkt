#lang racket

(require "../core.rkt")


(define [random-color]
  (make-Color
   (get-random-value 200 240)
   (get-random-value 200 240)
   (get-random-value 200 250)
   255))

(define [make-building spacing screen-h]
  (let* ([width  (exact->inexact (get-random-value 50 200))]
         [height (exact->inexact (get-random-value 100 800))]
         [y      (- screen-h 130.0 height)]
         [x      (- spacing 6000.0)])
    (make-Rect x y width height)))

(define [init-buildings max-buildings screen-h]
  (let ([spacing 0])
    (for/list ([i (in-range max-buildings)])
      (let ([building (make-building spacing screen-h)])
        (set! spacing (+ spacing (Rect-w building)))
        (cons building (random-color))))))

(define [core-ex-08]
  (let* ([screen-w      800]
         [screen-h      450]
         [max-buildings 100]
         [player        (make-Rect 400. 280. 40. 40.)]
         [buildings     (init-buildings max-buildings screen-h)]

         ;;; FIXME: This isn't good... I switched around the first two arguments
         ;;; to make-Camera2D to make this work...

         [camera        (make-Camera2D
                         (make-Vec2 (+ 20 (Rect-x player)) (+ 20 (Rect-y player)))
                         (make-Vec2 (/ 2.0 screen-w) (/ 2.0 screen-h))
                         0.0
                         1.0)])
    (init-window screen-w screen-h "raylib [core] example - 2d camera")
    (set-target-fps 60)
    (let loop ()
      (unless (window-should-close?)
        (cond
          [(key-down? 'KEY_RIGHT) (set-Rect-x! player (+ 2 (Rect-x player)))]
          [(key-down? 'KEY_LEFT)  (set-Rect-x! player (- 2 (Rect-x player)))]
          [(key-down? 'KEY_A)     (set-Camera2D-rotation! camera (+ 1 (Camera2D-rotation camera)))]
          [(key-down? 'KEY_S)     (set-Camera2D-rotation! camera (- 1 (Camera2D-rotation camera)))]
          [(key-down? 'KEY_R)     (set-Camera2D-rotation! camera 0.0)
                                  (set-Camera2D-zoom!     camera 1.0)])
        (set-Camera2D-target! camera (make-Vec2 (+ 20 (Rect-x player)) (+ 20 (Rect-y player))))
        (set-Camera2D-zoom!   camera (+ (Camera2D-zoom camera) (* 0.05 (get-mouse-wheel-move))))
        (cond
          [(> (Camera2D-rotation camera)  40) (set-Camera2D-rotation! camera  40.0)]
          [(< (Camera2D-rotation camera) -40) (set-Camera2D-rotation! camera -40.0)])
        (cond
          [(> (Camera2D-zoom camera) 3.0) (set-Camera2D-zoom! camera 3.0)]
          [(< (Camera2D-zoom camera) 0.1) (set-Camera2D-zoom! camera 0.1)])
        (begin
          (begin-drawing)
          (clear-background RAYWHITE)

          (begin
            (begin-mode-2d camera)

            ;; Draw the floor
            (draw-rect -6000 320 13000 8000 DARKGRAY)

            ;; Draw the buildings
            (map (lambda (b) (draw-Rect (car b) (cdr b))) buildings)

            ;; Draw the player
            (draw-Rect player RED)

            ;; Draw the weird crosshairs
            (draw-line
             (inexact->exact (Vec2-x (Camera2D-target camera)))
             (* -1 screen-h 10)
             (inexact->exact (Vec2-x (Camera2D-target camera)))
             (* screen-h 10)
             GREEN)
            (draw-line
             (* -1 screen-w 10)
             (inexact->exact (Vec2-y (Camera2D-target camera)))
             (* screen-w 10)
             (inexact->exact (Vec2-y (Camera2D-target camera)))
             GREEN)

            (end-mode-2d))

          (draw-text "SCREEN AREA" 640 10 20 RED)

          (draw-rect 0              0              screen-w 5               RED)
          (draw-rect 0              5              5        (- 10 screen-h) RED)
          (draw-rect (- 5 screen-w) 5              5        5               RED)
          (draw-rect 0              (- 5 screen-h) screen-w 5               RED)

          (draw-rect 10 10 250 113 (fade SKYBLUE 0.5))
          (draw-rect-lines 10 10 250 113 BLUE)

          (draw-text "Free 2d camera controls: " 20 20 10 BLACK)
          (draw-text "- Right/Left to move Offset" 40 40 10 DARKGRAY)
          (draw-text "- Mouse Wheel to Zoom in-out" 40 60 10 DARKGRAY)
          (draw-text "- A / S to Rotate" 40 80 10 DARKGRAY)
          (draw-text "- R to reset Zoom and Rotation" 40 100 10 DARKGRAY)

          (end-drawing))
        (loop)))
    (close-window)))

