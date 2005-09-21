From: "jywang" <jywang@cnic.cn>
Subject: can netfilter work on arp packet?
Date: Wed, 21 Sep 2005 14:02:46 +0800
Message-ID: <00f901c5be72$1783f400$060ae29f@javaboy>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary="----=_NextPart_000_00F3_01C5BEB5.24B18960";
	protocol="application/x-pkcs7-signature"; micalg=SHA1
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00F3_01C5BEB5.24B18960
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

Hi,all

i find that i only can inspect ip packet with netfilter hooks.

if there are some hooks with which i can look deeply in other packets, =
i.e. ARP.


Jinyi


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 =D0=D5=C3=FB=A3=BA      =CD=F5=BD=F0=D2=BB  =20
 =B5=E7=BB=B0=A3=BA      (+86)10-58812325
 =B5=A5=CE=BB=A3=BA      =
=D6=D0=B9=FA=BF=C6=D1=A7=D4=BA=BC=C6=CB=E3=BB=FA=CD=F8=C2=E7=D0=C5=CF=A2=D6=
=D0=D0=C4 R&D
 =B5=D8=D6=B7=A3=BA      =
=B1=B1=BE=A9=D6=D0=B9=D8=B4=E5=C4=CF=CB=C4=BD=D6=CB=C4=BA=C5
 =D3=CA=B1=E0=A3=BA      100080
 email=A3=BA     jywang@cnic.cn
-----------------------------------------------------
 Name:       jinyi wang
 Phone:      (86-10) 5881-2325
 Division:   R&D,Computer Network Information Center,
             Chinese Academy of Sciences
 Address:    4,4th South Street, Zhongguancun,=20
             Haidian District, Beijing, China
 Zip code:   100080
 Email:      jywang@cnic.cn
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
------=_NextPart_000_00F3_01C5BEB5.24B18960
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIIqzCCBCww
ggMUoAMCAQICASkwDQYJKoZIhvcNAQEFBQAwLDELMAkGA1UEBhMCQ04xDDAKBgNVBAoTA1NERzEP
MA0GA1UEAxMGU0RHLUNBMB4XDTA1MDEyODA3MDk0MloXDTA2MDEyODA3MDk0MlowQDELMAkGA1UE
BhMCQ04xDDAKBgNVBAoTA1NERzENMAsGA1UECxMEQ05JQzEUMBIGA1UEAxMLQ05JQy1qeXdhbmcw
gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMBuWvVZbvDpOX74rokMF4U7hl/2Plj7K1XJTxkt
0uT0bZCNwpPiq01tdgoeHjGL7Vkp7ksoKDmCuddsjgERIe4r+JWKCl+88vT/d1gIjwbhu5vBiOIE
qINgM6A8Lt1ZcGJgE+XihHXb7JKW8nRzX30voZmJtyJH6Sb+fkmdGHhDAgMBAAGjggHHMIIBwzAJ
BgNVHRMEAjAAMBEGCWCGSAGG+EIBAQQEAwIFoDALBgNVHQ8EBAMCBeAwKQYDVR0lBCIwIAYIKwYB
BQUHAwIGCCsGAQUFBwMEBgorBgEEAYI3FAICMCYGCWCGSAGG+EIBDQQZFhdVc2VyIENlcnRpZmlj
YXRlIG9mIFNERzAdBgNVHQ4EFgQUVNuUQvzaKesspcWL7aWrPFiK9yAwVAYDVR0jBE0wS4AUUx7J
kN8Y+eD6eaqEdyuYhiKKT7yhMKQuMCwxCzAJBgNVBAYTAkNOMQwwCgYDVQQKEwNTREcxDzANBgNV
BAMTBlNERy1DQYIBADAZBgNVHREEEjAQgQ5qeXdhbmdAY25pYy5jbjAJBgNVHRIEAjAAMDYGCWCG
SAGG+EIBBAQpFidodHRwczovL2NhLmNhLmdyaWQuY24vcHViL2NybC9jYWNybC5jcmwwNgYJYIZI
AYb4QgEDBCkWJ2h0dHBzOi8vY2EuY2EuZ3JpZC5jbi9wdWIvY3JsL2NhY3JsLmNybDA4BgNVHR8E
MTAvMC2gK6AphidodHRwczovL2NhLmNhLmdyaWQuY24vcHViL2NybC9jYWNybC5jcmwwDQYJKoZI
hvcNAQEFBQADggEBAHXUd1HJdqnROjlUNigcq67MKso8EMr7GZoiurVqU9IfuEeqtYjul2A45zGK
W0PaHbJayjLVI4sQ+fiGCYduFlO+BVYHLz4LwPICZ30tx2gOSQa6y49XCfgZCoa8c8fF68GQFq7J
ORh+RK3zST5XelynYmfMzK4ed106ZiYQUqzkwI0PBFozPz2a5K1jQMAt/AR8LOn8+b8ytWgHJBkl
TUS9uz7Y6dsMUABVtWofqCAGSPO55xffmQxa18Zdz+fk9rl4M+WQOTdR9gDlbF31Z9J72QNIIg3G
x9OKn+TfS9EXrJn1cQih+kr6+1gFc2QnC1uZ8zd/riXaLskTn4Jz/NowggR3MIIDX6ADAgECAgEA
MA0GCSqGSIb3DQEBBQUAMCwxCzAJBgNVBAYTAkNOMQwwCgYDVQQKEwNTREcxDzANBgNVBAMTBlNE
Ry1DQTAeFw0wNDExMTcwODQ0NDNaFw0wOTExMTcwODQ0NDNaMCwxCzAJBgNVBAYTAkNOMQwwCgYD
VQQKEwNTREcxDzANBgNVBAMTBlNERy1DQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ALB7ZE7OmEndq4epK3ZQNBpymt4lllESTDtkuU1G1Kn3kiXwsFBMn5pRDnYuHqS76KvwQB+oewFr
4SrngtxYion4s1LKx39q9MMxvlgHPBO2DOapaR1mQUpF560tROog/EjuGdGymkiDqUQ7mjHwOqA6
nH16Sny81vBUoqy1aVvbboU7XNmGX8pPP+U8+xsfB1+mUprA+4SHujRJdhch+/V+dPwkiIM0Hcws
VJ2pqGcg22e/0aMMSplvWi2J0bQSrv4IJ0u0u8ySI5ir/MFbFkTRzoQ8qa5ssc848FXRM2VmamGc
JiY45nGvUNV1cQwUkEjoHoOWl0qyFTBsLYWeDyMCAwEAAaOCAaIwggGeMA8GA1UdEwEB/wQFMAMB
Af8wHQYDVR0OBBYEFFMeyZDfGPng+nmqhHcrmIYiik+8MFQGA1UdIwRNMEuAFFMeyZDfGPng+nmq
hHcrmIYiik+8oTCkLjAsMQswCQYDVQQGEwJDTjEMMAoGA1UEChMDU0RHMQ8wDQYDVQQDEwZTREct
Q0GCAQAwCwYDVR0PBAQDAgHGMAkGA1UdEQQCMAAwCQYDVR0SBAIwADARBglghkgBhvhCAQEEBAMC
AAcwNgYJYIZIAYb4QgENBCkWJ1NERyBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSBDZXJ0aWZpY2F0
ZTA4BgNVHR8EMTAvMC2gK6AphidodHRwczovL2NhLmNhLmdyaWQuY24vcHViL2NybC9jYWNybC5j
cmwwNgYJYIZIAYb4QgEEBCkWJ2h0dHBzOi8vY2EuY2EuZ3JpZC5jbi9wdWIvY3JsL2NhY3JsLmNy
bDA2BglghkgBhvhCAQMEKRYnaHR0cHM6Ly9jYS5jYS5ncmlkLmNuL3B1Yi9jcmwvY2FjcmwuY3Js
MA0GCSqGSIb3DQEBBQUAA4IBAQCc5XmbUMsJHEk2h9k3MJ3r9QSNlD+cCmw+GtQr5N/JLq1zavL8
s8pLa5D9/0AYyjLJEvj/GX5QMDWgQqXZchQw9+yqNFJ95PHcfkLmWX8SxRnJeVyCgVtmX/J6d3Sv
eQIp9C4w5MMaQ6t+m331OAfJK97dO6lFrNygcp8Yfa9r0dDs+/e0Yb2aDeTCafTPs2Fvg+n/0E9Z
Mpcpaod4u7F0loxUSXpOljJJ5/B5ps5ftIF17m/yod4O4LI84Dn+LMC4Ds0NXWusQjoDRovOPBTU
9M0aDlB0SSC1DA0gM+kq2Y87zNpgaw7lU0xikGD9goYacPG9oOeY7dZAvsooUvJdMYIBlDCCAZAC
AQEwMTAsMQswCQYDVQQGEwJDTjEMMAoGA1UEChMDU0RHMQ8wDQYDVQQDEwZTREctQ0ECASkwCQYF
Kw4DAhoFAKCBujAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNTA5
MjEwNjAyNDZaMCMGCSqGSIb3DQEJBDEWBBThVXMZanbYYDEPmIq3bju3UjT7ITBbBgkqhkiG9w0B
CQ8xTjBMMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMC
BzANBggqhkiG9w0DAgIBKDAHBgUrDgMCHTANBgkqhkiG9w0BAQEFAASBgKvd1AgtpLDjrIMmgD/B
76arNswATiK/UTzt/E0aaX2zP3Tdiyk6gmNSqFcOyxajHL2F+3HnWpDemWZQykVZWdAq/BmHT+Sw
rfn6TxBpqAdB49pzjp6Apg0sLzBtSxmUTJqEya2t8nU8PJR3V3yX5qlsAGIkA6t+Ojpf7JTbm4ce
AAAAAAAA

------=_NextPart_000_00F3_01C5BEB5.24B18960--



