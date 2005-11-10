From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Why would certain packets not reach nat PREROUTING chain?
Date: Wed, 09 Nov 2005 20:57:45 -0500
Message-ID: <4372A919.8020100@rosi-kessel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig5B5D56E382C1DA7D79C74AF1"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig5B5D56E382C1DA7D79C74AF1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm troubeshooting an issue of accessing a VPN through NAT. Right now the=

problem can be reduced to the following question:

Under what conditions would inbound packets not be routing through the na=
t
PREROUTING chain?

These packets are arriving on inbound UDP port 500. They show up with
tcpdump, but when I add a log rule, e.g.

iptables -t nat -I PREROUTING -p udp -j LOG

The packets are not logged.  (They are also not DNAT'd to the proper
internal host, but that makes sense if they're not reaching the PREROUTIN=
G
chain at all).

I have nothing in the mangle table.

I am not running any IPSec services on the NAT box.

There is nothing between the NAT box and the Internet.

Most of the iptables tutorials warn against filtering in nat PREROUTING,
because "it will be bypassed in certain cases."  But what cases are those=
?

The iptables LOG targets are working generally--traffic coming from the
internal client to the NAT box and then the NAT box to the external VPN
server are all logged.  The only thing that is not being logged--and
presumably not arriving at the nat PREROUTING chain--are the inbound
packets.  Yet they are definitely arriving, as tcpdump -i eth0 indicates.=


Any suggestions?
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org




--------------enig5B5D56E382C1DA7D79C74AF1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDcqkZdTf3ZklQ6qYRAu+yAKCiKHNqc5Lh8/sD0cCfKfLgaJAmqgCdFCH5
yigu4z3X0OtZO3w3yGW+lIQ=
=6lTC
-----END PGP SIGNATURE-----

--------------enig5B5D56E382C1DA7D79C74AF1--

