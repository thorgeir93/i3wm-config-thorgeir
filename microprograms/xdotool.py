import os
import pwd
import logging
import subprocess

# (ref: stackoverflow.com/questions/1770209)
def _subprocess_as_user(command, username, stdout, stderr):
    """ Return a subprocess object with the given username as a user.
        :command: (list)    List of string bash operations.
                            E.g. ['ls' '-lha']
        :username:(str)     The executor of the given command.
    """
    def _demote(username):
        pw_record = pwd.getpwnam(username)
        os.setgid(pw_record.pw_gid)
        os.setuid(pw_record.pw_uid)
    env = os.environ.copy()
    env[ 'HOME' ] = '/home/{0}'.format(username)
    return subprocess.Popen(
        command, 
        stdout=stdout,
        stderr=stderr,
        preexec_fn=_demote(username),
        env=env
    )

def shell_cmd(command, user=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE):
    """ Run command in shell, return output and error messages.
        :command:   (str/list)  A string or a list of commands for
                                the shell. E.g. "ps aux" or ['ps', 'aux'].
        :user:      (str)       The executor of the given command.
                                A valid user from on the current server.
                                E.g. "thorgeir".
    """
    if not isinstance(command, list):
        new_command_list = []
        #command = command.split(' ')
        quote_word_track = []
        #single_quote_word_track = []
        for command in command.split(' '):
            if command.startswith('"') or command.startswith("'"):
                quote_word_track.append(command)
                continue
            if command.endswith('"') or command.endswith("'"):
                quote_word_track.append(command)
                command = ' '.join(quote_word_track)
            new_command_list.append( command )
            double_quote_word_track = []
            single_quote_word_track = []
        command = new_command_list
                
 
    if user: 
        process = _subprocess_as_user(command, user, stdout, stderr)
    else:
        process = subprocess.Popen(command, stdout=stdout, stderr=stderr)
    out, err = process.communicate() 
    out = out.decode('utf-8')
    if err:
        err = err.decode('utf-8')
    logging.debug('shell_cmd::IN:{0}'.format(str(command)))
    if out and len(out) < 5000:
        logging.debug('shell_cmd::OUT:{0}'.format(out))
    if err and len(err) < 5000:
        logging.debug('shell_cmd::ERR:{0}'.format(err))
    return out, err

transforms = {
    " ": "space",
    "~": "asciitilde",
    "/": "slash",
    "-": "minus",
}

def xdotool(command):
    """ Run the following command
    """
