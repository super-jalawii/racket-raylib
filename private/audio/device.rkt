#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Audio device management functions

;  Initialize audio device and context
;; void InitAudioDevice(void);
(rl init-audio-device [_fun -> _void] #:c-id InitAudioDevice)

;  Close the audio device and context (and music stream)
;; void CloseAudioDevice(void);
(rl close-audio-device [_fun -> _void] #:c-id CloseAudioDevice)

;  Check if audio device is ready
;; bool IsAudioDeviceReady(void);

;  Set master volume (listener)
;; void SetMasterVolume(float volume);
