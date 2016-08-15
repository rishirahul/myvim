I have swapped my windows and control keys for better typing. Steps below can be followed to swap the key

* Put the following in ~/.Xmodmap. check if key board mapping is correct using xev command

```
clear control
clear mod4

keycode 105 =
keycode 206 =

keycode 133 = Control_L NoSymbol Control_L
keycode 134 = Control_R NoSymbol Control_R
keycode 37 = Super_L NoSymbol Super_L

add control = Control_L
add control = Control_R
add mod4 = Super_L
```
* run xmodmap ~/.Xmodmap
