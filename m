From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: IPTABLES + IPROUTE2
Date: Fri, 30 Jan 2004 12:50:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075459848.2000.123.camel@raylinux.internal>
References: <EHENIKBEJAMHPLPJOJBPMEFKDIAA.lucho@galix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LF4/C6C1ZinEwKrFa3Z3"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EHENIKBEJAMHPLPJOJBPMEFKDIAA.lucho@galix.com>
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


--=-LF4/C6C1ZinEwKrFa3Z3
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-01-30 at 11:39, L.Malinov wrote:
> Hi Antony,
>=20
> According to the iproute2 manual, I can't do routing based on a destinati=
on
> port but based on the fwmark. So that's why I think I can achieve that al=
one
> with iproute2 only and I need iptables to put the mark as well. But in th=
is
> case I'm not sure that this can be achieved on a box with one network car=
d
> only or for traffic generated lacaly from the box. Any suggestions?
<<snip>>
What about the ROUTE patch in POM? You can basically route based on any
criteria possible with iptables.

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-LF4/C6C1ZinEwKrFa3Z3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAGjcIh1fuR/Bv+ygRAoTjAJ9zyDzfJrEHtULHvsk4CvW9GnAEFQCfUYnB
f1krlhy9rXvN3o1KPSsCEvM=
=pWfN
-----END PGP SIGNATURE-----

--=-LF4/C6C1ZinEwKrFa3Z3--


