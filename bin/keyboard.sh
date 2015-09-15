# Dvorak programer
setxkbmap us -variant dvp

# Make caps lock a Control
xmodmap -e "clear Lock"
xmodmap -e "keysym Caps_Lock = Control_L Caps_Lock"
xmodmap -e "add Control = Control_L"

# Remap modifiers (Keyboard dependent)
xmodmap -e "keycode 94 = Mode_switch"
xmodmap -e 'keycode 108 = Alt_L'

# Remap modifiers (Keyboard independent)
xmodmap -e 'keysym space = Alt_L'
xmodmap -e 'keycode any = space'

# Numbers
xmodmap -e "keysym d = d D 0"
xmodmap -e "keysym o = o O 1"
xmodmap -e "keysym m = m M 1"
xmodmap -e "keysym e = e E 2"
xmodmap -e "keysym w = w W 2"
xmodmap -e "keysym u = u U 3"
xmodmap -e "keysym v = v V 3"
xmodmap -e "keysym h = h H 4"
xmodmap -e "keysym t = t T 5"
xmodmap -e "keysym n = n N 6"
xmodmap -e "keysym g = g G 7"
xmodmap -e "keysym c = c C 8"
xmodmap -e "keysym r = r R 9"

# Xcape settings
killall -9 xcape

xcape -e 'Control_L=Escape'
xcape -e 'Shift_L=Escape'
xcape -e 'Alt_L=space'