From: WA Support <support@wildapache.net>
Subject: Re: Using an device alias?
Date: Tue, 07 Jan 2003 10:23:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1B0D05.34338FF5@wildapache.net>
References: <b74ecb8788.b8788b74ec@cvip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Steve,

The virtual interface is dealt with in the kernel, iptables doesn't care
about it, iptables just knows about the IP.

I have many virtual interfaces in rc.local, each associated with a
specific IP address.  All iptables cares about is the IP address.

What I have is this (I use a sript as opposed to
/etc/sysconfig/ipchains).

(snip)

LAN_IP="192.168.1.5"
LAN_IP_RANGE="192.168.1.0/24"
LAN_BCAST_ADRESS="192.168.1.255"
LAN_IFACE="eth0"

...

#########################################################################################
#
# Rules for INPUT chain for virtual interfaces
#

$IPTABLES -A INPUT -p ALL -i $INET_IFACE -s $LAN_IP_RANGE -d
$LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP_RANGE -d $LAN_IP_RANGE
-j ACCEPT


#
# Rules for OUTPUT chain for virtual interfaces
#

$IPTABLES -A OUTPUT -p ALL -s $LAN_IP_RANGE -j ACCEPT

#
#########################################################################################

# 
# Rules for special networks not part of the Internet
#
...

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT

...

(snip)

Hope this is what you were after, it works fine for me!

Murrah Boswell


Steve M Bibayoff wrote:
> 
> Sorry if everyone gets this twice, this one is a
> second posting when I realized this was a closed list.
> 
> Original question:
> Is it possible to use iptables with a device alias
> (ex.. eth0:1)? I tries to add a filter rule and got
> an error:
> % iptables -t filter -I INPUT -i eth0:1 -j ACCEPT
> Warning: wierd character in interface `eth0:1' (No
> aliases, :, ! or *).
> 
> If i list the rules, it's listed, but it doesn't
> appear to be working. I was wondering if someone had
> a definite answer.
> 
> TIA
> 
> Steve

