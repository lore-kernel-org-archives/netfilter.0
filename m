From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: rtsp-conntrack help needed...
Date: Sat, 17 Jan 2004 13:46:06 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040117214606.GA30925@home.tig-grr.com>
References: <200401171208.57545.Antony@Soft-Solutions.co.uk> <20040117150943.38AE2A400195@mwinf0202.wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040117150943.38AE2A400195@mwinf0202.wanadoo.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nicolas <nmeillet@wanadoo.Fr>
Cc: netfilter@lists.netfilter.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> # Masquerading rules
>=20
> iptables -t nat -A POSTROUTING -s 10.254.254.0/12 -o eth1 -j MASQUERADE
> iptables -t nat -A POSTROUTING -s 10.150.33.0/24 -o eth1 -j MASQUERADE

It appears you are using NAT.  This would prevent RTP/RTCP from functioning=
.=20
Please try the RTSP conntrack/nat modules and let me know if they work for
you.  I believe they are available in the current p-o-m, or you can get them
from here:

  http://home.tig-grr.com/rtsp/index.html

--=20
Any task can be completed in only one-third more time than is currently
estimated.
        -- Norman Augustine

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkAJrR4ACgkQFMm9uvwPXW5U5wCffxlnBFHxTsmoHDEqYfdmBEmf
8jkAniSAP493FDNSGg1fnPBbZckF1Ysa
=VUnW
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

