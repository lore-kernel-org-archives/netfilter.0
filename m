From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: CONNMARK, OUTPUT, sid-owner and marking closed connections
Date: Sun, 20 Feb 2005 18:52:48 -0500
Message-ID: <20050220235248.GC21766@elm.home.idallen.ca>
References: <20050218034429.GA14099@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050218034429.GA14099@elm.home.idallen.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ian! D. Allen wrote:
> How do I arrange that *all* the packets get marked, even the "FIN" ones?

Connection marking does it, once you fix the kernel bugs that prevent
it from working!

Here is a script that lets you set up one or more "session IDs"
(e.g. xterm windows, login sessions) that have all outgoing packets
marked.  With matching iproute2 rules (given at the bottom), all packets
from these sessions can be diverted out your second interface card
instead of the default first card.  So you can have one xterm that uses
only eth0 and one beside it that uses only eth1.

For example, you can open up an xterm, put the shell PID in the PIDLIST
below, run this script to set up connection marking, and then any network
activity that originates from that shell or its children will go out
$IF1 instead of $IF0.  Way cool.

"Session IDs" are "process groups" - usually including everything that
is a child of your login shell or of an X11 terminal shell.  The process
id of the first shell is usually the session ID you need.

#!/bin/sh -u
#   $0
# mark and re-route packets going out IF0 to IF1 for a given session ID
#
# Marked packets are diverted out a different interface using iproute2
# lines like this:  from all fwmark $MARK lookup $TABLE
# where $TABLE has a default route out $IF1
#
# -IAN! idallen@idallen.ca

# list of sessions whose packets we will route out IF1
PIDLIST='22540 22706'

IF0=eth0
IF1=eth1
PRIO=9     # must follow local and precede everything else
TABLE=2    # from the iproute2 rule list
MARK=5     # an arbitrary number

ip rule del fwmark $MARK 2>/dev/null
ip rule del fwmark $MARK 2>/dev/null
ip rule add prio $PRIO fwmark $MARK table $TABLE 
ip route flush cache

# stop "martian source" errors on $IF1 for packets diverted from $IF0 to $IF1
#
echo 0 > /proc/sys/net/ipv4/conf/$IF1/rp_filter

# the entire contents of the ianmark table is defined here; we can
# flush it safely
#
iptables -t mangle -F ianmark 2>/dev/null
iptables -t mangle -N ianmark 2>/dev/null

# Doing the marking based on session ID works fine until the connection
# drops - then suddenly the kernel-generated FIN packets aren't marked
# and end up going out $IF0. Use CONNMARK connection marking to ensure
# that the marking continues into the FIN packets.

# restore the CONNMARK connection mark into the packet mark:
# the following --restore-mark line doesn't work in 2.6.10-1mdk
iptables -t mangle -A ianmark -j CONNMARK --restore-mark
# if we now have a mark set then no mark testing and setting is needed
iptables -t mangle -A ianmark -m mark ! --mark 0 -j RETURN
# we don't have a mark set yet -
# set the packet mark for packets originating from these sessions IDs:
for pid in $PIDLIST ; do
    iptables -t mangle -A ianmark -m owner --sid-owner $pid \
	    -j MARK --set-mark $MARK
done
# save any non-zero packet marks into the CONNMARK connection mark:
# the following --save mark line doesn't work in 2.6.10-1mdk
iptables -t mangle -A ianmark -m mark ! --mark 0 -j CONNMARK --save-mark

# packets leaving on $IF1 still have the $IF0 source address - SNAT it
#
inet1=$( ifconfig $IF1 | grep 'inet addr:' | tr ':' ' ' | awk '{print $3}' )
iptables -t nat -D POSTROUTING -m mark --mark $MARK \
        -j SNAT --to-source $inet1 2>/dev/null
iptables -t nat -A POSTROUTING -m mark --mark $MARK \
        -j SNAT --to-source $inet1

# add the ianmark table to the end of the OUTPUT table;
# send packets that are going out $IF0 that don't have a mark yet
#
iptables -t mangle -D OUTPUT -o $IF0 -m mark --mark 0 -j ianmark  2>/dev/null
iptables -t mangle -A OUTPUT -o $IF0 -m mark --mark 0 -j ianmark 

# list the tables for good luck
iptables -n -v -t mangle -L OUTPUT
iptables -n -v -t mangle -L ianmark

================================================
iproute2 rules that make the above marking work:
================================================

----- IP Rules ----------------------------------
0:      from all lookup local 
9:      from all fwmark 0x5 lookup 2 
10:     from 192.168.9.0/24 lookup 1    # eth0
20:     from 192.168.7.0/24 lookup 2    # eth1
30:     from all lookup main 
40:     from all lookup default 
 
----- Table 1 [eth0] ----------------------------------
default via 192.168.9.254 dev eth0  proto static  src 192.168.9.250 
 
----- Table 2 [eth1] ----------------------------------
default via 192.168.7.1 dev eth1  proto static  src 192.168.7.250 
 
----- Table main ----------------------------------
192.168.7.0/24 dev eth1  proto kernel  scope link  src 192.168.7.250 
192.168.9.0/24 dev eth0  proto kernel  scope link  src 192.168.9.250 
127.0.0.0/8 dev lo  scope link 
 
----- Table default ----------------------------------
default via 192.168.9.254 dev eth0  proto static  src 192.168.9.250  metric 10 
default via 192.168.7.1 dev eth1  proto static  src 192.168.7.250  metric 20 

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

