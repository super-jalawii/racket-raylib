#lang racket

(require raylib)

(define width 800)
(define height 450)

(define [ex02]
  (init-window 800 450 "raylib [audio] example")
  (set-target-fps! 60)
  (init-audio-device)

  (let ([fxwav (load-sound "resources/sound.wav")]
        [fxogg (load-sound "resources/tanatana.ogg")])

    (let loop ()
      (unless (window-should-close?)

        (when (key-pressed? 'KEY_SPACE)
          (play-sound fxwav))

        (when (key-pressed? 'KEY_ENTER)
          (play-sound fxogg))

        (draw-begin)

        (clear-background WIZARDWHITE)

        (draw-text "Press space to play the wav sound!" 200 180 20 LIGHTGRAY)
        (draw-text "Press enter to play the ogg sound!" 200 220 20 LIGHTGRAY)

        (draw-end)
        (loop)))
    (unload-sound fxwav)
    (unload-sound fxogg))

  (close-audio-device)
  (close-window))
