From: Harald Welte <laforge@netfilter.org>
Subject: Re: Question to the list/maintainers....
Date: Fri, 3 Oct 2003 12:19:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003101955.GU5758@sunbeam.de.gnumonks.org>
References: <200310011918.40436.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LMyZIZ/7CYeQWiVH"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200310011918.40436.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org


--LMyZIZ/7CYeQWiVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2003 at 07:18:40PM -0400, Alistair Tonner wrote:
> 	Are the updates in 2.4.22 likely to fix the occasional DCC send/recieve=
=20
> errors that my natted users have been experiencing ( DCC connection reque=
sts
> 	come through, but cannot be seen by the client, only by the server and
> 	the NATTING host) -- this is an intermittent problem that I was
> 	laying at the foot of the client until I noted that the actual
> 	client to client connection was never built in the conntrack
> 	table?

please look at the irc related patch in the new patch-o-matic release,
that fixes a particular 'bug' in case mIRC is configured erroneously on
the client side.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--LMyZIZ/7CYeQWiVH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fU1LXaXGVTD0i/8RAlX5AKCjrwI7g9q49rK3qKlEngb7xftEgwCfSLZn
nD9K4bEHbaTaqeRTmN/jtZA=
=Ox1n
-----END PGP SIGNATURE-----

--LMyZIZ/7CYeQWiVH--

