From: Harald Welte <laforge@gnumonks.org>
Subject: Re: pptp-conntrack-nat ?
Date: Fri, 29 Nov 2002 17:10:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021129161021.GF7297@naboo.club.berlin.ccc.de>
References: <E18HhNW-0004lH-00@smtp.inode.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E18HhNW-0004lH-00@smtp.inode.at>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Lukas =?iso-8859-1?Q?=D6sterreicher?= <lukas.oesterreicher@inode.at>
Cc: netfilter@lists.netfilter.org


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 1996 at 10:25:39AM +0100, Lukas =D6sterreicher wrote:
> I ask because I run a linux nat server which is connected
> to the net by pptp, and so i wondered for what that module
> is actually good for / what it does. I guessed its not obligatory
> for connecting via pptp for that module is still beta and there
> are whole countrys using pptp to connect.
>=20
> Can you explain to me what it does or refer me to an url that
> does that?

it is a conntrack/nat helper module for pptp.  It's the same like the
respective helper modules for ftp/irc/h323/... - you will only need it
if you want to make [multiple] PPTP connections _through_ a stateful
firewall or NAT box.

> Thank you in advance,
> Lukas

--=20
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M-=
=20
V-- PS+ PE-- Y+ PGP++ t++ 5-- !X !R tv-- b+++ DI? !D G+ e* h+ r% y+(*)

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE955FtXaXGVTD0i/8RAhmEAKCWyvCEYtTHWMcoE0aNkHdeUZDkXQCcDP1/
zVBLJMs/4kQKGCroNeBFFV8=
=pR3f
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--

