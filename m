From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Sat, 08 Nov 2008 12:21:13 +0100
Message-ID: <49157629.2020104@plouf.fr.eu.org>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com> <49149060.70100@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49149060.70100@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
>=20
> What you want to do is have a very similar rule to DNAT any outbound=20
> traffic (coming in the internal interface to go out the external=20
> interface) that is destined to the IP and / or port of the service=20
> DNATed over to the internal IP / port as well.  I.e.
>=20
>    iptables -t nat -A PREROUTING -i eth1 -d $PUBLIC_IP -p tcp --dport=
=20
> 443 -j DNAT --to-destination $PRIVATE_IP

And make sure that traffic forwarded from eth1 to eth1 is ACCEPTed in=20
the filter/FORWARD chain.

> Now to prevent what I call a "TCP Triangle" you will need to SNAT the=
=20
> internal traffic that is being redirected back to the $PRIVATE_IP so=20
> that replies pass back through the router and back to the original=20
> client rather than the $PRIVATE_IP replying directly to the original=20
> client.  (See 'Julian's TCP Triangle' page=20
> "http://jengelh.medozas.de/images/dnat-mistake.png" for a diagram.)
>=20
>    iptables -t nat -A POSTROUTING -o eth1 -s $PRIVATE_LAN/$NM -d=20
> $PRIVATE_IP -j MASQUERADE
>=20
> Note:  You can use either the MASQUERADE or SNAT target depending on=20
> your preferences or what ever is compiled in to your kernel.  I chose=
=20
> MASQUERADE so I did not have to take your routers internal IP in to=20
> account in the rule(s) above.

Note both SNAT and MASQUERADE hide the real source address from the=20
server, which may be annoying for logging or access control purposes.=20
Source NAT is not required to avoid the "routing triangle" if the serve=
r=20
itself can route the return traffic to the NAT router. This can be=20
achieved with advanced routing on Linux. Alternatively, the router may=20
use the NETMAP target instead of SNAT or MASQUERADE to do a 1-to-1=20
mapping of the source address range into another range, so the original=
=20
source address can be retrieved.
