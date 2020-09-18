#lang racket

(require "../core.rkt")

;;;; FIXME: This one doesn't work because all keys report being pressed. This might be an i3 thing??

(define [core-ex-02]
  (let* ([screen-w 800]
        [screen-h 450]
        [ball-pos (make-Vec2 (/ screen-w 2.0) (/ screen-h 2.0))])
    (init-window screen-w screen-h "raylib [core] example - keyboard input")
    (set-target-fps 60)
    (let loop ()
      (unless (window-should-close?)
        (cond
          [(key-down? 'KEY_RIGHT) (set-Vec2-x! ball-pos (+ (Vec2-x ball-pos) 2.0))]
          [(key-down? 'KEY_LEFT)  (set-Vec2-x! ball-pos (- (Vec2-x ball-pos) 2.0))]
          [(key-down? 'KEY_UP)    (set-Vec2-y! ball-pos (- (Vec2-y ball-pos) 2.0))]
          [(key-down? 'KEY_DOWN)  (set-Vec2-y! ball-pos (+ (Vec2-y ball-pos) 2.0))])
        (begin-drawing)
        (clear-background RAYWHITE)
        (draw-text "move the ball with arrow keys" 10 10 20 DARKGRAY)
        (draw-circle-vec ball-pos 50.0 MAROON)
        (end-drawing)
        (loop))
      (close-window))))

