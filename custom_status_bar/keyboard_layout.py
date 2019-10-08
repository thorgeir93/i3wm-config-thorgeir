from i3pystatus import IntervalModule
import subprocess


class Xkblayout(IntervalModule):
    """Displays and changes current keyboard layout.

    ``change_layout`` callback finds the current layout in the
    ``layouts`` setting and enables the layout following it. If the
    current layout is not in the ``layouts`` setting the first layout
    is enabled.

    ``layouts`` can be stated with or without variants,
    e.g.: status.register("xkblayout", layouts=["de neo", "de"])
    """

    interval = 1
    format = u"{name}"
    uppercase = True
    settings = (
        ("format", "Format string"),
        ("layouts", "List of layouts"),
        ("uppercase", "Flag for uppercase output"),
    
        )
    layouts = []
    on_leftclick = "change_layout"

    def run(self):
        kblayout = self.kblayout()

        full_text = self.format.format(name=kblayout)

        color = "#ffff00"

        if full_text.lower() == 'us':
            color = '#00ff00'

        if full_text.lower() == 'is':
            color = '#ff0000'

        if self.uppercase:
            full_text = full_text.upper()

        full_text = u'■'*30

        self.output = {
            "full_text": full_text,
            "color": color
        }

    def change_layout(self):
        layouts = self.layouts
        kblayout = self.kblayout()
        if kblayout in layouts:
            position = layouts.index(kblayout)
            try:
                subprocess.check_call(["setxkbmap"] +
                                      layouts[position + 1].split())
            except IndexError:
                subprocess.check_call(["setxkbmap"] + layouts[0].split())
        else:
            subprocess.check_call(["setxkbmap"] + layouts[0].split())

    def kblayout(self):
        kblayout = subprocess.check_output("setxkbmap -query", shell=True)\
            .decode("utf-8").splitlines()
        kblayout = [l.split() for l in kblayout]
        kblayout = [l[1].strip() for l in kblayout
                    if l[0].startswith(("layout", "variant"))]
        return (" ").join(kblayout)
