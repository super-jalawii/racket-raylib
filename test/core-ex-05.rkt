#lang racket

(require "../core.rkt")

(define [core-ex-05]
  (let* ([screen-w     800]
         [screen-h     450])
    (set-config-flags 'FLAG_MSAA_4X_HINT)
    (init-window screen-w screen-h "raylib [core] example - gamepad input")
    (set-target-fps 60)

    ;; NOTE: You cannot load a texture before the window is initialized.

    (let ([tex-ps3-pad (load-tex "resources/ps3.png")])
      (let loop ()
        (unless (window-should-close?)
          (begin-drawing)
          (clear-background RAYWHITE)
          (when (gamepad-available? 'GAMEPAD_PLAYER1)
            (draw-tex tex-ps3-pad 0 0 DARKGRAY)
            (draw-text (format "Gamepad Name: ~a" (get-gamepad-name 'GAMEPAD_PLAYER1)) 10 40 20 BLACK)

            ;; FIXME: None of this seems to work and I don't know if it's
            ;; because my gamepad is 8bitdo or because it doesn't work in the
            ;; more general case of gamepads at all. Since keyboard input
            ;; doesn't work either, I'm not going to spend a lot of time working
            ;; on this right now.

            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_MIDDLE)      (draw-circle 396 222 13 RED))
            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_MIDDLE_LEFT) (draw-rect 328 170 32 13 RED))
            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_MIDDLE_RIGHT) (draw-tri
                                                                                     (make-Vec2 436.0 168.0)
                                                                                     (make-Vec2 436.0 185.0)
                                                                                     (make-Vec2 464.0 177.0)
                                                                                     RED))

            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_RIGHT_FACE_UP)    (draw-circle 557 144 13 LIME))
            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_RIGHT_FACE_RIGHT) (draw-circle 586 173 13 RED))
            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_RIGHT_FACE_DOWN)  (draw-circle 557 203 13 VIOLET))
            (when (gamepad-btn-down? 'GAMEPAD_PLAYER1 'GAMEPAD_BUTTON_RIGHT_FACE_LEFT)  (draw-circle 527 173 13 PINK))



            )
          (end-drawing)
          (loop)))
      (unload-tex tex-ps3-pad)
      (close-window))))

