From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: SNAT
Date: Wed, 13 Nov 2002 12:21:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32101998D@hslex01.hsl-brabantzuid.nl>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

> > > > iptables -t nat -I POSTROUTING -p udp -s 192.168.0.1 --sport 53 -j
> > > > SNAT --to-source 200.200.200.1:53

> > > I don't know if dns traffic is always sent *from* 53/udp, but I do
> > > know it is always sent *to* 53/udp.

> > Not *always* :-)   Sometimes it goes to 53/tcp...

> I think that the DNS traffic goes only on 53/tcp when transfering
> zones, and it uses the 53/udp for the queries.
>
> Also, if you use the BIND implementation of the DNS server, you
> can specify the source port, so the traffic can go from
> 53/udp to 53/udp

Of course you're right.
Anyway, I interpret the original question as how to SNAT normal dns traffic
because the rule he wrote was using the udp protocol for *source* port
53/udp, which doesn't have to match *all* dns traffic (if it does).
That's why I mentioned that I don't know if dns traffic always come *from*
port 53/udp (here it doesn't ; it uses some port above 1024), but I do know
it's going *to* port 53/udp.


Rob


