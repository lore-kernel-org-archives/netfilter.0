From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables >= 0.9.8: atomic update (nft -f ...) of a set not
 possible any more
Date: Tue, 4 Jan 2022 20:57:28 +0100
Message-ID: <20220104195728.GB938@breakpoint.cc>
References: <5tg3b13w5.PCaY2G@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5tg3b13w5.PCaY2G@prvy.eu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: etkaar <lists.netfilter.org@prvy.eu>
Cc: netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>, sbrivio@redhat.com

etkaar <lists.netfilter.org@prvy.eu> wrote:

[ CC Stefano ]

> Dear colleagues,
>=20
> given is following perfectly working ruleset (nft list ruleset), which dr=
ops almost all of the IPv4 traffic, but grants access to port 22 (SSH) for =
two IPv4 addresses provided by the set named 'whitelist_ipv4_tcp':

Thanks for reporting, I can reproduce this.

> +++
> table inet filter {
> 	set whitelist_ipv4_tcp {
> 		type inet_service . ipv4_addr
> 		flags interval
> 		elements =3D { 22 . 111.222.333.444,
> 			=A0 =A0 =A022 . 555.666.777.888 }
> 	}

I can repro this, looks like missing scratchpad cloning in the set
backend.

I can see that after second 'nft -f', avx2_lookup takes the 'if (unlikely(!=
scratch)) {' branch.

Can you try this (kernel) patch below?

As a workaround, you could try removing the 'interval' flag so that
kernel uses a hash table as set backend instead.

Stefano, does that patch make sense to you?
Thanks!

diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@ -1271,7 +1271,7 @@ static struct nft_pipapo_match *pipapo_clone(struct n=
ft_pipapo_match *old)
 {
 	struct nft_pipapo_field *dst, *src;
 	struct nft_pipapo_match *new;
-	int i;
+	int i, err;
=20
 	new =3D kmalloc(sizeof(*new) + sizeof(*dst) * old->field_count,
 		      GFP_KERNEL);
@@ -1291,6 +1291,14 @@ static struct nft_pipapo_match *pipapo_clone(struct =
nft_pipapo_match *old)
 		goto out_scratch;
 #endif
=20
+	err =3D pipapo_realloc_scratch(new, old->bsize_max);
+	if (err) {
+#ifdef NFT_PIPAPO_ALIGN
+		free_percpu(new->scratch_aligned);
+#endif
+		goto out_scratch;
+	}
+
 	rcu_head_init(&new->rcu);
=20
 	src =3D old->f;
