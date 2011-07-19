From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: netfilter periodically thinks local traffic is FORWARDed
Date: Tue, 19 Jul 2011 06:51:17 -0400
Message-ID: <j03nj6$sql$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig5C3E7558248B340CF20C8089"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig5C3E7558248B340CF20C8089
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have a router running 2.6.32.27.  It has an ip6 interface on it:

# ifconfig sixxs
sixxs     Link encap:IPv6-in-IPv4 =20
          inet6 addr: 2001:1234:f:107::2/64 Scope:Global
          inet6 addr: fe80::a08:1/64 Scope:Link
          inet6 addr: fe80::a4b:16fe/64 Scope:Link
          inet6 addr: fe80::ae8a:d6fb/64 Scope:Link
          inet6 addr: fe80::a4b:16c4/64 Scope:Link
          inet6 addr: fe80::43c1:d6f2/64 Scope:Link
          UP POINTOPOINT RUNNING NOARP  MTU:1280  Metric:1
          RX packets:11962628 errors:0 dropped:0 overruns:0 frame:0
          TX packets:7222926 errors:1393 dropped:0 overruns:0 carrier:139=
3
          collisions:0 txqueuelen:0
          RX bytes:1568350253 (1.4 GiB)  TX bytes:523325199 (499.0 MiB)

I have ip6tables rules installed (courtesy of Shorewall).  It seems
occasionally however that netfilter thinks that traffic that is
(supposed to be) local is being forwarded:

Jul 19 06:44:41 10.75.22.196 kernel: Shorewall:FORWARD:REJECT:IN=3Dsixxs
OUT=3Dsixxs SRC=3D2001:1234:000f:0107:0000:0000:0000:0001
DST=3D2001:1234:000f:0107:0000:0000:0000:0002 LEN=3D104 TC=3D0 HOPLIMIT=3D=
63
FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 CODE=3D0 ID=3D19746 SEQ=3D16622

That reject message is being caused by the second to last rule of my
FORWARD chain, after which the packet is "reject"ed:

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source             =20
destination       =20
 536K  243M accounting  all      *      *       ::/0               =20
::/0              =20
 127K   13M dynamic    all      *      *       ::/0               =20
::/0                ctstate INVALID,NEW
 274K  219M net2loc    all      sixxs  br-lan  ::/0               =20
::/0              =20
 256K   24M loc_frwd   all      br-lan *       ::/0               =20
::/0              =20
    0     0 ACCEPT     all      *      *       ::/0               =20
::/0                ctstate RELATED,ESTABLISHED
 6559  682K Reject     all      *      *       ::/0               =20
::/0              =20
 6559  682K LOG        all      *      *       ::/0               =20
::/0                LOG flags 0 level 6 prefix `Shorewall:FORWARD:REJECT:=
'
 6559  682K reject     all      *      *       ::/0               =20
::/0                [goto]

The question is of course, given that the DST address in that reject log
message is a local address of the ip6tables machine, why is the packet
being processed by the FORWARD chain?

I have put a "watch" on the interface to see if it's temporarily losing
that address while those packets are being logged and rejected and I
didn't see any evidence of such.

Any other ideas?

Cheers,
b.



--------------enig5C3E7558248B340CF20C8089
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk4lYaUACgkQl3EQlGLyuXDqdwCg8EdBjgTsmbl8lXl3JWMF/rdH
hMEAoPH/q4/+wownnEbayHRm6DXTckUv
=eJBT
-----END PGP SIGNATURE-----

--------------enig5C3E7558248B340CF20C8089--

