From: "David C. Hart" <DCH@TQMcube.com>
Subject: Kernel, IPTables or Router Anomaly? Maybe me?
Date: Fri, 31 Oct 2003 09:49:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067611776.1427.47.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Amj6Q6IM5r6MvWxSe4Ed"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: iptables mailing list <netfilter@lists.netfilter.org>


--=-Amj6Q6IM5r6MvWxSe4Ed
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I can't figure this out.

Our server has three internal IP addresses on two interfaces. So we have
eth0, eth0:1 and eth1.

"Oct 31 09:24:47 mail2 kernel: FIREWALLED: IN=3Deth1 OUT=3D
MAC=3D00:09:5b:22:29:d1:00:06:25:e4:ed:a3:08:00 SRC=3D217.97.25.71 DST=3D19=
2.
168.0.5 LEN=3D404 TOS=3D0x00 PREC=3D0x00 TTL=3D111 ID=3D40607 PROTO=3DUDP S=
PT=3D6022
DPT=3D1434 LEN=3D384"

In this case, destination 192.168.0.5 is on eth0:1. Yet it shows as eth1
with the eth1 MAC. This connections was NATed through the router so it
never hit the eth1 interface. Here's part of the ifconfig.

eth0      Link encap:Ethernet  HWaddr 00:50:04:65:E3:1B
          inet addr:192.168.0.31  Bcast:192.168.0.255=20
Mask:255.255.255.0

eth0:1    Link encap:Ethernet  HWaddr 00:50:04:65:E3:1B
          inet addr:192.168.0.5  Bcast:192.168.0.255  Mask:255.255.255.0

eth1      Link encap:Ethernet  HWaddr 00:09:5B:22:29:D1
          inet addr:192.168.0.32  Bcast:192.168.0.255=20
Mask:255.255.255.0


--=-Amj6Q6IM5r6MvWxSe4Ed
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/onaAol4OE0cpGaIRAtDiAKCs1TxWqf2Czj4S/+9OKi2VVDPgHQCeKL4J
f2iVq9Fznx4q3jMY7V6w00U=
=feWw
-----END PGP SIGNATURE-----

--=-Amj6Q6IM5r6MvWxSe4Ed--


