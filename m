From: Eric Leblond <eric@regit.org>
Subject: Re: cannot ping loopback address
Date: Wed, 05 Nov 2003 09:41:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068021693.26225.4.camel@porky>
References: <JKELJHHMDHPOLKFBOEGHKEGLDAAA.cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-rPL48DzRjPi0E8B3kQSX"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JKELJHHMDHPOLKFBOEGHKEGLDAAA.cldavis@speakeasy.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: cldavis@speakeasy.net
Cc: netfilter@lists.netfilter.org


--=-rPL48DzRjPi0E8B3kQSX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le mer 05/11/2003 =C3=A0 09:18, Christopher Davis a =C3=A9crit :
> Hello everyone!
> =20
> I have setup an iptables script that will not allow me to ping
> 127.0.0.1 for some reason --=20
> =20
> Input policy is drop
> Forward and output policy is accept.  (Egress filtering on the way!)
> =20
> I have in the rules to allow established or related connections -- "-A
> INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> Can ping everything else.
> ifconfig does have information on the lo @ 127.0.0.1
> =20
> Any ideas?

The fw receives a ping on INPUT : a ping has to be unrelated to the
connection open by the emission of the ping. So it cames as new on the
INPUT chains and it is dropped.
Add=20
	iptables -A INPUT -p icmp -m state --state NEW -j LOG
to check. It ping is logged, that's it.

The standard way to do is to have :
iptables -I INPUT -i lo -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT

BR,
> =20
> Thanks!!
> Christopher Davis
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-rPL48DzRjPi0E8B3kQSX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/qLe9nxA7CdMWjzIRAlLKAJ9L/w997S8a8OQNIDc52CR4LUj2XgCfQzyy
DLEQmrtYZMK+BU+Qh3SZzI8=
=+p62
-----END PGP SIGNATURE-----

--=-rPL48DzRjPi0E8B3kQSX--


