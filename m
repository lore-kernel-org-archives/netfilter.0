From: Josh Green <jgreen@users.sourceforge.net>
Subject: Memory allocation problem with iptables and NAT
Date: Tue, 22 Feb 2005 16:50:47 -0800
Message-ID: <1109119847.27702.22.camel@SillyPuddy.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-0V2o6G0nxc9UbxNVIWe/"
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


--=-0V2o6G0nxc9UbxNVIWe/
Content-Type: multipart/mixed; boundary="=-dUtarFEukcfGdA/KfpBy"


--=-dUtarFEukcfGdA/KfpBy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello, I'm using iptables 1.3.0 on an embedded MIPS platform (AMD
Alchemy db1100).  The kernel I am using is a CVS checkout from
linux-mips.org and is roughly equivalent to 2.6.11-rc2. I am also using
gcc 3.4.3 and fairly recent uClibc. This may be a kernel specific
problem, but I wanted to probe to see if anyone else has experienced
these problems or might have some insights.

I can insert the ip_tables and iptable_nat modules fine.  But the
following iptables command fails:

# iptables -t nat -F
iptables v1.3.0: can't initialize iptables table `nat': Memory
allocation problem
Perhaps iptables or your kernel needs to be upgraded.


I did an strace and came up with the attached output. Of particular
interest is this call:

old_mmap(NULL, 1651212288, PROT_READ|PROT_WRITE, MAP_PRIVATE|
MAP_ANONYMOUS, 0, 0) =3D -1 ENOMEM (Cannot allocate memory)

Wow, seems something is trying to mmap over 1.6GB of data.  If anyone
has any tips on why this is happening I would appreciate the input.
        Best regards,
        Josh Green


--=-dUtarFEukcfGdA/KfpBy
Content-Disposition: attachment; filename=iptables_strace.txt
Content-Type: text/plain; name=iptables_strace.txt; charset=ISO-8859-1
Content-Transfer-Encoding: base64

IyBzdHJhY2UgaXB0YWJsZXMgLXQgbmF0IC1GDQpleGVjdmUoIi91c3Ivc2Jpbi9pcHRhYmxlcyIs
IFsiaXB0YWJsZXMiLCAiLXQiLCAibmF0IiwgIi1GIl0sIFsvKiAxNiB2YXJzICovXSkgPSAwDQpp
b2N0bCgwLCBUSU9DTlhDTCwge0IxMTUyMDAgb3Bvc3QgaXNpZyBpY2Fub24gLWVjaG8gLi4ufSkg
PSAwDQppb2N0bCgxLCBUSU9DTlhDTCwge0IxMTUyMDAgb3Bvc3QgaXNpZyBpY2Fub24gLWVjaG8g
Li4ufSkgPSAwDQpzb2NrZXQoUEZfSU5FVCwgU09DS19SQVcsIElQUFJPVE9fUkFXKSAgPSA0DQpn
ZXRzb2Nrb3B0KDQsIFNPTF9JUCwgMHg0MCAvKiBJUF8/Pz8gKi8sICJuYXRcMFwwXDBcMFwwXDBc
MFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwIi4uLiwgWzg0XSkgPSAwDQpi
cmsoMCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDEwMDA3MDAwDQpicmso
MHgxMDAwODAwMCkgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDEwMDA4MDAwDQpvbGRfbW1h
cChOVUxMLCAxNjUxMjEyMjg4LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQ
X0FOT05ZTU9VUywgMCwgMCkgPSAtMSBFTk9NRU0gKENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkpDQpi
cmsoMHg3MjZiZjAwMCkgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDEwMDA4MDAwDQpvbGRf
bW1hcChOVUxMLCAxNjUxMjEyMjg4LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8
TUFQX0FOT05ZTU9VUywgMCwgMCkgPSAtMSBFTk9NRU0gKENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkp
DQpjbG9zZSg0KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwDQpvcGVuKCIvcHJv
Yy9zeXMva2VybmVsL21vZHByb2JlIiwgT19SRE9OTFkpID0gNA0KcmVhZCg0LCAiL3NiaW4vbW9k
cHJvYmVcbiIsIDEwMjQpICAgICAgID0gMTUNCmNsb3NlKDQpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA9IDANCmZvcmsoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9
IDEwNDENCndhaXQ0KC0xLCBbV0lGRVhJVEVEKHMpICYmIFdFWElUU1RBVFVTKHMpID09IDBdLCAw
LCBOVUxMKSA9IDEwNDENCi0tLSBTSUdDSExEIChDaGlsZCBleGl0ZWQpIEAgMCAoMCkgLS0tDQpz
b2NrZXQoUEZfSU5FVCwgU09DS19SQVcsIElQUFJPVE9fUkFXKSAgPSA0DQpnZXRzb2Nrb3B0KDQs
IFNPTF9JUCwgMHg0MCAvKiBJUF8/Pz8gKi8sICJuYXRcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBc
MFwzNDBcMjU2XDBcMjBcMFwwXDBcMFwzMFw0Ii4uLiwgWzg0XSkgPSAwDQpvbGRfbW1hcChOVUxM
LCAxNjUxMjEyMjg4LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05Z
TU9VUywgMCwgMCkgPSAtMSBFTk9NRU0gKENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkpDQpicmsoMHg3
MjZiZjAwMCkgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDEwMDA4MDAwDQpvbGRfbW1hcChO
VUxMLCAxNjUxMjEyMjg4LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FO
T05ZTU9VUywgMCwgMCkgPSAtMSBFTk9NRU0gKENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkpDQpjbG9z
ZSg0KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwDQp3cml0ZSgyLCAiaXB0YWJs
ZXMiLCA4aXB0YWJsZXMpICAgICAgICAgICAgICAgICA9IDgNCndyaXRlKDIsICIgdiIsIDIgdikg
ICAgICAgICAgICAgICAgICAgICAgID0gMg0Kd3JpdGUoMiwgIjEuMy4wIiwgNTEuMy4wKSAgICAg
ICAgICAgICAgICAgICAgPSA1DQp3cml0ZSgyLCAiOiAiLCAyOiApICAgICAgICAgICAgICAgICAg
ICAgICA9IDINCndyaXRlKDIsICJjYW5cJ3QgaW5pdGlhbGl6ZSBpcHRhYmxlcyB0YWJsZSAiLi4u
LCAzM2Nhbid0IGluaXRpYWxpemUgaXB0YWJsZXMgdGFibGUgYCkgPSAzMw0Kd3JpdGUoMiwgIm5h
dCIsIDNuYXQpICAgICAgICAgICAgICAgICAgICAgID0gMw0Kd3JpdGUoMiwgIlwnOiAiLCAzJzog
KSAgICAgICAgICAgICAgICAgICAgID0gMw0Kd3JpdGUoMiwgIk1lbW9yeSBhbGxvY2F0aW9uIHBy
b2JsZW0iLCAyNU1lbW9yeSBhbGxvY2F0aW9uIHByb2JsZW0pID0gMjUNCndyaXRlKDIsICJcbiIs
IDENCikgICAgICAgICAgICAgICAgICAgICAgID0gMQ0Kd3JpdGUoMiwgIlBlcmhhcHMgaXB0YWJs
ZXMgb3IgeW91ciBrZXJuZWwgIi4uLiwgNTRQZXJoYXBzIGlwdGFibGVzIG9yIHlvdXIga2VybmVs
IG5lZWRzIHRvIGJlIHVwZ3JhZGVkLg0KKSA9IDU0DQpleGl0KDMpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPSA/DQo=


--=-dUtarFEukcfGdA/KfpBy--

--=-0V2o6G0nxc9UbxNVIWe/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCG9NnRoMuWKCcbgQRAn/RAJwIfKI/VDDGohOlIz/A+9i/JwOgNwCgl/HU
0czhc/m+4va0m9txoKEruz4=
=qrLs
-----END PGP SIGNATURE-----

--=-0V2o6G0nxc9UbxNVIWe/--


