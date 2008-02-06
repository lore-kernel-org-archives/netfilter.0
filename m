From: Eric Leblond <eric@inl.fr>
Subject: Re: Skype Access
Date: Wed, 6 Feb 2008 14:35:05 +0100
Message-ID: <20080206133503.GB17524@bayen.regit.org>
References: <1202303321.5984.25.camel@wtprcwbti01002>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1202303321.5984.25.camel@wtprcwbti01002>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Cloves Pereira Costa Jr <cloves.costa@m2sys.com.br>
Cc: Netfilter ML <netfilter@vger.kernel.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wednesday, 2008 February  6 at 11:08:41 -0200, Cloves Pereira Costa Jr w=
rote:
> Hi all...
>=20
> I'm with some problems configuring Skype in my firewall...
>=20
> I know that Skype tries to conects in high ports (>1024) everytime it
> starts. I would like to know if somenone knows a rule to configure in
> Iptables that could know what port to accept outgoing connections
> dinamicaly, in the same way that FTP does whith RELATED state.

That's simple: send an email or phone to skype people and ask them to
open their protocol and especially the part concerning port allocation.
And don't forget to ask them to make this part of the protocol go
unencrypted on the wire.

Seriously, to develop an helper module for a protocol, 2 things are
needed:
 * The protocol is known (we know where to search the information about
 port opening)
 * The protocol is clear (no crypto, we can parse information)

Skype has both problems and will never have an helper module.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHqbeHnxA7CdMWjzIRAq9rAJ0S3OxLGyOa0q6fFMuNcej7pV5yugCfXmYk
Slhpk/Mxm+0kCVXUWDHuuho=
=WF/5
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
