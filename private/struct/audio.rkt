#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

(define-cstruct _AudioStream ([sample-rate _uint]
                              [sample-size _uint]
                              [channels    _uint]
                              [buffer      _pointer]))

(define-cstruct _Music ([ctx-type _int]
                        [ctx-data _pointer]
                        [sample-count _uint]
                        [loop-count   _uint]
                        [stream _AudioStream]) )

;; typedef struct Sound {
;;         unsigned int sampleCount;       // Total number of samples
;;         AudioStream stream;             // Audio stream
;;         } Sound

(define-cstruct _Sound ([sample-count _uint]
                        [stream       _AudioStream]))
