From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: RTSP netfilter patch for 2.4.18
Date: Thu, 30 Sep 2004 12:25:45 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040930192545.GA25254@home.tig-grr.com>
References: <20040928235104.GA21363@home.tig-grr.com>
	<415A612C.2030205@mrv.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <415A612C.2030205@mrv.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Yaron Presente <ypresente@mrv.com>
Cc: netfilter@lists.netfilter.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >Does the patch apply cleanly?  If it does, it should work okay.
> >=20
> >
> No, unfortunately it doesn't. I had a problem with the modifications in=
=20
> netfilter_ipv4/ip_conntrack.h .
> The patch tries to insert exp_rtsp_info and ct_rtsp_info into the union=
=20
> ip_conntrack_expect_help,
> which does not exist in my 2.4.18 source.
> Looking at the ftp 2.4.18 patch as a reference, I see that a ct_ftp_info=
=20
> does exist, but in a different context in the header file.
> an exp_ftp_info structure, however, is not defined at all.
> Any ideas?

I will try to get a patch to you within a few days.  However, I will not be
able to test it except to verify that the kernel builds.  If you can use a
later kernel, that would be best.

--=20
To use violence is to already be defeated.
        -- Chinese proverb

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkFcXbkACgkQFMm9uvwPXW6eNACgjzlSJCrwqfSDiTvrRcjIlKnT
OpwAnR+c8n2l827HBLBMKg9B76Ed/Hc+
=q/r2
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

