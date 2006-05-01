From: Bastian Blank <waldi@debian.org>
Subject: conntrack and bridge
Date: Mon, 1 May 2006 22:12:00 +0200
Message-ID: <20060501201200.GA1487@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks

Linux ethernet bridge and ip_conntrack in 2.6.16 does not properly work
together with fragmented IP packages. It does not even work with using
NOTRACK. The problem seems to be that ip_conntrack defragments the
packages always and then get dropped on the output device as they are
now too large.

Is there a proposed patch or workaround?

Bastian

--=20
Killing is stupid; useless!
		-- McCoy, "A Private Little War", stardate 4211.8

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iEYEARECAAYFAkRWa5AACgkQnw66O/MvCNHAOACgllFzFT8+2A3PrwZZItghUBh3
fqoAnRrk9beJW4M+F+IpHL7sfcRMDTix
=9D7l
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

