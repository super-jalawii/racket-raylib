#lang racket

(require "../core/structs.rkt"
         "../core/color.rkt"
         "../drawing/structs.rkt"
         "../texture/structs.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Draw a line in 3D world space
; void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
(rl draw-line-3d [_fun _Vec3 _Vec3 _Color -> _void] #:c-id DrawLine3D)

;;  Draw a point in 3D space, actually a small line
; void DrawPoint3D(Vector3 position, Color color);
(rl draw-point-3d [_fun _Vec3 _Color -> _void] #:c-id DrawPoint3D)

;;  Draw a circle in 3D world space
; void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
(rl draw-circle-3d [_fun _Vec3 _float _Vec3 _float _Color -> _void] #:c-id DrawCircle3D)

;;  Draw cube
; void DrawCube(Vector3 position, float width, float height, float length, Color color);
(rl draw-cube [_fun _Vec3 _float _float _float _Color -> _void] #:c-id DrawCube)

;;  Draw cube (Vector version)
; void DrawCubeV(Vector3 position, Vector3 size, Color color);
(rl draw-cube-vec [_fun _Vec3 _Vec3 _Color -> _void] #:c-id DrawCubeV)

;;  Draw cube wires
; void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
(rl draw-cube-wires [_fun _Vec3 _float _float _float _Color -> _void] #:c-id DrawCubeWires)

;;  Draw cube wires (Vector version)
; void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
(rl draw-cube-wires-vec [_fun _Vec3 _Vec3 _Color -> _void] #:c-id DrawCubeWiresV)

;;  Draw cube textured
; void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);
(rl draw-cube-tex [_fun _Texture2D _Vec3 _float _float _float _Color -> _void] #:c-id DrawCubeTexture)

;;  Draw sphere
; void DrawSphere(Vector3 centerPos, float radius, Color color);
(rl draw-sphere [_fun _Vec3 _float _Color -> _void] #:c-id DrawSphere)

;;  Draw sphere with extended parameters
; void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);
(rl draw-sphere-ex [_fun _Vec3 _float _int _int _Color -> _void] #:c-id DrawSphereEx)

;;  Draw sphere wires
; void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);
(rl draw-sphere-wires [_fun _Vec3 _float _int _int _Color -> _void] #:c-id DrawSphereWires)

;;  Draw a cylinder/cone
; void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
(rl draw-cyl [_fun _Vec3 _float _float _float _int _Color -> _void] #:c-id DrawCylinder)

;;  Draw a cylinder/cone wires
; void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
(rl draw-cyl-wires [_fun _Vec3 _float _float _float _int _Color -> _void] #:c-id DrawCylinderWires)

;;  Draw a plane XZ
; void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
(rl draw-plane [_fun _Vec3 _Vec2 _Color -> _void] #:c-id DrawPlane)

;;  Draw a ray line
; void DrawRay(Ray ray, Color color);
(rl draw-ray [_fun _Ray _Color -> _void] #:c-id DrawRay)

;;  Draw a grid (centered at (0, 0, 0))
; void DrawGrid(int slices, float spacing);
(rl draw-grid [_fun _int _float -> _void] #:c-id DrawGrid)

;;  Draw simple gizmo
; void DrawGizmo(Vector3 position);
(rl draw-gizmo [_fun _Vec3 -> _void] #:c-id DrawGizmo)

;;  Draw a model (with texture if set)
; void DrawModel(Model model, Vector3 position, float scale, Color tint);

;;  Draw a model with extended parameters
; void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);

;;  Draw a model wires (with texture if set)
; void DrawModelWires(Model model, Vector3 position, float scale, Color tint);

;;  Draw a model wires (with texture if set) with extended parameters
; void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);

;;  Draw bounding box (wires)
; void DrawBoundingBox(BoundingBox box, Color color);

;;  Draw a billboard texture
; void DrawBillboard(Camera camera, Texture2D texture, Vector3 center, float size, Color tint);
(rl draw-billboard [_fun _Camera3D _Texture2D _Vec3 _float _Color -> _void] #:c-id DrawBillboard)

;;  Draw a billboard texture defined by sourceRec
; void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint);
(rl draw-billboard-rect [_fun _Camera3D _Texture2D _Rect _Vec3 _float _Color -> _void] #:c-id DrawBillboardRec)
