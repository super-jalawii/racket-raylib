#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Text strings management functions
;;; NOTE: Some strings allocate memory internally for returned strings, just be careful!

;  Check if two text string are equal
;; bool TextIsEqual(const char *text1, const char *text2);

;  Get text length, checks for '\0' ending
;; unsigned int TextLength(const char *text);

;  Text formatting with variables (sprintf style)
;; const char *TextFormat(const char *text, ...);

;  Get a piece of a text string
;; const char *TextSubtext(const char *text, int position, int length);

;  Replace text string (memory should be freed!)
;; const char *TextReplace(char *text, const char *replace, const char *by);

;  Insert text in a position (memory should be freed!)
;; const char *TextInsert(const char *text, const char *insert, int position);

;  Join text strings with delimiter
;; const char *TextJoin(const char **textList, int count, const char *delimiter);

;  Split text into multiple strings
;; const char **TextSplit(const char *text, char delimiter, int *count);

;  Append text at specific position and move cursor!
;; void TextAppend(char *text, const char *append, int *position);

;  Find first text occurrence within a string
;; int TextFindIndex(const char *text, const char *find);

;  Get upper case version of provided string
;; const char *TextToUpper(const char *text);

;  Get lower case version of provided string
;; const char *TextToLower(const char *text);

;  Get Pascal case notation version of provided string
;; const char *TextToPascal(const char *text);

;  Get integer value from text (negative values not supported)
;; int TextToInteger(const char *text); 
