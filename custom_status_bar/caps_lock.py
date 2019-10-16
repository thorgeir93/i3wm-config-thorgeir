# -*- coding: utf-8 -*-
from i3pystatus import IntervalModule
import subprocess
import os

class CapsOnStatus(IntervalModule):
    """ Show big colorful status bar """
    interval = 2
    #format=u"{fill}"

    def caps_lock_status(self):
        pwd = (
            '/home/thorgeir/github/thorgeir/'
            'i3wm-config-thorgeir/custom_status_bar'
        )
        if not os.path.exists(pwd):
            pwd = os.path.dirname(os.path.realpath(__file__))

        process = subprocess.Popen(
            ["bash", "{0}/caps_status.sh".format(pwd)],
            stdout=subprocess.PIPE
        )
        output, error = process.communicate()
        output = output.decode('utf-8')

        return output.split('\n')[0]

    def run(self):
        caps_colors = {
            'off': '#00ff00',
            'on': '#ff0000'
        }

        full_text = u'■'*30
            
        self.output = {
            'full_text': full_text,
            'color': caps_colors[self.caps_lock_status()]
        }
