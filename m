From: Harald Welte <laforge@netfilter.org>
Subject: Re: [netfilter-core] Bug in iptables / nat
Date: Mon, 20 Dec 2004 19:34:34 +0100
Message-ID: <20041220183434.GE24142@sunbeam.de.gnumonks.org>
References: <000001c4e6be$07be4020$fe78a8c0@GERHARD>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YzdYn+D7cUqe+VA3"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000001c4e6be$07be4020$fe78a8c0@GERHARD>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Gerhard Lorbeer <Gerhard@Dr-Lorbeer.de>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org


--YzdYn+D7cUqe+VA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2004 at 07:02:04PM +0100, Gerhard Lorbeer wrote:
> Hi,
> We are using and supporting Suse/Novell-Linux.
> Recently we had built firewall's for a custumer-installation with nat.
> We wondered about many drops and found the reason.
>=20
> It is a bug (feature?) in iptables, known already in previous, see:
> http://www.mail-archive.com/cooker@linux-mandrake.com/msg130593.html

Most likely Novell/SuSE compiled iptables against header files of a
different kernel than the kernel they ship in their distribution.

> iptables-nat is not working with INVALID packets. Maybe it's an
> Suse-Problem. I've informed Suse/Novell about this.

Feel free to tell them to contact me directly.  I'm Cc'ing the netfilter
user list, since there might be others who are interested in this issue.

> Friendly
> Dr.-Ing. Gerhard Lorbeer
> Dr.Lorbeer EDV-Service GmbH
> Voetsdyck 8
> D-47638 Straelen

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--YzdYn+D7cUqe+VA3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBxxs6XaXGVTD0i/8RAgSwAJ4hbYrtSMFpeqnzMkqvQGTfCRn+4gCdGu1Z
nPh++oCs4FTcuU00/MVEe0c=
=IdF+
-----END PGP SIGNATURE-----

--YzdYn+D7cUqe+VA3--

