From: Eric Leblond <eric@regit.org>
Subject: Re: Filter out broadcast messages
Date: Wed, 07 Jan 2004 23:02:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073512943.17533.1.camel@porky>
References: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fE/jf5Oi2K1yxggCYvfz"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Gabby James <lizard0000092@hotmail.com>
Cc: netfilter@lists.netfilter.org


--=-fE/jf5Oi2K1yxggCYvfz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le mer 07/01/2004 =C3=A0 22:44, Gabby James a =C3=A9crit :

> iptables -A INPUT -d 255.255.255.255 -p udp -j DROP

You can use the addrtype module to filter it :
	http://www.netfilter.org/documentation/pomlist/pom-extra.html#addrtype

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-fE/jf5Oi2K1yxggCYvfz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQA//IHunxA7CdMWjzIRAsnMAKCQvs6hyQlqeXpJ6VkAX1ZM8PDR0ACeJ1+3
+eQ45AXqlUCJoNSCp5bY2mQ=
=uA/9
-----END PGP SIGNATURE-----

--=-fE/jf5Oi2K1yxggCYvfz--

