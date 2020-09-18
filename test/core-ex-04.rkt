#lang racket

(require "../core.rkt")

(define [core-ex-04]
  (let* ([screen-w     800]
         [screen-h     450]
         [scroll-speed 4])
    (init-window screen-w screen-h "raylib [core] example - input mouse wheel")
    (set-target-fps 60)
    (let loop ([box-pos-y (- (/ screen-h 2) 40)])
      (unless (window-should-close?)
        (begin-drawing)
        (clear-background RAYWHITE)
        (draw-text "use mouse wheel to move the cube up and down!" 10 10 20 GRAY)
        (draw-text (format "Box Position Y: ~a" box-pos-y) 10 40 20 LIGHTGRAY)
        (draw-rect (- (/ screen-w 2) 40) box-pos-y 80 80 MAROON)
        (end-drawing)
        (loop (- box-pos-y (* (get-mouse-wheel-move) scroll-speed))))
      (close-window))))
