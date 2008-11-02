From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Weird NAT problem
Date: Sun, 02 Nov 2008 12:08:21 +0100
Message-ID: <490D8A25.6020506@plouf.fr.eu.org>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net> <490CDDA9.90200@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490CDDA9.90200@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
>=20
> The first thing that comes to mind is that you may be dealing with an=
=20
> MTU / MSS issue.  Some of your connections work and some never seem t=
o=20
> start, which is a classic symptom of an MTU / MSS mis-match with the=20
> ICMP error being filtered out along the way.

Or with the ICMP error not being generated at all, because of the MTU=20
mismatch not occuring at an IP device. This is quite common with a DSL=20
modem acting as transparent bridge : as it works only at the link layer=
,=20
when it receives a PPPoE frame bigger than 1500 bytes from the ISP, it=20
cannot either forward it on the ethernet link, fragment it or send an=20
ICMP error.

The ISP routers should be responsible for doing the fragmentation and=20
sending ICMP errors. But unfortunately they don't always do it.=20
Sometimes the ISP don't even know the customer uses PPPoE, for example=20
when it uses a third-party DSL carrier which deals with the PPPoX stuff=
=20
and delivers user sessions to the ISP in L2TP tunnels.

> Try playing with the TCPMSS match extension and target to clamp the M=
SS=20
> to some lower values.

Be aware that this workaround only works for TCP, not for other IP=20
protocols such as UDP, ICMP (big pings), GRE, IPSec (AH, ESP), IPIP, 6i=
n4...

