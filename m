From: Pedro Abreu <pedro.abreu@anubisnetworks.com>
Subject: Re: throttling an internal IP's upstream bandwidth
Date: Mon, 19 Feb 2007 13:04:05 +0000
Message-ID: <1171890245.5374.19.camel@localhost.localdomain>
References: <Pine.LNX.4.64.0702091134220.18820@novak.ethosuk.org.uk>
	<45D83C7C.6000501@rtij.nl>
	<Pine.LNX.4.64.0702181232550.32641@novak.ethosuk.org.uk>
	<45D858AD.5060501@rtij.nl>
Reply-To: pedro.abreu@anubisnetworks.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-VDtl3Kb0jSW6hkdChCsv"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45D858AD.5060501@rtij.nl>
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


--=-VDtl3Kb0jSW6hkdChCsv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-02-18 at 14:46 +0100, Martijn Lievaart wrote:
> Scott van Looy wrote:
> > Today Martijn Lievaart did spake thusly:
> >
> >> Scott van Looy wrote:
> >>>
> >>> I'm on DSL, I only have small upstream and big downstream.=20
> >>> Everything goes through a 1:1 NAT iptables firewall - so internal=20
> >>> IPs are directly mapped to an external IP. I want to throttle the=20
> >>> internal upstream bandwidth so the internal machines can't upload at=20
> >>> more than 25k/s as the maxing out of the upstream is killing the=20
> >>> much faster downstream...is there a way to do this using iptables?
> >>>
> >>
> >> Google for wondershaper.
> >
> > I use wondershaper, it doesn't let me throttle on a per machine basis=20
> > tho - I want the firewall to only allow a max of 25k out for each of=20
> > my internal machines
> >
>=20
> Ah, then you have to do some work yourself. The answer is most probably=20
> tc, not netfilter. If you don't have a lot of internal machines, you can=20
> add a filter/qdisc for all of them but for large amounts of internal=20
> machines (or with dhcp), this gets unwieldy.
>=20
> However, wondershaper should do what you ultimately want, shape traffic=20
> so uploads don't disturb downloads. It works for me.
>=20
> M4
>=20
>=20

I use tc filter to distribute traffic between classes:

## ssh
tc filter add dev $DEV protocol ip parent 1:0 prio 10 u32\
      match ip dport 22 0xfffe flowid 1:10
## dns
tc filter add dev $DEV protocol ip parent 1:0 prio 11 u32\
      match ip dport 53 0xfffe flowid 1:10
## pings
tc filter add dev $DEV parent 1:0 protocol ip prio 12 u32 \
      match ip protocol 1 0xff flowid 1:10
## small packets (<64 bytes)
tc filter add dev $DEV parent 1: protocol ip prio 13 u32 \
      match ip protocol 6 0xff \
      match u8 0x05 0x0f at 0 \
      match u16 0x0000 0xffc0 at 2 \
      flowid 1:10

The easiest way should be to create a class for each machine and then tc
filter based on ip... alternatively it should be possible to mark
packets with iptables then match different marks with tc filter.


--=20

Pedro Abreu
AnubisNetworks
Rua Alexander Fleming, 5B
1600-054 Lisboa, Portugal
Tel. : +351 21 7252110
Mobile : +351 91 9302990
Fax : +351 21 7252119
pedro.abreu@anubisnetworks.com
http://www.anubisnetworks.com

--=-VDtl3Kb0jSW6hkdChCsv
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJNzCCAvYw
ggJfoAMCAQICEDeznNX5WhrhbL3Bm2Y111cwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDcwNTE2MTI0MVoXDTA3MDcwNTE2MTI0
MVowUDEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEtMCsGCSqGSIb3DQEJARYecGVk
cm8uYWJyZXVAYW51YmlzbmV0d29ya3MuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvEe5/KzzO6Hmvh3hqBdPaUmb6qn6M6VMCXGw6MG6VORuBNHjfVJ3Pf8uPy/BeWLYFN3kpdbO
LRi875pS7hmDr6a3xvx/bWW305k23GX7dm4HGlnRpdrhHDijac5RUQCt8tlgNLmyrZ2e4YquLpns
2YsHv4akqh39D3iocicpUbmx78whFz6YiQXvkih9dKxIlekP4sL+yrnYs/vP27XLLvCHPgCOziJQ
g9qtvQZjA6e51USxjOwa7ri+Ifhw3ctOL/lg4uCkwOpv6Vf+V4795W+H4eh4x0Y96RDvrtUzzv7v
0IDfeUkxbULgA1+xhZcPl2o8dgwX74+5e2dl973MZQIDAQABozswOTApBgNVHREEIjAggR5wZWRy
by5hYnJldUBhbnViaXNuZXR3b3Jrcy5jb20wDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOB
gQCKClESJCG5i3ltBSQcsXa+HIEzRLZvXAJlWpuh3/dRLjnPvlo3019oeQsC4dkXEWbFbYzeL/i7
oCxeaI2HkYCFL19aXp050qYi2FciOK0QPEbVtLJ8xT18CafG6rbQDkRx1W+h2dm+r2UoXJVqiX7L
Z5uHDqzIex1rHg8IkMo2FzCCAvYwggJfoAMCAQICEDeznNX5WhrhbL3Bm2Y111cwDQYJKoZIhvcN
AQEEBQAwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDcw
NTE2MTI0MVoXDTA3MDcwNTE2MTI0MVowUDEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJl
cjEtMCsGCSqGSIb3DQEJARYecGVkcm8uYWJyZXVAYW51YmlzbmV0d29ya3MuY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvEe5/KzzO6Hmvh3hqBdPaUmb6qn6M6VMCXGw6MG6VORu
BNHjfVJ3Pf8uPy/BeWLYFN3kpdbOLRi875pS7hmDr6a3xvx/bWW305k23GX7dm4HGlnRpdrhHDij
ac5RUQCt8tlgNLmyrZ2e4YquLpns2YsHv4akqh39D3iocicpUbmx78whFz6YiQXvkih9dKxIlekP
4sL+yrnYs/vP27XLLvCHPgCOziJQg9qtvQZjA6e51USxjOwa7ri+Ifhw3ctOL/lg4uCkwOpv6Vf+
V4795W+H4eh4x0Y96RDvrtUzzv7v0IDfeUkxbULgA1+xhZcPl2o8dgwX74+5e2dl973MZQIDAQAB
ozswOTApBgNVHREEIjAggR5wZWRyby5hYnJldUBhbnViaXNuZXR3b3Jrcy5jb20wDAYDVR0TAQH/
BAIwADANBgkqhkiG9w0BAQQFAAOBgQCKClESJCG5i3ltBSQcsXa+HIEzRLZvXAJlWpuh3/dRLjnP
vlo3019oeQsC4dkXEWbFbYzeL/i7oCxeaI2HkYCFL19aXp050qYi2FciOK0QPEbVtLJ8xT18CafG
6rbQDkRx1W+h2dm+r2UoXJVqiX7LZ5uHDqzIex1rHg8IkMo2FzCCAz8wggKooAMCAQICAQ0wDQYJ
KoZIhvcNAQEFBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNV
BAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRp
ZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVl
bWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0w
MzA3MTcwMDAwMDBaFw0xMzA3MTYyMzU5NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1h
aWwgSXNzdWluZyBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8VXNV+065yplaHmjA
dQRwnd/p/6Me7L3N9VvyGna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7dyfArhVqqP3FWy688Cwfn
8R+RNiQqE88r1fOCdz0Dviv+uxg+B79AgAJk16emu59l0cUqVIUPSAR/p7bRPGEEQB5kGXJgt/sC
AwEAAaOBlDCBkTASBgNVHRMBAf8ECDAGAQH/AgEAMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9j
cmwudGhhd3RlLmNvbS9UaGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIBBjAp
BgNVHREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcNAQEFBQAD
gYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQIJNwPP2t4WFiw9k6
GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa9/eH1sYITq726jTlEBpbNU1341Yh
eILcIRk13iSx0x1G/11fZU8xggMQMIIDDAIBATB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQN7Oc1flaGuFsvcGbZjXXVzAJBgUrDgMCGgUAoIIBbzAYBgkqhkiG
9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNzAyMTkxMzA0MDVaMCMGCSqGSIb3
DQEJBDEWBBTOmjBhJVpdMH7/VA77YgFUqanLRzCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhh
d3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEDeznNX5WhrhbL3Bm2Y111cwgYcGCyqG
SIb3DQEJEAILMXigdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EC
EDeznNX5WhrhbL3Bm2Y111cwDQYJKoZIhvcNAQEBBQAEggEAVTg13K0ALDjbzaGrK9P7few1IEx6
dZ+tVfcODUz2/e4Z64U0RHfcg0qi1IxnAzBD8GdqUcxVHm4JOkIIGzIxH16QuG/iPxnFUF92nyWf
XNzpRiAUABdf2ATTNJX5yQPLDsUOs8OUugbdZdfYfldxfipftbKtS5k6hiOH+i4pU3MNB0dTq4MC
sdvHtblxJK55hY3afZ9aSbX5eRkDGPFdfH2QRzi0Fwj+lLRvka/yLaqJHZZUHaua/41A4hbyV0Ur
Vjo9qwMixhjnbD1WqqDBX7dcFMcQsGCWUg1CwU5pJP7liso3tb/Bocq8hoqcvTNAwOlBG9zHmobX
za/U6DkjwAAAAAAAAA==


--=-VDtl3Kb0jSW6hkdChCsv--


