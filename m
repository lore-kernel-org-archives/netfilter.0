From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Source Port
Date: 15 Apr 2003 13:11:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050405086.1439.47.camel@raylinux.internal>
References: <1050404537.1482.19.camel@india>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PWXAI5uznK8PTqsjnBu9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050404537.1482.19.camel@india>
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


--=-PWXAI5uznK8PTqsjnBu9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Why? In the specific example that you give, what would be the
implications?


On Tue, 2003-04-15 at 13:02, Dharmendra.T wrote:
> Hi Everyone,=20
>=20
> I am a regular reader of this list and I have absorbed that most of
> the users won't use the source ports in their rules. Say for ex,=20
>=20
> #iptables -A INPUT -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j
> ACCEPT=20
>=20
> In these kind of rules they will not specify the source port from 1024
> to 65545. I strongly recommend all Linux Users to specify the exact
> rules what is allowed and what is not allowed.=20
>=20
> Any Comments? This could be a good practise?=20
> --=20
> Regards
> Dharmendra.T
>=20
>=20
> This message is intended for the addressee only. It may contain privilege=
d or Confidential information. If you have received this message in error,p=
lease notify the sender and destroy the message immediately.Unauthorised us=
e or reproduction of this message is strictly prohibited.



--=-PWXAI5uznK8PTqsjnBu9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+m+jeh1fuR/Bv+ygRAmNyAJ0VyXt+IvEMunbGVGIpHiOPwIcZCgCdEbSL
S0T+wh04QtNKERUwY93evGs=
=8xyv
-----END PGP SIGNATURE-----

--=-PWXAI5uznK8PTqsjnBu9--


