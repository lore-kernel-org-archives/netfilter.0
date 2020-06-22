From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables and connection tracking
Date: Mon, 22 Jun 2020 14:06:36 +0200
Message-ID: <20200622120636.GA17558@salvia>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?utf-8?Q?Gre=C5=A1ko?= <mgresko8@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Jun 21, 2020 at 07:54:14AM +0200, Marek Gre=C5=A1ko wrote:
> Hello,
>=20
> I have problem to get connection tracking work when using nftables. I
> have this setup on my fedora 32:
>=20
> table ip raw {
>         chain PREROUTING {
>                 type filter hook prerouting priority raw; policy accept;

Could you try from the filter (0) priority instead ?

                  type filter hook prerouting priority filter; policy accep=
t;

Thanks.
