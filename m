From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: It's possible to log all packet from one program?
Date: Sat, 8 Feb 2003 17:24:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030208162457.GB3913@ynfonatic.de>
References: <E18gXbA-0002VP-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E18gXbA-0002VP-00@kashyyyk.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: alex syring <alex@asyring.homeip.net>
Cc: netfilter@lists.netfilter.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

you can use the owner-match for that, although i'm not sure how good that o=
ne
works. I just tried that and it seems to work:

iptables -A OUTPUT -m owner --cmd-owner squid -j LOG --log-prefix "SQUID: "

After surfing a bit i saw a shitload of Squid-data in my logs, like:

Feb  8 17:19:56 castor kernel: SQUID: IN=3D OUT=3Dppp0 SRC=3D217.82.6.66 DS=
T=3D137.226.77.40 LEN=3D658 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D6144 DF PR=
OTO=3DTCP SPT=3D39376 DPT=3D80 WINDOW=3D5808 RES=3D0x00 ACK PSH URGP=3D0=20
Feb  8 17:19:56 castor kernel: SQUID: IN=3D OUT=3Dppp0 SRC=3D217.82.6.66 DS=
T=3D137.226.77.40 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D65535 DF PR=
OTO=3DTCP SPT=3D39376 DPT=3D80 WINDOW=3D8640 RES=3D0x00 ACK URGP=3D0=20
Feb  8 17:19:56 castor kernel: SQUID: IN=3D OUT=3Dlo SRC=3D127.0.0.1 DST=3D=
127.0.0.1 LEN=3D1610 TOS=3D0x02 PREC=3D0x00 TTL=3D64 ID=3D63291 DF PROTO=3D=
TCP SPT=3D3128 DPT=3D39375 WINDOW=3D32767 RES=3D0x00 ACK PSH URGP=3D0=20

Maybe it works even more reliable if you use the PIDs instead of "cmd-owner"
since on Debian squid runs under two users, root and proxy. After starting
squid forks a new instance with less priviledges i think... (i runs on port
3128 anyways, why should it run as root in the first place? *shrug*)

Hope that helps, Alex. (another one)

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5FL1kACgkQEMMZKORQoYKLNACfYjPiV3qrOpRLxe2VPwWGWpsC
7M8AoIOx/JPAm2DCydMVlrNhL/HkYdoI
=lk2T
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--

