#lang racket

(require raylib)


(define width 800)
(define height 450)

(define [ex03]
  (init-window width height "raylib [audio] example")
  (set-target-fps! 60)

  (init-audio-device)

  (let ([fxwav (load-sound "resources/sound.wav")]
        [fxogg (load-sound "resources/tanatana.ogg")])


    (let loop ()
      (unless (window-should-close?)
        (when (key-pressed? 'KEY_SPACE) (play-sound-multi fxwav))
        (when (key-pressed? 'KEY_ENTER) (play-sound-multi fxogg))

        (draw-begin)

        (clear-background WIZARDWHITE)

        (draw-text "Multichannel sound playing" 20 20 20 GRAY)
        (draw-text "Press space to play the wav sound!" 200 120 20 LIGHTGRAY)
        (draw-text "Press enter to play the ogg sound!" 200 180 20 LIGHTGRAY)

        (draw-text (format "Concurrent sounds playing: ~a" (sounds-playing)) 220 280 20 RED)

        (draw-end)
        (loop)))
    (stop-sound-multi)
    (unload-sound fxwav)
    (unload-sound fxogg))
  (close-audio-device)
  (close-window))
