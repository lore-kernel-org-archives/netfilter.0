From: Udo Rader <udo.rader@bestsolution.at>
Subject: mysterious dropped echo replies
Date: Tue, 31 May 2005 10:42:36 +0200
Message-ID: <1117528956.25434.65.camel@athene.bestsolution.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-+QOZq6lEzbJFfJI6UWKI"
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


--=-+QOZq6lEzbJFfJI6UWKI
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I am stuck with a strange phenonemon where iptables drops packages it
(probably) shouldn't.=20

The dropped packages are logged like this:

DROP IN=3D OUT=3Deth1 SRC=3D192.168.100.240 DST=3D192.168.100.10 LEN=3D28 T=
OS=3D0x00
PREC=3D0x00 TTL=3D64 ID=3D32153 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D45639 S=
EQ=3D0

So that means that this is about an icmp echo reply, originating from
192.168.100.240, pending to be sent through its internal interface
(eth1) and destined to 192.168.100.10.

It is completely mysterious to me where this reply comes from, but
that's not all.

Each of the two hosts involved can ping each other and in the case of a
ping, iptables does not drop any packages.

If I shut down 192.168.100.10 (a box within the DMZ), it doesn't take
long until iptables starts to drop packages destined to other boxes in
the DMZ.

One of the first rules in my iptables setup is this:

iptables -A INPUT -s 192.168.100.0/24 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -s 192.168.100.0/24 -m state --state NEW -j ACCEPT
iptables -A FORWARD -s 192.168.100.0/24 -m state --state NEW -j ACCEPT

For the internal interface this is the first rule:

iptables -A INPUT -i eth1 -s 192.168.100.0/24 -d 192.168.100.0/24 -m
state --state NEW -j ACCEPT
iptables -A FORWARD  -i eth1 -s 192.168.100.0/24 -d 192.168.100.0/24 -m
state --state NEW -j ACCEPT
iptables -A OUTPUT -o eth1 -s 192.168.100.0/24 -d 192.168.100.0/24 -m
state --state NEW -j ACCEPT
iptables -A FORWARD -o eth1 -s 192.168.100.0/24 -d 192.168.100.0/24 -m
state --state NEW -j ACCEPT

The rule that drops the package is the very last one (the 'catch all')
rule.

This is something new, because I haven't changed the iptaples setup for
quite some time, so if anybody has any guess on what's going on here.

Udo Rader

BestSolution.at GmbH
http://www.bestsolution.at

--=-+QOZq6lEzbJFfJI6UWKI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCnCN86VGCgP95rKIRAjTbAJ9DCEjJagnI726BH2OvsF97YK2K9ACeIEVz
mrbqV6vVdt+RI5b+ZNmSzJk=
=7wxb
-----END PGP SIGNATURE-----

--=-+QOZq6lEzbJFfJI6UWKI--


