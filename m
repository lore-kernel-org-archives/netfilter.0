From: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Subject: RE: I thought ssh is port #22 ?!!
Date: Thu, 1 Apr 2004 10:14:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9908FCB837A50642B74E2BEC198843095CC76C@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary="----=_NextPart_000_0000_01C417D2.0F97BCB0";
	micalg=SHA1;
	protocol="application/x-pkcs7-signature"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: cldavis@speakeasy.net, netfilter@lists.netfilter.org
Cc: Fajar Priyanto <fajarpri@arinet.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C417D2.0F97BCB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Port 32873 is the return port on the ssh client.

Here's how it works. The server listens on port 22. The client opens a
connection to the server, and tells the server which return port to use. If
you do "netstat -an" you will see the server talking on port 22, and the
client talking on some high numbered port like 32873. The high number port
used is random. It will change from one session to the next.

This is true not just for ssh - it is true for most tcp applications.

Michael Martinez
Unix System Administrator

-----Original Message-----
From: cldavis@speakeasy.net [mailto:cldavis@speakeasy.net] 
Sent: Wednesday, March 31, 2004 9:10 PM
To: netfilter@lists.netfilter.org
Cc: Fajar Priyanto
Subject: Re: I thought ssh is port #22 ?!!

You should edit sshd_config with the port command and set it to 22.  If the
directive is not present, I've had some versions of ssh listen on
everything, others only 22.  

You may also want to use the PermitRootLogin no directive to disable root
logins and use a regular user account to log in and then su to root if need
be.

As far as the firewall, you may want to setup your firewall to drop all
packets except packets sent to needed services.

Hope that helps
Chris
> -----Original Message-----
> From: Fajar Priyanto [mailto:fajarpri@arinet.org]
> Sent: Thursday, April 1, 2004 01:32 AM
> To: netfilter@lists.netfilter.org
> Subject: I thought ssh is port #22 ?!!
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi guys,
> I'm not really sure about this. I thought ssh is made in port #22?
> When I made a ssh session into my server, /var/log/messages showed this:
> Apr  1 09:20:20 server2 sshd[2711]: Accepted password for root from 
> 192.168.0.234 port 32873 ssh2
> 
> Why did it use port #32873?
> Is there something wrong with my ssh or firewall?
> TIA,
> - -- 
> Fajar Priyanto | Reg'd Linux User #327841 | http://linux.arinet.org
> 08:31:42 up 36 min, Mandrake Linux release 9.2 (FiveStar) for i586 
> public key: https://www.arinet.org/fajar-pub.key
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.3 (GNU/Linux)
> 
> iD8DBQFAa3EYkp5CsIXuxqURAluBAKCNiyg8+KXYDu/JuZghSVMXvfrjMgCdG7O2
> Bb4SQcbOiAqALl1o9yQ5H1k=
> =4uUZ
> -----END PGP SIGNATURE-----
> 
> 
> 




------=_NextPart_000_0000_01C417D2.0F97BCB0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKGDCCAjww
ggGlAhAyUDPPUNFW81yBrWVcT8glMA0GCSqGSIb3DQEBAgUAMF8xCzAJBgNVBAYTAlVTMRcwFQYD
VQQKEw5WZXJpU2lnbiwgSW5jLjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJsaWMgUHJpbWFyeSBDZXJ0
aWZpY2F0aW9uIEF1dGhvcml0eTAeFw05NjAxMjkwMDAwMDBaFw0yMDAxMDcyMzU5NTlaMF8xCzAJ
BgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJs
aWMgUHJpbWFyeSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw
gYkCgYEA5Rm/baNWYS2ZSHH2Z965jeu3noaACpEO+jglr0aIguVzqKCbJF0NH8xlbgyw0FaEGIea
BpsQoXPftFg5a27B9hXVqKg/qhIGjTGsf7A01480Z4gJzRQR4k5FVmkfeAKA2txHkSm7NsljXMXg
1y2He6G3MrB7MLoqLzGq7qNn2tsCAwEAATANBgkqhkiG9w0BAQIFAAOBgQBLRGZgaGTkmBvzsHLm
lYl83XuzlcAdLtjYGdAtND3GUJoQhoyqPzuoBPw3UpXD2cnbzfKGBsSxG/CCiDBCjhdQHGR6uD6Z
SXSX/KwCQ/uWDFYEJQx8fIedJKfY8DIptaTfXaJMxRYyqEL2Raa2Nrngv2U2k8LS12vc3lnWojX4
RTCCA2IwggLLoAMCAQICEAvaCxfBP4mOqwl0erTOLjMwDQYJKoZIhvcNAQECBQAwXzELMAkGA1UE
BhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAxIFB1YmxpYyBQ
cmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTk4MDUxMjAwMDAwMFoXDTA4MDUxMjIz
NTk1OVowgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29y
cC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIElu
ZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwgZ8wDQYJKoZIhvcNAQEB
BQADgY0AMIGJAoGBALtaRIoEFrtV/QN6ii2UTxV4NrgNSrJvnFS/vOh3Kp258Gi7ldkxQXB6gUu5
SBNWLccI4YRCq8CikqtEXKpC8IIOAukv+8I7u77JJwpdtrA2QjO1blSIT4dKvxna+RXoD4e2HOPM
xpqOf2okkuP84GW6p7F+78nbN2rISsgJBuSZAgMBAAGjgbAwga0wDwYDVR0TBAgwBgEB/wIBADBH
BgNVHSAEQDA+MDwGC2CGSAGG+EUBBwEBMC0wKwYIKwYBBQUHAgEWH3d3dy52ZXJpc2lnbi5jb20v
cmVwb3NpdG9yeS9SUEEwMQYDVR0fBCowKDAmoCSgIoYgaHR0cDovL2NybC52ZXJpc2lnbi5jb20v
cGNhMS5jcmwwCwYDVR0PBAQDAgEGMBEGCWCGSAGG+EIBAQQEAwIBBjANBgkqhkiG9w0BAQIFAAOB
gQACfZ5vRUs4oLje6VNkIbzkTCuPHv6SQKzYCjlqoTIhLAebq1n+0mIafVU4sDdz3PQHZmNiveFT
cFKH56jYUulbLarh3s+sMVTUixnI2COo7wQrMn0sGBzIfImoLnfyRNFlCk10te7TG5JzdC6JOzUT
cudAMZrTssSr51a+i+P7FTCCBG4wggPXoAMCAQICEHVSEkSwaMGQqBn42JfI4swwDQYJKoZIhvcN
AQEEBQAwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29y
cC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIElu
ZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwHhcNMDQwMzMxMDAwMDAw
WhcNMDQwNTMwMjM1OTU5WjCCARIxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZW
ZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRv
cnkvUlBBIEluY29ycC4gYnkgUmVmLixMSUFCLkxURChjKTk4MR4wHAYDVQQLExVQZXJzb25hIE5v
dCBWYWxpZGF0ZWQxJzAlBgNVBAsTHkRpZ2l0YWwgSUQgQ2xhc3MgMSAtIE1pY3Jvc29mdDEbMBkG
A1UEAxQSTWljaGFlbCBXIE1hcnRpbmV6MSgwJgYJKoZIhvcNAQkBFhltbWFydGluZXpAY3NyZWVz
LnVzZGEuZ292MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDP8igN90vaT6lovSjRLN8iWdiS
3AzhttuGdNfyW6+FVO5saCoerZwjw9BXONyLLmXVrkBEj4+SkWk/MncgOn9NJjPjPf4OAg/vHuAg
btSGPmycxRhlYgMeFH/XTQ6iTCOrB5SuSLlIER0GhjX24g3nEhIKhbdR0V0c3PRFKB0wswIDAQAB
o4IBBjCCAQIwCQYDVR0TBAIwADCBrAYDVR0gBIGkMIGhMIGeBgtghkgBhvhFAQcBATCBjjAoBggr
BgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL0NQUzBiBggrBgEFBQcCAjBWMBUWDlZl
cmlTaWduLCBJbmMuMAMCAQEaPVZlcmlTaWduJ3MgQ1BTIGluY29ycC4gYnkgcmVmZXJlbmNlIGxp
YWIuIGx0ZC4gKGMpOTcgVmVyaVNpZ24wEQYJYIZIAYb4QgEBBAQDAgeAMDMGA1UdHwQsMCowKKAm
oCSGImh0dHA6Ly9jcmwudmVyaXNpZ24uY29tL2NsYXNzMS5jcmwwDQYJKoZIhvcNAQEEBQADgYEA
BCCZhZkfkyc/UOJvECAdFxweZ+lBXYSRZuo4y5n5CjMPRbX8TkKfVHXBWwrJbUq+GEGYNTCwBstG
aT2IlDBWJ4hPhS1O6HXG2rLNSNMJAVZ9Qvk7pweqcSEYulWRFu1PWLuuuDUoAUDr5qbsB5zfJqki
ZNSodiNgOObB486gy9UxggQ+MIIEOgIBATCB4TCBzDEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4x
HzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5j
b20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYuLExJQUIuTFREKGMpOTgxSDBGBgNVBAMT
P1ZlcmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVhbCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90IFZh
bGlkYXRlZAIQdVISRLBowZCoGfjYl8jizDAJBgUrDgMCGgUAoIICsjAYBgkqhkiG9w0BCQMxCwYJ
KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDA0MDExNTE0MDRaMCMGCSqGSIb3DQEJBDEWBBRZ
0ZzJWYPR0FENsvLI5F4gea6gITBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAK
BggqhkiG9w0CBTCB8gYJKwYBBAGCNxAEMYHkMIHhMIHMMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5j
LjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWdu
LmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UE
AxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3Qg
VmFsaWRhdGVkAhB1UhJEsGjBkKgZ+NiXyOLMMIH0BgsqhkiG9w0BCRACCzGB5KCB4TCBzDEXMBUG
A1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBE
BgNVBAsTPXd3dy52ZXJpc2lnbi5jb20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYuLExJ
QUIuTFREKGMpOTgxSDBGBgNVBAMTP1ZlcmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVhbCBTdWJz
Y3JpYmVyLVBlcnNvbmEgTm90IFZhbGlkYXRlZAIQdVISRLBowZCoGfjYl8jizDANBgkqhkiG9w0B
AQEFAASBgJEx7PmetKa8sQqAlxhCl4uc3lK812sQCXeslddPRGVKPeL9j576F9kigPOa5ZYxJwHt
CcQGhT+0fDUdS+IgBOc5r8Paw+oHq3r1jmsQNeSFyjID+ua33z+WAlVslEBPK7/qPZO1MHg7E7qT
P8kADmgny2JP+TR1HLxJE5bpcDhRAAAAAAAA

------=_NextPart_000_0000_01C417D2.0F97BCB0--

