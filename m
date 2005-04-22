From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: Re: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 11:29:52 -0300
Message-ID: <1114180192.4118.106.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-t7kozaddCiI8yD6FFaWd"
Return-path: <netfilter-bounces@lists.netfilter.org>
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


--=-t7kozaddCiI8yD6FFaWd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Kruk and list

> As I wrote earlier on this list, I have a setup with linux router,=20
> three
> local interfaces and one outside interface. I do NAT and manage
> bandwidth. Therefore I needed the IMQ functionality. Unfortunately, no
> distro known by me at that time had kernel with IMQ (I didn't want to
> use stock kernel and patch it myself every time I need to upgrade
> kernel). Besides, it was also a kind of "proof-of-concept" solution.
> Anyway, It works almost flawlessly (except for some strange behaviour
> with GRE packets which I described few days ago).

I agree w/ you. I'm studyng a lot of QoS and I stopped w/ IMQ x dummy.

=46rom rom gname :http://article.gmane.org/gmane.linux.network/21224 . Jamal
explained differences betwen IMQ x dummy. Like you I prefer not patch
kernel..80)

I know that's not a netfilter stuff but it's RELATED w/ it 8).
Could you give some hints about your solution ? how-to/tutorial or other
place where I can find ?

thanks in advanced

--=20
\.\.\.\.\.\.\.\.\.\.\.\.\.\ Being  vewy, vewy quiet is iweviwent. <hehe-
.\.Kruk@epsilon.eu.org.\.\. hehehe> - Fudd of Borg.
\.http://epsilon.eu.org/\.\=20
.\.\.\.\.\.\.\.\.\.\.\.\.\.=20


--=20
Paulo Ricardo Bruck - consultor


--=-t7kozaddCiI8yD6FFaWd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta =?ISO-8859-1?Q?=E9?= uma parte de mensagem
	assinada digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCaQpg89ZqUGE0XNMRAkQaAKCLIJIM8W7ztDlugPAhExV1UNNKVACguoQC
VE/QyDhBfZUmZhLVwc5htNM=
=MHAh
-----END PGP SIGNATURE-----

--=-t7kozaddCiI8yD6FFaWd--


