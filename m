From: Harald Welte <laforge@netfilter.org>
Subject: Re: Change iptables log format (would be a nice feature)
Date: Wed, 8 Oct 2003 14:24:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031008122427.GU25743@sunbeam.de.gnumonks.org>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk> <1065456746.1189.32.camel@valhalla> <20031007094746.GJ18246@sunbeam.de.gnumonks.org> <Pine.LNX.4.56L0.0310081208511.5838@sutsko.kollegie.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UC+RhZhEc8lcmajv"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.56L0.0310081208511.5838@sutsko.kollegie.dk>
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
Cc: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org, ulogd@lists.gnumonks.org


--UC+RhZhEc8lcmajv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2003 at 12:11:46PM +0200, Lasse B. Jensen wrote:
>=20
> On Tue, 7 Oct 2003, Harald Welte wrote:
>=20
> > On Mon, Oct 06, 2003 at 12:12:26PM -0400, Chris Brenton wrote:
> > > On Thu, 2003-10-02 at 10:40, Lasse B. Jensen wrote:
> > > >
> > > > Is it possible to change the log format of iptables?
> > >=20
> > > As others have pointed out this is not possible, however it might mak=
e a
> > > nice feature to be added in. I've noticed that in high bandwidth
> > > environments what chokes throughput the most is logging.=20
> >=20
> > This is why you should use ULOG / ulogd if you log many packets.
>=20
> I have now tried with ulog and ulogd and got a much better performance...=
=2E=20
> however i seem that the timestamp i ulog i "fucked up". My time on the=20
> machine i fine, but the ulog timestamp says Jan 12 00.04.02 when the=20
> date-output says Okt 8 11.43.22=20
>=20
> Can anyone give me an explanation?

the answer is in the ulogd@lists.gnumonks.org mailinglist archive, there
is also a patch for it (in ulogd CVS).  I'm about to release ulogd-1.02
because of that bug.

> /Lasse

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--UC+RhZhEc8lcmajv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/hAH7XaXGVTD0i/8RAi6aAKCi7zcBimzwKME36aOZ6qMyreVH0QCgrkeg
hn/Im1Ql3Cu5SyG1Hf/Nw30=
=O3da
-----END PGP SIGNATURE-----

--UC+RhZhEc8lcmajv--

