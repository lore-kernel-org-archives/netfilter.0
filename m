From: Harald Welte <laforge@netfilter.org>
Subject: Re: Broadcast Traffic Control!!!
Date: Mon, 11 Jul 2005 09:38:19 +0200
Message-ID: <20050711073819.GG15121@sunbeam.de.gnumonks.org>
References: <ab5428f7050625141733f681a@mail.gmail.com>
	<ab5428f705062514221a0e850e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ab5428f705062514221a0e850e@mail.gmail.com>
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
To: tahmeed <qs.tahmeed@gmail.com>
Cc: netfilter@lists.netfilter.org


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2005 at 03:22:44AM +0600, tahmeed wrote:

> is it possible to filter BC packets using IPTABLES or in any other method=
s.=20

ARP packets are not IP packets.  Therefore you need to use arptables,
not iptables.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC0iHrXaXGVTD0i/8RAri4AKCq9HmTBLmOKxkW2RF+gCN5v8aAtwCfRCYL
wwUpfPhpw10BzeBsp7ZXwRA=
=nJ9I
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--

