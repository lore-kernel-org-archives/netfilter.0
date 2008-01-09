From: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Support for ICMP Time Exceeded in REJECT target ?
Date: Wed, 9 Jan 2008 18:18:36 +0100
Message-ID: <200801091818.38810.laurentp@cse-semaphore.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1455886.6kvNsb6Flq";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--nextPart1455886.6kvNsb6Flq
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi everybody,

I'm trying to add some layer 3 functionalities to a Linux-based layer 2=20
bridge.

The goal is to enumerate the bridges between two endpoints using the=20
traceroute command. As the Linux bridge code routes frames at the ethernet=
=20
level, the IP TTL is not decremented and no ICMP Time Exceeded reply is sen=
t,=20
making the bridge transparent.

I experimented with iptables and found out that I can decrement the TTL in =
the=20
PREROUTING chain (mangle table) with

iptables -t mangle -A PREROUTING -j TTL --ttl-dec 1

To generate an ICMP Time Exceeded reply when the TTL reaches zero, I tried =
the=20
REJECT target in the FORWARD chain (filter table). The REJECT target doesn'=
t=20
support ICMP Time Exceeded, but it was pretty straightforward to fix this.

Adding

iptables -t filter -A FORWARD -m ttl --ttl-eq 0 -j REJECT --reject-with=20
icmp-time-exceeded

the bridges show up in the traceroute output.

Why doesn't REJECT support ICMP Time Exceeded ? Is there a good reason, or =
is=20
it just that nobody has needed it yet ? Should I submit a patch (Linux kern=
el=20
netfilter + userspace iptables) ?

I know that my application breaks the OSI model and creates some kind of=20
hybrid "layer 2.5" device. I'm open to suggestions regarding a better way t=
o=20
implement bridges enumeration between two ethernet hosts, but using the=20
traceroute command is a customer requirement which could only be changed wi=
th=20
strong valid reasons.

Best regards,

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75

--nextPart1455886.6kvNsb6Flq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBHhQHu8y9gWxC9vpcRApMGAJ0c84bYX7BTqa1rusgG/80qoRbdVgCfZLqV
2A8MX5gIF0Lj7W2H99MCCHA=
=LPc5
-----END PGP SIGNATURE-----

--nextPart1455886.6kvNsb6Flq--
