From: Martin Tomasek <mtd@mk.cvut.cz>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 01:20:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707232008.GA26992@mt.mk.cvut.cz>
References: <200FAA488DE0D41194F10010B597610D2BA264@JUPITER>
Reply-To: mtd@mk.cvut.cz
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA264@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Every deny spawns my script, my script determines if it's a true attack a=
nd
> can take counter measures like email me and then shutdown the firewall
> etc.etc..

=3D> DOS

while true;do send_data_which_will_run_your_script;done;

should run _many_ scripts, if not, it could be parallelized.

> Other ways is to run snort or portsentry and others.. I'm happy with my
> script.. it's activated once only because I forgot to allow my VPN user to
> get through... ;) Oops.. Blocked him for a while..

portsentry, which blocks ips =3D> DOS

for a in `seq 1 1000`;do
send_data_which_will_trigger_postsentry_from_spoofed_ips;done;

where spoofed ips are google.com etc, it may include ips from your
network.

--=20
Martin Tomasek, mtd@email.cz
BOFH excuse #49:
Bogon emissions

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9KMyozWKqGie3rqoRAs5YAKCGg0yD5Nh/SucML6zMdSq1x9EuZgCcCjZ/
7o8oqC4hN+FEfFtH0FhX9MM=
=jAJr
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

