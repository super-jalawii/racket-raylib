#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;; Image manipulation functions

;  Create an image duplicate (useful for transformations)
;; Image ImageCopy(Image image);

;  Convert image to POT (power-of-two)
;; void ImageToPOT(Image *image, Color fillColor);

;  Convert image data to desired format
;; void ImageFormat(Image *image, int newFormat);

;  Apply alpha mask to image
;; void ImageAlphaMask(Image *image, Image alphaMask);

;  Clear alpha channel to desired color
;; void ImageAlphaClear(Image *image, Color color, float threshold);

;  Crop image depending on alpha value
;; void ImageAlphaCrop(Image *image, float threshold);

;  Premultiply alpha channel
;; void ImageAlphaPremultiply(Image *image);

;  Crop an image to a defined rectangle
;; void ImageCrop(Image *image, Rectangle crop);

;  Resize image (Bicubic scaling algorithm)
;; void ImageResize(Image *image, int newWidth, int newHeight);

;  Resize image (Nearest-Neighbor scaling algorithm)
;; void ImageResizeNN(Image *image, int newWidth,int newHeight);

;  Resize canvas and fill with color
;; void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);

;  Generate all mipmap levels for a provided image
;; void ImageMipmaps(Image *image);

;  Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
;; void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);

;  Extract color palette from image to maximum size (memory should be freed)
;; Color *ImageExtractPalette(Image image, int maxPaletteSize, int *extractCount);

;  Create an image from text (default font)
;; Image ImageText(const char *text, int fontSize, Color color);

;  Create an image from text (custom sprite font)
;; Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);

;  Draw a source image within a destination image
;; void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec);

;  Draw rectangle within an image
;; void ImageDrawRectangle(Image *dst, Rectangle rec, Color color);

;  Draw rectangle lines within an image
;; void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);

;  Draw text (default font) within an image (destination)
;; void ImageDrawText(Image *dst, Vector2 position, const char *text, int fontSize, Color color);

;  Draw text (custom sprite font) within an image (dest
;; void ImageDrawTextEx(Image *dst, Vector2 position, Font font, const char *text, float fontSize, float spacing, Color color);

;  Flip image vertically
;; void ImageFlipVertical(Image *image);

;  Flip image horizontally
;; void ImageFlipHorizontal(Image *image);

;  Rotate image clockwise 90deg
;; void ImageRotateCW(Image *image);

;  Rotate image counter-clockwise 90deg
;; void ImageRotateCCW(Image *image);

;  Modify image color: tint
;; void ImageColorTint(Image *image, Color color);

;  Modify image color: invert
;; void ImageColorInvert(Image *image);

;  Modify image color: grayscale
;; void ImageColorGrayscale(Image *image);

;  Modify image color: contrast (-100 to 100)
;; void ImageColorContrast(Image *image, float contrast);

;  Modify image color: brightness (-255 to 255)
;; void ImageColorBrightness(Image *image, int brightness);

;  Modify image color: replace color
;; void ImageColorReplace(Image *image, Color color, Color replace);
