From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Captive portal and DNAT
Date: Mon, 17 Dec 2007 09:25:23 -0600
Message-ID: <1197905123.19486.231.camel@grateful.d.umn.edu>
References: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9zknImKpM7GaE+ndaGoD"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?ISO-8859-1?Q?Gwenha=EBl?= Pasquiers <gegefr@gmail.com>
Cc: netfilter@vger.kernel.org


--=-9zknImKpM7GaE+ndaGoD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon, 2007-12-17 at 15:41 +0100, Gwenha=C3=ABl Pasquiers wrote:
> Hi,
>=20
> I'm facing an issue while trying to make a captive protal using iptables.
>=20
> marked packets in mangle PREROUTING should be normally forwarded.
> unmarked packets in mangle should be dropped or DNATed to my http portal.
>=20
> I'm using DNAT + SNAT on unmarked packets  to redirect to my portal.
>=20
> I'm forwarding marked packets with SNAT.
>=20
> The problem is that the NAT connection stays active even if the
> packets of this connection are marked and do not .

Are you sure that the connection is still being NAT'ed and it is not TCP
Keepalives?

So you have something like this:

# dont DNAT anything that is authenticated
iptables --table nat --append PREROUTING \
--in-interface ${incoming_traffic_interface} \
--match mark --mark ${allow_passage_integer} --jump ACCEPT

# dont DROP (via a rule in the filter table) anything that is
# authenticated
iptables --table filter --append FORWARD \
--in-interface ${incoming_traffic_interface} \
--match mark --mark ${allow_passage_integer} --jump ACCEPT

iptables --table nat --append PREROUTING \
--in-interface ${incoming_traffic_interface} \
--protocol tcp --destination-port 80 \
--jump DNAT --to-destination ${ip_address}

iptables --table nat --append PREROUTING \
--in-interface ${incoming_traffic_interface} \
--protocol tcp --destination-port 443 \
--jump DNAT --to-destination ${ip_address}



> In that case, when refreshing the page, the browser use the same TCP
> connection that is still DNATed to my captive portal. I'd like it not
> to be forwarded anymore.

I had issues with tcp keepalives. I had to tweak the apache configs:

KeepAlive Off

[...]

HTH,

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-9zknImKpM7GaE+ndaGoD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHZpTjU+eIf4TiLaIRAiaZAKCKMx5s2GgDxxsR4HpXZNQb4FWPBQCdFO+A
cNgVxnn2WbziLWUMmR+tXxc=
=0mpB
-----END PGP SIGNATURE-----

--=-9zknImKpM7GaE+ndaGoD--

