From: Harald Welte <laforge@netfilter.org>
Subject: Re: Problem for Bittorrent Application behind Linux Firewall
Date: Fri, 3 Oct 2003 13:03:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003110352.GI5758@sunbeam.de.gnumonks.org>
References: <049201c381b3$672939f0$5a01a8c0@wireless.cheung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iuN4h1cOz3siwt1Z"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <049201c381b3$672939f0$5a01a8c0@wireless.cheung.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Tom <gunsuper@atm.cyberec.com>
Cc: netfilter@lists.netfilter.org


--iuN4h1cOz3siwt1Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2003 at 05:16:41PM +0800, Tom wrote:
> The following is my iptables rules.According to my understanding, BT
> use the ports 6881 to 6889,Then I forward these ports to my machines
> in LAN.

I have no idea about bittorrent and it's protocol, sorry.
>=20
> #! /bin/sh
> iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 6881:6889 -j DNAT --=
to 192.168.1.90:6881-6889
> iptables -A FORWARD -p tcp -s 192.168.1.90 --dport 6881:6889 -j ACCEPT
>=20

Those rules say 'nat any port between 6881:6889 to any port between
6881:6889'.  i.e. port 6881 can be NAT'ed to 6884, happening in a
non-deterministic manner.

try 9 seperate rules for every port if you want to have that guarantee.
=20
> Tom Cheung
> 23 Sept 2003
--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--iuN4h1cOz3siwt1Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVeYXaXGVTD0i/8RAq3NAKCSJHg+MoeANoQtoGgab5PtlI5GKgCdHn0k
I1SjqY/74uQlr4yxbS0/Wdg=
=9h/1
-----END PGP SIGNATURE-----

--iuN4h1cOz3siwt1Z--

