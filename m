From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Caching of rules in PRE(POST)ROUTING chains?
Date: Mon, 17 Nov 2003 11:17:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069060670.21919.61.camel@raylinux.internal>
References: <1072098477.20031115110735@msmu.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-R6kr7jzDTsYK5346dY5I"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072098477.20031115110735@msmu.eu.org>
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


--=-R6kr7jzDTsYK5346dY5I
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-11-15 at 10:07, Pavel V. Yanchenko wrote:
> Hello.
>=20
> As far as I understand, rules in PRE- and POSTROUTING chains are
> cached? Because when I delete a rule with SNAT target for ip
> 192.168.10.10 this address's packets are still SNATed for several
> minutes. The same thing happens for rules in PREROUTING chains.
Isn't it the connection tracking table that's cached and NOT the rules?
Active connections need to timeout first.

> Is it possible to disable this feature? Maybe there is some file in
> /proc where cached rules are listed?
>=20
> Thanks in advance.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-R6kr7jzDTsYK5346dY5I
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/uJI+h1fuR/Bv+ygRAn4bAJ9tYmiWX2PA+cS18dFKoqmQViRBhwCffyZL
0j3VRb3ceKZow9N0BFR+XMk=
=RYO/
-----END PGP SIGNATURE-----

--=-R6kr7jzDTsYK5346dY5I--


