From: horape@tinuviel.compendium.com.ar
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 14:51:45 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214175144.GB19059@tinuviel.compendium.com.ar>
References: <20031214135211.GA11695@tinuviel.compendium.com.ar> <20031214160416.GA17220@tinuviel.compendium.com.ar> <200312141155.19270.JALaramie@Loudoun-Fairfax.com> <200312141716.40029.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312141716.40029.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

> > It looks like the proxy is grabbing the packets first and then dropping
> > them directly onto the INPUT chain. Try disabling the proxy and release=
 the
> > bound ports then try it again. Once the packets reach PREROUTING you can
> > DNAT them to another port.
> I could ubnderstand the proxy code managing to grab the packet off the wi=
re=20
> before netfilter (PREROUTING) sees it, but I don't see how it would then =
get=20
> seen by the INPUT chain - as far as I know, it's not possible for a packe=
t to=20
> reach netfilter's INPUT chain without first going through the PREROUTING=
=20
> chain.   If a packet bypasses one of these, it will bypass both.

> However, the idea of disabling the proxy, and then seeing if the LOG rule=
s=20
> show anything different, is a good one.

> How is the proxy connected to the socket?   Anything unusual?

The proxy is just a normal udp socket. (socket, bind, poll, recvfrom...)

What I'm doing is an IVR over H.323, the program receives and send rtp
packets until a conference is made, when the conference is made it starts
working as a proxy (ie, it gets the packet with a recvfrom and sends by
other socket with sendto) Nothing strange there.

> Antony

Saludos,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

