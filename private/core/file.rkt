#lang racket

(require "../struct/core.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Load file data as byte array (read)
; unsigned char *LoadFileData(const char *fileName, int *bytesRead);
; (rl *load-file-data [_fun _string _pointer -> _pointer] #:c-id LoadFileData)

;;  Save data to file from byte array (write)
; void SaveFileData(const char *fileName, void *data, int bytesToWrite);
; (rl save-file-data [_fun _string _pointer _int -> _void] #:c-id SaveFileData)

;;  Load text data from file (read), returns a '\0' terminated string
; char *LoadFileText(const char *fileName);
; (rl *load-file-text [_fun _string -> _string] #:c-id LoadFileText)

;;  Save text data to file (write), string must be '\0' terminated
; void SaveFileText(const char *fileName, char *text);
; (rl save-file-text [_fun _string _string -> _void] #:c-id SaveFileText)

;;  Check if file exists
; bool FileExists(const char *fileName);
(rl file-exists? [_fun _string -> _bool] #:c-id FileExists)

;;  Check file extension
; bool IsFileExtension(const char *fileName, const char *ext);
(rl file-ext? [_fun _string _string -> _bool] #:c-id IsFileExtension)

;;  Check if a directory path exists
; bool DirectoryExists(const char *dirPath);
(rl dir-exists? [_fun _string -> _bool] #:c-id DirectoryExists)

;;  Get pointer to extension for a filename string
; const char *GetExtension(const char *fileName);
(rl filename-ext [_fun _string -> _string] #:c-id GetExtension)

;;  Get pointer to filename for a path string
; const char *GetFileName(const char *filePath);
(rl filename [_fun _string -> _string] #:c-id GetFileName)

;;  Get filename string without extension (uses static string)
; const char *GetFileNameWithoutExt(const char *filePath);
(rl filename-w/o-ext [_fun _string -> _string] #:c-id GetFileNameWithoutExt)

;;  Get full path for a given fileName with path (uses static string)
; const char *GetDirectoryPath(const char *filePath);
(rl filename-dir [_fun _string -> _string] #:c-id GetDirectoryPath)

;;  Get previous directory path for a given path (uses static string)
; const char *GetPrevDirectoryPath(const char *dirPath);
(rl filename-prev-dir [_fun _string -> _string] #:c-id GetPrevDirectoryPath)

;;  Get current working directory (uses static string)
; const char *GetWorkingDirectory(void);
(rl working-dir [_fun -> _string] #:c-id GetWorkingDirectory)

;;  Get filenames in a directory path (memory should be freed)
; char **GetDirectoryFiles(const char *dirPath, int *count);

;;  Clear directory files paths buffers (free memory)
; void ClearDirectoryFiles(void);

;;  Change working directory, returns true if success
; bool ChangeDirectory(const char *dir);
(rl change-dir [_fun _string -> _bool] #:c-id ChangeDirectory)

;;  Check if a file has been dropped into window
; bool IsFileDropped(void);
(rl file-dropped? [_fun -> _bool] #:c-id IsFileDropped)

;;  Get dropped files names (memory should be freed)
; char **GetDroppedFiles(int *count);

;;  Clear dropped files paths buffer (free memory)
; void ClearDroppedFiles(void);

;;  Get file modification time (last write time)
; long GetFileModTime(const char *fileName);
(rl file-mod-time [_fun _string -> _long] #:c-id GetFileModTime)

;;  Compress data (DEFLATE algorythm)
; unsigned char *CompressData(unsigned char *data, int dataLength, int *compDataLength);
(rl compress-data [_fun _pointer _int _pointer -> _pointer] #:c-id CompressData)

;;  Decompress data (DEFLATE algorythm)
; unsigned char *DecompressData(unsigned char *compData, int compDataLength, int *dataLength);
(rl decompress-data [_fun _pointer _int _pointer -> _pointer] #:c-id DecompressData)

