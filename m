From: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Subject: Re: SNAT rule in the POSTROUTING chain ignored?
Date: Wed, 6 Jul 2005 15:37:07 +0200 (CEST)
Message-ID: <freemail.20050606153707.14041@fm1.freemail.hu>
References: <1120655138.5642.15.camel@nienna.balabit>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1120655138.5642.15.camel@nienna.balabit>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: KOVACS Krisztian <hidden@balabit.hu>
Cc: netfilter@lists.netfilter.org

Hello,

when I send packets with the java program, lines like the following one=20
appear in the kern.log, and iptables rules have the expected effect.

Jul  5 18:59:48 localhost kernel: IN=3D OUT=3Deth0 SRC=3D10.10.2.122=20
DST=3D10.10.2.28 LEN=3D39 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF=20
PROTO=3DUDP SPT=3D5060 DPT=3D5060 LEN=3D19

When I send packet with the problematic application, no lines appear in=20
kern.log.

In the meantime I developed another C application that sends UDP=20
packets from the same IP and port (5060) and it works as weel. But I=20
cannot understand why iptables doesn't have any effect on the=20
packets of the other C application (developed by other people).
The problematic application sends SIP (UDP) messages, while my=20
application sends only dummy UDP packets. But I think, this is the only=20
difference.

My SNAT rule looks like this:
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere            to:10.10.2.222

So I think, the rule is general enough. I tried to filter on interface,=20
source address, protocol, etc. but no effect...

Can an application somehow specify that iptables shouldn't have any=20
effect on its outgoing packets?

Bye,
Kornel Keseru


KOVACS Krisztian <hidden@balabit.hu> =EDrta:

>=20
>   Hi,
>=20
> 2005-07-05, k keltez=E9ssel 20.00-kor Keser=FB Korn=E9l ezt =EDrta:
> > I tried to debug the things in /var/log/kern.log and I found, that=20
some=20
> > debug lines appear when the java application sends something,=20
but=20
> > nothing appears when the C application sends.
> > Do you have any idea why iptables can not work for packets of the=20
C=20
> > application altough it works for a java application?
> > Thank you for your help in advance.
>=20
>   Could you please tell us what those debug lines are? Probably that
> would help a lot.
>=20
> --=20
>  Regards,
>   Krisztian Kovacs
>=20
> =0A=0A___________________________________________________________________=
_____________=0A[freemail] extra 1GB-os postafi=F3kkal, =D6nnek m=E1r van? =
http://freemail.hu=0A=0A

