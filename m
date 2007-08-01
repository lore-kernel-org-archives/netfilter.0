From: Eric Leblond <eric@inl.fr>
Subject: RE: adding rules - slow
Date: Wed, 01 Aug 2007 09:29:09 +0200
Message-ID: <1185953349.30855.2.camel@khasse.inl.fr>
References: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
	<1185572284.10031.2.camel@localhost>
	<002f01c7d40c$fb1b87d0$f1529770$@sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-bw9nbD1W+zD7vggHhcO0"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002f01c7d40c$fb1b87d0$f1529770$@sk>
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
To: =?UTF-8?Q?J=C3=BAlius_Bem=C5=A1?= <julo@atknet.sk>
Cc: "'John A. Sullivan III'" <jsullivan@opensourcedevel.com>, netfilter@lists.netfilter.org


--=-bw9nbD1W+zD7vggHhcO0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 01 ao=C3=BBt 2007 =C3=A0 09:24 +0200, J=C3=BAlius Bem=C5=A1 a =
=C3=A9crit :
> Thank you very much ... good idea.
> But do you know why is iptables so slow? Because I think about writing my=
 own utility for adding new rules.

It's a design problem: when you add a new rule, the whole table id
dumped in userspace, modified and sent back to kernel space.

And this take long when there is a large number of rules !

BR,
--=20
=C3=89ric Leblond, eleblond@inl.fr
T=C3=A9l=C3=A9phone : 01 44 89 46 39, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-bw9nbD1W+zD7vggHhcO0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGsDZFnxA7CdMWjzIRAm3tAJ9Ueti1G5e1u+ZSexs3Ljn8/vgSNwCfYJiY
Ytx7rzIfubkswjqyZhRkhQs=
=qXsf
-----END PGP SIGNATURE-----

--=-bw9nbD1W+zD7vggHhcO0--


