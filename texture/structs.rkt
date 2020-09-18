#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(provide (all-defined-out))

(define-cstruct
  _Texture2D ([id      _uint]
              [width   _int]
              [height  _int]
              [mipmaps _int]
              [format  _int]))

