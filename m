From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 15:27:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231202708.GP677@ns>
References: <20021231190312.98050.qmail@web40908.mail.yahoo.com> <20021231202321.1635.qmail@web40307.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TxukmIqg3MmZ0Kmh"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021231202321.1635.qmail@web40307.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Kevin McConnell <kevymac@yahoo.com>
Cc: Brad Chapman <kakadu_croc@yahoo.com>, Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.netfilter.org


--TxukmIqg3MmZ0Kmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Kevin McConnell (kevymac@yahoo.com) wrote:
>=20
> --- Brad Chapman <kakadu_croc@yahoo.com> wrote:
> > Yes. You have to remove all addressing data from the
> > config files your distro uses
> > to configure eth0 and eth1. Then you need to use a
> > kernel with CONFIG_BRIDGE and the
> > netfilter-bridge patches applied, and you need the
> > bridge-utils package installed.
> > Those thre items can be found at kernel.org and
> > http://www.math.leidenuniv.nl/~buytenh/bridge. The
> > Red Hat 8.0 2.4.18-14 kernel has
> > the appropriate infrastructure present.
>=20
> I have a question though. If he removes all addressing
> data, how can he do NAT'ing properly?

The two havn't got anything to do with each other.  NATing is modifying
packets as they pass through the router.  Addressing is the IP address
and whatnot to access the firewall/router.  One does not require the
other.

	Stephen

--TxukmIqg3MmZ0Kmh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Ef2crzgMPqB3kigRAooLAJ43tuCQHcuWkQQV3tdCqDX0T5VQSACcDY0i
Q0Zjmg3C2KIIqSoiXTTZ6vA=
=XLi4
-----END PGP SIGNATURE-----

--TxukmIqg3MmZ0Kmh--

