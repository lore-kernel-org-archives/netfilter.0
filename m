From: Harald Welte <laforge@netfilter.org>
Subject: Re: Change iptables log format
Date: Sun, 5 Oct 2003 16:08:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031005140859.GC5758@sunbeam.de.gnumonks.org>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LC6PSvEsRImd411h"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Lasse B. Jensen" <gymer@odense.kollegienet.dk>
Cc: netfilter@lists.netfilter.org


--LC6PSvEsRImd411h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2003 at 04:40:05PM +0200, Lasse B. Jensen wrote:
> Is it possible to change the log format of iptables?

not without modifying the sourcecode of ipt_LOG.c

you can alternatively start using ulogd, where you only have to modify
userspace code if you want to log in a special format...

> Lasse B. Jensen

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--LC6PSvEsRImd411h
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/gCX7XaXGVTD0i/8RAnrwAJ9jW2xw3LT+5WHSwFmAZmZ0qCHvnwCfemMr
yDbTB62b6+WiG9us+DuKeDE=
=MIki
-----END PGP SIGNATURE-----

--LC6PSvEsRImd411h--

