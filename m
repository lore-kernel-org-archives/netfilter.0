From: Jihoon Chung <difro@sexycoder.com>
Subject: Re: icmp echo packets not masqueraded properly.
Date: Wed, 19 Mar 2003 12:47:51 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030319034750.GA19265@morpheus>
References: <20030318073201.GA7700@morpheus> <200303182222.44556.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200303182222.44556.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

Thanks for the reply..

On Tue, Mar 18, 2003 at 10:22:44PM -0500, Joel Newkirk wrote:
> >
> > And the Masquerading rule is:
> > `iptables -t filter -A FORWARD -j MASQUERADE`;
> 
> I hope this is a mistype, and you're actually doing this in -t nat -A 
> POSTROUTING?  The MASQUERADE target is only valid in that chain.

Oops. Yes, it is a mistype. I meant -t nat.

> 
> > The problem occurs when I'm pinging from the notebook (host inside the
> > firewall) to any host outside the firewall.
> >
> > When ppp0 dies and the default-route gets changed to eth1 while
> > pinging from the notebook,  the ping session is still masqueraded to
> > ppp0's ip address !! ,  even though the packets are routed through
> > eth1. (I found this by tcpdumping on eth1)
> >
> > If I stop the ping on the notebook and wait 30 seconds and ping again,
> > it behaves fine.
> 
> Is this ALL traffic, or just ICMP? Only if the pinging was already taking 
> place as the route was changed?

Yes, just ICMP and only when the pinging was already taking place.

> 
> There's a 30-second timeout, IIRC, on ICMP in conntrack.  When MASQUERADE 
> detects that a device is no longer available it is supposed to dump all 
> conntrack entries associated with that device.  It appears that it is 
> not doing so, and the entries are simply expiring after timeout.  Is 
> device ppp0 still in the system, just not valid and not routed through?  
> If so, you might try taking it down from your route-changing daemon.

Well, 'ip addr list' shows ppp0 but with no ip address.
I tried taking it down completely (doesn't show in 'ip add list', no
pppd running.), but stil the problem exists.

> > Is there anyway I can make it behave without "stop-wait30sec" ?
> >
> > (by the way , I searched in /proc and tried turning on
> >  /proc/sys/net/ipv4/ip_dynaddr , but nothing changed.)
> 
> That has to be enabled for the MASQUERADE target to work properly anyway.
> 
> j
> 

