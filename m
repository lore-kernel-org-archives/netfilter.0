From: Alex Samad <alex@samad.com.au>
Subject: Help with Cisco VPN client in ipsec/tcp mode and iptables FW
Date: Mon, 2 Mar 2009 17:47:11 +1100
Message-ID: <20090302064711.GA2795@samad.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

I have iptables v1.4.1.1 running on 2.6.28.6 - this is an openwrt box.


My wife's work uses Cisco VPN client to give them remote access to their
corporate network.

This works fine when in udp/nat mode, but fail painfully in ipsec/tcp
mode.

=46rom having a look at tcpdump on my ppp0 interface (adsl to the
internet), I can see a syn packets

tcpdump: listening on ppp0, link-type LINUX_SLL (Linux cooked), capture
size 96 bytes
17:21:05.057537 IP (tos 0x0, ttl 127, id 65, offset 0, flags [none],
proto TCP (6), length 44) 60.241.248.86.1277 > 203.27.253.120.443: S,
cksum 0x17e5 (correct), 16808661:16808661(0) win 65535 <mss 1420>
	0x0000:  0004 0200 0000 0000 0000 0000 0000 0800
	0x0010:  4500 002c 0041 0000 7f06 3daf 3cf1 f856
	0x0020:  cb1b fd78 04fd 01bb 0100 7ad5 0000 0000
	0x0030:  6002 ffff 17e5 0000 0204 058c
17:21:05.097515 IP (tos 0x0, ttl 120, id 65, offset 0, flags [none],
proto TCP (6), length 40) 203.27.253.120.443 > 60.241.248.86.1277: S,
cksum 0x58f9 (correct), 2346076824:2346076824(0) ack 16808662 win 65535
	0x0000:  0000 0200 0000 0000 0000 0000 0000 0800
	0x0010:  4500 0028 0041 0000 7806 44b3 cb1b fd78
	0x0020:  3cf1 f856 01bb 04fd 8bd6 4a98 0100 7ad6
	0x0030:  5012 ffff 58f9 0000 aaaa 0000 0000

I can see packets going out and I can see the return syn packet coming
back. for some reason connection tracking is not associating the 2.=20

the firewall seems to be sending back an icmp host unreachable=20


I have a work around to dnat the traffic in, but her laptop get a
different ip if she hasn't brought it back in and its corporate policy
to use tcp/ipsec ......

any ideas what i can do ?

thanks
alex

please cc me as I am not subscribed to the list, thanks

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmrgO0ACgkQkZz88chpJ2N7HgCg99GK8wcy+dVcH0X/Jse5mcn1
YFcAn3Pw7Ks/Qj2eqnyF/dihsgKEbYo7
=9P9d
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
