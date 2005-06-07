From: Andre Raabe <andre.raabe@gmx.de>
Subject: Re: Iptables counting with Layer7 patch
Date: Tue, 7 Jun 2005 17:25:32 +0200
Message-ID: <20050607152532.GA2956@vaio>
References: <20050606113753.C9E182EA64@smtp02.isdsl.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050606113753.C9E182EA64@smtp02.isdsl.net>
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


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2005 at 01:37:46PM +0200, Douglas Lane wrote:
>=20
> Basically I want to take certain traffic (such as VoIP,HTTP,FTP,etc...) a=
nd
> mark it on INPUT, OUTPUT and FORWARD chains and then using iptables -v to
> get the packet statistics and log it into MRTG or something similar.
>=20
Yes it is possible. Try:
iptables -t mangle -A INPUT -m layer7 --l7proto http \
-j MARK --set-mark 1

iptables -t mangle -A FORWARD -m layer --l7proto http \
-j MARK --set-mark 2

iptables -t mangle -A OUTPUT -m layer --l7proto http \
-j MARK --set-mark 3

Get packet statistics with:

iptables -t mangle -L -n -v

Best regards,

--=20
Andre Raabe <andre.raabe@gmx.de>

GnuPG: 0xD275A240 | 8B69 EABD 46A4 3B88 354B A25C 4322 AC35 D275 A240
http://www.tuxknowledge.org | bash@jabber.ccc.de | encryption welcome

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCpbxsQyKsNdJ1okARArZfAJ9sdX0MpgvFcE4YwJBK8QbYqeRjsQCgjYGt
iiAM/V7TjvEb6y1rSqOVt7o=
=lBz9
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

