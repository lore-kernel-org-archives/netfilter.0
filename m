From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH] 2.4.20-pre6, -pre5-ac4 Configure.help fix for CONFIG_IP_NF_MATCH_DSCP
Date: Wed, 11 Sep 2002 23:54:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911235446.B3810@sunbeam.de.gnumonks.org>
References: <1031771969.1984.364.camel@spc9.esa.lanl.gov>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Hhx61DPNOHVwUu9"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1031771969.1984.364.camel@spc9.esa.lanl.gov>; from elenstev@mesatop.com on Wed, Sep 11, 2002 at 01:19:29PM -0600
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Steven Cole <elenstev@mesatop.com>
Cc: netfilter@lists.netfilter.org, Marcelo Tosatti <marcelo@conectiva.com.br>, Alan Cox <alan@lxorguk.ukuu.org.uk>, davem@redhat.com


--9Hhx61DPNOHVwUu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2002 at 01:19:29PM -0600, Steven Cole wrote:
> Greetings,
>=20
> In 2.4.20-pre6 and -pre5-ac4, there are two help texts in
> Documentation/Configure.help for CONFIG_IP_NF_TARGET_DSCP and
> there is currently no help text for CONFIG_IP_NF_MATCH_DSCP.

This is true.

> It looks like the first help text should really be for
> CONFIG_IP_NF_MATCH_DSCP.=20

You are correct.

> The small patch at the end should fix this. The patch was made=20
> against 2.4.20-pre6, but will apply to 2.4.20-pre5-ac4 with=20
> a small offset (36 lines).

Marcelo/Dave: Please apply Steven's patch to my stupid copy+paste mistake.

		Thanks.

> Steven=20
>=20
> --- linux-2.4.20-pre6/Documentation/Configure.help.orig	Wed Sep 11 11:49:=
17 2002
> +++ linux-2.4.20-pre6/Documentation/Configure.help	Wed Sep 11 11:49:56 20=
02
> @@ -2588,7 +2588,7 @@
>    Documentation/modules.txt.  If unsure, say `N'.
> =20
>  DSCP match support
> -CONFIG_IP_NF_TARGET_DSCP
> +CONFIG_IP_NF_MATCH_DSCP
>    This option adds a `DSCP' match, which allows you to match against
>    the IPv4 header DSCP field (DSCP codepoint).
> =20

--=20
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M+=
=20
V-- PS++ PE-- Y++ PGP++ t+ 5-- !X !R tv-- b+++ !DI !D G+ e* h--- r++ y+(*)

--9Hhx61DPNOHVwUu9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9f7ulXaXGVTD0i/8RAh9AAJ0c22P93UsRY3wCb9UAtm+uLsixEQCfa+Ai
xzopltjCMbCjgdNRmgRQARc=
=540i
-----END PGP SIGNATURE-----

--9Hhx61DPNOHVwUu9--

