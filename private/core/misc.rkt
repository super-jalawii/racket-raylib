#lang racket

(require "../struct/core.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Setup window configuration flags (view FLAGS)
; void SetConfigFlags(unsigned int flags);
(rl set-config-flags! [_fun _WindowFlags -> _void] #:c-id SetConfigFlags)

;;  Set the current threshold (minimum) log level
; void SetTraceLogLevel(int logType);
(rl set-trace-log-level! [_fun _int -> _void] #:c-id SetTraceLogLevel)

;;  Set the exit threshold (minimum) log level
; void SetTraceLogExit(int logType);
(rl set-trace-log-exit! [_fun _LogType -> _void] #:c-id SetTraceLogExit)

;;  Set a trace log callback to enable custom logging
; void SetTraceLogCallback(TraceLogCallback callback);

;;  Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
; void TraceLog(int logType, const char *text, ...);
;; FIXME: Figure out how to handle the variadic argument list here...
(rl trace-log [_fun _LogType _string -> _void] #:c-id TraceLog)

;;  Takes a screenshot of current screen (saved a .png)
; void TakeScreenshot(const char *fileName);
(rl take-screenshot [_fun _string -> _void] #:c-id TakeScreenshot)

;;  Returns a random value between min and max (both included)
; int GetRandomValue(int min, int max);
(rl random-value [_fun _int _int -> _int] #:c-id GetRandomValue)

