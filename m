From: "Stian B. Barmen" <stian@barmen.nu>
Subject: Re: Connection problems on large high speed connections.
Date: Wed, 27 Apr 2005 09:10:52 +0200
Message-ID: <1114585852.15246.11.camel@zepto.barmen.nu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-teLVSJLXqKDQ/Rv8tIJ7"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
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


--=-teLVSJLXqKDQ/Rv8tIJ7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

> NAT sequence number adjustment is broken since 2.6.11. I believe
> the patch was submitted in after 2.6.12-rc3 had been released.
>=20
> But it's an FTP/IRC/etc data channel related bug. It has nothing to do
> with plain HTTP. Do you mean HTTP transfer is also broken or it's just an
> FTP transfer initiated by a web client?
>=20

I get the same error if I run http or ftp. No difference.

Here is wget screenshot:

--09:08:01--
http://www.cpan.no/ports/win32/Standard/x86/perl5.00402-bindist04-bc.zip
  (try: 3) =3D> `perl5.00402-bindist04-bc.zip'
Connecting to www.cpan.no[158.36.2.10]:80... connected.
HTTP request sent, awaiting response... 206 Partial Content
Length: 6,176,370 (5,278,602 to go) [application/zip]

28%
[++++++++++++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>                               =
                              ] 1,754,080    906.44K/s

09:08:02 (904.70 KB/s) - Read error at byte 1754080/6176370 (Connection
reset by peer). Retrying.

You can see that it downloaded a bit, stopped, resumed, stopped again.=20

I hate peer sometimes .. :)

Best regards
Stian B. Barmen

--=-teLVSJLXqKDQ/Rv8tIJ7
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
CSqGSIb3DQEJBTEPFw0wNTA0MjcwNzEwNTJaMCMGCSqGSIb3DQEJBDEWBBTVCd3v+p0BmyhuvfGT
PGCWpeLS7TB4BgkrBgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUg
Q29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDQmlMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAw0JpTANBgkqhkiG9w0BAQEFAASBgCOmmqRCfwaUMrmHsSj/
inbthJIV2CsEIJIDgluOcwaRl20Hfn/E9sThONLoGXvHI9/4ipJCbAzkzNwIwYlBmc+LeGah+Xb6
kArCvFZ4khwS8367c4qzLElnjHeDXjmee4/Cvam5M/CbIPeqJjMs8umPNQTcfnSfoz+sRHJOXVA+
AAAAAAAA


--=-teLVSJLXqKDQ/Rv8tIJ7--


