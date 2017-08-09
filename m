From: Eric Leblond <eric@regit.org>
Subject: Re: Using sets for protocols ?
Date: Wed, 09 Aug 2017 02:11:40 +0200
Message-ID: <1502237500.3812.1.camel@regit.org>
References: <3F149C27-5E77-455F-B870-68307C3A87DF@nativemethods.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3F149C27-5E77-455F-B870-68307C3A87DF@nativemethods.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: J Doe <general@nativemethods.com>, netfilter@vger.kernel.org

Hi,

On Tue, 2017-08-08 at 17:15 -0400, J Doe wrote:
> Hi,
>=20
> I am currently experimenting with nftables syntax and was wondering
> if there was a way to specify that a rule applies to *BOTH* TCP and
> UDP.
>=20
> For instance, allowing DNS resolution:
>=20
> add rule filter input tcp sport domain ct state established,related
> accept
> add rule filter output tcp dport domain ct state
> new,established,related accept
> add rule filter input udp sport domain ct state established,related
> accept
> add rule filter output udp dport domain ct state
> new,established,related accept=C2=A0
>=20
> ...requires four rules the way I have written it.

Well, there is a series of mistakes here. First, usual way to write the
rules is to have one rule for established packets (that can also
include related)

  add rule filter input ct state established accept
  add rule filter output ct state established accept

This rule will take care of all replies and other packets. The only
thing you have to do after that is to accept packet that open a
exchange.

As you want to allow dns resolution, you need to open dns trafic:

  add rule filter output ct state new udp dport domain accept

Client don't use TCP often but you will indeed need a extra rule if
ever ou want to:

   add rule filter output ct state new tcp dport domain accept

> Is there a way to decrease this by specifying the rules apply to both
> TCP and UDP ?
>=20
> I tried using a set:
>=20
> add rule filter input { tcp, udp } sport domain ct state
> established,related accept
> add rule filter output { tcp, udp } dport domain ct state
> new,established,related accept
>=20
> ...but the nft parser rejects this syntax.

Yes, it won't work because the expression 'tcp dport domain' is
translated as 'check tcp + at tcp offset get port and check it against
53'


++
--=20
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/
