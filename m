From: Mark Vevers <mark@vevers.net>
Subject: Typo's in ip_conntrack_rpc_tcp.c ....
Date: Fri, 18 Jun 2004 15:49:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181549.19157.mark@vevers.net>
Reply-To: mark@vevers.net
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

The following 'bug' is currently only a textual typo due to the structures
actually used - if the structures change it could cause a real bug ....

In the init for ip_conntrack_rpc_tcp the code sets the ports for=20

  rpc_helpers[port].mask.dst.u.udp.port =3D htons(0x0);

with =20
  rpc_helpers[port].tuple.dst.protonum =3D IPPROTO_TCP;

i.e. it's setting the udp port for a TCP packet.   In this instance it does=
n't=20
matter becase the tuple structure is a union and uses the same type -=20
from ip_conntrack_tuple.h:
			struct {
                                u_int16_t port;
                        } tcp;
                        struct {
                                u_int16_t port;
                        } udp;

Here's the diff:
Index: ip_conntrack_rpc_tcp.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file:=20
/cvspublic/patch-o-matic-ng/rpc/linux/net/ipv4/netfilter/ip_conntrack_rpc_t=
cp.c,v
retrieving revision 1.2
diff -U2 -r1.2 ip_conntrack_rpc_tcp.c
=2D --- ip_conntrack_rpc_tcp.c      5 May 2004 16:39:37 -0000       1.2
+++ ip_conntrack_rpc_tcp.c      18 Jun 2004 14:34:18 -0000
@@ -451,7 +451,7 @@

                /* RPC can come from ports 0:65535 to ports[port] (111) */
=2D -               rpc_helpers[port].tuple.src.u.udp.port =3D htons(ports[=
port]);
=2D -               rpc_helpers[port].mask.src.u.udp.port =3D htons(0xffff);
=2D -               rpc_helpers[port].mask.dst.u.udp.port =3D htons(0x0);
+               rpc_helpers[port].tuple.src.u.tcp.port =3D htons(ports[port=
]);
+               rpc_helpers[port].mask.src.u.tcp.port =3D htons(0xffff);
+               rpc_helpers[port].mask.dst.u.tcp.port =3D htons(0x0);

                rpc_helpers[port].help =3D help;


=2D --=20
Mark Vevers.    mark@ifl.net / mark@vevers.net
Principal Internet Engineer, Internet for Learning,
Research Machines Plc. (AS5503)
=2D --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xB08F3CA3
=46ingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA0wDuWLU9HLCPPKMRAmxlAJ9qrku1Ykvjmv0QeUeyVoM8UFri8QCfXV8S
3whpD5fwsG/PpTWJHGVMqXg=3D
=3DsCOn
=2D----END PGP SIGNATURE-----


