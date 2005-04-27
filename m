From: "Stian B. Barmen" <stian@barmen.nu>
Subject: Re: Connection problems on large high speed connections.
Date: Wed, 27 Apr 2005 08:46:00 +0200
Message-ID: <1114584360.15242.6.camel@zepto.barmen.nu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<426F1D30.1080103@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-pT6/Qo/BcO7rZXXjin9I"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426F1D30.1080103@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org


--=-pT6/Qo/BcO7rZXXjin9I
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> ons, 27,.04.2005 kl. 00.03 -0500, skrev Taylor, Grant:
> > When I flush my iptables script the error is gone.=20
>=20
> You say that when you flush your iptables script the error goes away?  Ar=
e you flushing the firewall completely or just reapplying / rerunning your =
firewall script?  What are you doing when you flush the script?
>=20
>=20

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F DMZ
iptables -X DMZ
iptables -F ICMP
iptables -X ICMP
iptables -F SMTPDROP
iptables -X SMTPDROP
iptables -t nat -F POSTROUTING # sl=E5 av NAT'ing
iptables -t nat -F PREROUTING # sl=E5 av redirect

This is what I do when I run my script with stop parameter. The reason I
empty each separately is that I have one chain that I don't want to
reload every time (called NORDIC that is the IP classes of the nordic
countries). When running these -F and -X the problem goes away.=20

My firewall script works shortly by masking out all traffic to a x/30
mask that is sent to the DMZ chain. All SMTP (dest. port 25) is filtered
in SMTPDROP, and ICMP in the ICMP chain.=20

I run the following kernel modules:

modprobe ip_tables
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe ip_nat_ftp
modprobe ip_nat_irc
modprobe ipt_ULOG

Best regards
Stian B. Barmen

--=-pT6/Qo/BcO7rZXXjin9I
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
CSqGSIb3DQEJBTEPFw0wNTA0MjcwNjQ2MDBaMCMGCSqGSIb3DQEJBDEWBBSk8JPtEcCVgPGW3G6B
5JBxroezcTB4BgkrBgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUg
Q29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDQmlMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAw0JpTANBgkqhkiG9w0BAQEFAASBgBez+asjYQGWhvEeDXVh
J4ms6K+GJD0rPAPhLIdvJdIQJFIRTAE9pM9zGDGaN6W8QfuBYs5X1hebE9hUUXm69oJsMF/c+Z/F
kmSxdbUqaRXm5wyyPqrUXWklTwjmwWtGZ0HtQwSKsckapLr1I/92D0GouC7iyn7xrxyYBup2X9ya
AAAAAAAA


--=-pT6/Qo/BcO7rZXXjin9I--


