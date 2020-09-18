#lang racket

(require "core/structs.rkt"
         "core/window.rkt"
         "core/cursor.rkt"
         "core/color.rkt"
         "core/drawing.rkt"
         "core/file.rkt"
         "core/screenspace.rkt"
         "core/util.rkt"
         "core/camera.rkt"
         "core/timing.rkt"
         "draw.rkt"
         "input.rkt"
         "text.rkt"
         "texture.rkt"
         "model.rkt")

(provide (all-from-out
          "core/structs.rkt"
          "core/window.rkt"
          "core/cursor.rkt"
          "core/color.rkt"
          "core/drawing.rkt"
          "core/file.rkt"
          "core/screenspace.rkt"
          "core/util.rkt"
          "core/camera.rkt"
          "core/timing.rkt"
          "draw.rkt"
          "input.rkt"
          "text.rkt"
          "texture.rkt"
          "model.rkt"))

;;  Persistent storage management
;

;;  Load integer value from storage file (from defined position)
; int LoadStorageValue(int position);

;;  Save integer value to storage file (to defined position)
; void SaveStorageValue(int position, int value);


;;  Open URL with default system browser (if available)
; void OpenURL(const char *url);


