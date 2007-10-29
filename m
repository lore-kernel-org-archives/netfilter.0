From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: packets not seen by iptables
Date: Mon, 29 Oct 2007 13:53:06 -0500
Message-ID: <1193683986.18366.39.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-i4LWXMV2eGCIAHqFmweP"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-i4LWXMV2eGCIAHqFmweP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Greetings,

I am working on project that involves asymmetrical routing. I am using
two Debian GNU/Linux boxes as a active passive firewall cluster.


 Outgoing Traffic

+--eth0---+   +--eth0---+
|         |   |         |
| primary |   | backup  |
|         |   |         |
+--eth1---+   +--eth1---+

 Incoming Traffic

On the primary node everything works as expected.

I have done the following:

# echo 1 > /proc/sys/net/ipv4/ip_forward
# echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter

I can see the traffic "go through the box" with the following commands:

# tcpdump -i eth1
# tcpdump -i eth0

and also

# iptables -t mangle -L PREROUTING -v -n
# iptables -t filter -L FORWARD -v -n

So, with the tcpdump commands I see on stdout the traffic. With the
iptables commands I see byte counts increasing on the FORWARD chain.

Here lies the problem:

When I shut off the primary node and configure the backup to perform the
same functionality traffic does not seem to "go through" the tables.

Running the same commands on the backup:

# tcpdump -i eth1        <---- Output on stdout (good)
# tcpdump -i eth0        <---- No output (bad)

and also

# iptables -t mangle -L PREROUTING -v -n  <- byte counts do not increase
# iptables -t filter -L FORWARD -v -n     <- byte counts do not increase

So then I also did:

iptables -t mangle -A PREROUTING -j LOG --log-level ALERT

Again, I see no evidence on any packets reaching iptables.

So.... I have no idea where the packets are going after I seem them in
tcpdump. They seem like they disappear.

I have done an effective "diff" of /proc/sys/net/ between the two nodes
and they are identical.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-i4LWXMV2eGCIAHqFmweP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHJiwSU+eIf4TiLaIRAll8AJsHzylz4ANVn5yTfbJ6SwpFI9TEMQCfZWdQ
iV2jm6teeBcx2rvJZC6v7P8=
=h3S0
-----END PGP SIGNATURE-----

--=-i4LWXMV2eGCIAHqFmweP--

