From: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Subject: RE: Re: Ports closed in spite of opening them?
Date: Fri, 2 Apr 2004 11:11:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9908FCB837A50642B74E2BEC198843095CC776@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Type: multipart/signed;
	micalg=SHA1;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0010_01C418A3.368CF5C0"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Hurley, Michael" <MHurley@law.uconn.edu>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0010_01C418A3.368CF5C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

You sure sendmail isn't listening on just the loopback? Do netstat -an.

Michael Martinez
Unix System Administrator
-----Original Message-----
From: Hurley, Michael [mailto:MHurley@law.uconn.edu] 
Sent: Friday, April 02, 2004 11:04 AM
To: 'netfilter@lists.netfilter.org'
Subject: RE: Re: Ports closed in spite of opening them?

Yes, sendmail is listening on port 25; apache on port 443. However, I am not
able to connect to them. Here is what nmap reports:
Interesting ports on x.x.x.x:
(The 1597 ports scanned but not shown below are in state: filtered)
Port       State       Service
22/tcp     open        ssh
25/tcp     closed      smtp
80/tcp     open        http
443/tcp    closed      https

Nmap run completed -- 1 IP address (1 host up) scanned in 235 seconds


-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, April 02, 2004 10:29 AM
To: netfilter@lists.netfilter.org
Subject: Fwd: Re: Ports closed in spite of opening them?


On Friday 02 April 2004 4:09 pm, Hurley, Michael wrote:

> Trying to write an iptables script to open ports 22, 25, 80, and 443 on a
> little testing box. The problem is, when I scan for open ports, 25 and 443
> report they are *closed*. Any idea what might be going on here?

Do you have services actually listening on those ports?   Can you connect to
them from a suitable client running on the machine you did the port scan
from?

Regards,

Antony.

--
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the
list;
                                                     please don't CC me.





------=_NextPart_000_0010_01C418A3.368CF5C0
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
KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDA0MDIxNjExMTRaMCMGCSqGSIb3DQEJBDEWBBQ4
sM65Y+t6r5BbvZmMIEbenB315TBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3
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
AQEFAASBgLDvr2bB9wNkMZrWmCFTS+23czCHiGs1DeHn27rTvQdN8CqOmGdu5uodZjOg5lTZWvj+
TvPE7Itc8cB+tFAm5gmeNDxmlNIZXCv3/S18r2yQr1msp9kDFv4DvT0oT8ifgeP/whdvvlN/R8/3
cu9CAeDpRVqPB//rh0PRXsAQ4YVkAAAAAAAA

------=_NextPart_000_0010_01C418A3.368CF5C0--

