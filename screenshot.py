#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Use in i3wm with:
Save as screeshot.py somewhere into your PATH
bindsym --release Print exec --no-startup-id screenshot.py

This have been in developing mode, found glitches
by using python to perform screenshot
"""

import os
from subprocess import Popen, PIPE
from tempfile import NamedTemporaryFile
import pyscreenshot
from PIL import ImageGrab
import pyautogui
import time

SCREENSHOT_UTILITY = "/usr/bin/scrot -s"  # /usr/bin/import

def capture_screenshot():
    # Get the coordinates of the top-left and bottom-right corners of the frame
    top_left = pyautogui.position()
    bottom_right = pyautogui.position()

    # Capture the screen region between the top-left and bottom-right corners
    screen_region = (
        top_left.x,
        top_left.y,
        bottom_right.x,
        bottom_right.y
    )
    return ImageGrab.grab(screen_region)

def feed_xclipboard(filepath: str) -> None:
    """
    Copies the specified file path to the clipboard and displays a notification.

    Args:
        filepath (str): The file path to be copied to the clipboard.

    Returns:
        None
    """
    pipe = Popen("xclip -sel clip", shell=True, stdin=PIPE).stdin
    pipe.write(filepath.encode("utf-8"))
    pipe.close()

    pipe = Popen(f"notify-send {filepath}", shell=True, stdin=PIPE)
   # pipe.close()


def import_screenshot():
    filename = NamedTemporaryFile(
        suffix=".png",
        prefix="screenshot_{0}_".format(time.strftime("%Y%m%dT%H%M%S")),
        dir=os.path.expanduser("~/media/screenshots"),
        delete=False,
    ).name
    #screenshot = ImageGrab.grab()
    screenshot = capture_screenshot()
    #screenshot = pyscreenshot.grab()
    #screenshot.save(filename)
    return filename
    #p = Popen(SCREENSHOT_UTILITY + " " + filename, shell=True)
    #_ = os.waitpid(p.pid, 0)[1]
    #return filename


if __name__ == "__main__":
    screenshot = import_screenshot()
    feed_xclipboard(screenshot)
