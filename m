From: Michael Eck <meck@chilitech.net>
Subject: CONNMARK No chain/target/match problem
Date: Fri, 25 Jun 2004 14:16:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BA19D698-C6D3-11D8-B530-000A95D9C698@chilitech.net>
Mime-Version: 1.0 (Apple Message framework v618)
Content-Type: multipart/signed; micalg=sha1; boundary=Apple-Mail-2-358501011; protocol="application/pkcs7-signature"
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


--Apple-Mail-2-358501011
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

Greetings,
I'm unable to get CONNMARK rules to work.  Issuing
# iptables -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
yields:
# iptables: No chain/target/match by that name

Now, I've loaded ip_conntrack module with
# modprobe ip_conntrack
lsmod indicates that the module is loaded

I'm running Debian 3.0, with a 2.4.24 Kernel that has 
CONFIG_IP_NF_CONNTRACK=m, CONFIG_IP_NF_MATCH_CONNTRACK=m, 
iptables-1.2.11, bridging and ebtables, and, from what I've read
all of the other relevant modules.
The kernel and iptables are patched with patch-o-matic-ng-20040621 
(pending).

My ultimate goal is to build a bandwidth management box with ipp2p.  
All of the other features seem to work (HTB and ipp2p).

What does it seem like I'm missing?

----
Michael Eck
Chilitech Internet Solutions
Network Operations Center
570-323-2166
http://www.chilitech.net
--Apple-Mail-2-358501011
Content-Transfer-Encoding: base64
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Disposition: attachment;
	filename=smime.p7s

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIGGDCCAtEw
ggI6oAMCAQICAwwg8TANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhh
d3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDQwNDE0MTgwNDI4WhcNMDUwNDE0MTgwNDI4WjBEMR8wHQYDVQQD
ExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMSEwHwYJKoZIhvcNAQkBFhJtZWNrQGNoaWxpdGVjaC5u
ZXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCI16OJTyBPkRKO3WxdV9aNkxPuVA4
koiHX8FFdagvXD+H1ahkouGix0yGQFeoJQvOzg5glF5Uo6gNX/1bDkj0rLtFrIAB1yUECXdMXbp5
RW89mwZMkFILWs+ieQEC4YthOjw2dsLnnYnz06NgxGVWjl+h5LLRy4iX2rPeNKnJubf87H9j+e68
Wy52vJ3ak7JBhYBXasGdnRqA/pTTDkC5hGVl4Cdecic6Kii/1VzU4ydflLrW76hQ5wWeLDGMzZG0
f8lfafe/G7hCSCggplk3ifu9sdb93t02iZJgDfzuSYVp2e9sKJd4d5grj0lNgCZ/MM9cip7Qy+7m
5eUOD0IPAgMBAAGjLzAtMB0GA1UdEQQWMBSBEm1lY2tAY2hpbGl0ZWNoLm5ldDAMBgNVHRMBAf8E
AjAAMA0GCSqGSIb3DQEBBAUAA4GBAGXU08rSAqR06cN+y5h5KJLi+3HQ4uS5koGPYxjW6imhMrzr
i133du6bf7DXGHtnmRV4im/B2bgDxVPWIdnQy7QwFkf6ZSJ/yNIQbKFO0y2oKopad4LGz5PtPFv+
pdWlYN6iX+DmrxXB3IM92m2xOjy8xPIxGfRYXIJikIuGjmvRMIIDPzCCAqigAwIBAgIBDTANBgkq
hkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UE
BxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlm
aWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAz
MDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0
ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1
BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fx
H5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wID
AQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2Ny
bC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkG
A1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOB
gQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZ
foSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4
gtwhGTXeJLHTHUb/XV9lTzGCAucwggLjAgEBMGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVl
bWFpbCBJc3N1aW5nIENBAgMMIPEwCQYFKw4DAhoFAKCCAVMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQwNjI1MTgxNjA2WjAjBgkqhkiG9w0BCQQxFgQUr802DBV0
C0WssRdyYK4nmwyfyncweAYJKwYBBAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMc
VGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZy
ZWVtYWlsIElzc3VpbmcgQ0ECAwwg8TB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMMIPEwDQYJKoZIhvcNAQEBBQAEggEAop51B8ih
4he+BTsgQmrcUTons19G8i/GDriqKmFzqyOX6lF85MmAslsEZJCUNF6zs0JCOF4vk9XH0mhfoedA
md0YlxJwWYmk4GKL6ZNyP+U0ib+MmJdFMX6A2f00p07UQAgNI/g78MhF7Ioh2HWDKdnGrS+Fw3bL
BXM+hkE92CrMv+oGabP+zSsZil7/qKGo4IYYhtV2ByKJMO48bUg79dXm1lllXV6RkGUEwFZYGXxq
cUcjoFnMi/fl7uQ/QgZ0xoTn+USC/DYBksYEPbrNQ+LHOGY7czo3rjCZboJY78L4S8qmxz2knYXb
HlwPeQpGB2WrCH8AlxQTLKqO1PBtZgAAAAAAAA==

--Apple-Mail-2-358501011--


