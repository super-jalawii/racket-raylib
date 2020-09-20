#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; AudioStream management functions

;  Init audio stream (to stream raw audio pcm data)
;; AudioStream InitAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels);

;  Update audio stream buffers with data
;; void UpdateAudioStream(AudioStream stream, const void *data, int samplesCount);

;  Close audio stream and free memory
;; void CloseAudioStream(AudioStream stream);

;  Check if any audio stream buffers requires refill
;; bool IsAudioBufferProcessed(AudioStream stream);

;  Play audio stream
;; void PlayAudioStream(AudioStream stream);

;  Pause audio stream
;; void PauseAudioStream(AudioStream stream);

;  Resume audio stream
;; void ResumeAudioStream(AudioStream stream);

;  Check if audio stream is playing
;; bool IsAudioStreamPlaying(AudioStream stream);

;  Stop audio stream
;; void StopAudioStream(AudioStream stream);

;  Set volume for audio stream (1.0 is max level)
;; void SetAudioStreamVolume(AudioStream stream, float volume);

;  Set pitch for audio stream (1.0 is base level)
;; void SetAudioStreamPitch(AudioStream stream, float pitch);
