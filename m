From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] granular rule for combined tcp & udp sports?
Date: Tue, 6 Oct 2020 06:49:00 +0000
Message-ID: <8bf8c296-8857-03c7-9d04-463a7e9a1e6e@gmx.net>
References: <47b2582c-1f1e-4761-9be3-22018d7c87a2@gmx.net>
 <CABeHSrYi=MT8pD6nsRaUK7u56UvO-E7qh1Kmo0=YU386AE8aXw@mail.gmail.com>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601966980;
        bh=KVUD3ED5RFsF6DU+MsprEhXd8FV3S4HsyAYNbacWNz0=;
        h=X-UI-Sender-Class:Reply-To:To:References:Cc:From:Subject:Date:
         In-Reply-To;
        b=A1p2kc6LGNoD0JxRgW8AOdof+OGAhXNF8XAND7hOgyQlcfs2uNiw7ocUBFpU6aL/K
         6hNDOnzcUYa4bYxPyEh80BevzmkGzsSi0/GITRLYdhAUUYv1QjuTYATciCppKA3hNS
         hphj41+aN/3nbl8gbRUU3tr2H3ZJRAi4MKNpJRmA=
In-Reply-To: <CABeHSrYi=MT8pD6nsRaUK7u56UvO-E7qh1Kmo0=YU386AE8aXw@mail.gmail.com>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Yuval Steuer <yuvalsteuer11@gmail.com>

Thank you for the input but that still prints an (yet another) error:

Error: syntax error, unexpected !=3D, expecting ')'


On 06/10/2020 05:42, Yuval Steuer wrote:
> ((tcp sport !=3D { 80, 443, 993, 5228 }) or (udp sport !=3D 19302) and =

> (ip6 saddr @g_6))
>
> On Mon, 5 Oct 2020 at 16:02 =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vt=
ol@gmx.net <mailto:vtol@gmx.net>>=20
> wrote:
>
>     I am trying to get a granular logging rule going, combining tcp
>     and udp
>
>     sports for ip6 saddr but somehow failing:
>
>
>
>
>
>     tcp sport !=3D { 80, 443, 993, 5228 } udp sport !=3D 19302 ip6 sadd=
r @g_6
>
>     log flags all prefix "G_C :" continue
>
>
>
>     -> Error: conflicting protocols specified: tcp vs. udp
>
>
>
>
>
>
>
>     ip6 saddr @g_6 tcp sport !=3D { 80, 443, 993, 5228 } | udp sport !=3D=

>     19302
>
>     log flags all prefix "G_C :" continue;
>
>
>
>     -> Error: syntax error, unexpected '|', expecting newline or semico=
lon
>
>
>


