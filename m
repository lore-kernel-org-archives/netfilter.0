From: Athan <netfilter@miggy.org>
Subject: Re: Newbie question about having multiple destination addresses in a chain entry
Date: Sun, 5 Jan 2003 12:45:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030105124531.GJ16581@miggy.org>
References: <3E181977.4020204@aut.ac.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQAwcd5tHl0Qlnzi"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E181977.4020204@aut.ac.nz>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ian Batterbee <ian.batterbee@aut.ac.nz>
Cc: netfilter@lists.netfilter.org


--LQAwcd5tHl0Qlnzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2003 at 12:39:35AM +1300, Ian Batterbee wrote:
> Chain PREROUTING (policy ACCEPT 16 packets, 1278 bytes)
>  pkts bytes target     prot opt in     out     source=20
> destination
>    26  1248 NOTHING    tcp  --  eth0   any     anywhere=20
> 192.168.0.0/24     tcp dpt:www
>    28  1344 REDIRECT   tcp  --  eth0   any     anywhere=20
> !x.x.0.0/16      tcp dpt:www redir ports 3128
>=20
> Chain POSTROUTING (policy ACCEPT 29 packets, 1892 bytes)
>  pkts bytes target     prot opt in     out     source=20
> destination
>=20
> Chain OUTPUT (policy ACCEPT 24 packets, 1638 bytes)
>  pkts bytes target     prot opt in     out     source=20
> destination
>=20
> Chain NOTHING (1 references)
>  pkts bytes target     prot opt in     out     source=20
> destination

   I *think* your problem is that the NOTHING chain is empty, so at the
end of it it just returns to the calling chain.  Why not just simply -j
ACCEPT on the rule in PREROUTING?  That should stop it processing any
further down the PREROUTING for packets with that destination.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--LQAwcd5tHl0Qlnzi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4YKOsACgkQzbc+I5XfxKej8QCeO+wiilDzQbmMJdsjDyPe7eqC
OtgAnjSMr5cJ5narnOknW6wizNcPri7M
=EthE
-----END PGP SIGNATURE-----

--LQAwcd5tHl0Qlnzi--

