From: Harald Welte <laforge@netfilter.org>
Subject: Re: promiscuous mode
Date: Fri, 3 Oct 2003 12:00:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003100037.GQ5758@sunbeam.de.gnumonks.org>
References: <20031002231239.GH29243@gandalf.intern.marcant.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PCSS5jcV3Z4INoC2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031002231239.GH29243@gandalf.intern.marcant.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: nils toedtmann <netfilter@nils.toedtmann.net>
Cc: netfilter@lists.netfilter.org


--PCSS5jcV3Z4INoC2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2003 at 01:12:39AM +0200, nils toedtmann wrote:
> Hi,
>=20
> i want to do passive accounting using the ULOG target. As i=20
> understood, netfilter can only see packets passing the kernel
> routing code. That explains why i cannot see packets (except=20
> those for the box itself) passing the NIC in mangle/PREROUTING
> (NIC in promiscuous mode).

yes.  This is how a packet filtering framework is supposed to behave.

> but thats against iptables 1.2.3 (2001-11-06). Is there any
> other way doing passive accounting with iptables?

no, and I don't recommend it.  neither iptables, nor ULOG/ulogd are a
good way of doing accounting.

This discussion happened before.  Either on netdev, the ulogd list or
netfilter-devel, don't remember.

> /nils.


--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--PCSS5jcV3Z4INoC2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fUjFXaXGVTD0i/8RAhyhAJ4wa3h8e+lyG/GLCh1vDYh4B/sBhwCdHKUm
iE7eNM4LLZhyqolAyJW/A+0=
=KnaT
-----END PGP SIGNATURE-----

--PCSS5jcV3Z4INoC2--

