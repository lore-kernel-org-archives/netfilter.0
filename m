From: Harald Welte <laforge@gnumonks.org>
Subject: Re: PPTP
Date: Mon, 7 Apr 2003 23:08:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030407210837.GE14333@naboo.towersoft.de>
References: <000901c2fd21$3475f910$0205a8c0@maxima>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c2fd21$3475f910$0205a8c0@maxima>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Benny Butler <benny.butler@nexusitg.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2003 at 11:17:36AM -0500, Benny Butler wrote:
> Harald,
>=20
>     Please forgive me for  my lack of knowledge, I'm not much of an
> iptables person.  I have a client that I had to set up an iptables
> firewall.  They have a PPTP server on their internal network that I can
> get to, but only one client at a time can hook to it.  I see your patch
> listed at :
> http://netfilter.kfki.hu/documentation/pomlist/pom-extra.html#pptp-connt
> rack-nat and am wondering if this would allow multiple connections to
> the server? Is that it's intended function?

yes, exactly.  Please use the patch-o-matic system to apply this patch
and then load the modules 'ip_conntrack_proto_gre, ip_conntrack_pptp,
ip_nat_proto_gre and ip_nat_pptp'.  Please refer to the netfilter
mailinglist(s) for further assistance.

> Thanks, Benny

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+kejVXaXGVTD0i/8RAgSMAKCIWvYAOxD8wPpVm/ypVtQQaS8A4gCbBadq
b3HCCL+fgA4qYe0MrQJXHS0=
=n3pi
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--

