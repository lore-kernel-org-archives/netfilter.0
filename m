From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: IP range
Date: Thu, 25 Sep 2003 15:52:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064497924.31340.161.camel@raylinux.internal>
References: <20030925130213.58577.qmail@web9904.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-oqJjAh+vy91isuOdFNlf"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030925130213.58577.qmail@web9904.mail.yahoo.com>
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


--=-oqJjAh+vy91isuOdFNlf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-25 at 15:02, Andy Samuel wrote:
> Dear All
>=20
> I follow the example of ip range feature to block my
> incoming connection starting from IP 192.168.0.76 to
> 254, but allowing 192.168.0.1 to 75 to pass.
> So I use :
> iptables -A FORWARD -m iprange --src-range
> 192.168.0.76-192.168.0.254 -p TCP -j DROP.
>=20
> It shows error that iptables can not find
> libipt_iprange.
> I've check /lib/iptables and no any file about
> iprange.
> But I know my kernel already compiled with iprange
> enabled and ipt_iprange is already loaded as module (
> I can see it from lsmod ).
>=20
> How do I get libipt_iprange.so ?
> What is the connection of the file with the kernel
> module of ipt_iprange.so ?
>=20
You need to recompile the iptables source code. The kernel module
basically lists the entry points for the functions in the shared object
file (.so).

> Thank you so much
>=20
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product search
> http://shopping.yahoo.com
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-oqJjAh+vy91isuOdFNlf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/cvMDh1fuR/Bv+ygRAiZrAJ9VtACOhfHsFkMZ101/vkqE0aVxcgCfbKLi
E204ksYsHeC7dWYkjEsM/nI=
=ydCW
-----END PGP SIGNATURE-----

--=-oqJjAh+vy91isuOdFNlf--


