From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: ssh connecting to wrong machine....
Date: Sun, 2 Jun 2002 21:58:14 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <002c01c20aaa$812e04b0$020aa8c0@matttm9svd8lrh>
References: <20020602192157.A16556@trot.haven.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: George Georgalis <georgw@galis.org>, netfilter@lists.samba.org

George,
The general rule for ip/port forwarding to internal machine is simple. You
have one PREROUTING rule that changes the destination address/port.  You
then have one FORWARD rule that allows the packets to be forwarded (because
you are, or should be, by default dropping everything in the FORWARD chain).

> iptables -t nat -A PREROUTING -p tcp -s $EXT_host04 -j
DNAT --to-destination $LAN_host04

This is the major problem. If you're connection from a host on the Internet
the source address is not going to be your firewall. Change this line to:
iptables -t nat -A PREROUTING -p tcp -j DNAT --to-destination $LAN_host04

I would consider tightening up your forward rules as well:

> iptables -A FORWARD -i $EXTIF -o $LANIF -p tcp -m multiport --dport
$TCP_OPEN -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

Might I suggest doing something similar to what you did for the input rules:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $EXTIF -o $LANIF -d $LAN_host04 -p tcp -m
multiport --dport $TCP_OPEN -m state --state NEW -j ACCEPT
iptables -A FORWARD -i $EXTIF -o $LANIF -d $LAN_host04 -p udp -m
multiport --dport $UDP_OPEN -m state --state NEW -j ACCEPT

Notice I added the "-d $LAN_host04"....very important restriction.

Also, what is UDP port 22 for?  Is your firewall running all the same
services as $LAN_host04?  You are allowing the same access to it.

Goodluck,
Matt







