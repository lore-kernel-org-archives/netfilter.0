From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: SNAT rule in the POSTROUTING chain ignored?
Date: Wed, 06 Jul 2005 16:07:35 +0200
Message-ID: <1120658855.5642.24.camel@nienna.balabit>
References: <freemail.20050606153707.14041@fm1.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <freemail.20050606153707.14041@fm1.freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Cc: netfilter@lists.netfilter.org


  Hi,

2005-07-06, sze keltez=E9ssel 15.37-kor Keser=FB Korn=E9l ezt =EDrta:
> When I send packet with the problematic application, no lines appear in=
=20
> kern.log.
[...]
> My SNAT rule looks like this:
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  anywhere             anywhere            to:10.10.2=
.222
>=20
> So I think, the rule is general enough. I tried to filter on interface,=
=20
> source address, protocol, etc. but no effect...
>=20
> Can an application somehow specify that iptables shouldn't have any=20
> effect on its outgoing packets?

  No, unless it runs as root, uses PF_PACKET sockets and does full
packet assembly "by hand". If you don't have access to the source code
you could try using strace to find out what kind of sockets the given
application opens.

--=20
 Regards,
  Krisztian Kovacs


