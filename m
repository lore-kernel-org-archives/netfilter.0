From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: iptables and udp socket
Date: Mon, 01 Aug 2005 17:44:01 +0200
Message-ID: <1122911041.4319.13.camel@nienna.balabit>
References: <freemail.20050701171048.22863@fm18.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <freemail.20050701171048.22863@fm18.freemail.hu>
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


  Hi Kornel,

2005-08-01, h keltez=E9ssel 17.10-kor Keser=FB Korn=E9l ezt =EDrta:
> In the meantime I played with connection tracking and I found out that
> my iptables rules usually work parallel with the UDP traffic on the loc=
al=20
> socket if I set ip_conntrack_udp_timeout to 0. But for me it seems, it=20
> doesn't really disable udp connection tracking, does it? I think, it on=
ly=20
> sets the timeout to a very low value but the connection is still tracke=
d,=20
> therefore it may happen that sometimes iptables will fail in my scenari=
o.=20
> My problem is that I cannot avoid using UDP socket and iptables rule=20
> installed on the same IP:port.
>=20
> Is there a better way to "disable" UDP connection tracking and=20
> therefore to realize stateless behaviour of UDP in my scenario?

  The problem is that Netfilter has absolutely no stateless NAT support.
Once you disable connection tracking for UDP (which you could do with an
appropriate rule in 'raw' table using the 'NOTRACK' target), you won't
be able to NAT that connection...

--=20
 Regards,
  Krisztian Kovacs


