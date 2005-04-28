From: "Stian B. Barmen" <stian@barmen.nu>
Subject: Re: Connection problems on large high speed connections.
Date: Fri, 29 Apr 2005 00:56:44 +0200
Message-ID: <1114729004.14324.4.camel@zepto.barmen.nu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
	<1114585852.15246.11.camel@zepto.barmen.nu>
	<1114586414.15242.14.camel@zepto.barmen.nu>
	<1114608987.15240.49.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271542470.5216@blackhole.kfki.hu>
	<1114609896.15244.54.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271554450.5216@blackhole.kfki.hu>
	<1114719380.14301.4.camel@zepto.barmen.nu>
	<20050428212413.GA31194@bender.817west.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-nJRQNjlyncSQD/IEsEuJ"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050428212413.GA31194@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


--=-nJRQNjlyncSQD/IEsEuJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

> > Apr 28 22:07:47 fire Invalid:  IN=3Deth1 OUT=3D
> > MAC=3D00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=3D156.56.247.195
> > DST=3D217.199.xx.18 LEN=3D1500 TOS=3D00 PREC=3D0x00 TTL=3D53 ID=3D53186=
 CE DF
> > PROTO=3DTCP SPT=3D80 DPT=3D33553 SEQ=3D990104197 ACK=3D497088462 WINDOW=
=3D6432 ACK
> > URGP=3D0
>=20
> the only thing that jumps out at me is that all those packets have the
> CE bit set (Congestion Experienced).  care to share with us the rule
> that creates those log entries?  is it just "-m state --state INVALID -j
> LOG"?  i would be very surprised if setting CE caused a packet to
> identified as INVALID...
>=20

Yes of course I share willingly :)

        iptables -L INVALIDDROP -n &>/dev/null ||\
	iptables -N INVALIDDROP
        iptables -A INVALIDDROP -j ULOG --ulog-prefix "Invalid: "
        iptables -A INVALIDDROP -j DROP
	iptables -A INPUT -m state --state INVALID -j INVALIDDROP

This is the lines from my firewall script. It is like you say only -m
state --state INVALID that is used.=20

=46rom my iptables -L you can see it's right there at the top:

fire root # iptables -L INPUT -n
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  127.0.0.0/8          127.0.0.0/8
INVALIDDROP  all  --  0.0.0.0/0            0.0.0.0/0           state
INVALID
..... <snip> .....

Best regards
Stian B. Barmen

--=-nJRQNjlyncSQD/IEsEuJ
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
CSqGSIb3DQEJBTEPFw0wNTA0MjgyMjU2NDRaMCMGCSqGSIb3DQEJBDEWBBQZviopQNH1tnPmy8L6
6DDG9V6g0zB4BgkrBgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUg
Q29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDQmlMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAw0JpTANBgkqhkiG9w0BAQEFAASBgD86oGshyfExas+ZaUr1
ZDGL2nu3Yzi/3hjq8XLM2ZHYanevL1BQNoe70h0828H/beGzJCs8T5V4C1+J8sQ3QETvN+Ltw691
7J+7oJfhPiMYeAe2KkB1FTCMq8nny7wcAqYOAksEeqWX9/tp9CmJEcjGDA51mOYBhjfoX9qJ3Kfi
AAAAAAAA


--=-nJRQNjlyncSQD/IEsEuJ--


