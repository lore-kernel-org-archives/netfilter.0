From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Fwd: Re: MSN Messenger through a iptables firewall.
Date: Thu, 4 Jul 2002 15:31:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207041431.g64EVbU32016@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter <netfilter@lists.samba.org>

Someone else just posted this to me instead of to the list (or to the person 
with the problem).

Antony.

----------  Forwarded Message  ----------

Subject: Re: MSN Mesanger through a iptables firewall.
Date: Thu, 4 Jul 2002 16:30:08 +0200
From: <robert@ruegner.net>
To: "Antony Stone" <Antony@Soft-Solutions.co.uk>

try this http://linux-igd.sourceforge.net/about.php

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Thursday, July 04, 2002 4:21 PM
Subject: Re: MSN Mesanger through a iptables firewall.

> On Thursday 04 July 2002 3:06 pm, Stephan Viljoen wrote:
> > Firewall 1:
> > eth0 : 193.220.24.230 : uplink  , Gateway : 193.220.24.193
> > eth1 : 10.0.0.1/16
> >
> > echo "   enabling forwarding.."
> > echo "1" > /proc/sys/net/ipv4/ip_forward
> > $IPTABLES -F
> > $IPTABLES -X
> > $IPTABLES -P FORWARD ACCEPT
> > $IPTABLES -t nat -A POSTROUTING -s 10.0.0.1/16 -o eth0 -j MASQUERADE
> > $IPTABLES -A FORWARD -i eth0 -o eth1 -m state --state

ESTABLISHED,RELATED

> > -j ACCEPT
> > $IPTABLES -A FORWARD -i eth1 -o eth0 -j ACCEPT
>
> I don't see the point of you having these two FORWARDing rules when the
> default policy on this chain is ACCEPT ?   It's just an open router.
>
> > Firewall 2:
> > eth0 : 193.220.24.8
> > eth1 : 193.220.24.193
> > eth2 : 192.168.1.1
> >
> > $IPTABLES -F
> > $IPTABLES -X
> > $IPTABLES -P FORWARD ACCEPT
> > $IPTABLES -A FORWARD -i eth0 -o eth1 -m state --state

ESTABLISHED,RELATED

> > -j ACCEPT
> > $IPTABLES -A FORWARD -i eth1 -o eth0 -j ACCEPT
> >
> > $IPTABLES -t nat -A POSTROUTING -s 192.168.1.1/24 -o $EXTIF -j

MASQUERADE

> > $IPTABLES -A FORWARD -i eth0 -o eth2 -m state --state

ESTABLISHED,RELATED

> > -j ACCEPT
> > $IPTABLES -A FORWARD -i eth2 -o eth0 -j ACCEPT
>
> Again, there's no point in having any of these four FORWARDing rules when

the

> default policy is ACCEPT.   This firewall is also simply an open router.
>
>
>
> Antony.

-------------------------------------------------------

