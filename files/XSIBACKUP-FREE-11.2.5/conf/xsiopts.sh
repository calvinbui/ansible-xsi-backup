# This file contains some options (c) XSIBackup can use when executed
# (c) XSIBackup will operate well with default values, do not edit this
# file, unless you are absolutely sure of what you're doing and why you
# are doing it. You edit this file under your sole responsability.

# This variable below holds the xsi installation path in remote systems
# (c) XSIBackup will first try to determine the remote installation path
# dynamically for every backup job, if it finds duplicate installations 
# or can't find one, it will default to the hardcoded value below
xsidefaultpath=/vmfs/volumes/datastore1/xsi-dir

# The following variable holds the directory mask XSIBackup will use when 
# deleting older dirs at the time to make room, you do not need to change it
# the pattern below is not a REGEX, but a regular Linux search pattern, it
# checks YYYYMMDDhhmmss strings. Bounds are not checked, just type/length
datedirmask=20[1-3][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]

# Set the amount of megabytes which checksums will be compared after backup
# starting at the beggining of the file. This is not a complete check, but 
# quite often this portion of the disk will hold the superblock, so a change 
# in a single file will result in this portion of the disk being different
trivialcheck=500

# This is the default username (c) XSIBackup will use when connecting to 
# the backup server over SSH. All "over IP" backups are tunneled through 
# an ssh tunnel. You must ensure that the remote user has appropiate 
# permissions to perform the required backup job tasks.
defremusr=root

# This variable sets wether XSIBackup will check for new versions or not
# Set it to -no- if your DNS client takes too long to respond and it is
# delaying program execution
checkver=yes

# This value controls the level of verbosity, it can take values, set it
# above 2 to get detailed warnings about missing files, like .nvram or 
# .vmxf which are not neccessarily present in all VMs
errverb=2

# Rotate logs when they reach N megabytes, default is 50M
rotate_log_size=50

# Store messages to a remote server. You don't need Rsyslog server in the  
# remote machine. Messages will be tunneled through SSH and parsed to the 
# remote logger binary. The port after the IP is an SSH port, not Rsyslog
# You must first --link-srv to the log server. Set to localhost to log
# locally to /var/log/syslog.log (/scratch/log/syslog.log)
rsyslogsrv=localhost

# Less Secure Ciphers. This are old ciphers that have been deprecated in 
# newer OpenSSH versions. This feature can be activated by passing the 
# <l> switch along with the --backup-prog value and will boost SSH tunnel
# speed by 20-35%, use at your own discretion. aes128-ctr is not very
# fast, it's there for compatibility with newer OpenSSL versions 
less_secure_ciph=arcfour,blowfish-cbc,aes128-ctr
