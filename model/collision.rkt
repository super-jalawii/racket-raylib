#lang racket

(require "../core/structs.rkt"
         "../core/color.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

;;  Detect collision between two spheres
; bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);

;;  Detect collision between two bounding boxes
; bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);

;;  Detect collision between box and sphere
; bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);

;;  Detect collision between ray and sphere
; bool CheckCollisionRaySphere(Ray ray, Vector3 center, float radius);

;;  Detect collision between ray and sphere, returns collision point
; bool CheckCollisionRaySphereEx(Ray ray, Vector3 center, float radius, Vector3 *collisionPoint);

;;  Detect collision between ray and box
; bool CheckCollisionRayBox(Ray ray, BoundingBox box);
(rl check-coll-ray-box [_fun _Ray _BoundingBox -> _bool] #:c-id CheckCollisionRayBox)

;;  Get collision info between ray and model
; RayHitInfo GetCollisionRayModel(Ray ray, Model model);

;;  Get collision info between ray and triangle
; RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);

;;  Get collision info between ray and ground plane (Y-normal plane)
; RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight);
