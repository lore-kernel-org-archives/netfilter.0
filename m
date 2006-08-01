From: "Steffen Heil" <lists@steffen-heil.de>
Subject: Host not reachable problem
Date: Tue, 1 Aug 2006 18:43:06 +0200
Message-ID: <008901c6b589$9241ca50$0b4613ac@shs1>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0084_01C6B59A.539829F0"
Return-path: <netfilter-bounces@lists.netfilter.org>
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

This is a multi-part message in MIME format.

------=_NextPart_000_0084_01C6B59A.539829F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I have a server, which has 68 IPs. 4 for it's own network interfaces and a
network of 64 addresses for xen domains and vpn.
Now, only some of these domains are live and only some VPN clients online.
As such, only some IPs will be available, ohters will not.

For every available IP there is an entry in the routing table like this:
<singleIP> 0.0.0.0         255.255.255.255 UH    0      0        0
<virtualinterface>

Moreover there is a default route:
0.0.0.0         <ispgateway>   0.0.0.0         UG    0      0        0 eth0

ip_forward contains 1

Now, packets for IPs that are offline right now, are routed to the main ip
of my server, which is suppost to forward them.
This works for systems that are online.

However, packets for hosts wich are not online are routed by via the default
route.
What I would need is a routing table entry which routes my /26-network to
"host not reachable" and which has a lower priority than my explizit routing
rules.
How can I do that?

Regards,
  Steffen


BTW: Where can I set ip_forward for the next reboot?

------=_NextPart_000_0084_01C6B59A.539829F0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII4jCCAmow
ggHToAMCAQICAw96FDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhh
d3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDUwOTE0MDkwNTU3WhcNMDYwOTE0MDkwNTU3WjBeMQ0wCwYDVQQE
EwRIZWlsMRAwDgYDVQQqEwdTdGVmZmVuMRUwEwYDVQQDEwxTdGVmZmVuIEhlaWwxJDAiBgkqhkiG
9w0BCQEWFWxpc3RzQHN0ZWZmZW4taGVpbC5kZTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
uhwOMnpx6Ie9JOoTWutK0H8GiSwMjIjPeTX3HKqrTemKEau/CXGiAYb5+ramEl7Ul7ByMNe8Blr+
S/TLcCzy3am70jITkR75/HAeryopzZ+MIce7MY96Gm2cZkm6soJ+cpbm31/mqvVwMqWo6KqQ/YOb
fJCIbqg4I8wbrXlsh5sCAwEAAaMyMDAwIAYDVR0RBBkwF4EVbGlzdHNAc3RlZmZlbi1oZWlsLmRl
MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAZO5k8jD7PY1yKyFLCgSEd+iOZce9CGmP
/TcwuB4z5S1VDmURtquZU64K2q3JQV8BAN9q2SGm+Q7eUjEh71MEXxi/vuWX0Bc7GjNx2EZzaSTQ
Ot8Cl3EXwNuvJjS8jWQOrRgW4jNKYUx6+WUgSz8n6ImUZdT1x/1ep0gDDqu0QCMwggMtMIIClqAD
AgECAgEAMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYD
VQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVy
c29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0
ZS5jb20wHhcNOTYwMTAxMDAwMDAwWhcNMjAxMjMxMjM1OTU5WjCB0TELMAkGA1UEBhMCWkExFTAT
BgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUg
Q29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIG
A1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25h
bC1mcmVlbWFpbEB0aGF3dGUuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUadfUsJRk
W3HpR9gMUbbqcpGwhF59LQ2PexLfhSV1KHQ6QixjJ5+Ve0vvfhmHHYbqo925zpZkGsIUbkSsfOaP
6E0PcR9AOKYAo4d49vmUhl6t6sBeduvZFKNdbnp8DKVLVX8GGSl/npom1Wq7OCQIapjHsdqjmJH9
edvlWsQcuQIDAQABoxMwETAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBBAUAA4GBAMfskn5O
+PWWpWdiKqTwTRFg0G+NYFhhrCa7UjVcCM8w+6hKloofYkIjjBcP9LpknBesRynfnZhe0mxgcVyi
rNx54+duAEcftQ0o6AKd5Jr9E/Sm2Xyx+NxfIyYJkYBz0BQb3kOpgyXy5pwvFcr+pquKB3WLDN1R
hGvk+NHOd6KBMIIDPzCCAqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkEx
FTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3
dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEk
MCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJz
b25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVow
YjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU
5VAKMNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTX
p6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8C
AQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFs
RnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2
YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aU
nX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5
jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCAs8wggLLAgEB
MGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4x
LDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMPehQwCQYFKw4D
AhoFAKCCAbwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDYwODAx
MTY0MzA1WjAjBgkqhkiG9w0BCQQxFgQU7g1tKHYGxzBt/WdA6CDgoVNPlPUwZwYJKoZIhvcNAQkP
MVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZIhvcNAgUweAYJKwYBBAGCNxAEMWswaTBiMQsw
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECAw96FDB6BgsqhkiG9w0BCRAC
CzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMPehQwDQYJ
KoZIhvcNAQEBBQAEgYAQnzwyJCSagTM/M+Fp+XIfUMyEYRhlvip6YI+vQb+3t80ZYuHzAX9bIrI9
IH0LryN+X/hXDtNGHpwLwGhsqFILYHz5aQeoWkTiXx+4b5DC7Qutj/xHJZKwiCE7a8bOXXduYbHh
iOAUeagzzjLSKm9yxHgTZYtuAa9EkKhjLUCR2AAAAAAAAA==

------=_NextPart_000_0084_01C6B59A.539829F0--


