From: Katriel Traum <katriel@traum.org.il>
Subject: DNAT/MASQ Precedence
Date: Thu, 30 Jan 2003 19:31:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301301931.41645.katriel@traum.org.il>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello list,
I'm starting to set up a DMZ/LAN setup, and came across a problem/question.
The setup I want to do is a multi-homed firewall, with one intf. to a priva=
te=20
LAN and another to a DMZ.
The FW will MASQ the LAN, and DNAT into the DMZ.

I want to redirect _all_ traffic into the DMZ (is that even possible?) and =
in=20
the same time MASQ the LAN. The question is will they collide? If I use a=20
ruleset such as:
iptables -A PREROUTING -i $INET_IF -j DNAT --to-destination $DMZ_IP=20
iptables -A POSTROUTING -o $INET_IF -j MASQUERADE
(yes, there's only one computer in the DMZ)

Will I get return traffic into my lan? won't it be DNATed into the DMZ?

Thanks,

+katriel
pgp key: traum.org.il/gpg.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+OX2dDWy+Hv/461sRAqmWAJwJ5/vSBMlj/2dHS/seXuPrcTv81QCg/tan
C1xvdNg6gFpdAZRx84tsaR8=3D
=3D9ku+
=2D----END PGP SIGNATURE-----


