#lang racket

(require "../struct/audio.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Music management functions

;  Load music stream from file
;; Music LoadMusicStream(const char *fileName);
(rl load-music-stream [_fun _string -> _Music] #:c-id LoadMusicStream)

;  Unload music stream
;; void UnloadMusicStream(Music music);
(rl unload-music-stream [_fun _Music -> _void] #:c-id UnloadMusicStream)

;  Start music playing
;; void PlayMusicStream(Music music);
(rl play-music-stream [_fun _Music -> _void] #:c-id PlayMusicStream)

;  Updates buffers for music streaming
;; void UpdateMusicStream(Music music);
(rl update-music-stream [_fun _Music -> _void] #:c-id UpdateMusicStream)

;  Stop music playing
;; void StopMusicStream(Music music);
(rl stop-music-stream [_fun _Music -> _void] #:c-id StopMusicStream)

;  Pause music playing
;; void PauseMusicStream(Music music);
(rl pause-music-stream [_fun _Music -> _void] #:c-id PauseMusicStream)

;  Resume playing paused music
;; void ResumeMusicStream(Music music);
(rl resume-music-stream [_fun _Music -> _void] #:c-id ResumeMusicStream)

;  Check if music is playing
;; bool IsMusicPlaying(Music music);

;  Set volume for music (1.0 is max level)
;; void SetMusicVolume(Music music, float volume);

;  Set pitch for a music (1.0 is base level)
;; void SetMusicPitch(Music music, float pitch);

;  Set music loop count (loop repeats)
;; void SetMusicLoopCount(Music music, int count);

;  Get music time length (in seconds)
;; float GetMusicTimeLength(Music music);
(rl music-time-length (_fun _Music -> _float) #:c-id GetMusicTimeLength)

;  Get current music time played (in seconds)
;; float GetMusicTimePlayed(Music music);
(rl music-time-played (_fun _Music -> _float) #:c-id GetMusicTimePlayed)
