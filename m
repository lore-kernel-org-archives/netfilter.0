From: Alexander Samad <alex@samad.com.au>
Subject: Re: Multiple gateways problem
Date: Fri, 1 Apr 2005 09:52:11 +1000
Message-ID: <20050331235211.GE8639@samad.com.au>
References: <20050331133823.6562.qmail@flock1.newmail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2005 at 06:37:50PM +0200, Rub?n Cardenal wrote:
> =20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
>   I have a quite simple setup in ony of my servers but I can't make
> the conditional routing using iptables to work.
>=20
>   The server has:
>=20
>   eth0: 192.168.2.0/23
>   eth1/eth2: reserved for future use
>   eth3: 10.10.100.0/24
>=20
>   The eth3 is connected to a separate switch where 30 AP's are
> connected to and a dhcp server running on the server gives IP's to
> clients connected to the wireless lan. In the same way, eth0 is
> connected to another set of switchs (isolated from the switch where
> eth3 is connected to) where all LAN clients (192.168.2.0/23) are
> connected to.
>=20
>   I can use two gateways, both of them are accessed via eth0:
> 192.168.3.250 and 192.16.3.254. The default gateway for all the LAN
> clients (192.168.2.0/23) is (and must be) 192.168.3.254 and just a
> few people is allowed to use the other gateway.
>=20
>   The desired configuration is that I want to be able to route
> certain clients from eth3 (10.10.100.0/24) via 192.168.3.250 instead
> of the default gw of the server (192.168.3.254).
>=20
>   All the configurations I've tried, doesn't work or make LAN clients
> loose connectivity with the server. How should I setup routes/rules?
if you can group your users to specific networks then you can use

ip ru for something like this

0:      from all lookup local=20
200:    from 10.10.100.0/24 lookup wireless=20
201:    from 192.168.2.0/24 lookup plana=20
201:    from 192.168.3.0/24 lookup planb=20
32766:  from all lookup main=20
32767:  from all lookup default=20

or in using iptables -t mangle and PREROUTING you can mark your packets
with -m mark --set-mark 0x01

iptables -t mangle -I PREROUTING -s 10.100.100.0/24 -m mark --set-mark
0x01
iptables -t mangle -I PREROUTING -s 192.168.2.0/24 -m mark --set-mark
0x02
iptables -t mangle -I PREROUTING -s 192.168.3.0/24 -m mark --set-mark
0x03

and then use ip ru sort of like

0:      from all lookup local=20
200:    fwmark 0x01 lookup wireless=20
200:    fwmark 0x02 lookup plana
200:    fwmark 0x03 lookup planb=20
32766:  from all lookup main=20
32767:  from all lookup default=20



and then fill the tables with the appropiate routing rules

note - I split your 192.168.2.0/23 back into 2 /24 just for example, you
might need to check the syntax of the -m mark target as well.

Alex

>=20
>   Regards,
>=20
> - - Ruben.
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: PGP 8.1
>=20
> iQA/AwUBQkwnXQcpyqBKAkY5EQLdOwCg/rIS18MM5mKYfXjEhvSiCPgOV1QAmwZ7
> TG3o6vj9sH7NQXoVkgUsBcvS
> =3DBTkL
> -----END PGP SIGNATURE-----
>=20
>=20
>=20

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCTI0rkZz88chpJ2MRAqjfAJsFhUHCdVMmk1uDMIgs0Xf6AIMrXQCdG2l4
nW4RnqPS3MgTacfZGaYpJ/0=
=fUV5
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--

