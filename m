From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: iptables scripts
Date: Fri, 31 Oct 2003 07:26:34 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310310723500.6263-100000@localhost.localdomain>
References: <1067602360.1137.58.camel@valhalla>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067602360.1137.58.camel@valhalla>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: Gilles Yue <gyue@novelgmt.intnet.mu>, iptables mailing list <netfilter@lists.netfilter.org>

On 31 Oct 2003, Chris Brenton wrote:

> On Fri, 2003-10-31 at 06:25, Gilles Yue wrote: 
> > 
> > What is the difference between saving iptables rules by typing
> > /sbin/service save and putting it in a script which executes when the
> > pc is restarted?
> 
> IMHO this is a personal preference thing. Some people prefer to use the
> save/restore scripts. Some people (like myself) prefer to write their
> own shell script. Its all a matter of personal preference.
> 
> For me, I just find working with a shell script easier. I typically
> remotely manage my firewalls. I find it easier to vi a file rather than
> work from the command line (you are also less likely to shoot yourself
> in the foot by messing up your rules and blocking your remote session.
> Been there, done that ;-). I also like being able to add in additional
> functionality like variables, do loops, etc. Your mileage may vary.

that's the big bonus -- that you can do some preliminary setup in a
shell script like setting variables for convenience, setting kernel
parameters, loading modules and the like.

for the iptables tutorial i was talking about that i'm giving on monday,
here's the first part of my script, just to show folks what they can do:

--------------------------------------------

#!/bin/sh

# Commands.

IPT="/sbin/iptables"

# Interfaces.

INET_IF="eth0"
LOOPBACK_IF="lo"

# Addresses.

MY_IP="192.168.1.101"

# Special addresses.

LOOPBACK="127.0.0.0/8"
PRIVATE_CLASS_A="10.0.0.0/8"
PRIVATE_CLASS_B="176.16.0.0/12"
PRIVATE_CLASS_C="192.168.0.0/16"
CLASS_D="224.0.0.0/4"
CLASS_E="240.0.0.0/5"
BROADCAST_SRC="0.0.0.0"
BROADCAST_DEST="255.255.255.255"

# Ports.

PRIVPORTS="0:1023"
UNPRIVPORTS="1024:65535"

# Collective addresses.

BAD_SOURCE_ADDRS="$LOOPBACK $CLASS_D $CLASS_E $MY_IP"

ALLOWED_INCOMING_SERVICES="ssh http"
DISALLOWED_OUTGOING_SERVICES="telnet"

#######################################################
# Load necessary modules netfilter modules.
#######################################################

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state

#######################################################
# Set some /proc/sys settings to nail some bad stuff.
#######################################################

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

for f in /proc/sys/net/ipv4/conf/*/accept_source_route ; do
	echo 0 > $f
done

for f in /proc/sys/net/ipv4/conf/*/accept_redirects ; do
	echo 0 > $f
done

for f in /proc/sys/net/ipv4/conf/*/send_redirects ; do
	echo 0 > $f
done

for f in /proc/sys/net/ipv4/conf/*/rp_filter ; do
	echo 1 > $f
done

for f in /proc/sys/net/ipv4/conf/*/log_martians ; do
	echo 1 > $f
done

#######################################################
# Set the chain policies.
#######################################################

$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT ACCEPT	# Purists probably hate this.



... etc etc, you get the idea ...

shell scripts are indeed the way to go.

rday


