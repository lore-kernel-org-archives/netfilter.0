From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 02:41:43 +0300
Message-ID: <E01A900C-4406-4AC5-B3E7-D645A0291B34@gmail.com>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date;
        bh=qV/XlcU+XCgYvXAU4Rj9Tj37IJYRs29lPeONn/QayIg=;
        b=Prt7HW3hf3K0Rg05e0x1PvDKWjCqksaJyneszCJuE90/iK/IUwvLrE8zJVn8bYkGBq
         j/xtsNgmf97KLu4UwJ/HnVTgkIaVmLvk2JM3z0dkMJAQLYV3sPkb/h7GL5zF+itgu6hO
         jioMm1HPSOAYC/TfLBWQL5+Q5wRZc7nS+mmsBmxDMwMPcsG0BX5d1TXPqFxESKVzlJgD
         TJW7uxzeSgqVRzlQYXzpOxx1MJSd8Xn8VjeQNJs3TAmmm7lqrgRe5kipq9J6mL7AXmlS
         Rs/22hDRgXTqlw8+8v9MQ9vjCs4P+TldDUuP/zlDKPMJvg22+yaJtoQOn5ef7M9RTboB
         Kdag==
In-Reply-To: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Small update=20
with kernel 5.19.14 all is fine connect pptp for less that 2 sec

after switch to kernel 6.0.0 one time need more that 1 min to establish =
pptp connection other time not work .

m

> On 6 Oct 2022, at 2:34, Martin Zaharinov <micron10@gmail.com> wrote:
>=20
> Hi Team
>=20
> I make test image with kernel 6.0.0 and schem is :
>=20
> internet <> router NAT <> windows client pptp
>=20
> with l2tp all is fine and connections is establesh.
>=20
> But when try to make pptp connection  stay on finish phase and not =
connect .
>=20
> try to remove module : nf_conntrack_pptp and same not work.
>=20
>=20
> how to debug and find why not work ?
>=20
>=20
> Best regards,
> Martin

