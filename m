From: Lance Lesslie <llesslie@comcast.net>
Subject: Masquerade and active FTP ... help!
Date: Mon, 3 Aug 2009 10:39:07 -0500
Message-ID: <2F22C6DE-3311-47E2-B7C8-E7B95326B089@comcast.net>
Mime-Version: 1.0 (Apple Message framework v935.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

I've been trying to get active FTP to work through my linux server  
from computers on my internal network, but I haven't been able to get  
it working.  I've read the documentation, and I think I'm doing  
everything right.  Still, it won't work, and I'm not sure why not.   
I'm running Fedora Core 11, and /sbin/iptables -V gives "iptables  
v1.4.3.1".  Running uname -a shows:

Linux unimatrix01 2.6.29.6-213.fc11.x86_64 #1 SMP Tue Jul 7 21:02:57  
EDT 2009 x86_64 x86_64 x86_64 GNU/Linux

I created a stripped-down ruleset that accepts nearly everything, just  
in case it was some rule issue.  That didn't work.  My stripped-down  
rules are:

#!/bin/sh
EXT_IF=eth0
INT_IF=eth1
/sbin/iptables -F
/sbin/iptables -F -t nat
/sbin/iptables -F -t mangle
/sbin/iptables -X
/sbin/iptables -X -t nat
/sbin/iptables -X -t mangle
/sbin/iptables -Z
/sbin/iptables -P INPUT ACCEPT
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o $EXT_IF -j  
MASQUERADE

I load the appropriate nat and conntrack modules via /etc/sysconfig/ 
iptables-config:

# Load additional iptables modules (nat helpers)
#   Default: -none-
# Space separated list of nat helpers (e.g. 'ip_nat_ftp ip_nat_irc'),  
which
# are loaded after the firewall rules are applied. Options for the  
helpers are
# stored in /etc/modprobe.conf.
IPTABLES_MODULES="iptable_nat nf_nat nf_nat_ftp nf_nat_irc  
ipt_MASQUERADE nf_conntrack_ftp nf_conntrack_irc"

# Unload modules on restart and stop
#   Value: yes|no,  default: yes
# This option has to be 'yes' to get to a sane state for a firewall
# restart or stop. Only set to 'no' if there are problems unloading  
netfilter
# modules.
IPTABLES_MODULES_UNLOAD="yes"

# Save current firewall rules on stop.
#   Value: yes|no,  default: no
# Saves all firewall rules to /etc/sysconfig/iptables if firewall gets  
stopped
# (e.g. on system shutdown).
IPTABLES_SAVE_ON_STOP="no"

# Save current firewall rules on restart.
#   Value: yes|no,  default: no
# Saves all firewall rules to /etc/sysconfig/iptables if firewall gets
# restarted.
IPTABLES_SAVE_ON_RESTART="no"

# Save (and restore) rule and chain counter.
#   Value: yes|no,  default: no
# Save counters for rules and chains to /etc/sysconfig/iptables if
# 'service iptables save' is called or on stop or restart if  
SAVE_ON_STOP or
# SAVE_ON_RESTART is enabled.
IPTABLES_SAVE_COUNTER="no"

# Numeric status output
#   Value: yes|no,  default: yes
# Print IP addresses and port numbers in numeric format in the status  
output.
IPTABLES_STATUS_NUMERIC="yes"

# Verbose status output
#   Value: yes|no,  default: yes
# Print info about the number of packets and bytes plus the "input-" and
# "outputdevice" in the status output.
IPTABLES_STATUS_VERBOSE="no"

# Status output with numbered lines
#   Value: yes|no,  default: yes
# Print a counter/number for every rule in the status output.
IPTABLES_STATUS_LINENUMBERS="yes"

I believe the modules are loaded, because lsmod | grep ftp returns:

nf_nat_ftp              3120  0
nf_conntrack_ftp        8280  1 nf_nat_ftp
nf_nat                 18628  4  
nf_nat_irc,nf_nat_ftp,ipt_MASQUERADE,iptable_nat

I just don't understand why active FTP doesn't work.  Any advice would  
be greatly appreciated.  Thanks.

Lance

