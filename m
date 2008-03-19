From: "Steffen Heil" <lists@steffen-heil.de>
Subject: RE: Route packets by source IP
Date: Wed, 19 Mar 2008 23:03:38 +0100
Message-ID: <558A5399260B4A88B7FB73AD35D2244B@shs1>
References: <47DFCF36.3060500@riverviewtech.net> <43cba8b55bae94158c0580f06e368ea4@localhost> <47E1836C.7050707@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0182_01C88A15.77313900";
	micalg=SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E1836C.7050707@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_0182_01C88A15.77313900
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

> On 03/19/08 13:21, Franck JONCOURT wrote:
> > This is perhaps not a good way to do, but I was thinking 
> about using 
> > the __ip route__ command.
> > 
> > ip route add 192.168.2.0/24 via 192.168.0.2
> > 
> > where 192.168.2.0/24 would be the B1 network and 
> 192.168.0.2 would be 
> > the B2 ip address.
> > 
> > Is that wrong ?
> 
> "ip route" routes traffic based on destination IP address not 
> necessarily the network that it would pass through to get 
> there.  So if you have traffic headed to my web server, you 
> can not use "ip route" to get it there with out specifying my 
> servers IP address / subnet in the ip route command.

Right.
Even more: In my scenario the same client should be able to reach the
service using the public ip of both servers.
Therefor routing based on the destination (=client) ip is not possible at
all. However if the target ip was the A1 then reply as usual (use default
route) and if the target ip was A2 (only possible because it was forwarded
from B1) then route the packet to B2, where B will route the packets as
usual (using default route).

Regards,
  Steffen


-- Original Message ------------------------ 

Hi

I have two servers, having public IPs A1, B1, connected via private IPs A2,
B2 on a openVPN network.
Now I need to make a service (port p) of server A1:p available via B1:p.
So I want to try the following:

1. At B: dnat every incoming connection for B1:p to A2:p.
    - this is to archieve my goal -
2. At A: Route every packet "from A2:P" to B2.
    - otherwise A would try to route to the client via its gateway, which
would fail because of the private sender ip. -

I think I can do the first:

iptables -t nat -I PREROUTING -p tcp --dport p -j DNAT --to A2:p

But I don't know how to do the second.
Any hints?

Regards,
  Steffen

------=_NextPart_000_0182_01C88A15.77313900
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII7zCCAncw
ggHgoAMCAQICECcZZPsvvC+/xhvbdPLhrpUwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDkyNDEyMjYwNFoXDTA4MDkyMzEyMjYw
NFowXjENMAsGA1UEBBMESGVpbDEQMA4GA1UEKhMHU3RlZmZlbjEVMBMGA1UEAxMMU3RlZmZlbiBI
ZWlsMSQwIgYJKoZIhvcNAQkBFhVsaXN0c0BzdGVmZmVuLWhlaWwuZGUwgZ8wDQYJKoZIhvcNAQEB
BQADgY0AMIGJAoGBANV03as9J7BLKo1h6Jy5gO/J7LHxdXW9KGWkC+DdIo1Ii+Q+eok5FkpFgyCB
hw0cj09ZKC6Rr7W51rGKzUrGycp9TnvbXhIWh3BricKjL12SYxaqazcfyw8YQ8fFvk8XFlJtRcok
WouvAazUdl4CmfsxfpmN/WlghCvsPrKghw/lAgMBAAGjMjAwMCAGA1UdEQQZMBeBFWxpc3RzQHN0
ZWZmZW4taGVpbC5kZTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAAKrC/mvgV3nYRT8
+NboUGr27wfGkTGPXqJGd0TXJvbq8HgEG43XB9fQE/Hyi+yn/8WI6fDf1WiJ/YRCYyQx1E8X7MoF
ZBP18twCJkQJqJi2Tv9mf78XmFtgCm8hXi0Nl9EfnOu2nEIdWH3P5ysei3caWEkmm0VAngkeCvlT
Eq28MIIDLTCCApagAwIBAgIBADANBgkqhkiG9w0BAQQFADCB0TELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29u
c3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UE
AxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1m
cmVlbWFpbEB0aGF3dGUuY29tMB4XDTk2MDEwMTAwMDAwMFoXDTIwMTIzMTIzNTk1OVowgdExCzAJ
BgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgG
A1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMg
RGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3
DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw
gYkCgYEA1GnX1LCUZFtx6UfYDFG26nKRsIRefS0Nj3sS34UldSh0OkIsYyeflXtL734Zhx2G6qPd
uc6WZBrCFG5ErHzmj+hND3EfQDimAKOHePb5lIZererAXnbr2RSjXW56fAylS1V/Bhkpf56aJtVq
uzgkCGqYx7Hao5iR/Xnb5VrEHLkCAwEAAaMTMBEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0B
AQQFAAOBgQDH7JJ+Tvj1lqVnYiqk8E0RYNBvjWBYYawmu1I1XAjPMPuoSpaKH2JCI4wXD/S6ZJwX
rEcp352YXtJsYHFcoqzceePnbgBHH7UNKOgCneSa/RP0ptl8sfjcXyMmCZGAc9AUG95DqYMl8uac
LxXK/qarigd1iwzdUYRr5PjRzneigTCCAz8wggKooAMCAQICAQ0wDQYJKoZIhvcNAQEFBQAwgdEx
CzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEa
MBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2Vydmlj
ZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqG
SIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0x
MzA3MTYyMzU5NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTCB
nzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8VXNV+065yplaHmjAdQRwnd/p/6Me7L3N9Vvy
Gna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7dyfArhVqqP3FWy688Cwfn8R+RNiQqE88r1fOCdz0D
viv+uxg+B79AgAJk16emu59l0cUqVIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEAAaOBlDCBkTASBgNV
HRMBAf8ECDAGAQH/AgEAMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwudGhhd3RlLmNvbS9U
aGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIBBjApBgNVHREEIjAgpB4wHDEa
MBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcNAQEFBQADgYEASIzRUIPqCy7MDaNm
rGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQIJNwPP2t4WFiw9k6GX6EsZkbAMUaC4J0niVQ
lGLH2ydxVyWN3amcOY6MIE9lX5Xa9/eH1sYITq726jTlEBpbNU1341YheILcIRk13iSx0x1G/11f
ZU8xggL4MIIC9AIBATB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGlu
ZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBD
QQIQJxlk+y+8L7/GG9t08uGulTAJBgUrDgMCGgUAoIIB2DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcN
AQcBMBwGCSqGSIb3DQEJBTEPFw0wODAzMTkyMjAzMzdaMCMGCSqGSIb3DQEJBDEWBBR6elGSoRhB
7rUw/oqSwGvIeOawTzBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG
9w0CBTCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENv
bnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElz
c3VpbmcgQ0ECECcZZPsvvC+/xhvbdPLhrpUwgYcGCyqGSIb3DQEJEAILMXigdjBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhh
d3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECECcZZPsvvC+/xhvbdPLhrpUwDQYJKoZI
hvcNAQEBBQAEgYCkCRxpykm85MewiRpN83y6ra1k0EOFnQOGvVI7PxLjw5Jx8czrYvxTAaAmPHuu
tgGibtpgTwsWtPwROzk8vouyxyHyNYbHq838Ng9pzVoTL3C+uNDyR2sjL+XpKwRzpMbIdrRFUpr8
OdragkAEM+uoHL0tTlRIb9K1ntV5VkIjzQAAAAAAAA==

------=_NextPart_000_0182_01C88A15.77313900--

