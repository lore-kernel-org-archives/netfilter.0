From: "Stian B. Barmen" <stian@barmen.nu>
Subject: Re: Connection problems on large high speed connections.
Date: Thu, 28 Apr 2005 22:16:20 +0200
Message-ID: <1114719380.14301.4.camel@zepto.barmen.nu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
	<1114585852.15246.11.camel@zepto.barmen.nu>
	<1114586414.15242.14.camel@zepto.barmen.nu>
	<1114608987.15240.49.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271542470.5216@blackhole.kfki.hu>
	<1114609896.15244.54.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271554450.5216@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-vC0Z6QsgckILI1ACeCl0"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0504271554450.5216@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org


--=-vC0Z6QsgckILI1ACeCl0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Just to satisfy my couriosity, I logged in ulog the invalig packets, and
there are quite a few. How many should I expect to see and count as
normal?=20

For instance I downloaded a file from a reasonably fast FTP server at
about 7 MB, and during I logged three invalid TCP packets.=20

Apr 28 22:07:25 fire Invalid:  IN=3Deth1 OUT=3D
MAC=3D00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=3D156.56.247.195
DST=3D217.199.xx.18 LEN=3D1500 TOS=3D00 PREC=3D0x00 TTL=3D53 ID=3D47468 CE =
DF
PROTO=3DTCP SPT=3D80 DPT=3D33553 SEQ=3D985943197 ACK=3D497088462 WINDOW=3D6=
432 ACK
URGP=3D0
Apr 28 22:07:43 fire Invalid:  IN=3Deth1 OUT=3D
MAC=3D00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=3D156.56.247.195
DST=3D217.199.xx.18 LEN=3D1500 TOS=3D00 PREC=3D0x00 TTL=3D53 ID=3D52274 CE =
DF
PROTO=3DTCP SPT=3D80 DPT=3D33553 SEQ=3D989439897 ACK=3D497088462 WINDOW=3D6=
432 ACK
URGP=3D0
Apr 28 22:07:47 fire Invalid:  IN=3Deth1 OUT=3D
MAC=3D00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=3D156.56.247.195
DST=3D217.199.xx.18 LEN=3D1500 TOS=3D00 PREC=3D0x00 TTL=3D53 ID=3D53186 CE =
DF
PROTO=3DTCP SPT=3D80 DPT=3D33553 SEQ=3D990104197 ACK=3D497088462 WINDOW=3D6=
432 ACK
URGP=3D0

Should I just count this as normal? I thougt about using a limit per
second to log if it happened more than 2-3 per second.=20

Best regards
Stian B. Barmen

--=-vC0Z6QsgckILI1ACeCl0
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIH2TCCAkcw
ggGwoAMCAQICAw0JpTANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhh
d3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDQwOTE0MDc0NjEwWhcNMDUwOTE0MDc0NjEwWjBBMR8wHQYDVQQD
ExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR4wHAYJKoZIhvcNAQkBFg9zdGlhbkBiYXJtZW4ubnUw
gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALT1umqvVN4S1U2YVvSh3Zl3qTaM5AZGPBM6L3kf
YVGLVqWdeGYKlX+oZo7kThbA8OV+5Jg60rcEj6dEXqJV6ylN+XOByXFvepncxyC5w/rw4zpOfd7U
niFUzEI4gjNk5Y+SoMXv0EBWiM0Fr9muVn1QpTEdH+XJC/36Y1+lNLknAgMBAAGjLDAqMBoGA1Ud
EQQTMBGBD3N0aWFuQGJhcm1lbi5udTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAMOo
tvQpl6dnepLkO3CL0gyvUgYec1s/QJkoDJvs7Bu+JOdCWY9YKJqqazuuJ1kMd3fzSRjDWt4nv5Zk
w1/FBuE8baABEkCklugcWpnFinFoCHBVbY22vcY2k+EWoVsFhsille4FJo90Nf/Ds6c5ZE0t2wmM
yhGBYNLTNF972rrZMIICRzCCAbCgAwIBAgIDDQmlMA0GCSqGSIb3DQEBBAUAMGIxCzAJBgNVBAYT
AlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAeFw0wNDA5MTQwNzQ2MTBaFw0wNTA5MTQw
NzQ2MTBaMEExHzAdBgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBNZW1iZXIxHjAcBgkqhkiG9w0BCQEW
D3N0aWFuQGJhcm1lbi5udTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAtPW6aq9U3hLVTZhW
9KHdmXepNozkBkY8EzoveR9hUYtWpZ14ZgqVf6hmjuROFsDw5X7kmDrStwSPp0ReolXrKU35c4HJ
cW96mdzHILnD+vDjOk593tSeIVTMQjiCM2Tlj5Kgxe/QQFaIzQWv2a5WfVClMR0f5ckL/fpjX6U0
uScCAwEAAaMsMCowGgYDVR0RBBMwEYEPc3RpYW5AYmFybWVuLm51MAwGA1UdEwEB/wQCMAAwDQYJ
KoZIhvcNAQEEBQADgYEAw6i29CmXp2d6kuQ7cIvSDK9SBh5zWz9AmSgMm+zsG74k50JZj1gomqpr
O64nWQx3d/NJGMNa3ie/lmTDX8UG4TxtoAESQKSW6BxamcWKcWgIcFVtjba9xjaT4RahWwWGyKWV
7gUmj3Q1/8OzpzlkTS3bCYzKEYFg0tM0X3vautkwggM/MIICqKADAgECAgENMA0GCSqGSIb3DQEB
BQUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBl
IFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9u
IFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0Ex
KzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAw
MDAwWhcNMTMwNzE2MjM1OTU5WjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1
bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vp
bmcgQ0EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+j
Huy9zfVb8hp2vX8MOmHyv1HOAdTlUAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPP
K9Xzgnc9A74r/rsYPge/QIACZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQw
gZEwEgYDVR0TAQH/BAgwBgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0
ZS5jb20vVGhhd3RlUGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIw
IKQeMBwxGjAYBgNVBAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD
6gsuzA2jZqxnD3+vrL7CF6FDlpSdf0whuPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZGwDF
GguCdJ4lUJRix9sncVcljd2pnDmOjCBPZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC3CEZNd4k
sdMdRv9dX2VPMYICZjCCAmICAQEwaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENv
bnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElz
c3VpbmcgQ0ECAw0JpTAJBgUrDgMCGgUAoIIBUzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0wNTA0MjgyMDE2MjBaMCMGCSqGSIb3DQEJBDEWBBQUNhLsNm8po43z1XFx
dsegN8cPuDB4BgkrBgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUg
Q29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDQmlMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAw0JpTANBgkqhkiG9w0BAQEFAASBgHq2KVdYcUmLpdkiLDrA
iR0VXY2nApt6y7kKk5mP577+GTNntsCKcZyaKA8Ex0sBogWPMKbCzRi1WPnJZLicnWHxEr8EtbcZ
eSVSjEBV+8hBhpuj8UQatvzsJ7PtsnIpcgfoyqJsZ5E+R1XBKvgMuyLWiYGDzLjB6UAS3Vohvn4x
AAAAAAAA


--=-vC0Z6QsgckILI1ACeCl0--


