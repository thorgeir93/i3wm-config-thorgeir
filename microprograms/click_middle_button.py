import sys
from pymouse import PyMouse
from Xlib import display

# Get cursor coordinate
data = display.Display().screen().root.query_pointer()._data
x = data['root_x']
y = data['root_y']

print( 'X:%s' % x )
print( 'Y:%s' % y )

# Mouse click (middle button)
m = PyMouse()
middleButton = 3
m.click(x, y, middleButton)

sys.exit()
