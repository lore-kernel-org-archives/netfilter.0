From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: Dropping SYN with FIN flag set
Date: Tue, 21 Oct 2003 12:29:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021192921.GA12606@home.tig-grr.com>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com> <1066754393.1557.29.camel@valhalla> <3F95721F.2050905@Loudoun-Fairfax.com> <1066762574.1557.62.camel@valhalla>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1066762574.1557.62.camel@valhalla>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I actually have a method to my madness. Each morning I have a cron job
> kicks off to process the logs from the day before. The script has a ton
> of entires similar to the following:
>=20
> grep SYNFINSCAN cb5.txt > synfin-scan.txt
> grep -v SYNFINSCAN cb5.txt > cb6.txt
> grep FINSCAN cb6.txt > finscan.txt
> grep -v FINSCAN cb6.txt > cb7.txt
> grep NULLSCAN cb7.txt > nullscan.txt
> grep -v NULLSCAN cb7.txt > cb8.txt
> grep NMAPXMAS cb8.txt > nmapxmas.txt
> grep -v NMAPXMAS cb8.txt > cb9.txt

Don't know if you care or not, but you could do this much more efficiently
with perl.  If you don't want to do that, you can at least avoid the
tempfiles by using the surrounding spaces in your patterns, eg.

  grep " FINSCAN " logfile > finscan.txt

--=20
If you make people think they're thinking, they'll love you; but if you
really make them think they'll hate you.

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj+ViREACgkQFMm9uvwPXW4JFACfUdJncK3pij6Z6ffx/tE88cfK
0XQAn3wWZlEclyVRdGNitAHtjymQSTdA
=8aMw
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

