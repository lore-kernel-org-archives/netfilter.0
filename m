From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: How to block sending mail from local network.
Date: Sat, 7 Feb 2004 21:15:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040207201511.GA2097@zion.homelinux.com>
References: <4024C335.7080705@ergolight-sw.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4024C335.7080705@ergolight-sw.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: David Harel <hareldvd@ergolight-sw.com>
Cc: netfilter@lists.netfilter.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi David,=20

On Sat, Feb 07, 2004 at 12:51:33PM +0200, David Harel told us:
> Hi all,
>=20
>=20
> I tried a command:
> $IPTABLES -A OUTPUT -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE --dport smtp=20
> -j DROP
> but it did nothing.

This will only stop traffic generated on your gateway. To stop traffic
going _through_ the gateway you will need to put this rule in the
FORWARD rule instead of OUTPUT, so replace OUTPUT with FORWARD, you
might try something like this:

$IPTABLES -A FORWARD -p tcp --dprt 25 -i $LAN_IFACE -o $EXT_IFACE \
	-j REJECT --reject-with tcp-reset

HTH

Sven

>=20
> What can I do to block those messages sending attempts?
>=20
> --=20
> Thanks.
>=20
> David Harel,
>=20

--=20
Linux zion 2.6.3-rc1 #1 Sat Feb 7 19:08:35 CET 2004 i686 athlon i386 GNU/Li=
nux
 21:11:01  up 28 min,  2 users,  load average: 0.12, 0.06, 0.05

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAJUdPo4FAdB2PneQRAsPFAJoDSmTA8mm+r8lzvw7vCDWsaSaGHwCdExtD
ocno4CAk+1esY/Ut05n9AnQ=
=Y9lt
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

