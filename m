From: Mario V Guenzi <jclark@tiscali.it>
Subject: Re: Grammar in a bash script
Date: Tue, 18 Aug 2020 07:12:38 +0200
Message-ID: <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
 <20200817085658.GA3677@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="wVSgjZ8PQIlQM0rqWkbq0m9O3siHJtZAH"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200817085658.GA3677@salvia>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
        t=1597727565; bh=IThj/uOZU9drxp4E06vtfhaww1LBzXIHfRNnfYL8G98=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=ssiWb32cwavZnPAG2Kn4I0ouv30sgStc5gSFRataUR5LqC8pShfzGtnEBXlzv4sgV
         iZOMeTeuY/rcMvLeu83ZPkKscKYuM9369HccmJ+3TAS2qFkD0EQ0JW/r+N1SvvlNON
         g5eFV/DHGP6FNmmQbXwHB2cX8Ua6A9qw2fzvzN18=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wVSgjZ8PQIlQM0rqWkbq0m9O3siHJtZAH
Content-Type: multipart/mixed; boundary="nWPlcb5aiDHz4k2EdCe5sgQd4k57OdnMi"

--nWPlcb5aiDHz4k2EdCe5sgQd4k57OdnMi
Content-Type: text/plain; charset=iso-8859-15
Content-Language: it-IT
Content-Transfer-Encoding: quoted-printable

Il 17/08/20 10:56, Pablo Neira Ayuso ha scritto:
> Hi,

> You can set default policy to drop wehn defining the chain (in the
> same go), no need to call it twice, my suggestion for your ruleset is
> to place this in ruleset.nft:
>=20
> add table inet firewall
> add table inet nat
> add table netdev noddos
>=20
> add chain inet firewall INPUT { type filter hook input priority 0; poli=
cy drop; }
> add chain inet firewall OUTPUT { type filter hook output priority 0; po=
licy drop; }
> add chain inet firewall FORWARD { type filter hook forward priority 0; =
policy drop; }
> ...
>=20
> my rules
> my rules
> my rules
>=20

At first many thanks.
another question given your kindness,
I can use bash only to define my variables eg
EXTIF =3D "eth0"
LAN =3D "192.168.2.0/24"
etc
use the variables defined in writing the rules.nft file as per your
example and then write
nft -f /path/rules.nft in my bash script?
as usual I apologize for my terrible English.


--nWPlcb5aiDHz4k2EdCe5sgQd4k57OdnMi--

--wVSgjZ8PQIlQM0rqWkbq0m9O3siHJtZAH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTq04Bmf6EVqIWOKVubqqzVmQ2sigUCXztjTAAKCRCbqqzVmQ2s
ivSZAKCOb4wBjiGQS2ZctP070aGInC19GACfQbgf2yZMBSu3tx2DzOF6mN3iQpM=
=EAXl
-----END PGP SIGNATURE-----

--wVSgjZ8PQIlQM0rqWkbq0m9O3siHJtZAH--
