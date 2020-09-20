#lang racket

(require "../struct/audio.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Wave/Sound management functions

;  Play a sound
;; void PlaySound(Sound sound);
(rl play-sound [_fun _Sound -> _void] #:c-id PlaySound)

;  Pause a sound
;; void PauseSound(Sound sound);

;  Resume a paused sound
;; void ResumeSound(Sound sound);

;  Stop playing a sound
;; void StopSound(Sound sound);

;  Check if a sound is currently playing
;; bool IsSoundPlaying(Sound sound);

;  Set volume for a sound (1.0 is max level)
;; void SetSoundVolume(Sound sound, float volume);

;  Set pitch for a sound (1.0 is base level)
;; void SetSoundPitch(Sound sound, float pitch);

;  Convert wave data to desired format
;; void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels);

;  Copy a wave to a new wave
;; Wave WaveCopy(Wave wave);

;  Crop a wave to defined samples range
;; void WaveCrop(Wave *wave, int initSample, int finalSample);

;  Get samples data from wave as a floats array
;; float *GetWaveData(Wave wave);
;  Wave/Sound management functions
;;

;; NOTE: These might be from Raylib 3.0, but at least some of them are in 2.6 (we
;; don't know which ones)

;  Play a sound
;; void PlaySound(Sound sound);

;  Stop playing a sound
;; void StopSound(Sound sound);

;  Pause a sound
;; void PauseSound(Sound sound);

;  Resume a paused sound
;; void ResumeSound(Sound sound);

;  Play a sound (using multichannel buffer pool)
;; void PlaySoundMulti(Sound sound);
(rl play-sound-multi [_fun _Sound -> _void] #:c-id PlaySoundMulti)

;  Stop any sound playing (using multichannel buffer pool)
;; void StopSoundMulti(void);
(rl stop-sound-multi [_fun -> _void] #:c-id StopSoundMulti)

;  Get number of sounds playing in the multichannel
;; int GetSoundsPlaying(void);
(rl sounds-playing [_fun -> _int] #:c-id GetSoundsPlaying)
