From: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Subject: Re: lost UDP packets with matching NAT rules
Date: Wed, 15 Feb 2006 14:18:29 +0100 (CET)
Message-ID: <freemail.20060115141829.61431@fm15.freemail.hu>
References: <200602142221.39824@krak>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602142221.39824@krak>
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
To: KOVACS Krisztian <hidden@sch.bme.hu>
Cc: netfilter@lists.netfilter.org

Hello,

thanks for your reply! See my comments below.

KOVACS Krisztian <hidden@sch.bme.hu> =EDrta:

>=20
>   Hi,
>=20
> On Tuesday 14 February 2006 10:34, Keser=FB Korn=E9l wrote:
> > I'm using iptables (v1.3.4 on a 2.6.15.3 kernel) in order to NAT
> > incoming UDP packets arriving on a single IP:port (1-1 rules in PRE-
> > and POSTROUTING chains in the nat table). I found out that=20
packets are
>=20
>   Why do you need two rules here? Redirecting incoming UDP packets=20
to a=20
> single IP:port has nothing to do with POSTROUTING, it's a single rule=20
on=20
> PREROUTING.

I also have to modify the source of the packets not only the destination
(I want to realize NAT). Maybe my sentence (about redirection) was=20
misleading.

>=20
> > How could I find out, why are the packets lost? Is there a log entry
> > somewhere that says if an UDP packet was dropped because of... ?
>=20
>   Try monitoring /proc/net/stat/ip_conntrack. I guess the number you=20
find=20
> in the insert_failed column will match the number of dropped packets.

Thanks for the hint! I checked it. Strange, that not the "insert_failed"=20
but the number in the "dropped" column is incremented with 99. 1=20
packet (the first one) was forwarded successfully. Note, that with my=20
test program I send packets from 100 different sources within a very=20
short time (some milliseconds) to the same IP:port (where iptables is=20
setup). Do I overload something with that?

Thanks,
Kornel Keseru
=0A=0A_____________________________________________________________________=
______=0AP=E9nz=FCgyi szolg=E1ltat=E1s =E9s hitelig=E9nyl=E9s interneten ke=
reszt=FCl a nap 24 =F3r=E1j=E1ban az [origo]-n.=0Ahttp://www.klikkbank.hu=
=0A=0A

