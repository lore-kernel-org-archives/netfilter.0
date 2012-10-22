From: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Subject: AW: Possible bug in iptables : -m --uid-owner not working with ping
Date: Mon, 22 Oct 2012 14:43:15 +0000
Message-ID: <304595783255CB4682E86E67D63E6FEE2AEA96@dc2008r2.sh-solutions.intern>
References: <50855A6B.1070000@lavabit.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_00C1_01CDB074.5916BE10"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50855A6B.1070000@lavabit.com>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?utf-8?B?bWF0amHFvg==?= <matjazbercic@lavabit.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_NextPart_000_00C1_01CDB074.5916BE10
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi

On my system /bin/ping has suid-bit set.
So it it always executed as root, not as the user invoking it.

As far as I know, ping requires root privileges...

Regards,
  Steffen


> -----Urspr=C3=BCngliche Nachricht-----
> Von: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] Im Auftrag von matja=C5=BE
> Gesendet: Montag, 22. Oktober 2012 16:39
> An: netfilter@vger.kernel.org
> Betreff: Possible bug in iptables : -m --uid-owner not working with =
ping
>=20
> Hi all,
> Is it possible that owner matching does not work correctly ?
> I tried blocking internet access to one user, but found out he can =
still
> use ping.
> Pleas see below : (I removed some lines from ping output for clarity -
> also there are no other rules in iptables)
>=20
> matjaz@laptop:~$ iptables --version
> iptables v1.4.16.3
> matjaz@laptop:~$ sudo iptables -F -t nat ; sudo iptables -F
> matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
> PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
> 64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D46.9 ms
> # ok, works
> matjaz@laptop:~$ id nonet
> uid=3D1002(nonet) gid=3D1003(nonet) groups=3D1003(nonet)
> matjaz@laptop:~$ sudo iptables -A OUTPUT -p icmp -m owner --uid-owner
> 1002 -j REJECT
> matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
> PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
> 64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D46.7 ms
> # not ok, still works
> matjaz@laptop:~$ sudo iptables -A OUTPUT -p icmp -j REJECT
> matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
> PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
> ping: sendmsg: Operation not permitted
>=20
> My machine :
> matjaz@laptop:~$ cat /etc/issue
> Ubuntu 12.04.1 LTS \n \l
> matjaz@laptop:~$ uname -a
> Linux laptop 3.2.0-32-generic #51-Ubuntu SMP Wed Sep 26 21:33:09 UTC
> 2012 x86_64 x86_64 x86_64 GNU/Linux
>=20
> I installed the latest version of iptables (this didn't work even with
> the ubuntu supplied version) from source and rebooted before testing. =
I
> didn't uninstall the previous version before installation.
>=20
> Also : the -match --uid-owner seems to work on other protocols.
>=20
> Oddly enough, using group id instead seems to work :
> matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
> PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
> 64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D47.6 ms
> --- 173.194.35.145 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2002ms
> rtt min/avg/max/mdev =3D 46.284/46.994/47.659/0.615 ms
> matjaz@laptop:~$ sudo iptables -A OUTPUT -p icmp -m owner --gid-owner
> 1003 -j REJECT
> matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
> PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
>  From 192.168.2.151 icmp_seq=3D1 Destination Port Unreachable
> --- 173.194.35.145 ping statistics ---
> 0 packets transmitted, 0 received, +3 errors
> matjaz@laptop:~$ ping -c 3 173.194.35.145
> PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
> 64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D47.3 ms
> --- 173.194.35.145 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2003ms
> rtt min/avg/max/mdev =3D 46.645/46.933/47.373/0.402 ms
>=20
> Is this expected behaviour ?
> Best regards,
> Matja=C5=BE Ber=C4=8Di=C4=8D
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

------=_NextPart_000_00C1_01CDB074.5916BE10
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIVRDCCBjQw
ggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDE1NVoX
DTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOrlr6KMoOMpohBllVHrdRvEg/q6r8jR+EK
75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSMzR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC
+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxD
z2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSDkOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr
/+N2JLKutIxMYqQOJebr/f/h5t95m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFc
fH6WNU7y1LhRgjAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqDCH14qywG
XLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy6QMVQjbbMXlt
UfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPIzKKR9tQW8gGK+2+R
HxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKfKSETEPrHh7p5shuuNktv
sv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HORz9v3vQwR4e3ksLc2JZOAFK+s
sS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9sIPP7ON0fz095HdThKjiVJe6vofq
+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCieuoBJ9OlqmsVWQvifIYf40dJPZkk9YgGT
zWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7tw1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGq
Up/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQG2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb1
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIHOzCCBiOg
AwIBAgIDBGGXMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTIwNjE0MDkzNDUxWhcNMTMwNjE1MDU1ODI4WjBlMRkwFwYDVQQNExAyOXowUXpwVXU2M2o4c3J5
MQswCQYDVQQGEwJERTEVMBMGA1UEAxMMU3RlZmZlbiBIZWlsMSQwIgYJKoZIhvcNAQkBFhVsaXN0
c0BzdGVmZmVuLWhlaWwuZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCxOXwC/gMU
vwL0X3IBNc5pBE1cxbMzGx/3Z0JxBdFmQN26kn+LjkG629BVEWsYfdvasVCdBvlE6b9hcEECugUl
2tpYO00JRXzSGQwO0MizWNWKngjRjiknbt5pPQghgDvN/VKxGY9JUboI5qE0sp1a09+3UM1BycIf
TwMeqcr1e72yY0KBF9q3d48hY1okbDRSm2TytnsEBLgqB8AGOcCDuNe5eMOUNkqTRmwWXzdHS39p
6k2+aym65iU4jM5PnHvZbhClUdOh/g4m2Oow6CTGIa84QIAGBAsSaI9PZmvDKdwkCAKVaGUw4O+t
wgiOo0Vrhvk8wkfxDRTLK1lnY+45AgMBAAGjggPKMIIDxjAJBgNVHRMEAjAAMAsGA1UdDwQEAwIE
sDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwHQYDVR0OBBYEFIvBMReqXgBLOgEnvq2z
MmF43TSYMB8GA1UdIwQYMBaAFFNy7ZKc4NrLAVx8fpY1TvLUuFGCMCAGA1UdEQQZMBeBFWxpc3Rz
QHN0ZWZmZW4taGVpbC5kZTCCAjsGA1UdIASCAjIwggIuMIICKgYLKwYBBAGBtTcBAgIwggIZMC4G
CCsGAQUFBwIBFiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMDQGCCsGAQUFBwIB
FihodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9pbnRlcm1lZGlhdGUucGRmMIIBEAYIKwYBBQUHAgIw
ggECMCcWIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagdZUaGlzIGNlcnRp
ZmljYXRlIHdhcyBpc3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBTdGFydFNTTCBXZWItb2YtVHJ1c3Qg
Q29tbXVuaXR5IFZhbGlkYXRpb24gcmVxdWlyZW1lbnRzIG9mIHRoZSBTdGFydENvbSBDQSBwb2xp
Y3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRlZCBwdXJwb3NlIGluIGNvbXBsaWFuY2Ug
b2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMuMIGcBggrBgEFBQcCAjCBjzAnFiBTdGFy
dENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgECGmRMaWFiaWxpdHkgYW5kIHdhcnJhbnRp
ZXMgYXJlIGxpbWl0ZWQhIFNlZSBzZWN0aW9uICJMZWdhbCBhbmQgTGltaXRhdGlvbnMiIG9mIHRo
ZSBTdGFydENvbSBDQSBwb2xpY3kuMDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuc3RhcnRz
c2wuY29tL2NydHUxLWNybC5jcmwwgY4GCCsGAQUFBwEBBIGBMH8wOQYIKwYBBQUHMAGGLWh0dHA6
Ly9vY3NwLnN0YXJ0c3NsLmNvbS9zdWIvY2xhc3MxL2NsaWVudC9jYTBCBggrBgEFBQcwAoY2aHR0
cDovL2FpYS5zdGFydHNzbC5jb20vY2VydHMvc3ViLmNsYXNzMS5jbGllbnQuY2EuY3J0MCMGA1Ud
EgQcMBqGGGh0dHA6Ly93d3cuc3RhcnRzc2wuY29tLzANBgkqhkiG9w0BAQUFAAOCAQEAaN2q0MFI
JcZM+37730j8TON1BKgtHHLCTTpymmsa6ukzJNVb5S0sA/LrqvdR+m3swBX9LD+rJjNXMtmUx2tE
wdLk+trRfomn61FSIHoPkRBvFhKV6ldlEvZ87WFzuxa6vAKNIehVcj4SWk9rfqRXRAhvM5eAx6sK
sYoq3gX+OUgAlCOwfTe02C7dJzjfa2nWPI7KUYBM80xrwcnjQKvds0iep1viIOSjQ9/w2IXcwcTr
Wkip9mnY2jigYTzOaK9nP6qB65HIMC1nGd1S09yT+7WF4mnm/tJIek2Na4Y9QBPSalU2YsDf74u8
pschznQ33qBCEK2U+PNiKGsNuLMpZzCCB8kwggWxoAMCAQICAQEwDQYJKoZIhvcNAQEFBQAwfTEL
MAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdp
dGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAnBgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24g
QXV0aG9yaXR5MB4XDTA2MDkxNzE5NDYzNloXDTM2MDkxNzE5NDYzNlowfTELMAkGA1UEBhMCSUwx
FjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmlj
YXRlIFNpZ25pbmcxKTAnBgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIIC
IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwYjbCbxsRnx4n5V7tTOQ8nJi1sE2ICIkXs7p
d/JDCqIGZKTMjjb4OOYj8G5tsTzdcqOFHKHTPbQzK9Mvr/7qsEFZZ7bEBn0KnnSF1nlMgDd63zkF
Uln39BtGQ6TShYXSw3HzdWI0uiyKfx6P7u000BHHls1SPboz1t1N3gs7SkufwiYv+rUWHHI1d8o8
XebK4SaLGjZ2XAHbdBQl/u21oIgP3XjKLR8HlzABLXJ5+kbWEyqouaarg0kd5fLv3eQBjhgKj2NT
FoViqQ4ZOsy1ZqbCa3QH5Cvhdj60bdj2ROFzYh87xL6gU1YlbFEJ96qryr92/W2b853bvz1mvAxW
qq+YSJU6S9+nWFDZOHWpW+pDDAL/mevobE1wWyllnN2qXcyvATHsDOvSjejqnHvmbvcnZgwaSNdu
QuM/3iE+e+ENcPtjqqhsGlS0XCV6yaLJixamuyx+F14FTVhuEh0B7hIQDcYyfxj//PT6zW6R6DZJ
vhpIaYvClk0aErJpF8EKkNb6eSJIv7p7afhwx/p6N9jYDdJ2T1f/kLfjkdLd78Jgt2c63f6qnPDU
i39yIs7Gn5e2+K+KoBCo2fsYxra1XFI8ibYZKnMBCg8DsxJg8novgdujbv8mMJf1i92JV7atPbOv
K8W3dgLwpdYrmoYUKnL24zOMXQlLE9+7jHQTUksCAwEAAaOCAlIwggJOMAwGA1UdEwQFMAMBAf8w
CwYDVR0PBAQDAgGuMB0GA1UdDgQWBBROC+8apEBbpRdphzDKNGhD0EGu8jBkBgNVHR8EXTBbMCyg
KqAohiZodHRwOi8vY2VydC5zdGFydGNvbS5vcmcvc2ZzY2EtY3JsLmNybDAroCmgJ4YlaHR0cDov
L2NybC5zdGFydGNvbS5vcmcvc2ZzY2EtY3JsLmNybDCCAV0GA1UdIASCAVQwggFQMIIBTAYLKwYB
BAGBtTcBAQEwggE7MC8GCCsGAQUFBwIBFiNodHRwOi8vY2VydC5zdGFydGNvbS5vcmcvcG9saWN5
LnBkZjA1BggrBgEFBQcCARYpaHR0cDovL2NlcnQuc3RhcnRjb20ub3JnL2ludGVybWVkaWF0ZS5w
ZGYwgdAGCCsGAQUFBwICMIHDMCcWIFN0YXJ0IENvbW1lcmNpYWwgKFN0YXJ0Q29tKSBMdGQuMAMC
AQEagZdMaW1pdGVkIExpYWJpbGl0eSwgcmVhZCB0aGUgc2VjdGlvbiAqTGVnYWwgTGltaXRhdGlv
bnMqIG9mIHRoZSBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSBQb2xpY3kgYXZhaWxh
YmxlIGF0IGh0dHA6Ly9jZXJ0LnN0YXJ0Y29tLm9yZy9wb2xpY3kucGRmMBEGCWCGSAGG+EIBAQQE
AwIABzA4BglghkgBhvhCAQ0EKxYpU3RhcnRDb20gRnJlZSBTU0wgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwDQYJKoZIhvcNAQEFBQADggIBABZsmfRmDDT10IVefQrs2hBOOBxe36YlBUuRMsHoO/E9
3UQJWwdJiinLZgK3sZr3JZgJPI4b4d02hytLu2jTOWY9oCbH8jmRHVGrgnt+1c5a5OIDV3Bplwj5
XlimCt+MBppFFhY4Cl5X9mLHegIF5rwetfKe9Kkpg/iyFONuKIdEw5Aa3jipPKxDTWRFzt0oqVzy
c3sE+Bfoq7HzLlxkbnMxOhK4vLMR5H2PgVGaO42J9E2TZns8A+3Tmh2a82VQ9aDQdZ8vr/DqgkOY
+GmciXnEQ45GcuNkNhKv9yUeOImQd37Da2q5w8tES6x4kIvnxyweSxFEyDRSJ80KXZ+FwYnVGnjy
lRBTMt2AhGZ12bVoKPthLr6EqDjAmRKGpR5nZK0GLi+pcIXHlg98iWX1jkNUDqvdpYA5lGDANMmW
cCyjEvUfSHu9HH5rt52Q9CI7rvj8Ksr6glKg769LVZPrwbXwIousNE4mIgShhyx1SrflfRPXuAxk
wDbSyS+GEowjCcEbgjtzSaNqV4eU5dZ4xZlDY+NN4Hct4WWZcmkEGkcJ5g8BViT7H78OealYLrnE
CQF+lbptAAY+supKEDnY0Cv1v+x1v5cCxQkbCNxVN+KB+zeEQ2IgyudWS2Xq/mzBJJMkoTTrBf+a
Iq6bfT/xZVEKpjBqs/SIHIAN/HKK6INeMYIEHTCCBBkCAQEwgZQwgYwxCzAJBgNVBAYTAklMMRYw
FAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0
ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRl
IENsaWVudCBDQQIDBGGXMAkGBSsOAwIaBQCgggJdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTEyMTAyMjE0NDMyMlowIwYJKoZIhvcNAQkEMRYEFLW08b7eMMJ/8vFp
CVN5pOvN7XfHMIGlBgkrBgEEAYI3EAQxgZcwgZQwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1T
dGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5n
MTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBD
QQIDBGGXMIGnBgsqhkiG9w0BCRACCzGBl6CBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0
YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcx
ODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENB
AgMEYZcwgasGCSqGSIb3DQEJDzGBnTCBmjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqG
SIb3DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwBwYFKw4DAgcwDQYIKoZIhvcNAwIC
AUAwDQYIKoZIhvcNAwICASgwBwYFKw4DAhowCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglg
hkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAjoNtXymKJgeUrpGfMXwsLXVtFwsq1Zm0nOKC1kNB
mYzJb4GQBibrI7IwHHplKHqqua6DNXVCYMHsdkcxUPmb0vkren6n20RKtKSRzG+6OXunIZBVlr2K
CJS6cACO3EgNPEPhj7xFXo5eDQNr6jbEx043emn1GWx4pjIZrDa1B5drtOae7YsaOxPjH33cldpo
oKN/G7xZWzrNuzuVgjQQ6JFqsHxvZuD6pmI92L2S50V2w/zaFFRkNd1qPtADe9uSqhGtUIE5msdm
DYqvYJRe4KEAlouO4itv75fWXuaU6gzsyR6oytN0gFM0tUAaiPwsvh2nw2klN/VA0ZMOY9mJGAAA
AAAAAA==

------=_NextPart_000_00C1_01CDB074.5916BE10--
