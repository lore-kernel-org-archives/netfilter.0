From: Eric Leblond <eric@inl.fr>
Subject: Re: NAT + (libnfqueue || libipq): There are some documents about
 it?
Date: Mon, 01 Jun 2009 22:49:25 +0200
Message-ID: <1243889365.6398.19.camel@ice-age>
References: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
	 <1243321049.27090.22.camel@khasse.inl.fr>
	 <3fdd6ce00905270753g5ca270c3kfbc7985f8f3524f3@mail.gmail.com>
	 <3fdd6ce00905311605k6815936ct6dd19d49cbf30668@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-0MJhHBS+wt5424sbIicd"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3fdd6ce00905311605k6815936ct6dd19d49cbf30668@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Bruno Moreira Guedes <thbmatrix@gmail.com>
Cc: Netfilter <netfilter@vger.kernel.org>


--=-0MJhHBS+wt5424sbIicd
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 31 mai 2009 =E0 20:05 -0300, Bruno Moreira Guedes a =E9crit :
> 2009/5/27 Bruno Moreira Guedes <thbmatrix@gmail.com>:
> > 2009/5/26 Eric Leblond <eric@inl.fr>:
> >> Hi,
> >>
> >> Le mardi 26 mai 2009 =E0 01:53 -0300, Bruno Moreira Guedes a =E9crit :
> >>> Hi all,
> >>>
> >>> I need to do some tasks about translating address in user-space. So, =
I
> >>> first tried using libipq because it seems to me a library present in =
a
...
> But, even with the right checksum it doesn't work as expected(by me).
> The packet seems like I dropped it instead of accepting it. So, I ask:
> does netfilter "retranslate" the packet answer for me? For example:
>=20
> 1) I receive in the nat::POSTROUTING a packet and jump it to QUEUE or NFQ=
UEUE;
> 2) By jumping it to QUEUE or NFQUEUE, the packet is sent to user-space
> and "received" by nfnetlink library
> 3) So, it "goes" to the my code through ipq/nfqueue, which changes the
> source addr from 1.1.1.1 to 2.2.2.2
> 4) My code sets the verdict NF_ACCEPT
> 5) The packet is sent to its destiny (by example 2.2.2.3)
> 6) The host 2.2.2.3 send me a ACK, and the IP header has source
> address 2.2.2.3, and destiny address 2.2.2.2
>=20
> And so, netfilter will automatically make a "answer DNAT" in the ACK
> by changing its destiny to 1.1.1.1 and sending it to the 1.1.1.1 host,
> or it'll simply accept the packet as it seems to be for the local
> machine??

If you accept the packet in POSTROUTING nat, it will discard any NAT
action done after the NFQUEUE rule. Thus you will need to do NAT by
yourself.

If you want to see what happens, I suggest to run "conntrack -E" when
doing test. It will show you what the connection tracking is doing.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--=-0MJhHBS+wt5424sbIicd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Ceci est une partie de message
 =?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBKJD7RnxA7CdMWjzIRAh2NAJ4hDy7aIEV0EksVnprf7aZtq13NuQCcC3A1
rTWH1v3wzuonrxKtBfYxavw=
=8fe4
-----END PGP SIGNATURE-----

--=-0MJhHBS+wt5424sbIicd--

