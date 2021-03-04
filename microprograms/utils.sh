cmd () {
    # Write the given command on the command line.
    #
    # :param bash_command: A string to write on the cmd line.
    #
    bash_command=${1}; shift
    echo "${bash_command}"
    xdotool type "${bash_command}"
}

exe_cmd () {
    # Write and run the given command on the command line.
    #
    # :param bash_command: A string to be excuted on the cmd line.
    # :param sleep_time: How long time (float) to sleep after the
    #   command is executed. (default:1.0)
    #
    default_sleep_time=1.0

    bash_command=${1}; shift
    sleep_time=${1:-$default_sleep_time}; shift

    cmd "${bash_command}" && xdotool key Return && sleep ${sleep_time}
}

installer_ssh () {
    # Add the number from the command line to the given ipv4
    # and ssh as user installer with the new ipv4.
    #
    # :param prefix_ipv4: First three octet, e.g. "127.0.1."
    #

    prefix_ipv4=${1}; shift

    xdotool key Escape 
    xdotool type "dd"
    xdotool type "issh installer@${prefix_ipv4}"
    xdotool key Escape p
    xdotool key Return
    sleep 1.5
}

installer_ssh_login () {
    exe_cmd "qwerty77"
    exe_cmd "sudo -i" 1.5
    exe_cmd "qwerty77"
    exe_cmd "set -o vi" 0.1
    exe_cmd "clear" 0.1
}

installer_setup_cuckoo_session () {
    exe_cmd "sudo su - cuckoo"
    exe_cmd "set -o vi"
    exe_cmd "source ~/venv/bin/activate"
}

installer_setup_work_session () {
    xdotool key alt+a colon && xdotool type "setw synchronize-panes off"
    xdotool key Return && sleep 1

    installer_setup_cuckoo_session

    # Next pane - Go to cuckoo_setup repo.
    xdotool key alt+a o && sleep 0.2

    exe_cmd "tail -f -n 100 /home/cuckoo/.cuckoo/log/cuckoo.log"
}
    

installer_init_ssh_action () {
    exe_cmd "yes"
    exe_cmd "qwerty77"
    exe_cmd "sudo -i" 1.5
    exe_cmd "qwerty77"
}

init_cuckoo_setup_repo () {
    xdotool type "set -o vi" && xdotool key Return
    xdotool type "clear" && xdotool key Return
    xdotool type "git clone http://c3gitlab01.amadis.com/sandbox_array/sandbox/sandbox_setup.git"
    xdotool key Return
    
    xdotool type "cd /root/sandbox_setup && bash setup_cuckoo_host.sh" && xdotool key Return
    xdotool type "cd /var/data/gitlab/cuckoo_setup" && xdotool key Return
}

