From: =?UTF-8?B?RWNrbCwgTcOhdMOp?= <ecklm94@gmail.com>
Subject: Re: Why tproxy to 127.0.0.1:port doesn't make packets go through the
 input chain with iifname lo?
Date: Sat, 20 May 2023 16:19:13 +0200
Message-ID: <CAPFYX+JE_9UhOe_Oe7CsHBdZ4-kY=fi=zyfPt_DYFDRXwOnmqw@mail.gmail.com>
References: <B4205731-F80B-4A87-B932-8749C51A06FB@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684592380; x=1687184380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDIJnTjDCoRlWTrPsH6rIGdkjh2qmWzZVDXQJ0i8wNk=;
        b=c+R9lje60g/vTMNJmqqwWUjzh62G/d2DfYtcWcXeQJRk64mR96wDLjGM7mNqZfAFf2
         GrVzfe8+Ng6GCRUEaZYRb7/QNDN4y4jHJeRLbqrSEQtJA2+7wHcD7EsBOANvREtFcPGl
         ozGN/bTWuaGRz/TTczukBjgKGbUrpCexYaDgcQ9wwrbpl4SmMIVL7tZhxNqbhxWpd/cx
         Z+mcb3x5cDiG0IhRmGjzE7PgY8oor16r4EzTsGfBsS+vg0NFcQHLSPgCqu0+tZpdt+2l
         B2R5KyvPHxLDIIF8U//r2FnrU7/wgzfltNOkQPi5lNhpfNFGlOo9Y3ptgh5JY0UY8Bd8
         LWFQ==
In-Reply-To: <B4205731-F80B-4A87-B932-8749C51A06FB@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Glen,

It's been a while but I'll try to reply to your questions inline.

Bests,
M=C3=A1t=C3=A9

Glen Huang <heyhgl@gmail.com> ezt =C3=ADrta (id=C5=91pont: 2023. m=C3=A1j. =
14., V, 9:24):
>
> Hi,
>
> I think I mostly understand how TPROXY works, thanks to M=C3=A1t=C3=A9=E2=
=80=99s super helpful article [1].
>
> However, I still don=E2=80=99t understand how the "to address:port=E2=80=
=9D part work. Given this rule:
>
> nft add rule nat prerouting iifname lan tproxy to 127.0.0.1:1234 meta mar=
k set 1 accept
>
> And this policy based routing:
>
> ip rule add mark 1 lookup 100
> ip route add local default dev lo table 100
>
> When does a packet arriving on =E2=80=9Clan" get redirected to 127.0.0.1:=
1234? Is it before or after the routing decision? It seems it should be aft=
er, but from trace, it shows that the packet goes through the input chain a=
nd its iifname is lan. Since tproxy redirects it to 127.0.0.1, shouldn=E2=
=80=99t it be =E2=80=9Clo" instead?

The rule is added to the prerouting table so the rule is applied
before the routing decision. It's exactly because otherwise you
wouldn't be able to route it to the localhost. You can't make a
routing decision after it's already been made. And even though you do
the redirection, the interface it entered the system is still lan, not
lo. (The firs i in iifname stands for input.) The output interface may
be lo because that's where your proxy is probably listening, but it's
not quite important in the tproxy rule.

>
> I wonder what the flow chart is like? My current guess is that packets ar=
riving on =E2=80=9Clan" first get routed to =E2=80=9Clo", because of the ma=
rk and the policy routing, then tproxy redirects it to 127.0.0.1:1234, but =
again, this is probably wrong given iifname being lan. I also wonder do <ad=
dr> and <interface> have to match in "tproxy to <addr>:port =E2=80=9C and "=
dev <interface> table 100=E2=80=9D? What the flow chart is like if they don=
=E2=80=99t?

As far as I remember, your description is true except for the
confusion around the iifname value. It's just the input interface. It
doesn't change on routing.

To be honest I'm not sure what the address is good for in the "tproxy
to" part. Maybe it's useful if your proxy uses a listening address
other than 0.0.0.0 or 127.0.0.1. So you could use "tproxy to
192.0.2.1" in case it's a local address too. What the routing
interface would be in that case, I'm not sure. The examples in [2]
only use a port number. Maybe someone else can halp you out with this
more precisely.

>
> PS: In my case, lan is actually an XFRM interface, not sure if that matte=
rs.
>
> Could someone offer some pointers? Thanks in advance.
>
> [1] https://gsoc-blog.ecklm.com/iptables-redirect-vs.-dnat-vs.-tproxy/

[2]: https://www.kernel.org/doc/Documentation/networking/tproxy.txt
