From: Harald Welte <laforge@netfilter.org>
Subject: Re: RTSP
Date: Fri, 3 Oct 2003 12:27:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003102707.GX5758@sunbeam.de.gnumonks.org>
References: <771599703.20030930173006@netfids.com> <20030930235504.GB2030@home.tig-grr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nydc3TyZakb7ip9W"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030930235504.GB2030@home.tig-grr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Geffrey Velasquez <g_netfilter@netfids.com>, netfilter@lists.netfilter.org, tmarshall@real.com


--nydc3TyZakb7ip9W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2003 at 04:55:04PM -0700, Tom Marshall wrote:
> You can try this:
>=20
>   http://home.tig-grr.com/rtsp/index.html

Why did nobody submit that to patch-o-matic yet?=20

Another issue, to quote from the above URL:
> Please let me know if you use this module, and how it works for you.
> The more feedback, the more incentive to improve the module and try to
> get it into the mainline kernel.

This is not possible.  The netfilter coreteam strongly opposes including
conntrack/nat helpers for protocols where there is not at least one free
software client and server implementation.  AFAIK, there is no free RTSP
server implementation so far.  Please inform me, if I'm wrong.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--nydc3TyZakb7ip9W
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fU77XaXGVTD0i/8RAk0eAJ0Tz4Spdi5iFrjAI+RKjEV2cQ29UgCfX0oi
V8QlH6tJPrUydxrQiH+Npkc=
=HI1R
-----END PGP SIGNATURE-----

--nydc3TyZakb7ip9W--

