From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: iptables: invalid arguement with kernel 2.6.5
Date: Tue, 4 May 2004 13:58:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040504115824.GA5227@zion.homelinux.com>
References: <002e01c431c7$09cfe910$440997cb@GINA>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002e01c431c7$09cfe910$440997cb@GINA>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Det Buaklee <det@dss.go.th>
Cc: netfilter@lists.netfilter.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Det,

On Tue, May 04, 2004 at 06:00:40PM +0700, Det Buaklee told us:
> Hi
> =20
> I am very new in configuring iptables with bridge software. I want to do
> a transparent proxy with iptables and squid and running a firewall
> bridge on the squid box. I have upgraded my kernel to 2.6.5 (to get the
> firewall-bridge) and I have already tried compiled iptables 1.2.9 with
> the kernel src directory. My problem is when I tried something like=20
> =20
> /sbin/iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 8080
> =20
> or=20
> =20
> /sbin/iptables -t mangle -A PREROUTING -m physdev --physdev-in eth0 -p
> tcp --dport 80 -j REDIRECT --to-port 8080
> =20
> and iptables just return=20
> =20
> iptables: invalid argument
> =20
> Any help or pointer to some documents would be much appreciated.=20
> =20
> Det Buaklee

REDIRECT ist only valid in the nat table, not in mangle.


HTH

Sven

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 13:57:45  up 13 days, 18:47,  1 user,  load average: 0.03, 0.04, 0.06

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAl4Vgo4FAdB2PneQRArJ4AJ46No2usGb14X2CtqW8fQaXQJDc+ACeLwk8
rivqfTdMkaxhcxPwYH5vID4=
=NeCV
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

