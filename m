From: Ron Arts <raarts@netland.nl>
Subject: ASSERT ip_conntrack_core.c:622 &ip_conntrack_lock not readlocked
Date: Wed, 12 Mar 2003 14:09:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E6F3176.4040600@netland.nl>
Reply-To: raarts@office.netland.nl
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms030508020103060704000102"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms030508020103060704000102
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I get this error on kernel 2.4.21pre4 when I boot. RH 2.4.18 didn't have this problem:

Mar 12 14:05:52 n000007 kernel: ASSERT ip_conntrack_core.c:622 &ip_conntrack_lock not readlocked
Mar 12 14:05:52 n000007 last message repeated 2 times
Mar 12 14:05:52 n000007 kernel: unable to load module ip_conntrack_ftp
Mar 12 14:05:52 n000007 kernel: ip_nat_ftp: error registering helper for port 121
Mar 12 14:05:52 n000007 kernel: ASSERT ip_conntrack_core.c:622 &ip_conntrack_lock not readlocked
Mar 12 14:05:52 n000007 nbs-iptables: /lib/modules/2.4.21-0NBS/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
Mar 12 14:05:52 n000007 nbs-iptables: Hint: insmod errors can be caused by incorrect module parameters, including invalid IO
  or IRQ parameters
Mar 12 14:05:52 n000007 nbs-iptables: init_module: Device or resource busy
Mar 12 14:05:52 n000007 nbs-iptables: /lib/modules/2.4.21-0NBS/kernel/net/ipv4/netfilter/ip_nat_ftp.o: insmod /lib/modules/2
.4.21-0NBS/kernel/net/ipv4/netfilter/ip_nat_ftp.o failed
Mar 12 14:05:52 n000007 nbs-iptables: /lib/modules/2.4.21-0NBS/kernel/net/ipv4/netfilter/ip_nat_ftp.o: insmod ip_nat_ftp fai
led

Is this a known problem?

Ron Arts


-- 
Netland Internet Services
bedrijfsmatige internetoplossingen

http://www.netland.nl   Kruislaan 419              1098 VA Amsterdam
info: 020-5628282       servicedesk: 020-5628280   fax: 020-5628281

Unrecoverable Error #666: Armegeddon in 30..29..28..27..

--------------ms030508020103060704000102
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJdjCC
AxkwggKCoAMCAQICAwdzkDANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUx
HTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVl
bWFpbCBSU0EgMjAwMC44LjMwMB4XDTAyMDUxMzEyNDI0OFoXDTAzMDUxMzEyNDI0OFowXDEN
MAsGA1UEBBMEQXJ0czERMA8GA1UEKhMIUm9uIFIuQS4xFjAUBgNVBAMTDVJvbiBSLkEuIEFy
dHMxIDAeBgkqhkiG9w0BCQEWEXJhYXJ0c0BuZXRsYW5kLm5sMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAsz1vQDs+fOlea3WOBrQay1HHCqENWzUhuaMzDYKduzVxGzwNmc7j
HnR0QflErghjp61ihnDQI1EF3NbIlSAne3fiCQ/9i2Ztbtxa1dlhzu3iZzMvCX4MDaIFwgk1
rkdVG2sVZwgjV9nvroVZoV3Mqgh2ev7Cd6USxG9yJ3HFaK/BntOhCnRv52jTPOFqlZfD37FH
XNmllxdmdfD7VKE7ssTr+wq336cm2uqqY0BEiovD1W6gyG2UXDBRo7ExhCroJzzirmsffW09
p5XTdzC5CO3tdYqz5rtUua5ED0AwJGK7WO4YO2jHRSg7jykc+XvSXvL9SdlhKMqeWt1b/im+
XQIDAQABoy4wLDAcBgNVHREEFTATgRFyYWFydHNAbmV0bGFuZC5ubDAMBgNVHRMBAf8EAjAA
MA0GCSqGSIb3DQEBBAUAA4GBABNzXukOa8Lhmw1d12+RvwFORDhX2FEy+iaXkG6RDTcctEuc
QBAebt1ialWEa3MAI5R7xKhkF78W/RilmHbSMr5MX3RfSnmi49n0+rzqtXDygci1PJfZFLSi
cNx8GreiFF9H1id3F0LmJpkc2WEEJxJ5ofKVpXjjrt1MkMm2X8KtMIIDGTCCAoKgAwIBAgID
B3OQMA0GCSqGSIb3DQEBBAUAMIGSMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xDzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2Vy
dGlmaWNhdGUgU2VydmljZXMxKDAmBgNVBAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAw
LjguMzAwHhcNMDIwNTEzMTI0MjQ4WhcNMDMwNTEzMTI0MjQ4WjBcMQ0wCwYDVQQEEwRBcnRz
MREwDwYDVQQqEwhSb24gUi5BLjEWMBQGA1UEAxMNUm9uIFIuQS4gQXJ0czEgMB4GCSqGSIb3
DQEJARYRcmFhcnRzQG5ldGxhbmQubmwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCzPW9AOz586V5rdY4GtBrLUccKoQ1bNSG5ozMNgp27NXEbPA2ZzuMedHRB+USuCGOnrWKG
cNAjUQXc1siVICd7d+IJD/2LZm1u3FrV2WHO7eJnMy8JfgwNogXCCTWuR1UbaxVnCCNX2e+u
hVmhXcyqCHZ6/sJ3pRLEb3InccVor8Ge06EKdG/naNM84WqVl8PfsUdc2aWXF2Z18PtUoTuy
xOv7Crffpyba6qpjQESKi8PVbqDIbZRcMFGjsTGEKugnPOKuax99bT2nldN3MLkI7e11irPm
u1S5rkQPQDAkYrtY7hg7aMdFKDuPKRz5e9Je8v1J2WEoyp5a3Vv+Kb5dAgMBAAGjLjAsMBwG
A1UdEQQVMBOBEXJhYXJ0c0BuZXRsYW5kLm5sMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEE
BQADgYEAE3Ne6Q5rwuGbDV3Xb5G/AU5EOFfYUTL6JpeQbpENNxy0S5xAEB5u3WJqVYRrcwAj
lHvEqGQXvxb9GKWYdtIyvkxfdF9KeaLj2fT6vOq1cPKByLU8l9kUtKJw3Hwat6IUX0fWJ3cX
QuYmmRzZYQQnEnmh8pWleOOu3UyQybZfwq0wggM4MIICoaADAgECAhBmRXK3zHT1z2N2RYTQ
LpEBMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgw
JgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVt
YWlsQHRoYXd0ZS5jb20wHhcNMDAwODMwMDAwMDAwWhcNMDQwODI3MjM1OTU5WjCBkjELMAkG
A1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8w
DQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQD
Ex9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDeMzKmY8cJJUU+0m54J2eBxdqIGYKXDuNEKYpjNSptcDz63K737nRvMLwzkH/5
NHGgo22Y8cNPomXbDfpL8dbdYaX5hc1VmjUanZJ1qCeu2HL5ugL217CR3hzpq+AYA6h8Q0JQ
UYeDPPA5tJtUihOH/7ObnUlmAC0JieyUa+mhaQIDAQABo04wTDApBgNVHREEIjAgpB4wHDEa
MBgGA1UEAxMRUHJpdmF0ZUxhYmVsMS0yOTcwEgYDVR0TAQH/BAgwBgEB/wIBADALBgNVHQ8E
BAMCAQYwDQYJKoZIhvcNAQEEBQADgYEAMbFLR135AXHl9VNsXXnWPZjAJhNigSKnEvgilegb
SbcnewQ5uvzm8iTrkfq97A0qOPdQVahs9w2tTBu8A/S166JHn2yiDFiNMUIJEWywGmnRKxKy
QF1q+XnQ6i4l3Yrk/NsNH50C81rbyjz2ROomaYd/SJ7OpZ/nhNjJYmKtBcYxggMnMIIDIwIB
ATCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJ
Q2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZp
Y2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwAgMHc5AwCQYF
Kw4DAhoFAKCCAWEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
MDMwMzEyMTMwOTEwWjAjBgkqhkiG9w0BCQQxFgQU22WsLiOYnvPD8EaELKstgHPd8WIwUgYJ
KoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga0GCyqGSIb3DQEJEAILMYGdoIGaMIGSMQsw
CQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24x
DzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2VydGlmaWNhdGUgU2VydmljZXMxKDAmBgNV
BAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAwLjguMzACAwdzkDANBgkqhkiG9w0BAQEF
AASCAQBtRpVHfBxM3IkDKqC5QodaXLyM7Fd4NxEGO2b0pMPw9IDWbZlJVAtFlUFndog66sHg
4E6DvYKTfjUNDoUBP+zFWSqS2nm2NvkMtbagNrO3yNNL+8M4nOSq+gcNbVhJJgvCJOFl+wkp
3P78apdoTpJhaQ40lBxs6kXFWNe8Rd3FTgxFl21+Hz1X08Sy616HY0oPyXATw2bf9wvpiox8
TISiIzT/UTaEjvrnnrtLfmlHeQyJNPawLWk/yueTGWkanSGBKpShHLCcJ4xsKnHWXNuoukZy
RiNe8ytPgtaZ7NULa8k7asPZ/TuXUjuI+MCdatMcGKSUQYB3Su2MNJouUwDdAAAAAAAA
--------------ms030508020103060704000102--


