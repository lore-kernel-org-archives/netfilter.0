From: Athan <netfilter@miggy.org>
Subject: Re: HELP: Conntrack table filling up !!!
Date: Tue, 31 Dec 2002 23:50:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231235005.GD1985@miggy.org>
References: <3E075D48.70801@interplus.ro> <000001c2b10e$e13376a0$0100a8c0@zultys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000001c2b10e$e13376a0$0100a8c0@zultys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2002 at 12:54:57PM -0800, Ranjeet Shetye wrote:
>=20
> There are ways in which pings (ICMP packets) can fill up conntrack
> tables quickly. Are you running into problems with ICMP traffic only or
> with any traffic ? e.g. look at /proc/net/ip_conntrack . Is it filled up
> with ICMP traffic connections only ? If so, you might want to protect
> your linux box from malformed ICMP packets, by DROPping all such packets
> in the "filter" table.

  Don't arbitrarily drop all ICMP, bad idea, breaks a few things.

  Couldn't the 'full ip conntrack table' problem be solved by echo'ing a
bigger number into /proc/sys/net/ipv4/ip_conntrack_max ?

	root@jimblewix:/proc/sys/net/ipv4;
	23:48:19 0$ echo 32768 > ip_conntrack_max=20

certainly changes it here.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4SLS0ACgkQzbc+I5XfxKe1igCfX7whr9akXYXncNrJIcBidGzX
av4AniJvf9qEFjfTFhKznmXViTk1ToKK
=cAaK
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--

