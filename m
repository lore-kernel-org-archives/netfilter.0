From: Harald Welte <laforge@netfilter.org>
Subject: Re: conntrack for samba/netbios-ns
Date: Fri, 7 Nov 2003 17:48:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031107164809.GU5741@sunbeam.de.gnumonks.org>
References: <20031105003401.GA11702@shell.blacknet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ubBGeysJ7fFOU9Y9"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031105003401.GA11702@shell.blacknet.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter <netfilter@lists.netfilter.org>


--ubBGeysJ7fFOU9Y9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2003 at 01:34:01AM +0100, Goetz Bock wrote:
>=20
> Dear list,
>=20
> as googeling did not turn up anything nor did a browsing through the
> lists archive turn up anything usefull, I'll just have to ask.

i think the issue of a smb connection tracking and/or nat module has
already been discussed 2-3 years ago.  It's just that nobody has written
one so far. patches welcome ;)

> It looks like if the conntacking modules (all from stock 2.4.22) are not
> ablel to relate the reply a.b.c.24.netbios-ns > a.b.c.17.32769 to the
> request a.b.c.17.32769 > a.b.c.31.netbios-ns.

no, of course not.  connection tracking can just deal with symmetric
connections (a.b.c.d:e -> v.w.x.y:z and replies v.w.x.y:z ->a.b.c.d:e).
Everything else can only be achieved with connection tracking helpers.

> Is there a conntrack_netbios-ns or am I doing something wrong?

no, as indicated above, nobody has contributed one yet.

> /"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--ubBGeysJ7fFOU9Y9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/q8zJXaXGVTD0i/8RAmzfAJ9uaCs1ClytDx7IEcODo5x/svrKNQCeIx/C
AOjpr0iPdDpFKt+wBXALvTQ=
=xMSn
-----END PGP SIGNATURE-----

--ubBGeysJ7fFOU9Y9--

