From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Security question
Date: Mon, 01 Mar 2004 15:03:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078146228.13371.29.camel@raylinux.internal>
References: <404332A5.1000500@stupar.homelinux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-q1aVa6sQNXNcRbvkf5yl"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <404332A5.1000500@stupar.homelinux.net>
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


--=-q1aVa6sQNXNcRbvkf5yl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-03-01 at 14:55, Sasa Stupar wrote:
> What is the potential security problem if you have network as follows:
>=20
> SOLUTION 1
>=20
> INET-CABLE MODEM-----------------|
> ROUTER-eth0-public IP address----|
> ROUTER-eth1-private IP address---|------->SWITCH
> ROUTER-eth2-private IP address---|
> Internal server for mail,web-----|
> all LAN users with private IP----|
>=20
>=20
> SOLUTION 2
>=20
> INET-CABLE MODEM-->eth0-ROUTER|--eth1|
> 			       --eth2|-->SWITCH
> 		 server and LAN users|
>=20
> I am thinking of the solution 1 because cable modem is a little bit to=20
> far away from the router and I don't want to use to much of the cables.=20
> I have setup router with MAC address filtering and also put firewall on=20
> all internal computers.
>=20
> What is possible security problem comparing the 2 solutions above?
>=20
Depends what firewall/packet filtering capabilities eth0-ROUTER has ...

> Regards,
> Sasa
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-q1aVa6sQNXNcRbvkf5yl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAQzS0h1fuR/Bv+ygRAl+sAJkBpTMpx21g3/xlppzb8LZXzpwFdgCbB0N4
HJbA8NyOlBnOg/ZwQAJMdLw=
=LnQl
-----END PGP SIGNATURE-----

--=-q1aVa6sQNXNcRbvkf5yl--


