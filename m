From: Harald Welte <laforge@netfilter.org>
Subject: Re: Connection synchronization.
Date: Fri, 3 Oct 2003 12:31:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003103147.GA5758@sunbeam.de.gnumonks.org>
References: <200309301409.45599.carles@unlimitedmail.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IhkijFRPBo/yHbQs"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200309301409.45599.carles@unlimitedmail.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Carles Xavier Munyoz =?iso-8859-1?Q?Bald=F3?= <carles@unlimitedmail.org>
Cc: netfilter@lists.netfilter.org


--IhkijFRPBo/yHbQs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2003 at 02:09:45PM +0200, Carles Xavier Munyoz Bald=F3 wrot=
e:
> Hi,
> I have a master FW with a failover FW that I have configured using Keepal=
ived=20
> (http://keepalived.sourceforge.net/index.html).
> The problem I have now is that when the failover FW is activated due a fa=
ult=20
> in the master FW, the current connections are lost.
>=20
> Is there any utility for keep linux netfilter connections synchronization
> between the two firewalls ?

not yet, but under development.

> I have seen that this is done by the Linux Virtual Server=20
> (http://www.linuxvirtualserver.org/), but I don't want a Linux Virtual Se=
rver=20
> director, I only want a FW box with a failover FW with synchronized=20
> connections.

This cannot be compared to conntrack sync.  The LVS problem is way
simpler than ours.

> Greetings.
=20

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--IhkijFRPBo/yHbQs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVATXaXGVTD0i/8RAp0IAJ447cWd0MsP7SWIfG9hTEZVNCJgawCgkh5j
ITnVH8OKK7nTEz+bYslrjko=
=bFIE
-----END PGP SIGNATURE-----

--IhkijFRPBo/yHbQs--

