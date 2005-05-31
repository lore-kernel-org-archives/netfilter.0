From: Jorge Salamero <526715@celes.unizar.es>
Subject: ip_conntrack problems with a dlink DSL504T
Date: Tue, 31 May 2005 12:07:57 +0200
Message-ID: <200505311208.02694.526715@celes.unizar.es>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1218600.Vgp3qv5oj8";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
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

--nextPart1218600.Vgp3qv5oj8
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hi all,

i've a dlink dsl504T, a dsl router with linux embedded:
# cat /proc/version
Linux version 2.4.17_mvl21-malta-mips_fp_le (victor@localhost.localdomain)=
=20
(gcc version 2.95.3 20010315 (release/MontaVista)) #62 =C2=B6g=C2=A4@ 4=C2=
=A4=C3=AB 4 23:04:57=20
CST 2005

i've rised ip_conntrack_max because default was 512
# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
2048

but after a while of using p2p (mldonkey) it seems it can't handle more=20
connections ... even it takes a while to connect to it by telnet ...

i don't know how to count the number of stablished connections because it u=
ses=20
BusyBox v0.61.pre (2005.04.04-15:09+0000) and it doesn't have netstat neith=
er=20
wc :-/

i've take a look at /proc/net/ip_conntrack and i can see this: (a few lines)
tcp      6 205962 ESTABLISHED src=3D80.37.182.178 dst=3D81.34.11.12 sport=
=3D1985=20
dport=3D4662 [UNREPLIED] src=3D192.168.1.2 dst=3D80.37.182.178 sport=3D4662=
=20
dport=3D1985 [ASSURED] use=3D1
tcp      6 30576 CLOSE_WAIT src=3D83.35.78.48 dst=3D81.34.11.12 sport=3D164=
51=20
dport=3D4662 src=3D192.168.1.2 dst=3D83.35.78.48 sport=3D4662 dport=3D16451=
 [ASSURED]=20
use=3D1
tcp      6 24789 CLOSE_WAIT src=3D80.36.59.185 dst=3D81.34.11.12 sport=3D15=
30=20
dport=3D4662 src=3D192.168.1.2 dst=3D80.36.59.185 sport=3D4662 dport=3D1530=
 [ASSURED]=20
use=3D1
tcp      6 188615 ESTABLISHED src=3D192.168.1.2 dst=3D62.162.220.71 sport=
=3D4662=20
dport=3D1434 [UNREPLIED] src=3D62.162.220.71 dst=3D81.34.11.12 sport=3D1434=
=20
dport=3D4662 [ASSURED] use=3D1

as far as i know, an assured connection can't be unreplied, true ?

do you know what's the problem ?

if you need more information about rules, modules loaded or anything, ask f=
or=20
it.

thanks in advance !

=2D-=20
Jorge Salamero Sanz (bencer)
mail: <bencer@cauterized.net>
blog: <http://bys.cauterized.net/>
http: <http://www.cauterized.net/>

--nextPart1218600.Vgp3qv5oj8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnDeCksL4pbD/o/oRAicuAJsF9rrB1lWgm8cSt+zOkJnbE60wugCaA0qq
O6mFOhkl4TeYCXfRL657uas=
=SpSl
-----END PGP SIGNATURE-----

--nextPart1218600.Vgp3qv5oj8--

