From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Masquerade stopped working?!?!
Date: Sun, 3 Aug 2003 17:42:58 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308031716270.8771-100000@localhost>
References: <1059926792710.ew5.dummy1@gazeta.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059926792710.ew5.dummy1@gazeta.pl>
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
To: dummy1@gazeta.pl
Cc: netfilter@lists.netfilter.org

Hi Jakub,

> > To connect coumputers from my local network to the internet I used
> > iptables and masquerade (snat was working to). Everything was working
> > fine since one day. Suddenly, about one week ago, machines from local
> > network have stopped seeing Internet, but my box is working fine. I
> > suspect my ISP doing some nasty dirty tricks. Is it possible that ISP
> > can recognize packets which are coming from my local network and drops
> > it? And how should I configure my box to go around this problem?
> > Please help! I spend a couple of days browsing Internet and reading
> > tons of documention and still know nothing.

It is possible that the ISP can recognise packets coming from machines in
your network, by looking at the TTL. As a router, your box should
decrement the TTL of packets which it forwards, and as a result the
packets which it forwards for the inside machines will have a different
TTL (one less) than if those boxes were directly connected.

Since Windows and Linux machines have well known "standard" TTLs, it's
possible to use this to block access from machines behind a router,
without blocking access for the router itself.

You can try using the TTL target of iptables to re-increment the TTL, so 
that it appears as though those boxes were directly connected, with such 
a rule:

  iptables -t mangle -A POSTROUTING -o <external-interface> \
	-j TTL --ttl-inc 1

But if you have Windows boxes on your network, they will still have a
different TTL to packets from your Linux box (I think), and once again the
ISP can be aware that more than one machine is in use. So it might be
better to use the TTL target to lock the TTL to some fixed value:

  iptables -t mangle -A POSTROUTING -o <external-interface> \
	-j TTL --ttl-set 64

where 64 appears to be the default for Linux boxes (at least with a 2.4 
kernel, as mine has).

There is also a possible innocent explanation, in that perhaps your ISP
has introduced a router with a lower TTL, which would require all packets
going through it to be fragmented. Windows and Linux do Path MTU Discovery
by default, which requires the receipt of ICMP fragmentation-needed
packets.

If these packets are not being forwarded to your inside machines for some
reason (e.g. a bug in iptables, or you are using an older version, or they
are blocked by your firewall rules), then you would be able to ping, but
full-sized packets from a web server page response or an FTP download
would not make it to your machine. You can test this by using tcpdump to 
determine whether ICMP fragmentation-needed packets are arriving on your 
external interface, and whether they are being correctly masqueraded by 
iptables and forwarded to the relevant machine on your internal interface.

Finally, and this is probably not the cause of your problem, but if your
ISP cares about people using NAT then you should be aware that they can
still use a technique devised by Steve Bellovin to monitor IP IDs and
determine (approximately) how many machines are active behind a NAT
router:

  [http://www.research.att.com/%7Esmb/papers/fnat.pdf]

This attack has already been implemented in at least one commercial 
product, sFlow [http://www.sflow.org/]. It is possible that your ISP is 
using this software to detect users who are running NAT. However, as far 
as I'm aware there is no simple way to use this attack to actually block 
the NATted hosts without blocking the router itself. It's more likely 
that your ISP would send you a nasty letter in this case.

Mr Bellovin proposes that IP IDs should be randomised by NAT gateways to
prevent this second attack, but as far as I know this cannot be done by 
iptables (yet) and no free software exists to make a Linux box do it.

Finally, Mr Bellovin points out that other techniques could be used to 
passively fingerprint the machines in your network, to determine the 
number of different OSes in use, if not the number of actual machines. I'm 
not aware of any technique to prevent this other than the enforced use of 
application-level proxies on the router/firewall box.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


