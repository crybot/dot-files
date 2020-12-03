# Make qt auto adjust highdpi scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/
export EDITOR=vim
export PATH=$PATH:'/usr/local/bin/python'
export PATH=$PATH:'/home/crybot/.local/bin'

# opam configuration
test -r /home/crybot/.opam/opam-init/init.sh && . /home/crybot/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
