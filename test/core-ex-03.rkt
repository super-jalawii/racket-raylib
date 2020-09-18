#lang racket

(require "../core.rkt")

(define [core-ex-03]
  (let* ([screen-w   800]
         [screen-h   450]
         [ball-color DARKBLUE])
    (init-window screen-w screen-h "raylib [core] example - mouse input")
    (set-target-fps 60)
    (let loop ([ball-pos (make-Vec2 -100.0 -100.0)])
      (unless (window-should-close?)
        (cond
          [(mouse-btn-pressed? 'MOUSE_LEFT_BUTTON)   (set! ball-color MAROON)]
          [(mouse-btn-pressed? 'MOUSE_MIDDLE_BUTTON) (set! ball-color LIME)]
          [(mouse-btn-pressed? 'MOUSE_RIGHT_BUTTON)  (set! ball-color DARKBLUE)])
        (begin-drawing)
        (clear-background RAYWHITE)
        (draw-text "move ball with mouse and click mouse button to change color" 10 10 20 DARKGRAY)
        (draw-circle-vec ball-pos 40.0 ball-color)
        (end-drawing)
        (loop (get-mouse-position)))
      (close-window))))
