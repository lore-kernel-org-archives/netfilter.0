From: Stephen Frost <sfrost@snowman.net>
Subject: Re: ftp hammer rule help
Date: Mon, 30 Sep 2002 23:16:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021001031622.GG8948@ns>
References: <007201c268f5$abec1fd0$6501a8c0@adm2hsmw3cesp7>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <007201c268f5$abec1fd0$6501a8c0@adm2hsmw3cesp7>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Adam De Paolis <adepaolis@rogers.com>
Cc: netfilter@lists.netfilter.org


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Adam De Paolis (adepaolis@rogers.com) wrote:
> I am trying to create a rule which will prevent users from hammering my f=
tp site when its busy. A rule which say will drop userlogin if their is 3 a=
ttempts in 1 minute.
>=20
> I believe the match recent rule is what I need to get working but I don't=
 have it working.  This is what I have so far (thanks to stephen frost, but=
 it doesnt seem to work.=20
>=20
> The firewall machine is my ftp server, both are on the same computer:
>=20
> iptables -A FORWARD -m recent --name ftpconn --rcheck --seconds 60 --hitc=
ount 3 -j DROP
> iptables -A FORWARD -p tcp -d aa.bb.cc.dd/32 --dport 21 -m recent --name =
ftpconn --set -j DRO

Can you say what does happen..?  Also, cat /proc/net/ipt_recent/ftpconn
and see what's there.  It also looks like maybe you have it set up
incorrectly in the second rule, you want to ACCEPT there until they
reach the limit which is in the first rule, and then they'll be dropped
there.

	Stephen

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9mROGrzgMPqB3kigRAg0uAJ9FKszQfWmoCqgVXDRVmInJzHhzkwCfRgq0
Yv5jaS1zRfq+J0/eCOYdCbY=
=E8w9
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--

