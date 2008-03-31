From: "Steffen Heil" <lists@steffen-heil.de>
Subject: FW: CONNMARK and ip rule fwmark
Date: Mon, 31 Mar 2008 21:50:06 +0200
Message-ID: <6F83141C27C94F17A967258DC5CC1A1A@shs1>
Mime-Version: 1.0
Content-Type: multipart/signed;
	micalg=SHA1;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0094_01C89379.2E2FCE70"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_0094_01C89379.2E2FCE70
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry, I am not accustomed yet to not having reply-to the list... 

> -----Original Message-----
> From: Steffen Heil [mailto:lists@steffen-heil.de] 
> Sent: Monday, March 31, 2008 2:07 AM
> To: 'Jan Engelhardt'
> Subject: RE: CONNMARK and ip rule fwmark
> 
> Hi
> 
> > ># iptables -t nat -A PREROUTING -p TCP -d publicip -j DNAT --to
> > >10.4.0.1
> > >
> > >My observations seem to tell me, that ip rule is evaluated BEFORE 
> > >iptables rules are applied, so the mark is not set yet.
> > 
> > See http://jengelh.hopto.org/images/nf-packet-flow.png , routing 
> > decision takes place in the middle. (It's called _PRE_ROUTING_ for a
> > reason.)
> 
> Can you think of any reason SYN ACK packets are not seen at 
> ANY tables in my case?
> I see the syn packet and I know the service is running at that port!
> a.b.c.d is the client.
> 
> Regards,
>   Steffen
> 
> 
> 
> iptables -t raw -I PREROUTING -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t raw -I OUTPUT -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t raw -I PREROUTING -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t raw -I OUTPUT -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t filter -I INPUT -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t filter -I FORWARD -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t filter -I OUTPUT -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t filter -I INPUT -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t filter -I FORWARD -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t filter -I OUTPUT -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t nat -I PREROUTING -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t nat -I POSTROUTING -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t nat -I OUTPUT -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t nat -I PREROUTING -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t nat -I POSTROUTING -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t nat -I OUTPUT -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t mangle -I PREROUTING -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t mangle -I INPUT -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t mangle -I FORWARD -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t mangle -I OUTPUT -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t mangle -I POSTROUTING -p tcp -d a.b.c.d/24 -j LOG 
> iptables -t mangle -I PREROUTING -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t mangle -I INPUT -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t mangle -I FORWARD -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t mangle -I OUTPUT -p tcp -s a.b.c.d/24 -j LOG 
> iptables -t mangle -I POSTROUTING -p tcp -s a.b.c.d/24 -j LOG
> 

------=_NextPart_000_0094_01C89379.2E2FCE70
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
AQcBMBwGCSqGSIb3DQEJBTEPFw0wODAzMzExOTUwMDVaMCMGCSqGSIb3DQEJBDEWBBTE2dE3UjJr
Myb/xy0ZdWEigcaNyzBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG
9w0CBTCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENv
bnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElz
c3VpbmcgQ0ECECcZZPsvvC+/xhvbdPLhrpUwgYcGCyqGSIb3DQEJEAILMXigdjBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhh
d3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECECcZZPsvvC+/xhvbdPLhrpUwDQYJKoZI
hvcNAQEBBQAEgYAAuOGvt/eNH0uPog1OZcd7mDeUgyPidz+duwbku61d8qnG539fNrfNvkU+U5VX
ElkYN+EW7judzSPuIm8GGgmiu2xhaKDSkYxID3F+31w80kq3RXPAJu//Ba8LukQCmsoJyM5sSNQS
enIWGXFp4/vD1xjme+lcqnjYRg9ZpXCfggAAAAAAAA==

------=_NextPart_000_0094_01C89379.2E2FCE70--

