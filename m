From: horape@tinuviel.compendium.com.ar
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 09:32:35 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214123235.GA10092@tinuviel.compendium.com.ar>
References: <20031214005212.GA8217@tinuviel.compendium.com.ar> <200312140842.08855.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312140842.08855.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> > I've a system that at its core has an UDP proxy that's the performance
> > bottleneck. I wanted to use the DNAT kernel facilities to replace my
> > code with the very tuned one on netfilter.

> > I'm adding a rule that says something like this:

> > /sbin/iptables -t nat -A PREROUTING -d myip -p udp -m udp --dport 5000 =
-j
> > DNAT --to-destination otherip:18918

> > but the rule never see the packets (they never got to the chain)

> > I assume that it's because I've a socket listening on udp:5000, and it
> > seems reasonable what's happening... I'd like to add a PREPREROUTING ch=
ain
> > that is processed before deciding if the packet is for a local socket, =
can
> > somebody give me a hint on where to look for it?

> PREROUTING works exactly as the name suggests - it is applied to packets=
=20
> before the routing decision is made about whether they are local, or bein=
g=20
> routed through the box.   Therefore you *can* use the PREROUTING chain to=
=20
> divert packets which would otherwise be accepted locally, so that they go=
 to=20
> another machine, or else divert packets which would have gone somewhere e=
lse,=20
> so that they are accepted locally.

> You say the rule never sees the packets...  how do you know this?   Are y=
ou=20
> looking at the packet / byte counters, and they stay at zero all the time?

Yes, and I've added a rule like this:

/sbin/iptables -t nat -A PREROUTING -j LOG and don't see the packets.

> You also say you have a local process listening on port 5000 - is that ge=
tting=20
> any packets and responding to them, even with above rule in place?

Yes, it continues getting the packets.

Saludos,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

