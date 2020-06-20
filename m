From: Florian Westphal <fw@strlen.de>
Subject: Re: ipsec matching in postrouting nat
Date: Sat, 20 Jun 2020 23:00:35 +0200
Message-ID: <20200620210035.GG26990@breakpoint.cc>
References: <CAChjPdR5sZrJKhAgL1BK1wH3Gk64Fx4F1o+KYkJUJ-OcrMjGvg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAChjPdR5sZrJKhAgL1BK1wH3Gk64Fx4F1o+KYkJUJ-OcrMjGvg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?iso-8859-15?Q?Gre=A8ko?= <mgresko8@gmail.com>
Cc: netfilter@vger.kernel.org

Marek Gre=A8ko <mgresko8@gmail.com> wrote:
> Hello,
>=20
> I would like to write rule similar to:
>=20
> iptables -t nat -A POSTROUTING -o ppp0 -m policy --dir out --pol ipsec -j=
 RETURN
>=20
> in nftables. But I am not successful.
>=20
> I tried:
>=20
>                 oifname "ppp0" meta secpath exists return
>=20
> with no luck.
>=20
> Is there some equvalent of the iptables command?

Try replacing 'meta secpath' with 'rt ipsec'
