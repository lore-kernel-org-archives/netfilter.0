From: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Subject: RE: Instructions on how to redirect port 80 to port 8080
Date: Tue, 17 Feb 2004 14:24:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9908FCB837A50642B74E2BEC198843095CC64B@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary="----=_NextPart_000_0053_01C3F561.C5694830";
	protocol="application/x-pkcs7-signature";
	micalg=SHA1
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
To: Alexis <alexis@attla.net.ar>, Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0053_01C3F561.C5694830
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Seems like it ought to work, but it doesn't. Maybe I should turn
iptables logging on ... Any simple way of doing this? Bear with me, I'm
real new to iptables, I haven't taken the time to learn it yet.

Regards,
 
Michael Martinez
ISTM/CSREES
United States Department of Agriculture
---
This email is signed with my digital signature so that you may verify
the authenticity of the sender.

--> -----Original Message-----
--> From: Alexis [mailto:alexis@attla.net.ar] 
--> Sent: Tuesday, February 17, 2004 2:10 PM
--> To: Netfilter
--> Cc: Martinez, Michael
--> Subject: Re: Instructions on how to redirect port 80 to port 8080
--> 
--> 
--> sorry, my mistake this line is wrong 
--> 
--> change mangle for nat
--> 
--> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
--> x.x.x.x:8080
--> 
--> 
--> 
--> On Tue, 2004-02-17 at 16:04, Alexis wrote:
--> > iptables -t mangle -A PREROUTING -p tcp --dport 80 -j DNAT --to
--> > x.x.x.x:8080
--> > 
--> > could be a start :)
--> > 
--> > 
--> > 
--> > On Tue, 2004-02-17 at 15:55, Martinez, Michael wrote:
--> > > Guys - 
--> > > 
--> > > I'm finding a lack of documentation describing how to 
--> do this. It ought
--> > > to be simple. I know how to do it with ipchains.
--> > > 
--> > > On a redhat linux system using /etc/sysconfig/iptables, 
--> what line(s) do
--> > > I add to /etc/sysconfig/iptables to configure to 
--> redirect all inbound
--> > > port 80 traffic to port 8080 on the same host?
--> > > 
--> > > Thank  you -
--> > > 
--> > > Regards,
--> > >  
--> > > Michael Martinez
--> > > ISTM/CSREES
--> > > United States Department of Agriculture
--> > > ---
--> > > This email is signed with my digital signature so that 
--> you may verify
--> > > the authenticity of the sender.
--> -- 
--> Alexis <alexis@attla.net.ar>
--> 
--> 

------=_NextPart_000_0053_01C3F561.C5694830
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKGTCCAjww
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
cudAMZrTssSr51a+i+P7FTCCBG8wggPYoAMCAQICEHD8Ga/sdmdUIXET5JOiIyMwDQYJKoZIhvcN
AQEEBQAwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29y
cC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIElu
ZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwHhcNMDQwMjA2MDAwMDAw
WhcNMDQwNDA2MjM1OTU5WjCCARMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZW
ZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRv
cnkvUlBBIEluY29ycC4gYnkgUmVmLixMSUFCLkxURChjKTk4MR4wHAYDVQQLExVQZXJzb25hIE5v
dCBWYWxpZGF0ZWQxJzAlBgNVBAsTHkRpZ2l0YWwgSUQgQ2xhc3MgMSAtIE1pY3Jvc29mdDEcMBoG
A1UEAxQTTWljaGFlbCBXLiBNYXJ0aW5lejEoMCYGCSqGSIb3DQEJARYZbW1hcnRpbmV6QGNzcmVl
cy51c2RhLmdvdjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAw3Sav+mTJtEJY34KPyuDG31E
LfhH9NT2hqzWoi/irp3S4RuW0ViUKFxF1gT6oTxW2lcniPVn2Y1BShrblbng2cqxQVwb9ZVbKOwP
mBiMucAl2JvfSnpTOMt8/pHULeviqWh2D+vpD13Pj1och841YAhLVM2maIjCuxavkXBKpF8CAwEA
AaOCAQYwggECMAkGA1UdEwQCMAAwgawGA1UdIASBpDCBoTCBngYLYIZIAYb4RQEHAQEwgY4wKAYI
KwYBBQUHAgEWHGh0dHBzOi8vd3d3LnZlcmlzaWduLmNvbS9DUFMwYgYIKwYBBQUHAgIwVjAVFg5W
ZXJpU2lnbiwgSW5jLjADAgEBGj1WZXJpU2lnbidzIENQUyBpbmNvcnAuIGJ5IHJlZmVyZW5jZSBs
aWFiLiBsdGQuIChjKTk3IFZlcmlTaWduMBEGCWCGSAGG+EIBAQQEAwIHgDAzBgNVHR8ELDAqMCig
JqAkhiJodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9jbGFzczEuY3JsMA0GCSqGSIb3DQEBBAUAA4GB
AIJL0QQOXZAXkAmA8T4rHs4n710i9Izpv8ABBUDLGN9mkSxnW+HJpvnif+3bf4dZBVHXIIlWvpMf
YElZsvlVyGFM7Y6V1N7gufDq9Sk/oVJr0ScT7a4iHMODQqNP+M3elQVBliIQbMtl7RtW3MT2YePx
OUCaPGWG1DWE506KRpaSMYIEPjCCBDoCAQEwgeEwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMu
MR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24u
Y29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQD
Ez9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBW
YWxpZGF0ZWQCEHD8Ga/sdmdUIXET5JOiIyMwCQYFKw4DAhoFAKCCArIwGAYJKoZIhvcNAQkDMQsG
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQwMjE3MTkyNDM2WjAjBgkqhkiG9w0BCQQxFgQU
QNV6RxXRO/KYXTKB9Oj8OxSz45YwZwYJKoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAHBgUrDgMC
GjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgw
CgYIKoZIhvcNAgUwgfIGCSsGAQQBgjcQBDGB5DCB4TCBzDEXMBUGA1UEChMOVmVyaVNpZ24sIElu
Yy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2ln
bi5jb20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYuLExJQUIuTFREKGMpOTgxSDBGBgNV
BAMTP1ZlcmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVhbCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90
IFZhbGlkYXRlZAIQcPwZr+x2Z1QhcRPkk6IjIzCB9AYLKoZIhvcNAQkQAgsxgeSggeEwgcwxFzAV
BgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYw
RAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVmLixM
SUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1YWwgU3Vi
c2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQCEHD8Ga/sdmdUIXET5JOiIyMwDQYJKoZIhvcN
AQEBBQAEgYAUolSh7gPfy9fSNEAvtb+jgBNQaxeiwcyMdwvFxqLBOg5JbpuuT9uMBVOk92iTBWmM
Ym2F07n5fmrjJ3jXWae8qAYodgtzSZNPHF7HtklhvCcy2cUAnxH7+8goExPQNQkb5qRFD09ZX76J
BYI48BrcMozL/BziossspcNfAG2DvwAAAAAAAA==

------=_NextPart_000_0053_01C3F561.C5694830--

