#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Window-related functions

;;  Initialize window and OpenGL context
; void InitWindow(int width, int height, const char *title);
(rl init-window [_fun _int _int _string -> _void] #:c-id InitWindow)

;;  Check if KEY_ESCAPE pressed or Close icon pressed
; bool WindowShouldClose(void);
(rl window-should-close? [_fun -> _bool] #:c-id WindowShouldClose)

;;  Close window and unload OpenGL context
; void CloseWindow(void);
(rl close-window [_fun -> _void] #:c-id CloseWindow)

;;  Check if window has been initialized successfully
; bool IsWindowReady(void);
(rl window-ready? [_fun -> _bool] #:c-id IsWindowReady)

;;  Check if window has been minimized (or lost focus)
; bool IsWindowMinimized(void);
(rl window-minimized? [_fun -> _bool] #:c-id IsWindowMinimized)

;;  Check if window has been resized
; bool IsWindowResized(void);
(rl window-resized? [_fun -> _bool] #:c-id IsWindowResized)

;;  Check if window is currently hidden
; bool IsWindowHidden(void);
(rl window-hidden? [_fun -> _bool] #:c-id IsWindowHidden)

;;  Toggle fullscreen mode (only PLATFORM_DESKTOP)
; void ToggleFullscreen(void);
(rl toggle-fullscreen [_fun -> _void] #:c-id ToggleFullscreen)

;;  Show the window
; void UnhideWindow(void);
(rl unhide-window [_fun -> _void] #:c-id UnhideWindow)

;;  Hide the window
; void HideWindow(void);
(rl hide-window [_fun -> _void] #:c-id HideWindow)

;;  Set icon for window (only PLATFORM_DESKTOP)
; void SetWindowIcon(Image image);

;;  Set title for window (only PLATFORM_DESKTOP)
; void SetWindowTitle(const char *title);
(rl set-window-title! [_fun _string -> _void] #:c-id SetWindowTitle)

;;  Set window position on screen (only PLATFORM_DESKTOP)
; void SetWindowPosition(int x, int y);
(rl set-window-position! [_fun _int _int -> _void] #:c-id SetWindowPosition)

;;  Set monitor for the current window (fullscreen mode)
; void SetWindowMonitor(int monitor);
(rl set-window-monitor! [_fun _int -> _void] #:c-id SetWindowMonitor)

;;  Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
; void SetWindowMinSize(int width, int height);
(rl set-window-min-size! [_fun _int _int -> _void] #:c-id SetWindowMinSize)

;;  Set window dimensions
; void SetWindowSize(int width, int height);
(rl set-window-size! [_fun _int _int -> _void] #:c-id SetWindowSize)

;;  Get native window handle
; void *GetWindowHandle(void);
(rl get-window* [_fun -> _void] #:c-id GetWindowHandle)

;;  Get current screen width
; int GetScreenWidth(void);
(rl screen-width [_fun -> _int] #:c-id GetScreenWidth)

;;  Get current screen height
; int GetScreenHeight(void);
(rl screen-height [_fun -> _int] #:c-id GetScreenHeight)

;;  Get number of connected monitors
; int GetMonitorCount(void);
(rl monitor-count [_fun -> _int] #:c-id GetMonitorCount)

;;  Get primary monitor width
; int GetMonitorWidth(int monitor);
(rl monitor-width [_fun _int -> _int] #:c-id GetMonitorWidth)

;;  Get primary monitor height
; int GetMonitorHeight(int monitor);
(rl monitor-height [_fun _int -> _int] #:c-id GetMonitorHeight)

;;  Get primary monitor physical width in millimetres
; int GetMonitorPhysicalWidth(int monitor);
(rl monitor-physical-width [_fun _int -> _int] #:c-id GetMonitorPhysicalWidth)

;;  Get primary monitor physical height in millimetres
; int GetMonitorPhysicalHeight(int monitor);
(rl monitor-physical-height [_fun _int -> _int] #:c-id GetMonitorPhysicalHeight)

;;  Get window position XY on monitor
; Vector2 GetWindowPosition(void);

;;  Get the human-readable, UTF-8 encoded name of the primary monitor
; const char *GetMonitorName(int monitor);
(rl monitor-name [_fun _int -> _string] #:c-id GetMonitorName)

;;  Get clipboard text content
; const char *GetClipboardText(void);
(rl clipboard-text [_fun -> _string] #:c-id GetClipboardText)

;;  Set clipboard text content
; void SetClipboardText(const char *text);
(rl set-clipboard-text! [_fun _string -> _void] #:c-id SetClipboardText)
