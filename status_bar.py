# -*- coding: utf-8 -*-
from i3pystatus import Status
from custom_status_bar.keyboard_layout import Xkblayout
from custom_status_bar.battery import BatteryStatus

status = Status()

status.register(Xkblayout)
status.register(BatteryStatus)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
        format="%a %-d %b %H:%M:%S",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)

# Displays whether a DHCP client is running
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)

# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="wlp2s0",
    format_up="wifi: {v4cidr} {kbs} MB/s ",
    divisor=1048576,
    round_size=2,
    )

status.register("network",
    interface="tun0",
    format_up="tun0: {v4cidr} {kbs} MB/s ",
    divisor=1048576,
    round_size=2,
    )

status.register("network",
    interface="virbr0",
    format_up="virbr0: {v4cidr} {kbs} MB/s ",
    divisor=1048576,
    round_size=2,
    )

#status.register(
#    'battery',
#    interval=5,
#    format='{battery_ident}: [{status} ]{percentage_design:.2f}%',
#    alert=True,
#    alert_percentage=15,
#    status = {
#        'DPL': 'DPL',
#        'CHR': 'CHR',
#        'DIS': 'DIS',
#        'FULL': '',})

#status.register(
#    "backlight"
#        )


#status.register("network",
#    interface="corpnet",
#    format_up="corpnet: {v4cidr}",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
#status.register("disk",
#    path="/home/throstur",
#    format="/home/throstur {avail}",)
#status.register("disk",
#    path="/",
#    format="/ {avail}",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="♪{volume}",)


status.run()
