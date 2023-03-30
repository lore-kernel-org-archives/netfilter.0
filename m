From: Kiernan George <kbg98@vt.edu>
Subject: Re: Creating a map programmatically using the C library libnftnl
Date: Thu, 30 Mar 2023 13:17:46 -0400
Message-ID: <CAOg40qjrXRQyMic-KSEA16rxfT4zBPRmPEOkLx-49x9EQPtZew@mail.gmail.com>
References: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
 <20230328150941.GB25361@breakpoint.cc> <CAOg40qhR5vXo=tkNThLTbZ3nK0MZDf=VwONarYBg4KFokYCqcg@mail.gmail.com>
 <20230330160954.GA22225@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112; t=1680196677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+P9fJ+zrLTeg4VcGo8GyF2NoRPSQngLpeB8yh8QuxAs=;
        b=pJy1vvxiYeZ+lQotSq+1pXqvRrQGPrrL4VN6hBIWNoW0xdVV8SMD/X6rhai00liBuW
         rfRiCB45LbgBnaqyIYM6QswPpnmKup9Ol1tVdYVOW12xH45TNIZnU740QGFUBzJIUjdp
         Ikt1qnqP0pX4/bdGAG2PYnIo3mkm7C68UwHgrglZ7ilz8w7nJkPiM82GrozvyS/PNs0P
         OJ493lY6jBiq6lOgC1WLtDAyrZa9NJM13aqojxEvr75ZakrAdeaBHlylweeTDlZE52TQ
         ANJLPOH4MnnjGaYw6hd/fVv5XNiu3D7UymUAGEgzVpaVv/lXbg70dV28AkL7wcXO23hD
         C54w==
In-Reply-To: <20230330160954.GA22225@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

That works to create the map, but when I go to add an element through
the command line it fails with this error:

root@laptop:/tmp# nft add element netdev example test2 { 1.1.1.1 .
1111 : 2.2.2.2 }
Error: Could not process rule: File exists
add element netdev example test2 { 1.1.1.1 . 1111 : 2.2.2.2 }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Do you have any insight?

On Thu, Mar 30, 2023 at 12:09=E2=80=AFPM Florian Westphal <fw@strlen.de> wr=
ote:
>
> Kiernan George <kbg98@vt.edu> wrote:
> > I'm not sure how to take that example and modify it to create the type =
of
> > map I mentioned in my initial request, or how to work in IPV6 for examp=
le.
> > I could also use an example on how to add an element to a map
> > programmatically. I see there is the nft-set-add, but it does not work =
on a
> > map.
>
> diff --git a/examples/nft-map-add.c b/examples/nft-map-add.c
> --- a/examples/nft-map-add.c
> +++ b/examples/nft-map-add.c
> @@ -26,6 +26,16 @@
>  #include <libmnl/libmnl.h>
>  #include <libnftnl/set.h>
>
> +/* See nftables/include/datatype.h. We should place these datatypes in
> + * a public header so third party applications still work with nftables.
> + */
> +#define TYPE_BITS 6
> +
> +enum nft_key_types {
> +        TYPE_IPADDR        =3D 7,
> +        TYPE_INET_SERVICE  =3D 13,
> +};
> +
>  static struct nftnl_set *setup_set(uint8_t family, const char *table,
>                                  const char *name)
>  {
> @@ -40,14 +50,11 @@ static struct nftnl_set *setup_set(uint8_t family, co=
nst char *table,
>         nftnl_set_set_str(s, NFTNL_SET_TABLE, table);
>         nftnl_set_set_str(s, NFTNL_SET_NAME, name);
>         nftnl_set_set_u32(s, NFTNL_SET_FAMILY, family);
> -       nftnl_set_set_u32(s, NFTNL_SET_KEY_LEN, 2);
> -       /* See nftables/include/datatype.h, where TYPE_INET_SERVICE is 13=
. We
> -        * should place these datatypes in a public header so third party
> -        * applications still work with nftables.
> -        */
> -       nftnl_set_set_u32(s, NFTNL_SET_KEY_TYPE, 13);
> -       nftnl_set_set_u32(s, NFTNL_SET_DATA_LEN, 2);
> -       nftnl_set_set_u32(s, NFTNL_SET_DATA_TYPE, 13);
> +       nftnl_set_set_u32(s, NFTNL_SET_KEY_LEN, 8); /* two 32bit regs, on=
e for ip address, one for inet_service */
> +       /* Next line is ONLY needed so 'nft list ruleset' can pretty-prin=
t this */
> +       // nftnl_set_set_u32(s, NFTNL_SET_KEY_TYPE, TYPE_IPADDR << TYPE_B=
ITS | TYPE_INET_SERVICE);
> +       nftnl_set_set_u32(s, NFTNL_SET_DATA_LEN, 4); /* one 32bit reg */
> +       nftnl_set_set_u32(s, NFTNL_SET_DATA_TYPE, TYPE_IPADDR);
>         nftnl_set_set_u32(s, NFTNL_SET_ID, 1);
>         nftnl_set_set_u32(s, NFTNL_SET_FLAGS, NFT_SET_CONSTANT | NFT_SET_=
MAP);
