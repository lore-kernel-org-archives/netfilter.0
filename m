From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: RE: [nftables] granular rule for combined tcp & udp sports?
Date: Fri, 9 Oct 2020 09:23:26 +0300
Message-ID: <000101d69e04$b3965540$1ac2ffc0$@gmail.com>
References: <47b2582c-1f1e-4761-9be3-22018d7c87a2@gmx.net> <CABeHSrYi=MT8pD6nsRaUK7u56UvO-E7qh1Kmo0=YU386AE8aXw@mail.gmail.com> <8bf8c296-8857-03c7-9d04-463a7e9a1e6e@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=/FHX3YUX/CSFy+di5oKEY1zMOQDQxhv+1rvw+IiGr+A=;
        b=g/xkko7reyg1Ho3zwX7ImE1UdZNfip1oIDV/L1vCpxEcYqjj6OM9a9mnf/bbIeE6Ub
         vzcM4om86Ry2qG7bzoR4DpiIwh53bCBZZlGYQ0DcicQ20KzZd2dHtz7bPZ95g3vuwuNy
         /eV2k3TF5aKbQ2eXSEQk+v5a8+KWXr6Pxcl9IRoF6Hirfh8f4w289Nv73PHroAj04D+I
         Gau4kZPyxJ0PdPp07LLgljMtxPAwg/Hl0ZIrFgx+TxI0fJo9bC5DwHmdpjVj28SSdmfE
         TLnVePM0mVIJ8d/1CtaOxu1gEmLTLTGHI5lOSPwtZQqhL5Ygox63noe/a9nlWey8KYbM
         iQdA==
In-Reply-To: <8bf8c296-8857-03c7-9d04-463a7e9a1e6e@gmx.net>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

What OS and nftables versions are you using?

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

-----Original Message-----
From: =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net>=20
Sent: Tuesday, October 6, 2020 9:49 AM
To: netfilter@vger.kernel.org
Cc: Yuval Steuer <yuvalsteuer11@gmail.com>
Subject: Re: [nftables] granular rule for combined tcp & udp sports?

Thank you for the input but that still prints an (yet another) error:

Error: syntax error, unexpected !=3D, expecting ')'


On 06/10/2020 05:42, Yuval Steuer wrote:
> ((tcp sport !=3D { 80, 443, 993, 5228 }) or (udp sport !=3D 19302) and =

> (ip6 saddr @g_6))
>
> On Mon, 5 Oct 2020 at 16:02 =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 =
<vtol@gmx.net <mailto:vtol@gmx.net>>=20
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
>     tcp sport !=3D { 80, 443, 993, 5228 } udp sport !=3D 19302 ip6 =
saddr @g_6
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
>     ip6 saddr @g_6 tcp sport !=3D { 80, 443, 993, 5228 } | udp sport =
!=3D
>     19302
>
>     log flags all prefix "G_C :" continue;
>
>
>
>     -> Error: syntax error, unexpected '|', expecting newline or =
semicolon
>
>
>



