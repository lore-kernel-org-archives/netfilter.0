From: "claudio987\@libero\.it" <claudio987@libero.it>
Subject: RE: Wol Magic Packets
Date: Tue, 29 Aug 2006 13:38:50 +0200
Message-ID: <J4RCCQ$90300DFBE572C56BB53FC8E3AEB5BD68@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

---------- Initial Header -----------

From      : netfilter-bounces@lists.netfilter.org
To          : "netfilter" netfilter@lists.netfilter.org
Cc          : 
Date      : Tue, 29 Aug 2006 07:54:10 +0200
Subject : RE: Wol Magic Packets







> >> If WOL packets really *do* enter your network then I don't know how
> >> to block them. 
> >> 
> >> According to the AMD whitepaper a WOL packet is sent using a subnet
> >> directed broadcast to pass through routers. If you search around the=

> >> internet, you find that directed broadcasts can be blocked by using:=

> >> "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts".
> >> But, that's ICMP and UDP seems (commonly) to be used for WOL packets=

> >> so this would not help you. 
> >> 
> > packet enters only if I send it to a port opened into the
> > router...: for example: if I forward port 30 tcp\udp to
> > 192.168.0.2 (pc of my lan) and I send a wol packet for
> > another internet address out of my lan to poty 30 of external
> > ppp0 interface of my router, pc 192.168.0.2 turns on
> > 
> 
> Yes, well, you've said that before and as I said: if these *do* enter
> your network then I don't know how to block them.
> Perhaps you can search for the String match (it's in an older POM-ng an=
d
> which I never used) and try to catch those WOL packets by matching it's=

> contents. Since each WOL packet looks the same (6 bytes FF followed by
> 16 bytes containing the MAC address of the PC to wake up), you should b=
e
> able to do it.
> 
> 
> Gr,
> Rob
> 
> 
> 
how can I do it?=0A=0A=0A________________________________________________=
___________________=0ASalva ora il tuo preventivo gratuito Direct Line e =
assicurati lo sconto extra 5+5% sulla polizza auto!=0Ahttp://click.libero=
.it/directline2=0A


