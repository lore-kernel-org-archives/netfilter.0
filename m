From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Sat, 14 Sep 2013 15:41:35 +0200
Message-ID: <5234678F.6010401@plouf.fr.eu.org>
References: <8761u59uit.fsf@vostro.rath.org> <5232B01B.2030007@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5232B01B.2030007@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Vigneswaran R a =E9crit :
> Hello Nikolaus,
>=20
> I have a doubt. It seems, rath of ebox is assigned with IP address in=
=20
> the range 192.168.12.0/24. However, IP address of vostro seems to be=20
> 192.168.17.47 (assuming /24). Ebox doesn't have any route to this ran=
ge.=20
> So it try to use default route via eth0.

Correct.

> What I assume is, 'vostro' has IP addresses in (atleast) two ranges=20
> (192.168.12.0/24, 192.168.17.0/24). In the default routing table, the=
=20
> src IP is set to 192.168.12.x (for the packets originating from vostr=
o).=20
> However, the 'tovpn' table didn't specify the src IP. So, when the=20
> 'tovpn' table is being used, the packets may have got the src IP as=20
> 192.168.17.x.
>=20
> I think, you can avoid this by explicitly specifying the src IP when=20
> adding the route to 'tovpn' table,
>=20
>      ip route add default via 192.168.12.1 src 192.168.12.x table tov=
pn

This won't work. It's too late. The source address has already been
selected by the TCP layer when the packet was created and won't be
changed when the packet is re-routed due to the mark.

Possible workarounds :
- Add a route on ebox to let it know that 192.168.17.47 is reachable
through rath. My favourite choice.
- Use SNAT to the address of the output interface on vostro.
- Use connection mark (connmark) by iptables on ebox so that replies to
original packets received on a given interface are forwarded to the sam=
e
interface.
