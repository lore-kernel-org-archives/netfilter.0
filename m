From: Harald Welte <laforge@netfilter.org>
Subject: Re: MSN throught Linux
Date: Fri, 3 Oct 2003 12:43:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003104359.GB5758@sunbeam.de.gnumonks.org>
References: <14C5057BC852D611BAC400E0299AA10F02042D@MAILSERV>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vgMGNn5J91Ssshoo"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <14C5057BC852D611BAC400E0299AA10F02042D@MAILSERV>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: MOUDARIR Mohamed <moudarir@Richbond.ma>
Cc: netfilter@lists.netfilter.org


--vgMGNn5J91Ssshoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2003 at 06:48:34PM -0000, MOUDARIR Mohamed wrote:
> Hi
> Can we use MSN voice conversation behind a Linux firwall ( redhat )=20

No.  I think they are using SIP (no idea, I haven't used windofs for 8
years) for which you would need a conntrack+nat helper on the linux
firewall.  Since nobody has written such a helper yet, it doesn't work.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--vgMGNn5J91Ssshoo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVLvXaXGVTD0i/8RAjFeAJ421Tkq05qbAW0q98x8EJH3OSBk/QCcDDJ/
/7+D5b6gdMWDJhlq152DK/w=
=dFgs
-----END PGP SIGNATURE-----

--vgMGNn5J91Ssshoo--

