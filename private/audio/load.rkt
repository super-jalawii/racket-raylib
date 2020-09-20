#lang racket

(require "../struct/audio.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Wave/Sound loading/unloading functions

;  Load wave data from file
;; Wave LoadWave(const char *fileName);

;  Load wave data from raw array data
;; Wave LoadWaveEx(void *data, int sampleCount, int sampleRate, int sampleSize, int channels);

;  Load sound from file
;; Sound LoadSound(const char *fileName);
(rl load-sound [_fun _string -> _Sound] #:c-id LoadSound)

;  Load sound from wave data
;; Sound LoadSoundFromWave(Wave wave);

;  Update sound buffer with new data
;; void UpdateSound(Sound sound, const void *data, int samplesCount);

;  Unload wave data
;; void UnloadWave(Wave wave);

;  Unload sound
;; void UnloadSound(Sound sound);
(rl unload-sound [_fun _Sound -> _void] #:c-id UnloadSound)

;  Export wave data to file
;; void ExportWave(Wave wave, const char *fileName);

;  Export wave sample data to code (.h)
;; void ExportWaveAsCode(Wave wave, const char *fileName);
