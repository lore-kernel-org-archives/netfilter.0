From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: Forwarding DNS
Date: Thu, 5 Feb 2004 21:12:51 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040206051251.GA2721@home.tig-grr.com>
References: <40228B0E.3080906@amfes.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40228B0E.3080906@amfes.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Daniel Miller <dmiller@amfes.com>
Cc: netfilter@lists.netfilter.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's not silly to implement your own DNS cache.  Why not try dnsmasq?

  http://www.thekelleys.org.uk/dnsmasq/doc.html

On Thu, Feb 05, 2004 at 10:27:26AM -0800, Daniel Miller wrote:
> Can I setup a DNS forward for my LAN to point to my ISP's DNS servers=20
> for internet name resolution?  As I'm on a high-speed connection, and my=
=20
> provider has already implemented their own caching DNS servers, it seems=
=20
> (at least on the surface) silly for me to implement my own caching-only=
=20
> server.  This way, I can choose to implement direct forwarding to my=20
> ISP's servers, or use an internal caching-only server, and have it=20
> transparent to the LAN.
>=20
> Daniel

--=20
The nice thing about standards is that there are so many of them to choose =
from.
        -- Andrew Tanenbaum

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkAjIlMACgkQFMm9uvwPXW4V2QCfRytH7N4uW4brVfJbn9Xx91Ug
zHEAniu4cD+O34+JH5swW6vEOXHFbwia
=CZar
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

