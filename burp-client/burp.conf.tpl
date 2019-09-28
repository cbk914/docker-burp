# This is an example config file for the burp client.

mode = client
port = ${BURP_SERVER_PORT}
# A different port to use for restores - see the man page for more options.
#port_restore = 5971
status_port = 4972
server = ${BURP_SERVER}
password = ${BURP_CLIENT_PASSWORD}
cname = ${HOSTNAME}
# Choose the protocol to use.
# 0 to decide automatically, 1 to force protocol1 mode (file level granularity
# with a pseudo mirrored storage on the server and optional rsync). 2 forces
# protocol2 mode (inline deduplication with variable length blocks).
# protocol = 0
pidfile = /var/run/burp.client.pid
syslog = 0
stdout = 1
progress_counter = 1
# Ratelimit throttles the send speed. Specified in Megabits per second (Mb/s).
# ratelimit = 1.5
# Network timeout defaults to 7200 seconds (2 hours).
# network_timeout = 7200
# The directory to which autoupgrade files will be downloaded.
# To never autoupgrade, leave it commented out.
# autoupgrade_dir=/etc/burp/autoupgrade/client
# OS path component for the autoupgrade directory on the server.
# autoupgrade_os=test_os
# Wait a random number of seconds between 0 and the given number before
# contacting the server on a timed backup.
# randomise = 1200

# Set server_can_restore to 0 if you do not want the server to be able to
# initiate a restore.
server_can_restore = 1

# Set server_can_override_includes to 0 if you do not want the server to be
# able to override the local include/exclude list. The default is 1.
# server_can_override_includes = 1

# Set an encryption password if you do not trust the server with your data.
# Note that this will mean that network deltas will not be possible. Each time
# a file changes, the whole file will be transferred on the next backup.
# encryption_password = My^$pAsswIrD%@

# More configuration files can be read, using syntax like the following
# (without the leading '# ').
# . path/to/more/conf

# Run as different user/group.
# user=graham
# group=nogroup

cross_filesystem = /home
cross_all_filesystems = 1

# Uncomment the following lines to automatically generate a certificate signing
# request and send it to the server.
ca_burp_ca = /usr/sbin/burp_ca
ca_csr_dir = /etc/burp/CA-client

# SSL certificate authority - same file on both server and client
ssl_cert_ca = /etc/burp/ssl_cert_ca.pem

# Client SSL certificate
ssl_cert = /etc/burp/ssl_cert-client.pem

# Client SSL key
ssl_key = /etc/burp/ssl_cert-client.key

# Client SSL ciphers
#ssl_ciphers =

# Client SSL compression. Default is zlib5. Set to zlib0 to turn it off.
#ssl_compression = zlib5

# SSL key password, for loading a certificate with encryption.
ssl_key_password = password

# Common name in the certificate that the server gives us
ssl_peer_cn = burpserver

# Example syntax for pre/post scripts
#backup_script_pre=/path/to/a/script
#backup_script_post=/path/to/a/script
#restore_script_pre=/path/to/a/script
#restore_script_post=/path/to/a/script

# The following options specify exactly what to backup.
# The server will override them if there is at least one 'include=' line on
# the server side and 'server_can_override_includes=1'.
include = /tobackup
#exclude = /home/graham/testdir/librsync-0.9.7/testsuite
#include = /home/graham/testdir/librsync-0.9.7/testsuite/deep
#include = /home/graham/xdir
#exclude = /home/graham/testdir/libr
# Exclude file names ending in '.vdi' or '.vmdk' (case insensitive)
#exclude_ext = vdi
#exclude_ext = vmd
# Exlude file path matching a regular expression
# (note that 'include_regex' is not yet implemented)
#exclude_regex = \.cache
# Exclude various temporary file systems. You may want to add devfs, devpts,
# proc, ramfs, etc.
exclude_fs = sysfs
exclude_fs = tmpfs
# Exclude files based on size. Defaults are 0, which means no limit.
#min_file_size = 0 Mb
#max_file_size = 0 Mb
# The content of directories containing a filesystem entry named like this
# will not be backed up.
nobackup = .nobackup
# By default, burp backups up the fifos themselves, rather than reading from
# them. These two options let you choose a particular fifo to read, or read
# from all fifos.
#read_fifo=/path/to/a/fifo
#read_all_fifos=0
# The same for block device nodes.
#read_blockdev=/path/to/a/blockdev
#read_all_blockdevs=0
# Exclude files from compression by extension.
exclude_comp=bz2
exclude_comp=gz
exclude_comp=xz
exclude_comp=zst
# When backing up, whether to enable O_NOATIME when opening files and
# directories. The default is atime=0, which enables O_NOATIME.
#atime=1
# When enabled, this causes problems in the phase1 scan (such as an 'include'
# being missing) to be treated as fatal errors. The default is 0.
#scan_problem_raises_error=1
