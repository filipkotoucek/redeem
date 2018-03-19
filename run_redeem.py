from redeem.Redeem import Redeem
import sys
import signal
sys.path.append(r'/home/debian/pysrc')

import pydevd
pydevd.settrace('192.168.7.1')

#configs = "/usr/src/redeem/configs"
configs = "/etc/redeem"

def run_redeem():
    '''
    try:
        r = Redeem(configs)
        while 1:
            pass# do stuff
    except KeyboardInterrupt:
        r.exit()
        sys.exit()
    '''
    # Create Redeem
    r = Redeem(configs)

    def signal_handler(signal, frame):
        r.exit()

    # Register signal handler to allow interrupt with CTRL-C
    signal.signal(signal.SIGINT, signal_handler)

    # Launch Redeem
    r.start()

    # Wait for end of process signal
    signal.pause()
    
if __name__ == "__main__": 
    
    run_redeem()
    
    print "Redeem finished"
