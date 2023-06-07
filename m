From: Kerin Millar <kfm@plushkava.net>
Subject: Re: IPv4 Evil Bit
Date: Wed, 7 Jun 2023 14:30:19 +0100
Message-ID: <20230607143019.65e7f5ec1a21db391071a4d4@plushkava.net>
References: <20230607131743.309d5aff@parrot>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1686144621; x=1686231021; bh=WIrNIH1GOnOKrk4+TwobrEZn1
        YPp8pLTFhxijNhNBoI=; b=fF6VvXr0rsQm9xPDVwtw2ciJ5yRPbgBnLFw8zLs7K
        040z8fxFG1L8wGN8eOPipL1lfWIr7omDWOjbxIPAMhFMNqu1YUxxc8ZOLhQsTYSv
        aDHO9g/pisGtRgEV1RnVYiYfjh8gZGf/+S7QF3oEidFzjJfe42SA8N/taj4wvIFA
        H4Vgv3K5xojmGDBZU9UxIj7l75kKG6m+tiB1z2l8rHnL8ykrT6KnmugIrPxO+7uI
        xs0mJuzb3AkyMw8Ai07J1597aGAvLDmAOZzbM3jq8iwj+LZv37rgIyZ7E0g9vgRN
        WzP5oyYprSb+V7LsI/NF+lWkiV73nBo2O3SSeUv320vNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1686144621; x=1686231021; bh=WIrNIH1GOnOKrk4+TwobrEZn1YPp8pLTFhx
        ijNhNBoI=; b=r/+I1vrFu9ZaEl4iF9Ei9kyJw5re1cTDbkwvkTVowhqEtLvywFU
        6TJxz5IxBaLaiSjQhx4QOxKFbm6l0Q5idSlXzdHw7TkrVqbuHqhW6NasgAJWgTLe
        HEvHzX09I1gfV8Iv91Jeo9sx/IZDdngH+Ttt73tPUwxcfSRwtMK9JCFRFs3pM+cK
        GLTS82v6KCii44JNCfUIvKlUBr/hAdBA2RJ6q1GjbC5UCNaPLGX/VwVH1QtD5aTX
        CqUzK6QnTGfW2LXqrmrywlxkfDSnUX68+4sG2Q4MuRk9GhsQVLmYUlbRUdBXuLje
        OeRrLIbKoRqvRoEkq+exXZCxERj0HALN9+A==
In-Reply-To: <20230607131743.309d5aff@parrot>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?ISO-8859-1?Q?K=FCthe?= <m-k-mailling-list@mk16.de>
Cc: netfilter@vger.kernel.org

On Wed, 7 Jun 2023 13:17:43 +0200
Marek K=FCthe <m-k-mailling-list@mk16.de> wrote:

> Hello,
>=20
> I hope I am in the right place. I have two questions about nftables:
>=20
> 1) Is it possible to perform OR operations in nftables? For example
> `ip6 saddr ::/128 OR ip saddr 127.0.0.1/8 accept;` As far as I
> understand it, everything else is concatenated with AND.

No. Nor would a set suffice, as ipv4_addr and ipv6_addr elements cannot be =
mixed.

>=20
> 2) I want to see how many IPv4 packets I can get with the Evil Bit
> (RFC3514). Since there seems to be no native function for this in
> nftables, I seem to have to use raw payload expression. So I have
> set up the following:
>=20
> @th,6,1 & 0x80 =3D 0x80 \
>     log prefix "[nftables] Evil bit: " counter reject;
>=20
> However, `Error: syntax error, unexpected '=3D'` appears. What is the
> reason for this? How can I formulate this expression correctly?

Try @nh,48,8 & 0x80 =3D=3D 0x80. The offset and length values are expressed=
 in bits, not bytes.

--=20
Kerin Millar
