From: Harald Welte <laforge@gnumonks.org>
Subject: Re: Fw: Hi,
	could you please tell me the difference between ipt_eco.c and
	ipt_ECN.c?
Date: Wed, 29 Sep 2004 10:06:18 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040929080618.GF31674@sunbeam.de.gnumonks.org>
References: <BAY22-DAV9tr5XsCj1d000243f2@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY22-DAV9tr5XsCj1d000243f2@hotmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: T Lu <tlu@hotmail.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2004 at 03:29:41PM +0800, T Lu wrote:
>=20
> ----- Original Message -----=20
> From: T Lu=20
> To: davej@codemonkey.org.uk=20
> Sent: Wednesday, September 29, 2004 3:25 PM
> Subject: Hi, could you please tell me the difference between ipt_eco.c an=
d ipt_ECN.c?
>=20
>=20
> Hi,
>=20
> I'm a newbie to linux, I'm compiling linux-2.6.8.1 on my Dell Latitude X3=
00 notebook, carefully according to the README_26.txt. It breaks at the mak=
e modules step, gives out this message,
>=20
> "make[3]: *** No rule to make target `net/ipv4/netfilter/ipt_ecn.c', need=
ed by `net/ipv4/netfilter/ipt_ecn.o'.  Stop.
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2
> "
>=20
> As I cannot find ipt_eco.c in the source code tree, can I safely copy
> ipt_ECN.c to ipt_eco.c to avoid this error? Could you please help me
> out through this? Thanks a lot!

ipt_ecn.c is definitely included in the stock 2.6.8.1 kernel.  You must
have deleted it somehow accidentially. (net/ipv4/netfilter/ipt_ecn.c)

ipt_ECN is totally different (it's a target, not a match).

> Regards,
> Tim

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBWmz6XaXGVTD0i/8RAmfmAJ9aY8KcJKb3dDTMeXGiDiWS6D576wCeL/n3
By2jOYfcGjK5OTRr2Lpis+I=
=hZIe
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--

