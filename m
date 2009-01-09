From: Thomas Jacob <jacob@internet24.de>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 09 Jan 2009 12:55:26 +0100
Message-ID: <1231502126.24038.15.camel@enterprise.ims-firmen.de>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
	 <49673A13.6050807@arturaz.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-q65cRrqjR2mG/YQ74RUf"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49673A13.6050807@arturaz.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?UTF-8?Q?Art=C5=ABras_=C5=A0lajus?= <x11@arturaz.net>
Cc: Richard Hartmann <richih.mailinglist@gmail.com>, netfilter@vger.kernel.org


--=-q65cRrqjR2mG/YQ74RUf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-01-09 at 13:50 +0200, Art=C5=ABras =C5=A0lajus wrote:
> Richard Hartmann wrote:
>  > Hi all,
>  >
>  > I need to log the traffic each local IP in a NAT'ed network generates
>  > per day.
>  >
>  > Unfortunately, the environment is rather restricted and compiling new
>  > software is not an option. Thus, I am wondering if I can abuse iptable=
s,
>  > which is in use anyway, to log for me, as well.
>  >
>  > The end result should be a log which contains IP, date and traffic
>  > generated. I don't really care about the output format as I will perl =
it
>  > into the format I need, anyway.
>=20
> iptables -N ACCOUNTING
> iptables -A FORWARD -j ACCOUNTING
> iptables -A ACCOUNTING -s your_user_ip -j ACCEPT
> iptables -A ACCOUNTING -d your_user_ip -j ACCEPT
>=20
> bam, with iptables -L ACCOUNTING -n -v you can have packet/byte counters =
;)

Or you could use the external extension ipt_ACCOUNT

http://www.intra2net.com/de/produkte/opensource/ipt_account/=20

which does the same much faster and you don't have to
specify lots of accounting rules. Unfortunately you need
to patch your kernel for that, if you want to use it
as is.

--=-q65cRrqjR2mG/YQ74RUf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBJZzsugF9cFv867HwRAsigAJ4xxVH1Gt87JBQ+X5FyDNzvcRXZnwCfTqZq
u+euPiFWSKZEd3hHwsM0gKA=
=JpvU
-----END PGP SIGNATURE-----

--=-q65cRrqjR2mG/YQ74RUf--

