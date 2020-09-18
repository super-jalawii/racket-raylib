#lang racket

(require "../core.rkt")


(define [core-ex-01]
  (let ([screen-w 800]
        [screen-h 450])
    (init-window screen-w screen-h "raylib [core] example - basic window")
    (set-target-fps 60)
    (let loop ()
      (unless (window-should-close?)
        (begin-drawing)
        (clear-background RAYWHITE)
        (draw-text "Congrats! You created your first window!" 190 200 20 LIGHTGRAY)
        (end-drawing)
        (loop))
      (close-window))))
