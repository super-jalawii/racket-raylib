#lang racket

(require raylib)


(define screen-width 800)
(define screen-height 450)





(define [ex01]
  (init-window screen-width screen-height "raylib [audio] example")
  (set-target-fps! 60)
  (init-audio-device)

  (let ([song (load-music-stream "resources/guitar_noodling.ogg")]
        [time-played 0.]
        [pause #f])

    (let loop ()
      (unless (window-should-close?)

        (update-music-stream song)

        (when (key-pressed? 'KEY_SPACE)
          (stop-music-stream song)
          (play-music-stream song))

        (when (key-pressed? 'KEY_P)
          (set! pause (not pause))

          (if pause
              (pause-music-stream song)
              (resume-music-stream song)))

        (set! time-played (* 400 (/ (music-time-played song) (music-time-length song))))

        (when (> time-played 400)
          (stop-music-stream song))

        (draw-begin)

        (clear-background WIZARDWHITE)

        (draw-text "Music should be playing!" 255 150 20 LIGHTGRAY)

        (draw-rect 200 200 400 12 LIGHTGRAY)
        (draw-rect 200 200 (exact-truncate time-played) 12 MAROON)
        (draw-rect-lines 200 200 400 12 GRAY)

        (draw-text "Press space to restart music" 214 250 20 LIGHTGRAY)
        (draw-text "Press P to pause/resume music" 208 280 20 LIGHTGRAY)

        (draw-end)

        (loop))

      (unload-music-stream song)
      (close-audio-device)
      (close-window))))
