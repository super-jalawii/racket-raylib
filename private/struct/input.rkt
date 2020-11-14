#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer rl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) rl))

(define _MouseButton
  (_enum '(
           MOUSE_LEFT_BUTTON   = 0
           MOUSE_RIGHT_BUTTON  = 1
           MOUSE_MIDDLE_BUTTON = 2)))

(define _GamepadNumber
  (_enum '(
           GAMEPAD_PLAYER1 = 0
           GAMEPAD_PLAYER2 = 1
           GAMEPAD_PLAYER3 = 2
           GAMEPAD_PLAYER4 = 3)))

(define _GamepadButton
  (_enum '(
    GAMEPAD_BUTTON_UNKNOWN = 0

    ;; This is normally a DPAD
    GAMEPAD_BUTTON_LEFT_FACE_UP
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT
    GAMEPAD_BUTTON_LEFT_FACE_DOWN
    GAMEPAD_BUTTON_LEFT_FACE_LEFT

    ;; This normally corresponds with PlayStation and Xbox controllers
    ;; XBOX: [YX A,B]
    ;; PS3: [TriangleSquare Cross,Circle]
    ;; No support for 6 button controllers though..
    GAMEPAD_BUTTON_RIGHT_FACE_UP
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT

    ;; Triggers
    GAMEPAD_BUTTON_LEFT_TRIGGER_1
    GAMEPAD_BUTTON_LEFT_TRIGGER_2
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2

    ;; These are buttons in the center of the gamepad
    GAMEPAD_BUTTON_MIDDLE_LEFT     ;;PS3 Select
    GAMEPAD_BUTTON_MIDDLE          ;;PS Button/XBOX Button
    GAMEPAD_BUTTON_MIDDLE_RIGHT    ;;PS3 Start

    ;; These are the joystick press in buttons
    GAMEPAD_BUTTON_LEFT_THUMB
    GAMEPAD_BUTTON_RIGHT_THUMB)))

(define _GamepadAxis
  (_enum '(
          ;; This is here just for error checking
          GAMEPAD_AXIS_UNKNOWN = 0

          ;; Left stick
          GAMEPAD_AXIS_LEFT_X
          GAMEPAD_AXIS_LEFT_Y

          ;; Right stick
          GAMEPAD_AXIS_RIGHT_X
          GAMEPAD_AXIS_RIGHT_Y

          ;; Pressure levels for the back triggers
          GAMEPAD_AXIS_LEFT_TRIGGER       ;; [1..-1] (pressure-level)
          GAMEPAD_AXIS_RIGHT_TRIGGER      ;; [1..-1] (pressure-level)
          )))

(define _KeyboardKey
  (_enum '(
    KEY_NONE = 0
    ;KEY_NONE            = 4294967295
    KEY_APOSTROPHE      = 39
    KEY_COMMA           = 44
    KEY_MINUS           = 45
    KEY_PERIOD          = 46
    KEY_SLASH           = 47
    KEY_ZERO            = 48
    KEY_ONE             = 49
    KEY_TWO             = 50
    KEY_THREE           = 51
    KEY_FOUR            = 52
    KEY_FIVE            = 53
    KEY_SIX             = 54
    KEY_SEVEN           = 55
    KEY_EIGHT           = 56
    KEY_NINE            = 57
    KEY_SEMICOLON       = 59
    KEY_EQUAL           = 61
    KEY_A               = 65
    KEY_B               = 66
    KEY_C               = 67
    KEY_D               = 68
    KEY_E               = 69
    KEY_F               = 70
    KEY_G               = 71
    KEY_H               = 72
    KEY_I               = 73
    KEY_J               = 74
    KEY_K               = 75
    KEY_L               = 76
    KEY_M               = 77
    KEY_N               = 78
    KEY_O               = 79
    KEY_P               = 80
    KEY_Q               = 81
    KEY_R               = 82
    KEY_S               = 83
    KEY_T               = 84
    KEY_U               = 85
    KEY_V               = 86
    KEY_W               = 87
    KEY_X               = 88
    KEY_Y               = 89
    KEY_Z               = 90

    KEY_SPACE           = 32
    KEY_ESCAPE          = 256
    KEY_ENTER           = 257
    KEY_TAB             = 258
    KEY_BACKSPACE       = 259
    KEY_INSERT          = 260
    KEY_DELETE          = 261
    KEY_RIGHT           = 262
    KEY_LEFT            = 263
    KEY_DOWN            = 264
    KEY_UP              = 265
    KEY_PAGE_UP         = 266
    KEY_PAGE_DOWN       = 267
    KEY_HOME            = 268
    KEY_END             = 269
    KEY_CAPS_LOCK       = 280
    KEY_SCROLL_LOCK     = 281
    KEY_NUM_LOCK        = 282
    KEY_PRINT_SCREEN    = 283
    KEY_PAUSE           = 284
    KEY_F1              = 290
    KEY_F2              = 291
    KEY_F3              = 292
    KEY_F4              = 293
    KEY_F5              = 294
    KEY_F6              = 295
    KEY_F7              = 296
    KEY_F8              = 297
    KEY_F9              = 298
    KEY_F10             = 299
    KEY_F11             = 300
    KEY_F12             = 301
    KEY_LEFT_SHIFT      = 340
    KEY_LEFT_CONTROL    = 341
    KEY_LEFT_ALT        = 342
    KEY_LEFT_SUPER      = 343
    KEY_RIGHT_SHIFT     = 344
    KEY_RIGHT_CONTROL   = 345
    KEY_RIGHT_ALT       = 346
    KEY_RIGHT_SUPER     = 347
    KEY_KB_MENU         = 348
    KEY_LEFT_BRACKET    = 91
    KEY_BACKSLASH       = 92
    KEY_RIGHT_BRACKET   = 93
    KEY_GRAVE           = 96

    KEY_KP_0            = 320
    KEY_KP_1            = 321
    KEY_KP_2            = 322
    KEY_KP_3            = 323
    KEY_KP_4            = 324
    KEY_KP_5            = 325
    KEY_KP_6            = 326
    KEY_KP_7            = 327
    KEY_KP_8            = 328
    KEY_KP_9            = 329
    KEY_KP_DECIMAL      = 330
    KEY_KP_DIVIDE       = 331
    KEY_KP_MULTIPLY     = 332
    KEY_KP_SUBTRACT     = 333
    KEY_KP_ADD          = 334
    KEY_KP_ENTER        = 335
    KEY_KP_EQUAL        = 336)))

(define key::none 'KEY_NONE)
;KEY_NONE            = 4294967295
(define key::apostrophe 'KEY_APOSTROPHE)
(define key::comma 'KEY_COMMA)
(define key::minus 'KEY_MINUS)
(define key::period 'KEY_PERIOD)
(define key::slash 'KEY_SLASH)
(define key::zero 'KEY_ZERO)
(define key::one 'KEY_ONE)
(define key::two 'KEY_TWO)
(define key::three 'KEY_THREE)
(define key::four 'KEY_FOUR)
(define key::five 'KEY_FIVE)
(define key::six 'KEY_SIX)
(define key::seven 'KEY_SEVEN)
(define key::eight 'KEY_EIGHT)
(define key::nine 'KEY_NINE)
(define key::semicolon 'KEY_SEMICOLON)
(define key::equal 'KEY_EQUAL)
(define key::A 'KEY_A)
(define key::B 'KEY_B)
(define key::C 'KEY_C)
(define key::D 'KEY_D)
(define key::E 'KEY_E)
(define key::F 'KEY_F)
(define key::G 'KEY_G)
(define key::H 'KEY_H)
(define key::I 'KEY_I)
(define key::J 'KEY_J)
(define key::K 'KEY_K)
(define key::L 'KEY_L)
(define key::M 'KEY_M)
(define key::N 'KEY_N)
(define key::O 'KEY_O)
(define key::P 'KEY_P)
(define key::Q 'KEY_Q)
(define key::R 'KEY_R)
(define key::S 'KEY_S)
(define key::T 'KEY_T)
(define key::U 'KEY_U)
(define key::V 'KEY_V)
(define key::W 'KEY_W)
(define key::X 'KEY_X)
(define key::Y 'KEY_Y)
(define key::Z 'KEY_Z)
(define key::space 'KEY_SPACE)
(define key::escape 'KEY_ESCAPE)
(define key::enter 'KEY_ENTER)
(define key::tab 'KEY_TAB)
(define key::backspace 'KEY_BACKSPACE)
(define key::insert 'KEY_INSERT)
(define key::delete 'KEY_DELETE)
(define key::right 'KEY_RIGHT)
(define key::left 'KEY_LEFT)
(define key::down 'KEY_DOWN)
(define key::up 'KEY_UP)
(define key::page-up 'KEY_PAGE_UP)
(define key::page-down 'KEY_PAGE_DOWN)
(define key::home 'KEY_HOME)
(define key::end 'KEY_END)
(define key::caps-lock 'KEY_CAPS_LOCK)
(define key::scroll-lock 'KEY_SCROLL_LOCK)
(define key::num-lock 'KEY_NUM_LOCK)
(define key::print-screen 'KEY_PRINT_SCREEN)
(define key::pause 'KEY_PAUSE)
(define key::F1 'KEY_F1)
(define key::F2 'KEY_F2)
(define key::F3 'KEY_F3)
(define key::F4 'KEY_F4)
(define key::F5 'KEY_F5)
(define key::F6 'KEY_F6)
(define key::F7 'KEY_F7)
(define key::F8 'KEY_F8)
(define key::F9 'KEY_F9)
(define key::F10 'KEY_F10)
(define key::F11 'KEY_F11)
(define key::F12 'KEY_F12)
(define key::left-shift 'KEY_LEFT_SHIFT)
(define key::left-control 'KEY_LEFT_CONTROL)
(define key::left-alt 'KEY_LEFT_ALT)
(define key::left-super 'KEY_LEFT_SUPER)
(define key::right-shift 'KEY_RIGHT_SHIFT)
(define key::right-control 'KEY_RIGHT_CONTROL)
(define key::right-alt 'KEY_RIGHT_ALT)
(define key::right-super 'KEY_RIGHT_SUPER)
(define key::KB_MENU 'KEY_KB_MENU)
(define key::left-bracket 'KEY_LEFT_BRACKET)
(define key::backslash 'KEY_BACKSLASH)
(define key::right-bracket 'KEY_RIGHT_BRACKET)
(define key::grave 'KEY_GRAVE)

(define key::kp-zero 'KEY_KP_0)
(define key::kp-one 'KEY_KP_1)
(define key::kp-two 'KEY_KP_2)
(define key::kp-three 'KEY_KP_3)
(define key::kp-four 'KEY_KP_4)
(define key::kp-five 'KEY_KP_5)
(define key::kp-six 'KEY_KP_6)
(define key::kp-seven 'KEY_KP_7)
(define key::kp-eight 'KEY_KP_8)
(define key::kp-nine 'KEY_KP_9)
(define key::kp-decimal 'KEY_KP_DECIMAL)
(define key::kp-divide 'KEY_KP_DIVIDE)
(define key::kp-multiply 'KEY_KP_MULTIPLY)
(define key::kp-subtract 'KEY_KP_SUBTRACT)
(define key::kp-add 'KEY_KP_ADD)
(define key::kp-enter 'KEY_KP_ENTER)
(define key::kp-equal 'KEY_KP_EQUAL)
