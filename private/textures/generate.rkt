#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Image generation functions

;; Image GenImageColor(int width, int height, Color color);
;; Image GenImageGradientV(int width, int height, Color top, Color bottom);
;; Image GenImageGradientH(int width, int height, Color left, Color right);
;; Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
;; Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
;; Image GenImageWhiteNoise(int width, int height, float factor);
;; Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);
;; Image GenImageCellular(int width, int height, int tileSize);
