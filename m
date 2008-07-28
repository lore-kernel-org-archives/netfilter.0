From: Eric Leblond <eric@inl.fr>
Subject: Re: your mail
Date: Mon, 28 Jul 2008 16:43:41 +0200
Message-ID: <20080728144341.GD27519@khasse.inl.fr>
References: <009301c8ef85$a7389050$f5a9b0f0$@com> <20080728141409.GC27519@khasse.inl.fr> <5226fb870807280721kaa95f6esc6955cc87da42c18@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5226fb870807280721kaa95f6esc6955cc87da42c18@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: David Boulding <davidboulding@gmail.com>
Cc: netfilter@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Monday, 2008 July 28 at 10:21:43 -0400, David Boulding wrote:
> Thanks for the reply.
> I knew of nfq_get_packet_hw(), but I'm looking for a way to get the raw b=
yte
> > >
> > > I'm developing with libnetfilter_queue, using "iptables -A FORWARD ."=
 to
> > > capture packets of interest on a bridge for analysis (firewall).

As you said "analysis", you may only want to "sniff" packet. In that case,
you can use NFLOG (latest git) or ULOG.

NFQUEUE moudle uses the dev_parse_header() function which only return the
source hardware address. You will not be able to retrieve the wanted
information without patching the kernel.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiN2x0ACgkQnxA7CdMWjzJSmQCdHBt2ro5Tx7m5GbWhl7uGZz7l
5H8Anjc9CaBwO/tOVaywfm+WwzeeBayE
=felb
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
