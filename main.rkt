#lang racket/base

(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included a LICENSE.txt file, which links to
;; the GNU Lesser General Public License.
;; If you would prefer to use a different license, replace LICENSE.txt with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here

(module+ test
  ;; Tests to be run with raco test
  )

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  )

;;;;; TESTING ---------------

;; FIXME: See note about key-down? above...
(define [input-keys]
  (let ([screen-width 800]
        [screen-height 450])
    (init-window screen-width screen-height "raylib test")
    (set-target-fps 60)
    (toggle-fullscreen)
    (begin-drawing)
    (clear-background WHITE)
    (end-drawing)
    (let loop ([ball-pos (make-Vec2 (/ screen-width 2.0) (/ screen-height 2.0))])
      (cond
        [(key-down? 'KEY_RIGHT) (set-Vec2-x! ball-pos (+ (Vec2-x ball-pos) 2.0))])
      (begin
        (begin-drawing)
        (clear-background WHITE)
        (draw-circle-vec2 ball-pos 10.0 LIGHTGRAY)
        (end-drawing))
      (unless (key-down? 'KEY_L) (loop)))))
