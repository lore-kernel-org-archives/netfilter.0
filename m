From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Help with iptables script
Date: Tue, 14 Dec 2004 20:17:43 -0500
Message-ID: <1103073463.2028.13.camel@localhost>
References: <6.1.2.0.0.20041214161928.02702088@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041214161928.02702088@corpmail.courtesymortgage.com>
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
To: Jason Williams <jwilliams@courtesymortgage.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

Welcome to netfilter/iptables - it's a fabulous product.  You do indeed
seem to know what you are doing.  I'll make some comments in your text.

On Tue, 2004-12-14 at 19:22, Jason Williams wrote:
> Evening everyone.
> 
> I will be quick to the point. Need some help with IPTables. New to 
> IPTables, but not to firewalls. Right now, just getting my head wrapped 
> around the differences and syntax IPTables compared to other firewalls i've 
> used.
> 
> Anyway, working on just a very simple firewal script (for first time 
> learning) to do the following:
> 
> 1) Block all incoming requests to firewall host and private LAN
> 
> 2) Do NAT for my private LAN
> 
> 3) Allow private LAN outbound on all ports.
> 
> So far, this is what i've come up with. Not sure if it is correct, but 
> thought i'd ask some of the experts on this list.
> 
> #External interface and IP info
> INET_IP="1.2.3.4"
> INET_IFACE="eth0"
> 
> #Private LAN macros
> LAN_IP="192.168.1.0/24"
> LAN_IFACE="eth2"
> 
> # IPTables Configuration.
> 
> IPTABLES="/usr/sbin/iptables"
> 
> # Set default policies for the INPUT, FORWARD and OUTPUT chains.
> #
> 
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
> 
Very good start :-)
> 
> #
> # Take care of bad TCP packets that we don't want.
> #
> 
> $IPTABLES -N bad_tcp_packets
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
> --log-prefix "New not syn:"
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
I would be interested to see some list discussion here.  When I use
connection tracking, I generally do not drop NEW not SYN packets.  NEW
packets initiated from untrusted sources are generally dropped anyway
whether they have the SYN bit flipped or not.  On the other hand, you
may find legitimate NEW packets that are not SYN, e.g., if a session has
been interrupted (e.g., firewall reset), the sessions may still be alive
on the end points.  Dropping the non-SYN packets will force a time out
or application hang and a call to the help desk.  Letting those packets
through will renew the connection tracking state and keep the
application alive.
> 
> # Do some checks for obviously spoofed IP's
> 
> $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.0.0/16 -j DROP
> $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 10.0.0.0/8 -j DROP
> $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 172.16.0.0/12 -j DROP
We usually take anti-spoofing one step further in the ISCS network
security project (http://iscs.sourceforge.net).  To be good Internet
citizens, we also want to make sure that only valid internal addresses
are sending traffic out.  If you have and will alway have only one
protected network, one can do this with a single inverse rule, e.g., 
$IPTABLES -A bad_tcp_packets -i $LAN_IFACE -s ! $LAN_IP - j DROP

If you have multiple protected networks, you can do this with the RETURN
target and a separate chain, e.g., 
$IPTABLES -N SpoofChain
$IPTABLES -A bad_tcp_packets -i $LAN_IFACE -j SpoofChain
$IPTABLES -A SpoofChain -s $LAN_IP1 -j RETURN
$IPTABLES -A SpoofChain -s $LAN_IP2 -j RETURN
$IPTABLES -A SpoofChain -j DROP

> 
> #Simple NAT setup
> 
> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP
> 
> # Accept the packets we actually want to forward
> 
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG 
> --log-level DEBUG --log-prefix "IPT FORWARD packet died: "
> 
> # INPUT chain
> 
> $IPTABLES -A INPUT -p tcp -j bad_tcp_packets
Since you're not accepting any packets on the INPUT chain, you don't
need to filter bad packets unless you want to log them.  Are you sure
you don't want to accept RELATED,ESTABLISHED traffic on your INPUT
chain?
> 
> 
> # OUTPUT chain
> 
> $IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
Are you expecting bad packets on your OUTPUT chain?
> 
> #
> # Special OUTPUT rules to decide which IP's to allow.
> #
> 
> $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
I believe you can drop the -p ALL.  What about traffic on lo?
> 
> I build this from reading some how-to's, sample scripts and now started 
> reading a book called "Red Hat Linux Firewalls" by Bill McCarty.
> 
> I appreciate any help.
> 
> Cheers,
> Jason
We do all of this and more automatically in the ISCS project
(http://iscs.sourceforge.net) although it is not yet production code. 
Good luck and welcome again - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


