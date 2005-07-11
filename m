From: Harald Welte <laforge@netfilter.org>
Subject: Re: removing entries from conntrack table
Date: Mon, 11 Jul 2005 09:36:01 +0200
Message-ID: <20050711073601.GE15121@sunbeam.de.gnumonks.org>
References: <IISVR6$0605B46BBF14FF0959F85306B36F361C@libero.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <IISVR6$0605B46BBF14FF0959F85306B36F361C@libero.it>
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
To: "massiblue@libero.it" <massiblue@libero.it>
Cc: netfilter <netfilter@lists.netfilter.org>


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2005 at 05:16:18PM +0200, massiblue@libero.it wrote:
> so i need a way to
> _selectively_ delete
> conntrack entries!

ctnetlink from pom-ng and the 'conntrack' program are your friends.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC0iFhXaXGVTD0i/8RAt/xAJ0Rn7HemRLQB1B4YJ4sAvf6iKntdgCfUU/l
tezzlG1Z0qX9p2iAjMa+3r8=
=WfCy
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--

