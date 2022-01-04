From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: nftables >= 0.9.8: atomic update (nft -f ...) of a set not
 possible any more
Date: Wed, 5 Jan 2022 00:22:22 +0100
Message-ID: <20220105002222.6695b8f7@elisabeth>
References: <5tg3b13w5.PCaY2G@prvy.eu>
        <20220104195728.GB938@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641338558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=APTNjtc/NVeYk8GhPpMv5eoWks1kKQ6Uvjyyq82/v/0=;
        b=LMftvNvyOQk3gM9xz17H/4zSqVNY7Vhh1brWYDm3LhfXeqi2Ia17/NFufBT12nA4ydrB8v
        3vRktywtGJ8IfW91SNnyKWKZduy2FlisYqlksiWAdWaqL/O2MVdx2y3A+rubKipSNLo+0w
        bNQKh0dhzsQXV877aSBswBU4YuOv83w=
In-Reply-To: <20220104195728.GB938@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Florian Westphal <fw@strlen.de>
Cc: etkaar <lists.netfilter.org@prvy.eu>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Hi Florian,

On Tue, 4 Jan 2022 20:57:28 +0100
Florian Westphal <fw@strlen.de> wrote:

> etkaar <lists.netfilter.org@prvy.eu> wrote:
>=20
> [ CC Stefano ]
>=20
> > Dear colleagues,
> >=20
> > given is following perfectly working ruleset (nft list ruleset), which =
drops almost all of the IPv4 traffic, but grants access to port 22 (SSH) fo=
r two IPv4 addresses provided by the set named 'whitelist_ipv4_tcp': =20
>=20
> Thanks for reporting, I can reproduce this.
>=20
> > +++
> > table inet filter {
> > 	set whitelist_ipv4_tcp {
> > 		type inet_service . ipv4_addr
> > 		flags interval
> > 		elements =3D { 22 . 111.222.333.444,
> > 			=C2=A0 =C2=A0 =C2=A022 . 555.666.777.888 }
> > 	} =20
>=20
> I can repro this, looks like missing scratchpad cloning in the set
> backend.
>=20
> I can see that after second 'nft -f', avx2_lookup takes the 'if (unlikely=
(!scratch)) {' branch.
>=20
> Can you try this (kernel) patch below?
>=20
> As a workaround, you could try removing the 'interval' flag so that
> kernel uses a hash table as set backend instead.
>=20
> Stefano, does that patch make sense to you?
> Thanks!

Thanks for checking and fixing this!

Yes, it makes sense, a clone without a subsequent new insertion
wouldn't have a scratchpad otherwise -- I wonder how I missed this.
Just perhaps:

> diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipap=
o.c
> --- a/net/netfilter/nft_set_pipapo.c
> +++ b/net/netfilter/nft_set_pipapo.c
> @@ -1271,7 +1271,7 @@ static struct nft_pipapo_match *pipapo_clone(struct=
 nft_pipapo_match *old)
>  {
>  	struct nft_pipapo_field *dst, *src;
>  	struct nft_pipapo_match *new;
> -	int i;
> +	int i, err;
> =20
>  	new =3D kmalloc(sizeof(*new) + sizeof(*dst) * old->field_count,
>  		      GFP_KERNEL);
> @@ -1291,6 +1291,14 @@ static struct nft_pipapo_match *pipapo_clone(struc=
t nft_pipapo_match *old)
>  		goto out_scratch;
>  #endif
> =20
> +	err =3D pipapo_realloc_scratch(new, old->bsize_max);
> +	if (err) {
> +#ifdef NFT_PIPAPO_ALIGN
> +		free_percpu(new->scratch_aligned);
> +#endif

I would use another label for this, "out_scratch_aligned", for
consistency with the rest of the error handling, but it's not a strong
preference.

> +		goto out_scratch;
> +	}
> +
>  	rcu_head_init(&new->rcu);
> =20
>  	src =3D old->f;
>=20

--=20
Stefano

