From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Re IPv6 MARK support
Date: Wed, 28 Feb 2007 21:38:13 +0900 (JST)
Message-ID: <200702281238.l1SCcEL0012637@toshiba.co.jp>
References: <200702281053.l1SArNIC025800@toshiba.co.jp>
	<200702281136.l1SBaJLe019021@toshiba.co.jp>
	<2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>
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
To: mael.boutin@laposte.net
Cc: netfilter@lists.netfilter.org


Hi,

From: "Boutin Ma=EBl" <mael.boutin@laposte.net>
Date: Wed, 28 Feb 2007 12:53:44 +0100

> Thanks for the patch, however it does not work, the kernel does not c=
ompile :
> =

> line 18:
> =

> struct sk_buff has no member named mark (it should be nfmark no ?)
> unknown field "mark" specified in initializer

Ah yes. nfmark is renamed to mark at 2.6.20.

> To answer your previous questions :
> yes i have logs in the kernel for both out6 and post6.

Thanks.

> Of course i can try 2.6.20 but it seems to me that there is the same
> problem (i tried before)

I think so.

> In my opinion the problem is due to the fact that the routing decisio=
n
> is made before OUTPUT chain but not relaunched once the nfmark routin=
g
> key is changed which is i think how it should work.

Yes. That is what ip6_route_me_harder does.

How about this for 2.6.19 ?

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
+		.mark =3D skb->nfmark,
 		.nl_u =3D
 		{ .ip6_u =3D
 		  { .daddr =3D iph->daddr,

