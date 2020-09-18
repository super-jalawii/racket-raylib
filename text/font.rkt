#lang racket

(require "structs.rkt"
         "../core/structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Get the default Font
;     Font GetFontDefault(void);
(rl get-font-default [_fun -> _Font] #:c-id GetFontDefault)

;;  Load font from file into GPU memory (VRAM)
;     Font LoadFont(const char *fileName);
(rl load-font [_fun _string -> _Font] #:c-id LoadFont)

;;  Load font from file with extended parameters
;     Font LoadFontEx(const char *fileName, int fontSize, int *fontChars, int charsCount);
(rl load-font-ex [_fun _string _int (_ptr i _int) _int -> _Font] #:c-id LoadFontEx)

;;  Load font from Image (XNA style)
;     Font LoadFontFromImage(Image image, Color key, int firstChar);
(rl image->font [_fun _Image _Color _int -> _Font] #:c-id LoadFontFromImage)

;;  Load font data for further use
;     CharInfo *LoadFontData(const char *fileName, int fontSize, int *fontChars, int charsCount, int type);
(rl load-font-data [_fun _string _int (_ptr i _int) _int _int -> (_ptr o _CharInfo)] #:c-id LoadFontData)

;;  Generate image font atlas using chars info
;     Image GenImageFontAtlas(const CharInfo *chars, Rectangle **recs, int charsCount, int fontSize, int padding, int packMethod);
(rl gen-image-font-atlas [_fun (_ptr i _CharInfo) _pointer _int _int _int _int -> _Image] #:c-id GenImageFontAtlas)

;;  Unload Font from GPU memory (VRAM)
;     void UnloadFont(Font font);
(rl unload-font [_fun _Font -> _void] #:c-id UnloadFont)
