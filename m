From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: How to log dropped packet ?
Date: 16 Jul 2003 14:49:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058359786.6618.33.camel@raylinux.internal>
References: <000701c34b93$c4da9180$96f2f8db@independence.co.kr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Qj4TLb6hbLNoYNuUm9qI"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c34b93$c4da9180$96f2f8db@independence.co.kr>
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


--=-Qj4TLb6hbLNoYNuUm9qI
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-07-16 at 14:14, Jerry Kim wrote:
> Hi all.
>=20
> I hope to know how to log dropped/accepted packets.
> For example,
>=20
Exactly the same except put -j LOG --log-prefix "Accept input eth0"
instead of -j ACCEPT.
Oh, and the log rule must be before the accept/drop rule.

> iptables -A INPUT -i eth0 -p tcp -d 10.10.10.1 --dport 22 -j ACCEPT
>=20
> How can I log it ?
> I don't understand how '-j LOG' target operate.
>=20
> Help.
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Qj4TLb6hbLNoYNuUm9qI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/FUnqh1fuR/Bv+ygRAir7AJ4giHM7YcZX5FlXuiNYIgwzC2+8NwCfYiUs
OyU3I8fJY2FVmqAYz/awieI=
=CQZC
-----END PGP SIGNATURE-----

--=-Qj4TLb6hbLNoYNuUm9qI--


