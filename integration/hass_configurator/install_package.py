import subprocess
import sys
package = 'hass-configurator==0.4.1'
subprocess.check_call([sys.executable, '-m', 'pip', 'install', package])