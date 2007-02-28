From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Re IPv6 MARK support
Date: Wed, 28 Feb 2007 20:36:18 +0900 (JST)
Message-ID: <200702281136.l1SBaJ3T008745@toshiba.co.jp>
References: <2acb06d50702280004r5dae5aa1p6fb1f0bc9543a3d3@mail.gmail.com>
	<2acb06d50702280155x6b6f89e3o89097e070880ae3e@mail.gmail.com>
	<200702281053.l1SArNIC025800@toshiba.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702281053.l1SArNIC025800@toshiba.co.jp>
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: yasuyuki.kozakai@toshiba.co.jp
Cc: netfilter@lists.netfilter.org


Hi again,

From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Date: Wed, 28 Feb 2007 19:53:22 +0900 (JST)

> =

> Hi,
> =

> From: "Boutin Ma=EBl" <mael.boutin@laposte.net>
> Date: Wed, 28 Feb 2007 10:55:01 +0100
> =

> > After some tests, it appears that it is the OUTPUT chain that does =
not
> > work. Indeed with the PREROUTING chain the mark is taken into accou=
nt
> > by iproute and the packet is routed as indicated in the correspondi=
ng
> > tables.
> > =

> > Is it a bug or something i missed ?
> =

> I suspect IPv6 routing. But for conformation, can you try
> =

> 	ip6tables -t mangle -A OUTPUT -m mark --mark 0x1 -j LOG	--log-prefix=
 "out6 "
> 	ip6tables -t mangle -A POSTROUTING -m mark --mark 0x1 -j LOG --log-p=
refix "post6 "
> =

> after your rules and check whether you can see some log by LOG target=
 ?
> And do you have any chance to try 2.6.20 ?

I found that ip6_route_me_harder() doesn't take into account of mark.

Can you try this patch ?

Regards,

[NETFILTER]: ip6_route_me_harder should take into account mark

Signed-off-by: Yasuyuki Kozakai <yasuyuki.kozakai@toshiba.co.jp>

diff --git a/net/ipv6/netfilter.c b/net/ipv6/netfilter.c
index f6294e5..ca50b58 100644
--- a/net/ipv6/netfilter.c
+++ b/net/ipv6/netfilter.c
@@ -15,6 +15,7 @@ int ip6_route_me_harder(struct sk_buff *
 	struct dst_entry *dst;
 	struct flowi fl =3D {
 		.oif =3D skb->sk ? skb->sk->sk_bound_dev_if : 0,
+		.mark =3D skb->mark,
 		.nl_u =3D
 		{ .ip6_u =3D
 		  { .daddr =3D iph->daddr,

