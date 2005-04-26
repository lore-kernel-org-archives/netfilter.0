From: "Stian B. Barmen" <stian@barmen.nu>
Subject: Connection problems on large high speed connections.
Date: Wed, 27 Apr 2005 00:50:37 +0200
Message-ID: <1114555837.14247.15.camel@zepto.barmen.nu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-vkQ/4zD5n/OY7xPD2u+n"
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


--=-vkQ/4zD5n/OY7xPD2u+n
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

My firewall has started to drop large connections, like downloading a
>1MB file over FTP or HTTP typically fails. But, it seems that the speed
needs to be over 4-500 K/s before the error occurs.=20

I live in Norway and if I ftp from ftp.sunet.se a linux distro ISO for
instance this will faill at about 1 MB size, then it will retry,
continue another megabyte and a new stall. But if I download a large
file from a slow server at about 100-200 K/s the download will continue.

When I flush my iptables script the error is gone.=20

I did some tests like remove all iptables entries with -m limit and
such. Also I tested from a nat'ed machine behind the firewall and from
the firewall itself. Same error on both. I also run Snort on the
computer, but it does no difference if it is started or not.

The only thing I can think of is that I not very long ago upgraded from
a 2.4 kernel to a 2.6 kernel. The last two kernels I tried was 2.6.11
and now the 2.6.12-rc3, both produces the same error. I also now
upgraded iptables from 1.2.11 to 1.3.1 but the same error appears.=20

My dmesg shows no error messages. How can I get a log from what is
happening? It is not in the FORWARD or OUTPUT chains since it happens
from both internal clients and the firewall itself. Can it be NAT? I use
SNAT to do natting of all connections. How can I debug nat?

I did a ping -f to my gateway, no packet loss, even if i crank the size
up to 1450. I am outta ideas.=20

System info:

Fujitsu Server
eepro100 NICs (2)
SCSI disks 2 at 10GB each
Kernel 2.6.11 and 2.6.12-rc3
iptables 1.2.11 and 1.3.1

Hope you have some ideas on my problem.=20

Best regards=20
Stian B. Barmen

--=-vkQ/4zD5n/OY7xPD2u+n
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
CSqGSIb3DQEJBTEPFw0wNTA0MjYyMjUwMzdaMCMGCSqGSIb3DQEJBDEWBBSmmCu5FoHaX2npmw4M
HwUod/qgCTB4BgkrBgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUg
Q29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDQmlMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAw0JpTANBgkqhkiG9w0BAQEFAASBgA1jJVbGV3TSaGKtzmAg
UH5h0oprkP3bODt0Tcydi9ObutGqoPUusMOI5I+DGnL4BWNNuRj014Ahcx4dinhkiVP3c6mTM6xH
r+TjJecNEUVq42J17yyDubDdcQC1Kz5evbDwlKqmIllsZriwYKiypkFdGfaXObVzKryfsgyu1xQd
AAAAAAAA


--=-vkQ/4zD5n/OY7xPD2u+n--


