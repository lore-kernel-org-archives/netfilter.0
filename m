From: Eric Leblond <eric@regit.org>
Subject: Re: Controlling number of sessions
Date: Tue, 23 Sep 2003 17:44:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064331844.3102.21.camel@porky>
References: <200309231859450453.1183C0A3@smtp.khi.wol.net.pk>
	 <1064328220.3980.26.camel@samwise>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-wY3WtItgkXbAwNNRLPfI"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064328220.3980.26.camel@samwise>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Daniel Bidwell <bidwell@andrews.edu>
Cc: Nauman Malik <naumanm@khi.wol.net.pk>, netfilter@lists.netfilter.org


--=-wY3WtItgkXbAwNNRLPfI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

You want the connlimit target that is in POM ! :
http://www.netfilter.org/documentation/pomlist/pom-base.html#connlimit

Le mar 23/09/2003 =C3=A0 16:43, Daniel Bidwell a =C3=A9crit :
> On Tue, 2003-09-23 at 09:59, Nauman Malik wrote:
> > Hi,
> >=20
> > I have a Linux box being used as a cache server. I want to control numb=
er of TCP sessions per user/IP on this machine. e.g. At one time only 50 re=
uqets per user can be passed through this linux box.
> > Is it possible using iptables?.
> > Any idea how?
>=20
> I have connection tracking enabled and have a perl program that runs
> every 5 minutes and counts the number of connections per local IP.  You
> can then use a program like cutter to kill extra connections if this is
> really what you want to do.
> >=20
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-wY3WtItgkXbAwNNRLPfI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/cGpEnxA7CdMWjzIRAlDKAJ49iuhIuboMOYF/Pw2DYJ5jZ79hAwCfXF03
pr99uqvw0mQapqs+XRh7My0=
=EUdx
-----END PGP SIGNATURE-----

--=-wY3WtItgkXbAwNNRLPfI--

