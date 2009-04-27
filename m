From: =?ISO-8859-1?Q?Vlado_Drz=28=EDk?= <vlado@ttx.sk>
Subject: Re: SNAT and multiple ISP problem
Date: Mon, 27 Apr 2009 12:14:25 +0200
Message-ID: <49F58581.3020705@ttx.sk>
References: <40e8da40904260645x601a22a4obb942a30e3428d31@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <40e8da40904260645x601a22a4obb942a30e3428d31@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Maxim Koshelev <chuchelo@gmail.com>
Cc: netfilter@vger.kernel.org

Maxim Koshelev  wrote / nap=EDsal(a):
> Hi all,
> I have a problem that I can't find working way to do some kind of loa=
d
> balance beetween two internet channels using SNAT. I've tried various
> schemes to do this but in all of them kernel makes wrong routing.
> For example if I try to add such rules in nat:
>=20
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $ETH0IP
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to $PPP0IP
>=20
> kernel will do SNAT only according default route in table main. It is
> ok. But if I try to change default routing selection (e.g. by adding
> in 'mangle' table some marks and adding 'ip rules' with this marks)
> kernel begins to route some packets nated to ppp0 into eth0 and
> vice-versa! I can simple monitor this ugly behavior using tcpdump. It
> brings to lost packets and connections drops ( because one of IP's is
> 192.168... but second one is real )
>=20
> Is there any way to make right routing?

Please post your routing table and mark setup. For me it seems that you
don't have routing tables setup up correctly (or is not doing what you
want). For example imcomming packets that are marked are using
alternative routing table and that doesn't include your internal networ=
k
routes (and so is sent outside to default route after un-NATing).

Regards,
Vlado.

