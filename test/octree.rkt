#lang racket

(require "../core.rkt")
(require "../../ecs/ecs.rkt")
(require "../../datastructures/geom.rkt")
(require "../../datastructures/octree2.rkt")


(ecs:component world BoundingBox (pos dim))
(ecs:component world Camera      (ref pos target up fov type))
(ecs:component world WSLabel     (text v-offset))
(ecs:component world Point       (pos color))

(define [vec3->c v]
  (make-Vec3
   (+ 0. (vec3-x v))
   (+ 0. (vec3-y v))
   (+ 0. (vec3-z v))))

;; This is just a shim to make our bounding box component work as position,
;; dimensions, and bounding area.
;; (define [get-bounds bbox]
;;   (let* ([pos   (BoundingBox-pos bbox)]
;;          [dim   (BoundingBox-dim bbox)]
;;          [x-pos (vec3-x pos)]
;;          [y-pos (vec3-y pos)]
;;          [z-pos (vec3-z pos)])
;;     (bounding-box pos (vec3
;;                        (+ x-pos (vec3-x dim))
;;                        (+ y-pos (vec3-y dim))
;;                        (+ z-pos (vec3-z dim))))))

(define [Camera->Camera3D cam]
  (let ([c3d (make-Camera3D
              (vec3->c (Camera-pos    cam))
              (vec3->c (Camera-target cam))
              (vec3->c (Camera-up     cam))
              (Camera-fov    cam)
              (Camera-type   cam))])
    (set-Camera-ref! cam c3d)
    c3d))


(ecs:entity world (Camera #f
                          (vec3 0 100 10)
                          (vec3 0   0  0)
                          (vec3 0   1  0)
                          45.0 'CAMERA_PERSPECTIVE))


;; Create some initial data for the octree and create corresponding components:

;; (define [random-box #:min [min-size 0]
;;                     #:max [max-size 10]]
;;   (let ([x1 (random min-size max-size)]
;;         [x2 (random min-size max-size)]
;;         [y1 (random min-size max-size)]
;;         [y2 (random min-size max-size)]
;;         [z1 (random min-size max-size)]
;;         [z2 (random min-size max-size)])
;;     (BoundingBox (vec3 (min x1 x2) (min y1 y2) (min z1 z2))
;;                  (vec3 (- (max x1 x2) (min x1 x2))
;;                        (- (max y1 y2) (min y1 y2))
;;                        (- (max z1 z2) (min z1 z2))))))

(define [random-point
         #:min [min-size 0 ]
         #:max [max-size 10]]
  (Point (vec3
          (random min-size max-size)
          (random min-size max-size)
          (random min-size max-size))
         (random-color)))

(define ot (make-octree #:get-bounds (lambda (pt)
                                       (bounding-box (Point-pos pt)
                                                     (Point-pos pt)))
                        #:min-size 0.01
                        #:max-size 10))

(define [random-color]
  (make-Color
   (random 0 255)
   (random 0 255)
   (random 0 255)
   155))

;; FIXME: Change this to points for right now - it will help us to see if things
;; are working a little easier.
(for ([i (in-range 10)])
  (let* ([point (random-point)]
         [pos   (Point-pos point)]
         [label (WSLabel (format "(~a, ~a, ~a)"
                                 (vec3-x pos)
                                 (vec3-y pos)
                                 (vec3-z pos)) 1.0)])
    (ecs:entity world point label)
    (octree-insert! ot point)))

(define [get-camera]
  (car (ecs:select world ([cam Camera]) cam)))

(define [draw-octree tree]
  (octree-map (lambda (node)
                (let* ([bounds (node-bounds node)]

                       ; NOTE: I'm not sure but it looks like cubes are drawn
                       ; centered?? This doesn't seem right, since it looks like
                       ; nothing else is centered this way, but still.

                       [pos    (vec3-subtract (bounding-box-min bounds)
                                              (vec3-scalar-divide (bounding-box-min bounds) 2.0))]
                       [dim    (dimensions bounds)])
                  (draw-cube-wires-vec (vec3->c pos) (vec3->c dim) BLACK))) tree)

  ;; Draw points. Could (maybe should?) do this in the tree.

  (ecs:select world ([point Point])
              (draw-sphere (vec3->c (vec3-subtract (Point-pos point)
                                                   (vec3-scalar-divide (Point-pos point) 2.0))) 0.1 (Point-color point))))

(define [draw-octree-labels tree]
  (let ([cam (get-camera)])
    (octree-map (lambda (node)
                  (let* ([bounds (node-bounds node)]
                         [pos    (bounding-box-min bounds)]
                         [dim    (dimensions bounds)]
                         [ws-pos (get-world->screen (vec3->c pos) (Camera-ref cam))])
                    (draw-text (format "Node: (~a, ~a, ~a)" (vec3-x pos) (vec3-y pos) (vec3-z pos))
                               (exact-truncate (Vec2-x ws-pos)) (exact-truncate (Vec2-y ws-pos))
                               10 BLACK))) tree)))

(define [draw-labels]
  (ecs:select world ([point Point]
                     [label WSLabel])
              (let* ([pos (vec3-subtract (Point-pos point)
                                         (vec3-scalar-divide (Point-pos point) 2.0))]
                     [l-pos (make-Vec3
                             (vec3-x pos)
                             (+ (vec3-y pos) (WSLabel-v-offset label))
                             (vec3-z pos))]
                     [cam (get-camera)]
                     [ws-l-pos (get-world->screen l-pos (Camera-ref cam))])
                (draw-text (WSLabel-text label)
                           (exact-truncate (Vec2-x ws-l-pos))
                           (exact-truncate (Vec2-y ws-l-pos))
                           10
                           (Point-color point)))))
;; (let ([screen-w 800]
;;       [screen-h 600])
;;   (init-window screen-w screen-h "Octree Test")
;;   (set-target-fps 60)

;;   ;; Initialize the camera. I think we have to do this after the window is
;;   ;; initialized.

;;   (ecs:select
;;    world ([ent Entity]
;;           [cam Camera])
;;    (let ([c3d (Camera->Camera3D cam)])
;;      (set-camera-mode c3d 'CAMERA_FREE))))

;; (define [run]
;;   (let loop ()
;;     (unless (window-should-close?)
;;       (next-frame)
;;       (loop))))

;; (define [next-frame]
;;   (let ([c3d (car (ecs:select
;;                    world ([ent Entity]
;;                           [cam Camera])
;;                    (update-camera (Camera-ref cam))
;;                    (Camera-ref cam)))])
;;     (begin
;;       (begin-drawing)
;;       (clear-background RAYWHITE)
;;       (begin
;;         (begin-mode-3d c3d)

;;         (draw-octree ot)
;;         (draw-grid 10 1.)

;;         (end-mode-3d))

;;       (draw-labels)
;;       (draw-octree-labels ot)
;;       (draw-fps 0 0)

;;       (end-drawing))))















(define [game-test]
  (let ([screen-w 800]
        [screen-h 600]
        [camera   (make-Camera3D
                   (make-Vec3 0. 10. 10.)
                   (make-Vec3 0.  0.  0.)
                   (make-Vec3 0.  1.  0.)
                   45.
                   'CAMERA_PERSPECTIVE)]
        [cube-pos (make-Vec3 0.   0.  0.)])
    (init-window screen-w screen-h "Game Test")
    (set-target-fps 60)
    (set-camera-mode camera 'CAMERA_FREE)
    (let ([tileset (load-tex "resources/tileset2.png")]
          )
      (let loop ()
        (unless (window-should-close?)
          (begin
            (begin-drawing)
            (clear-background RAYWHITE)

            
            (begin
              (begin-mode-3d camera)

              ;; How do we draw a quad with a texture rendered to it? Will the
              ;; back of it have a texture? Can we make it have a different
              ;; texture?

              (draw-grid 10 1.)
              (end-mode-3d))

            (draw-tex-pro tileset
                          (make-Rect 0. 64. 32. 32.)
                          (make-Rect 0.  0. 32. 32.)
                          (make-Vec2 0.0 0.0)
                          0.0
                          GRAY)

            (draw-fps 10 10)
            (end-drawing))
          (loop))))
      (close-window)))
