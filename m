From: Harald Welte <laforge@netfilter.org>
Subject: Re: Configure to Full Cone
Date: Tue, 1 Feb 2005 15:11:45 +0100
Message-ID: <20050201141145.GT6878@sunbeam.de.gnumonks.org>
References: <I92QAA$38252CB0CA3DB7D37ACA5591C593A0E1@bol.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0tLsAbKYoZ7gVvm3"
Content-Disposition: inline
In-Reply-To: <I92QAA$38252CB0CA3DB7D37ACA5591C593A0E1@bol.com.br>
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
To: fernandonach <fernandonach@bol.com.br>
Cc: netfilter <netfilter@lists.netfilter.org>


--0tLsAbKYoZ7gVvm3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2004 at 11:18:10AM -0200, fernandonach wrote:

> How can I configure IPtables to be Full Cone?

You cannot. iptable_nat only implements the most sophisticated version
of NAT: fully symmetric.

> Fernando

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--0tLsAbKYoZ7gVvm3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB/44hXaXGVTD0i/8RAiDJAKCxyezcKOyER0GYp05t7T2KLuqdQQCeKVkd
FEXx9VKcI1gUWF8MdwMPehk=
=4Ydd
-----END PGP SIGNATURE-----

--0tLsAbKYoZ7gVvm3--

