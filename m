From: "Steffen Heil" <lists@steffen-heil.de>
Subject: RE: Route packets by source IP
Date: Thu, 20 Mar 2008 01:30:21 +0100
Message-ID: <75E251D69A5244278E45E6F35899091C@shs1>
References: <47DFCF36.3060500@riverviewtech.net> <43cba8b55bae94158c0580f06e368ea4@localhost> <47E1836C.7050707@riverviewtech.net> <558A5399260B4A88B7FB73AD35D2244B@shs1> <47E1A98F.7070603@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0217_01C88A29.F6998E90";
	micalg=SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E1A98F.7070603@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0217_01C88A29.F6998E90
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

> It sounds like you have (one or more ports of) ExtA port 
> forwarded to IntA and (one or more ports of) ExtB port 
> forwarded to IntB.  You now want (one or more different ports 
> of) ExtB port forwarded to IntA and possibly (one or more 
> different ports of) ExtA port forwarded to IntB. 
> This will allow IntA to effectively be accessed via one port 
> range on ExtA and another port range of ExtB and possibly vice versa.

No.
There is no firewall or such in front.
I DO have 2 public reachable Servers with 1 public IP each and a openVPN
connection between them giving each 1 additional private IP.

Now I want to make some services on server A accessable though the public IP
of server B. (While they stay reachable on the public IP of server A.)

To simplify things:
The private openvpn IP of both servers is not used for anything else. Just
the connection between these two servers.
You can think of only making one service available - everything else will
just duplicate iptables commands.

> Let's see if I understand you correctly.  (In addition to 
> what you already have) you now want ExtB:81 port forwarded to 
> IntA:<something> and associated reply traffic to go back out 
> ExtB, not the default of ExtA.

This is nearly what I want:
I want to forward ExtB:80 to be forwarded to IntA:80 and associated reply
traffic to go back out ExtB, not default ExtA.
(The client should not notice A at all.)

B will not provide any own service at the ports in question.

> Presuming this is correct, you can fairly easily do this if 
> you are willing to do something simple.  If you will send the 
> traffic that you want to reply through the non default route 
> to a different IP or port, you can easily use tc to match the 
> traffic to use a different routing table and thus route out 
> the non default interface.

What is tc and how is it set up ?

> You can either use a different port or a different IP address 
> on the internal server(s).  You need something to be 
> different between the traffic that comes in to the default 
> and non default routes so that you have an easy way to 
> identify the traffic and apply tc rules.

Everything that comes on the private ip (openvpn ip) applies.
That ip is not used for anything else.

> Are you wanting to run similar services on both ExtA and 
> ExtB, and have them be redundant of each other?

No.

I need this setup for two things, one is hard to explain, so I will skip it,
the other is easy:
I need to transfer a service which cannot run on two servers in parallel
from one host to another.
The problem is, that clients are connecting all the time and do this by DNS.
Now changing DNS needs some time to timeout the caches and I do have near by
no controll over the dns servers. The TTL is two days.
So I need the very same instance of one service to be reachable by two ips
on two different servers (at two different providers).

> Before I go in to tc rules, would this scenario suffice what 
> you are trying to do?

Your scenario was much more than I need.
You involved 4 systems (ext and int, A and B). I only have 2 and I will
never need to do all this in two directions. In both my use cases, there is
only a need to forward from B to A, never from A to B at the same time.

Any help to starting points for the configuration commands is appreciated.

Regards,
  Steffen

------=_NextPart_000_0217_01C88A29.F6998E90
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
AQcBMBwGCSqGSIb3DQEJBTEPFw0wODAzMjAwMDMwMjFaMCMGCSqGSIb3DQEJBDEWBBSG2uKuLrre
EbFFQ4szOSOPKRhuYjBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG
9w0CBTCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENv
bnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElz
c3VpbmcgQ0ECECcZZPsvvC+/xhvbdPLhrpUwgYcGCyqGSIb3DQEJEAILMXigdjBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhh
d3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECECcZZPsvvC+/xhvbdPLhrpUwDQYJKoZI
hvcNAQEBBQAEgYAVw4EWHQSV/wXbcmvofkgD4ejZa8pasYIs1uTmK8XMsdU0DH/gLlI/k8VxgEW/
74o1xtmJ/lzW7NGmJdxHxQ0EiTffhSAqNJDP7Ha2GnmqA+NMMSidaZxwVjLEY9JqEka+Yg4EeJJy
KN2mWlc+BN54Mj96kUBfVswu4c9IJ7NhlwAAAAAAAA==

------=_NextPart_000_0217_01C88A29.F6998E90--

