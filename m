From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: How to NOT redirect..
Date: Thu, 07 Nov 2002 23:59:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCAF044.9020509@fugmann.dhs.org>
References: <3DCAB394.BE9050AF@acabtu.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Karina_G=F3mez_Salgado?= <kgs@acabtu.com.mx>
Cc: netfilter@lists.netfilter.org

Karina G=F3mez Salgado wrote:
> Hi, I'm using iptables for redirect requests to port 80 to port 3128 of=

> Squid.
>=20
> But I have a problem, because some of the squid users have trouble
> accessing certain services through the proxy, i want to this users
> bypass the proxy when they try to reach certain sites.
>=20
I had a simillar problem where clients could access sites directly, but=20
not when the transparent quid was setup. The problem was that the server =

had ECN enabled. Some brain-dead routers/firewalls filter out all=20
packets with the ECN bit set. Disabling ECN on the firewall solved the=20
problems.
Try to look at the value of /proc/sys/net/ipv4/tcp_ecn. If the value is=20
'1', then do an 'echo 0 > /proc/sys/net/ipv4/tcp_ecn' on the machine=20
running the squid and see if the problem persists.

This might be an easier way to solve the problem rather than adding=20
specific rules to let machines bypass the proxy.

Regards
Anders Fugmann
--
Author of FIAIF
FIAIF is an intelligent firewall
http://fiaif.fugmann.dhs.org


