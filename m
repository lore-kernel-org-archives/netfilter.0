From: =?UTF-8?B?0IbQstCw0L0g0KnQtdGA0LHQtdC5?= <ivan@intraffic.ua>
Subject: Re: Dynamic list for net's
Date: Wed, 13 May 2020 21:59:07 +0300
Message-ID: <CAPLRfG+RCkQ=g5qQN=GrjoHzUxDK78F4=4ZwQ9qQqm2gTJfcQQ@mail.gmail.com>
References: <CAPLRfGJXvrwpROcjAsxb-7=dASRO1j0h+UbwKUDhXi1zXV48_g@mail.gmail.com>
 <c5b80a94-21d8-b672-f9c4-3d99b95164fe@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intraffic-ua.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5uWKLC9PZaeW8liWOERBNSqbiaJ2aL9o0MU65CUME3w=;
        b=gGnGCR6GlOhXaSN4Ncr3KRznaeyleeYf9rg4gbQPAs8RTdKDKD14UqW/xTKFxhyS5H
         WEEUpdgQvDVM1osEglZVJaf8Q67lY8kfkvR7c4BjfwDYOCRlzOVuX1ejC2vbkplzOuqO
         iZM+XflLDKdfEXu9WARL2saB5XiGRlpgp4jMqgRLBlmagBGWDt8LXkWRZPW6Lh/eT6kA
         g6Qom6VSLbefqjfrjVxW0w+UQ/03prd+08Xrllj3p+4+KuiScKdUG6XeP1Et3MEBnCdt
         4oNPHCSc1NaPjrckyyr2EkiFrt77YqBYWH/z+TlMIxsIR0NFdc4oub91r8dwkmdqk3tk
         WoLQ==
In-Reply-To: <c5b80a94-21d8-b672-f9c4-3d99b95164fe@plushkava.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: kfm@plushkava.net
Cc: netfilter@vger.kernel.org

Yes, that's what I want
Thank you very much.



=D1=81=D1=80, 13 =D0=BC=D0=B0=D1=8F 2020 =D0=B3. =D0=B2 21:39, <kfm@plushka=
va.net>:
>
> On 13/05/2020 18:40, =D0=86=D0=B2=D0=B0=D0=BD =D0=A9=D0=B5=D1=80=D0=B1=D0=
=B5=D0=B9 wrote:
> > Hi all
> >
> > I have question about "SET"
> >
> > I read this block on manpage:
> >>
> >> Using anonymous sets to accept particular subnets and ports.
> >>
> >>
> >> nft add rule filter input ip saddr { 10.0.0.0/8, 192.168.0.0/16 } tcp =
dport { 22, 443 } accept
> >>
> >> Named sets are sets that need to be defined first before they can be r=
eferenced in rules. Unlike anonymous sets, elements can be added to or remo=
ved from a named set at any time. Sets are referenced from rules using an @=
 prefixed to the sets name.
> >>
> >> Using named sets to accept addresses and ports.
> >>
> >>
> >> nft add rule filter input ip saddr @allowed_hosts tcp dport @allowed_p=
orts accept
> >
> >
> > But i can't use network how elements in set. because only ipv4_addr or
> > ipv6_addr types are supported.
>
> For named sets, ensure that the "interval" flag is present. See the
> discussion that occurred in the following bug:
>
> https://bugzilla.netfilter.org/show_bug.cgi?id=3D1380
>
> --
> Kerin Millar
