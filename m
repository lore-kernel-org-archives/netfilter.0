From: Athan <netfilter@miggy.org>
Subject: Re: How to find nvl table?
Date: Tue, 15 Apr 2003 08:09:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030415070918.GA7135@miggy.org>
References: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Bobo <boboaq@163.com>
Cc: "netfilter @ lists. netfilter. org" <netfilter@lists.netfilter.org>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2003 at 03:02:56PM +0800, Bobo wrote:
> HI
>=20
>      Some days ago ,a member of here reply me the followings about traffi=
c account:
> >try this one:
> >
> >iptables -nvL INPUT
                 ^^^^^
>    [root@myfirewall account]# iptables -nvL  input
> iptables: Table does not exist (do you need to insmod?)
>=20
>     why?  how to find the talbe? does  it need a special patch?

  It's case sensitive:

07:25:43 0$ iptables -nvL  input
iptables: Table does not exist (do you need to insmod?)
root@jimblewix:/other/backup;
08:07:48 0$ iptables -nvL  INPUT
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20
=2E..

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6bsB4ACgkQIr2uvLNOS8O1bACfd0eu4nru/HZU5DcHAel0zkbE
cuMAoIAAd+aRtNnFZvV3rHN7QDgZczDc
=XT+v
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

