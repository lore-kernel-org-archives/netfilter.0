From: "Steffen Heil" <lists@steffen-heil.de>
Subject: Two bridges and NAT in one server
Date: Tue, 14 Mar 2006 18:05:16 +0100
Message-ID: <003401c64789$77692930$0b4613ac@shs1>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_002F_01C64791.D8F06120"
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
To: ebtables-user@lists.sourceforge.net, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_002F_01C64791.D8F06120
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I have a fairly complex networking issue with xen, which I need to get
runnning.
My biggest problem obviously does not arise from xen directly, but more from
linux networking, so I assume someone here might be able to help me.

So, here we go:

Given hardware:
I have 1 server with 4 public IPs which need to have the same MAC.
Say, $mac for $ip1, $ip2, $ip3, $ip4. All IPs have subnet /24, with $ip3 and
$ip4 residing in the same subnet, and $ip1 and $ip2 in different subnets
each.

I use the default xen 3.0.1 setup, that creates a bridge, moves the real
eth0 interface to that bridge and create a virtual eth0 in every client.
Now I got the problem, that my provider only accepts ONE MAC. I solved this
using ebtables:

server02:~# ebtables -t nat -L
Bridge table: nat

Bridge chain: PREROUTING, entries: 6, policy: ACCEPT
-p IPv4 -d $mac -i peth0 --ip-dst $2 -j dnat --to-dst 0:16:3e:0:16:1
-p ARP -d $mac -i peth0 --arp-ip-dst $2 -j dnat --to-dst 0:16:3e:0:16:1
-p IPv4 -d $mac -i peth0 --ip-dst $3 -j dnat --to-dst 0:16:3e:0:16:2
-p ARP -d $mac -i peth0 --arp-ip-dst $3 -j dnat --to-dst 0:16:3e:0:16:2
-p IPv4 -d $mac -i peth0 --ip-dst $4 -j dnat --to-dst 0:16:3e:0:16:3
-p ARP -d $mac -i peth0 --arp-ip-dst $4 -j dnat --to-dst 0:16:3e:0:16:3

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

Bridge chain: POSTROUTING, entries: 6, policy: ACCEPT
-p IPv4 -s 0:16:3e:0:16:1 -o peth0 --ip-src $2 -j snat --to-src $mac
-p ARP -s 0:16:3e:0:16:1 -o peth0 --arp-ip-src $2 -j snat --to-src $mac
-p IPv4 -s 0:16:3e:0:16:2 -o peth0 --ip-src $3 -j snat --to-src $mac
-p ARP -s 0:16:3e:0:16:2 -o peth0 --arp-ip-src $3 -j snat --to-src $mac
-p IPv4 -s 0:16:3e:0:16:3 -o peth0 --ip-src $4 -j snat --to-src $mac
-p ARP -s 0:16:3e:0:16:3 -o peth0 --arp-ip-src $4 -j snat --to-src $mac

This is basically SNAT at MAC-level for $ip2, $ip3 and $ip4.
$ip1 is the ip of the host, which inherits it's mac from the real hardware,
which already has $mac.

That works.

Everything until here is (except for MAC-NAT) xen-default. xen creates the
xenbr0 bridge, moves eth0 there (renamed to peth0) and connects a virtual
eth0 in dom0.

Now I finally get to my problem.

I need to create another bridge, that I connect some guests to and that have
private IP addresses. Those should be NATed by the host.

I tried:
- iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -j SNAT
--to-source $ip1
- iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
- iptables -t nat -A POSTROUTING -o peth0 -s 192.168.1.0/24 -j SNAT
--to-source $ip1
- iptables -t nat -A POSTROUTING -o peth0 -j MASQUERADE

None of these work.
I can ping the guests form the host, and connect between them, but not to
the outside world.

If the guest sends DNS-requests, they ARE translated to source=$ip1 and send
out. The DNS-Server replies to $ip1, which I can see tcpdumping the real
eth0. And those packets dest-mac is really $mac, which means they should be
delivered to the host, which should do NAT and forward them to guest.
However, that does not work. The DNS-response never reaches the host, they
do not even apper on tcpdumping the virtual eth0, neighter correctly nor
incorrectly. They simple don't.

Can someone explain me, how I can get NAT working for one bridge, while it
should not work for the other?

(Please, as my mailing list subscription seems not to be completed yet, send
answers as direct copy to me. Thanks.)

Regards,
  Steffen

------=_NextPart_000_002F_01C64791.D8F06120
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
AhoFAKCCAbwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDYwMzE0
MTcwNTE2WjAjBgkqhkiG9w0BCQQxFgQU11CySS58sTxm39FqdMiKa6/EuCIwZwYJKoZIhvcNAQkP
MVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZIhvcNAgUweAYJKwYBBAGCNxAEMWswaTBiMQsw
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECAw96FDB6BgsqhkiG9w0BCRAC
CzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMPehQwDQYJ
KoZIhvcNAQEBBQAEgYBd9Qj/jR7HcGNWhy0Za71b2oMpP3nt0Mj7ytYMP/edgOTlxljbGHgYJ8zq
uB1GOpISl/WDfgVJ+gLNYg/nsR2D0gtVh1VkmasTXp9ujZAIe/z5oH6j863LwPX2BcjK7I223lVH
x0gWLt50yCSknDCmvj6yjWPNhopw0sNv++lCDwAAAAAAAA==

------=_NextPart_000_002F_01C64791.D8F06120--


