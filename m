From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: icmp echo packets not masqueraded properly.
Date: Tue, 18 Mar 2003 22:22:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303182222.44556.netfilter@newkirk.us>
References: <20030318073201.GA7700@morpheus>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030318073201.GA7700@morpheus>
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
To: Jihoon Chung <difro@sexycoder.com>, netfilter@lists.netfilter.org

No answers, just questions and thoughts...

On Tuesday 18 March 2003 02:32 am, Jihoon Chung wrote:

> (I've written a small daemon which detects status of ppp0 and changes
> to default route accordingly, and this calls 'ip route flush cache'
> everytime it changeds routes)
>
> And the Masquerading rule is:
> `iptables -t filter -A FORWARD -j MASQUERADE`;

I hope this is a mistype, and you're actually doing this in -t nat -A=20
POSTROUTING?  The MASQUERADE target is only valid in that chain.

> The problem occurs when I'm pinging from the notebook (host inside the
> firewall) to any host outside the firewall.
>
> When ppp0 dies and the default-route gets changed to eth1 while
> pinging from the notebook,  the ping session is still masqueraded to
> ppp0's ip address !! ,  even though the packets are routed through
> eth1. (I found this by tcpdumping on eth1)
>
> If I stop the ping on the notebook and wait 30 seconds and ping again,
> it behaves fine.

Is this ALL traffic, or just ICMP? Only if the pinging was already taking=
=20
place as the route was changed?

There's a 30-second timeout, IIRC, on ICMP in conntrack.  When MASQUERADE=
=20
detects that a device is no longer available it is supposed to dump all=20
conntrack entries associated with that device.  It appears that it is=20
not doing so, and the entries are simply expiring after timeout.  Is=20
device ppp0 still in the system, just not valid and not routed through? =20
If so, you might try taking it down from your route-changing daemon.

> Is there anyway I can make it behave without "stop-wait30sec" ?
>
> (by the way , I searched in /proc and tried turning on
>  /proc/sys/net/ipv4/ip_dynaddr , but nothing changed.)

That has to be enabled for the MASQUERADE target to work properly anyway.

j


