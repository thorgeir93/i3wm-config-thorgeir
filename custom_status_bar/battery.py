from i3pystatus import IntervalModule
import subprocess
import os


class BatteryStatus(IntervalModule):
    """ Displays and changes current battery. """
    interval = 1
    format = u"{symbol}{battery}"
    uppercase = True
    settings = (("format", "Format string"),)

    base_path = '/sys/class/power_supply/'
    battery_folder = 'BAT1'
    capacity = 'capacity'
    status = 'status'

    def run(self):
        file_capacity = os.path.join(self.base_path, self.battery_folder, self.capacity)
        res = '0'
        with open(file_capacity, 'r') as f:
            res = f.readlines()[0].split('\n')[0]

        num = int( res )
        
        color = '#FF0000'
        if num >= 50:
            color = '#ADFF2F' # Green
        elif 20 < num < 50:
            color = '#FFFF00' # Yellow


        # TODO if number goes under 20, make it red!
    
        status={
            "DIS": "↓",
            "CHA": "↑",
            "FULL": "=",
        }

        file_status = os.path.join(self.base_path, self.battery_folder, self.status)
        with open(file_status, 'r') as f:
            res = f.readlines()[0].split('\n')[0]
    
        symbol = status[ res[0:3].upper() ]
        
        full_text = self.format.format(symbol=symbol, battery=str(num))

        self.output = {
            'full_text': full_text, #full_text,
            'color': color
        }

        #status={
        #   "DIS": "↓",
        #   "CHR": "↑",
        #   "FULL": "=",
        #}

        #with open(f_status, 'r') as f:
        #    res = f.readlines()[0].split('\n')[0]
    
    #symbol = status[ res[0:3].upper() ]
