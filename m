From: Harald Welte <laforge@netfilter.org>
Subject: Re: Using iptables with x86_64 static kernel (module problems)?
Date: Fri, 3 Oct 2003 12:21:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003102156.GV5758@sunbeam.de.gnumonks.org>
References: <20031001161136.GA13226@cc.jyu.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FOdG/w7DHD+yDhUZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031001161136.GA13226@cc.jyu.fi>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jani Averbach <jaa@cc.jyu.fi>
Cc: netfilter@lists.netfilter.org


--FOdG/w7DHD+yDhUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2003 at 07:11:36PM +0300, Jani Averbach wrote:
>=20
> Hello!
>=20
> I am trying to use netfilter (iptables) with static (no module
> support) x86_64 kernel (2.4.23-pre5-x86_64-1). However, iptables won't
> work with that kernel because it try to do various modules related
> task. If I compile a static i386 2.4.23-pre5 kernel that will work
> like expected.=20

I don't really understand the problem.  'iptables tries to do various
mudules related task' ?

> If this is a nontrivial problem, I could provide more detailed
> information.

yes, please.   I have no idea what you are talking about, sorry.

> Thanks,
> Jani

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--FOdG/w7DHD+yDhUZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fU3EXaXGVTD0i/8RAr+PAJ9wsb44o4C692GJqWdKUdPbfeBGQQCfTeAA
hSAgZOjtAym7FiVFqOHzicM=
=3sig
-----END PGP SIGNATURE-----

--FOdG/w7DHD+yDhUZ--

