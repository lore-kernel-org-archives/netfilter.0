From: Michael Barry <mbarry@cs.umass.edu>
Subject: (no subject)
Date: Sun, 19 Sep 2004 18:54:34 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095620074.3098.1.camel@jabbera-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ZyVRwleTm+F23Xx+hI/A"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-ZyVRwleTm+F23Xx+hI/A
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have a bunch of public IP addresses, for example, in the range
192.168.1.100-192.168.1.104.=20

I have a 5 computers on my internal network statically defined from
192.168.0.100-192.168.0.104.=20

I am trying to create a rule where each computer will always map to the
same public ip address. For example I did: iptables -t nat -s
192.168.0.100 -j SNAT --to-source 192.168.1.100.=20

The problem is if I try to do a ping from 192.168.0.100 it correctly
gets translated to 192.168.1.100 and the ping goes out, but when the
reply comes back there is an ARP request for WHO-HAS 192.168.1.100, and
since no-one technically holds this address no reply is ever sent, and
the ping reply gets dropped. Does anyone know a solution to this
problem?

Thanks for your time,
--=20
---------------------------------------
Michael Barry <mbarry@cs.umass.edu>


-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.2.5 (GNU/Linux)

mQGiBD+g+0URBADCYQfUXqlCotTnSbprbyOResgLUTYxERMj50z3+16SeELpKOFT
IlfUhWrKcBoQlIyt8jBL/raN8sc8uVAklIDXmcmBzwhTlZu8mwb63GfTstqDSeBO
mdPQlWd4RlKUABinHymFL16XFjGBWdqDsimP0sLVtxygljtOrrTLDLMdPwCg5Sho
AmvLz/9XrgH4Og2BI2w4GO0D/20S3/oTZoAe0Uu9H7qUmsphg1Rk5cqn2zg5Fd7h
2KaNZjtntgd/2nK9eb1zlwcYEI++TxWJiEFMqSa0+Vr8zj8yDINhRLzIFTkNGkI9
0aJNVmZ9Vm6hEeDTTZ91d+pnzRLwbGPyu7xvddlSsn9uILI8KrIp/7gPKqfo5c8z
rXCJBACu/SkTyrXxlEz5L0BmvMyiKwPZGsfqvPp3ZRhKfSZvx7TFa2UvlGN5jQJD
qIDP1DH0foOQV1oX/tngBLwLFaIsTfO7brYcKX+uT0k/Q1vT2aBmHAQA4xduG2dg
eXJyBLwYtM1sKTNQj5fnmKZtHE1Vij2uAGUowmKOSuiEOf6/D7QjTWljaGFlbCBC
YXJyeSA8bWJhcnJ5QGNzLnVtYXNzLmVkdT6IXgQTEQIAHgUCP6D7RQIbAwYLCQgH
AwIDFQIDAxYCAQIeAQIXgAAKCRDZGaOeesLyC/F+AKClFpol8BoIm8yDxBiMmCWd
K/pZawCfQb8oetmw5lIyHMVelC7ir+wasb+5AQ0EP6D7RxAEAKuLODeCFV+aVi7z
2qdE1oYNrH+AitdiB36W/SkLEb8YlXZ/cGFBl4gPspdA93mLyjrlLg5xp+kXVeAU
DbaYLl9pz4wtmz3GqnyqQdgAPW3XjEv5Dkau+RzKAmlze87x2mw8Zn0ffvcalRFm
+fAEDOvaZquVVljYxgkktI2G6MIPAAQNBACQ4LvuAH+LKbn5NYis+ifEHA4QYPBH
jtPe2Rb4keAp4azr6Qy1iJTuF/6+G8qCyraoqjk5wlMC7c8gjxCNkXA2VEX0+bXt
pb85nrQlL0udf8V2ffukxlXOmFo43j85jljzLLk535P/lCXrbiDnW4W5/+8Qpn/z
aDpqDeLSAX/+a4hJBBgRAgAJBQI/oPtHAhsMAAoJENkZo556wvILN3gAn3/x2PNm
O1mycJQtyUpCFRXEp8EWAKDPxWTPlx5Ii9DaWadahV4b9LRe4A=3D=3D
=3Dqjmb
-----END PGP PUBLIC KEY BLOCK-----

--=-ZyVRwleTm+F23Xx+hI/A
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBTdXp2RmjnnrC8gsRAoWOAJ4z4oXQ3xanQhiHvCBxz5fbeNcW3ACdEW1K
jLJwJ555YD5BPmGRgNu6Hf0=
=tpdN
-----END PGP SIGNATURE-----

--=-ZyVRwleTm+F23Xx+hI/A--


