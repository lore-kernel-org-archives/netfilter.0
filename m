From: Harald Welte <laforge@netfilter.org>
Subject: Re: forward port of TTL.patch to 2.6.0-test9
Date: Fri, 7 Nov 2003 17:50:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031107165012.GV5741@sunbeam.de.gnumonks.org>
References: <3FA7CD65.6000804@tamiweb.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JVVqWhpkAs5raV7A"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3FA7CD65.6000804@tamiweb.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Kostadin Karaivanov <larry@tamiweb.com>
Cc: netfilter@lists.netfilter.org


--JVVqWhpkAs5raV7A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2003 at 06:01:41PM +0200, Kostadin Karaivanov wrote:
> Hi list,
> I just forward ported TTL.patch (attached) from patch-o-matic-20031103=20
> to linux-2.6.0-test9 for fun and profit. It's rather mechanical port but=
=20
> it works at least build-in. I've veryfied this with tcpdump.
> But I have two questions. First of course is: is this the proper way to=
=20
> port things like this, couse AFAIC 2.4 and 2.5 networking code is quite=
=20
> different, if not why.=20

no, I don't see a problem with this 2.6 merge.  However, we still don't
have a 2.6-ready patch-o-matic (I'm working on it), so I cannot really
integrate it somewhere.

> And second - where I can read about current > implementation ot linux
> networking excetp kernel sources.

I doubt there is any information apart from the netdev and linux-kernel
mailinglist archives.

> wwell Larry.
>=20
> P.S please cc me, I'm not subscribet to the list.
--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--JVVqWhpkAs5raV7A
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/q81EXaXGVTD0i/8RArRsAJ0WmyGy4bxErC8tGalng5he7NORGwCffBtw
1upXrBIT9ipfCAOy1it+qZQ=
=/AvS
-----END PGP SIGNATURE-----

--JVVqWhpkAs5raV7A--

