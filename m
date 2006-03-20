From: "Steffen Heil" <lists@steffen-heil.de>
Subject: RE: Daisy Chaining two computers?
Date: Mon, 20 Mar 2006 18:31:09 +0100
Message-ID: <006901c64c44$13d8a4d0$0b4613ac@shs1>
References: <200603201452.43715@nienna>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=SHA1;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0064_01C64C4C.75120AE0"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200603201452.43715@nienna>
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
To: 'KOVACS Krisztian' <hidden@balabit.hu>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0064_01C64C4C.75120AE0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

>   If you don't have a shortage of (internal) IP addresses, 
> then use software bridging on the linux box. It's very easy 
> to set up and completely transparent.

You don't need more IPs that would be Nat.
Since both systems shall act, as if they were directly connected to the
network, you want a switch / bridge.

I would recommend using a hardware switch, as is gives you more ports at
very low prices nowadays and you can reboot the linux system independent of
your windows box.
If there is a reason that you cannot use a real hardware switch, you can use
a linux software bridge. It will basicly be identical to a hardware switch,
but switch ports are more limited and the linux box must be running all the
time. Even reboots will (shortly) interrupt the network connection of you
other box.

However, if you don't plan to use the linux box as hardware firewall in
front of windows, then there is no benefit and I would definitely pefer a
real hardware switch.

And be warned, that when running as a bridge, the mac of you windows station
will still be seen at the network (remeber the linux bridge acts as a real
hardware switch).

Regards,
  Steffen

------=_NextPart_000_0064_01C64C4C.75120AE0
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
AhoFAKCCAbwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDYwMzIw
MTczMTA5WjAjBgkqhkiG9w0BCQQxFgQU3OTXbODa+MKXN+6z5PZg+ALDZoswZwYJKoZIhvcNAQkP
MVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZIhvcNAgUweAYJKwYBBAGCNxAEMWswaTBiMQsw
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECAw96FDB6BgsqhkiG9w0BCRAC
CzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMPehQwDQYJ
KoZIhvcNAQEBBQAEgYBud2EpDuu4uCBM7lry2JUB02Rvy8FVWwyyGh7ZFcJ8eqsLS/5zVH4AVIax
v5pvDL6OivnjuRAye016qT1H0BVgjLtym7u+GcxQHxhGsCksl3KUOaK1kf9z8/DVNpJgcIW0YFrP
r1HrZk9ooLHhuLezFcPdVipd5STozWCOwA2YEwAAAAAAAA==

------=_NextPart_000_0064_01C64C4C.75120AE0--


