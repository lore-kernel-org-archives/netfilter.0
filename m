From: Frank =?iso-8859-1?Q?Matthie=DF?= <frankm@lug-owl.de>
Subject: Two isp's over one physical if w/ different ip alias addr
Date: Tue, 24 Jun 2003 17:18:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624151842.GR14958@dvmwest.gt.owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h5TCuzcqTWZxfGfk"
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter List <netfilter@lists.netfilter.org>


--h5TCuzcqTWZxfGfk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

after some doing with iptables and ip from iproute packet and a research in
google i can't resolve my 'routing' problem. I've read also the Linux
adv Routing & Traffic Control HOWTO, but get no idea why my setup
doesn't run as expected.

What i have: A debian sid box, iptables 1.2.7a-5,  iproute 20010824-8.

My preffered setup:

DMZ
10.0.0.0/24
  |
  |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
10.0.0.1/24
eth0

Firewallbox

-j MASQUERADE  (actual no snat, this should be a problem)
eth1           eth1:1
212.8.203.4    192.168.0.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
  |               |
  |               |
  |            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  |            192.168.0.254/24
  |            DSL Router(NAT)
  |            212.203.240.4/32
  |            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  |               |
  |               |
ISP0           ISP1

For some day's i want to use both isp's. My first try was to set tos
0x10 for ssh and use this wit a "ip rule" statement to run into a
special routing table.

ip route add default table http.ftp via 192.168.0.254 src 192.168.0.1
ip rule add tos 16 table http.ftp
ip route flush

After that i check this with "tcpdump -i eth1 -n port 22". The new ssh
connection use the old(212.8.203.4) gateway.=20

Independent from my snat problem on eth1:1, the ssh packet has to leave
the firewall over eth1:1(192.168.0.1). Is there a typical beginner fault
in my ip route/rule config?

Second: Is there a way to do MASQUERADE or SNAT on both interfaces(eth1,
eth1:1)? Do the packets mangled before the arrive netfilter pre- or
postrouting? Or ask another way round: When do the packet manipulate by
the routing table?=20


my picture if netfilter is:
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                      =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        =3D=3D=3D=3D=3D=3D=3D=3D=3D
            |          |                      |           |        |       |
-->Packet-->|prerouting|---routing decision---|postrouting|-----+--|forward=
|--+-->
            |          |                      |           |     |  |       =
|  |
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                      =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D     |  =3D=3D=3D=3D=3D=3D=3D=3D=3D  |
   [1]                         [2]                          [3] |          =
   |
                                                                |          =
   |
                                                             =3D=3D=3D=3D=
=3D=3D=3D       =3D=3D=3D=3D=3D=3D=3D
                                                             |  In |       =
| Out |
                                                             =3D=3D=3D=3D=
=3D=3D=3D       =3D=3D=3D=3D=3D=3D=3D

Where do the packet get the source address 192.168.0.1 from the "ip
route" rule?

I hope i explain my problem in a way that you can give one/siome hints.

Frank.
--=20
Frank Matthie=DF                                               frankm@lug-o=
wl.de

  May the penguin be with you!

--h5TCuzcqTWZxfGfk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE++GvSlvxyuc8baY0RAi88AJ493k0sXsGmGNXHA4VLggCxBGkT3gCcClV0
WJMC4xGT6MRFQAbBy5J4bU8=
=ndYn
-----END PGP SIGNATURE-----

--h5TCuzcqTWZxfGfk--

