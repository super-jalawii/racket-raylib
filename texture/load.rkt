#lang racket

(require "structs.rkt"
         "../core/structs.rkt"
         "../core/color.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Load image from file into CPU memory (RAM)
; Image LoadImage(const char *fileName);

;;  Load image from Color array data (RGBA - 32bit)
; Image LoadImageEx(Color *pixels, int width, int height);

;;  Load image from raw data with parameters
; Image LoadImagePro(void *data, int width, int height, int format);

;;  Load image from RAW file data
; Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);

;;  Export image data to file
; void ExportImage(Image image, const char *fileName);

;;  Export image as code file defining an array of bytes
; void ExportImageAsCode(Image image, const char *fileName);

;;  Load texture from file into GPU memory (VRAM)
; Texture2D LoadTexture(const char *fileName);
(rl load-tex [_fun _string -> _Texture2D] #:c-id LoadTexture)

;;  Load texture from image data
; Texture2D LoadTextureFromImage(Image image);

;;  Load cubemap from image, multiple image cubemap layouts supported
; TextureCubemap LoadTextureCubemap(Image image, int layoutType);

;;  Load texture for rendering (framebuffer)
; RenderTexture2D LoadRenderTexture(int width, int height);

;;  Unload image from CPU memory (RAM)
; void UnloadImage(Image image);

;;  Unload texture from GPU memory (VRAM)
; void UnloadTexture(Texture2D texture);
(rl unload-tex [_fun _Texture2D -> _void] #:c-id UnloadTexture)

;;  Unload render texture from GPU memory (VRAM)
; void UnloadRenderTexture(RenderTexture2D target);

;;  Get pixel data from image as a Color struct array
; Color *GetImageData(Image image);

;;  Get pixel data from image as Vector4 array (float normalized)
; Vector4 *GetImageDataNormalized(Image image);

;;  Get image alpha border rectangle
; Rectangle GetImageAlphaBorder(Image image, float threshold);

;;  Get pixel data size in bytes (image or texture)
; int GetPixelDataSize(int width, int height, int format);

;;  Get pixel data from GPU texture and return an Image
; Image GetTextureData(Texture2D texture);

;;  Get pixel data from screen buffer and return an Image (screenshot)
; Image GetScreenData(void);

;;  Update GPU texture with new data
; void UpdateTexture(Texture2D texture, const void *pixels);
