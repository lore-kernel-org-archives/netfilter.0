From: Unknown <unknown@unknown.invalid>
Subject: Re: more than 1 source ip
Date: 26 Nov 2002 12:18:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038305896.1450.7.camel@rayw.knowledgefactory.co.za>
References: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-o3NdRBHZ7S45tPjlrcJA"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
In-Reply-To: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-o3NdRBHZ7S45tPjlrcJA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-11-26 at 12:00, Wasim Bashir wrote:
> Hi,
>=20
> how do i select more than 1 source IP, what i want to do is allow vnc acc=
ess
> to an internal win2k box from 2 different ip addresses, how do you do thi=
s,
> at the moment i'm using :
>=20
> /sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
> machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800
>=20
Use 2 rules?

> Any help would be much appreciated.
>=20
> Thanks
>=20
> Wasim
--=20

--=-o3NdRBHZ7S45tPjlrcJA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA940poh1fuR/Bv+ygRAiXOAKCqduphwCT+eAR09fZWL6DelIs7qwCgtYjM
Cy/r18AGyjkWhmXdvoKo0Ps=
=G06y
-----END PGP SIGNATURE-----

--=-o3NdRBHZ7S45tPjlrcJA--


