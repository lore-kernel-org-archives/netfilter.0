From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: quick questions ---
Date: Thu, 27 Nov 2003 15:13:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069938812.20794.3.camel@raylinux.internal>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-MPdyax2lSWkvsvjiaLDd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
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


--=-MPdyax2lSWkvsvjiaLDd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-11-27 at 15:02, Knight, Steve wrote:
> Hi chaps
>=20
> Had a bit of a google, and of course consulted Ziegler, but I'm still not
> 100% on either of these, so ---
>=20
> 1) can iptables use eth0:0 as a valid interface distinct from eth0 ?  So =
I
> can use eth0 as LAN internal i/f and eth0:0 as DMZ internal i/f.
>=20
No, not directly, but can be referenced by the virtual ip.

> and ...
>=20
> 2) Back when I did my checkpoint certs we covered "static NAT" - simple
> one-to-one address translation, rather than "hide NAT" - aka iptables SNA=
T /
> MASQUERADE....
>=20
> ...the question I have is -=20
>=20
> is the example given in Ziegler starting on p280 and table 7.1 "Host
> Forwarding to Servers in a Privately Addressed DMZ" an example of "static
> NAT"?
>=20
That would be DNAT, not SNAT. and then it could be either 1:1 or N:1,
depending on the iptables rule.

> Thanks for any pointers
>=20
> Steve
>=20
>=20
>=20
> -----------------------------------------------------------------------
> Information in this email may be privileged, confidential and is=20
> intended exclusively for the addressee.  The views expressed may
> not be official policy, but the personal views of the originator.
> If you have received it in error, please notify the sender by return
> e-mail and delete it from your system.  You should not reproduce,=20
> distribute, store, retransmit, use or disclose its contents to anyone.
> =20
> Please note we reserve the right to monitor all e-mail
> communication through our internal and external networks.
> -----------------------------------------------------------------------
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-MPdyax2lSWkvsvjiaLDd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/xfh8h1fuR/Bv+ygRAvcXAKCJ9CINo8sVXTP7IcHHn7JcvEDZRQCdGwHP
Dg8DKWZhQ3NpPyxYVU/gkcA=
=uwkx
-----END PGP SIGNATURE-----

--=-MPdyax2lSWkvsvjiaLDd--


