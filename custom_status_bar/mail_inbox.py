from i3pystatus import IntervalModule
import subprocess
import os

import requests

class MailInbox(IntervalModule):
    """ Displays number of unread mail in my mail box. """
    interval = 30
    format = u"{symbol} {inbox_size}"
    uppercase = True
    settings = (("format", "Format string"),)

    def run(self):
        """
        """
        # Get the mail inbox size.
        #
        try:
            res = requests.get('http://localhost:5000/inbox_size')
            inbox_size = res.json()['result']
            full_text=self.format.format(symbol="✉", inbox_size=str(inbox_size))
        
            # Determine the color for the text.
            #
            num = int( inbox_size )
            color = '#ADFF2F' # Green
            if 2 < num < 10:
                color = '#FFFF00' # Yellow
            elif 10 <= num:
                color = '#FF0000' # Red
        except:
            full_text=self.format.format(symbol="✉", inbox_size="error")
            color = '#FF0000' # Red
            

        self.output = {
            'full_text': full_text,
            'color': color
        }
