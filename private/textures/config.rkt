#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Texture2D configuration functions

;  Generate GPU mipmaps for a texture
;; void GenTextureMipmaps(Texture2D *texture);

;  Set texture scaling filter mode
;; void SetTextureFilter(Texture2D texture, int filterMode);

;  Set texture wrapping mode
;; void SetTextureWrap(Texture2D texture, int wrapMode);
