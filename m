From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: iptables problems with SuSE 8.0
Date: 13 Mar 2003 13:42:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047555776.1453.4.camel@raylinux.internal>
References: <FFEKLFAFFPMEICKNCBGAMEFKCDAA.trenkler@syn-con.de>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VzXglNqUVrmCD3gsMJWQ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FFEKLFAFFPMEICKNCBGAMEFKCDAA.trenkler@syn-con.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "(iptables) English   Mailing-List Netfilter" <netfilter@lists.netfilter.org>


--=-VzXglNqUVrmCD3gsMJWQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This is not a problem with SuSE or iptables.

It looks like a problem with either the NIC driver or the NIC itself ...

Ray

On Thu, 2003-03-13 at 12:21, Steffen Trenkler wrote:
> Hi,
>=20
> I'm new here in this list.
>=20
> My English is not so very well, but I try to explain my problem with
> iptables:
>=20
> I got a system with SuSE 8.0. It works as a router with an iptables scrip=
t
> between 2 static LANs. The Script does it very well, but sometimes it
> happens that all connections from one LAN to the other are blocked sudden=
ly.
>=20
> /var/log/messages and /var/log/firewall shows the following:
>=20
> fw  kernel: eth0: Transmit timed out, status 00, resetting...
> fw kernel:      Rx ring c071a000: 00000000 00000000 00000000 00000000 ...
> fw kernel:      Tx ring c071b000: 80008001 80008005 80008009 8000800d
> 80008011 ...
>=20
> and then:
>=20
> fw kernel: PACKET DROPPED: .....
> fw kernel: PACKET DROPPED: .....
> fw kernel: PACKET DROPPED: .....
> ...
>=20
> The error-message repeats periodically for a few seconds.
>=20
> There are 2 same NICs in that system: D-Link DFE-550TX.
>=20
> After rebooting the system, the firewall works fine again, 'cause the scr=
ipt
> is loaded at booting the system.
>=20
> Thx 4 help
>=20
> Steffen Trenkler
>=20
> Note: Is there any german-language iptables list?


--=-VzXglNqUVrmCD3gsMJWQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+cG7Ah1fuR/Bv+ygRAlVJAJ4hK0kSNHzaALXpjX479IDsVBbWVQCfSaVa
CBkmLoj8TedVP7B8heNQVpI=
=HfH9
-----END PGP SIGNATURE-----

--=-VzXglNqUVrmCD3gsMJWQ--


