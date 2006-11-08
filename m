From: Clemens <clemens.schaefer@gmx.de>
Subject: Re: How to configure firewall rules through a website
Date: Wed, 08 Nov 2006 23:33:13 +0100
Message-ID: <45525B29.1050304@gmx.de>
References: <4550B5B8020000930000417A@DBNSMTP.UKZN.AC.ZA>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigC685745616550AC08C15A1B8"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4550B5B8020000930000417A@DBNSMTP.UKZN.AC.ZA>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC685745616550AC08C15A1B8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> I've just been introduced to netfilter. I would like to know if it is
> possible to configure the firewall rules from a text file that is
> written to by some script attached to a website. I am trying to
> configure a firewall on Snapgear linux which is hosting a website which=

> is supposed to alllow a user to enter configuration rules. I hope to
> save these to a text file from which i would like the netfilter program=

> to read from. Is this possible. I only have a week to get this done, so=

> any help is greatly appreciated.


iptables-restore and iptables-save is exactly what you want :)


greets, clemens


--------------enigC685745616550AC08C15A1B8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFUlswnDei4azjmoERAoucAJ9+l9Qw+IytRIPuuMz3dAg3SbuUTACbBNw1
Ebjc2mtzPsol/rK+lhQrAaY=
=NJyd
-----END PGP SIGNATURE-----

--------------enigC685745616550AC08C15A1B8--

