From: Robert Vangel <vangelr@rfgt.net>
Subject: Re: sysctl vs. echo > /proc...
Date: Tue, 31 May 2005 16:24:52 +0800
Message-ID: <429C1F54.1030000@rfgt.net>
References: <429BFCCA.9010505@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050200020103070507040008"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429BFCCA.9010505@riverviewtech.net>
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

This is a cryptographically signed message in MIME format.

--------------ms050200020103070507040008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Taylor, Grant wrote:
> Hey fellow TuX users out there, I have a question for you.
> 
> Does any one know the (technical) difference in using sysctl verses 
> echoing values in to the appropriate areas in side of the /proc file 
> system?  Which is the more current (expected in the future) practice?  
> Any ideas and / or thoughts on this matter would be greatly 
> appreciated.  Consider this very simple and common example:
> 
> sysctl -w net.ipv4.ip_forward=1
> 
> verses
> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> 
> Grant. . . .
> 

I don't think there is any real different between the two methods. 
Really calling sysctl to do it is just another step when using echo 
would do it anyway.

On the other hand, if sysctl can be used to log anything so you can 
possibly reverse any changes may be an idea, but the only things I have 
ever changed (that I can think of) in /proc are ip_forward and 
tcp_conntrack_max, which have been with an echo and then editing 
/etc/sysctl.conf to match.

--------------ms050200020103070507040008
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII5TCC
As0wggI2oAMCAQICAw1u0jANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQxMTE2MDE1MjI0WhcNMDUxMTE2MDE1MjI0
WjBCMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR8wHQYJKoZIhvcNAQkBFhB2
YW5nZWxyQHJmZ3QubmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnVjoXbO/
cCKywUfgl0It0g3E1UdH4Ms8fWUady6f9V5bNSsGow0C3cK2QHBCwX5xKlFy+GzL+a8haJEn
PjhxqhIGuOoV+E0NJksoOqdEp0V0zjmbm9NvlvaYrMILISwYdY9Cq8TivHj3YYa2lLpwO433
4A9t7nulq/qJ1kFqFXzcmFb08+PlANlx0BLZBVxl7lNLgSaKyK1N8u9BqHYj9CZqPB/qAayW
VjkDR73XxKBGoHPjeIZPdoS8hT0QwSVnbczC16Soe+utkfhA3iEuBLlHImRnboa/qsIHFH67
O3lvjlL+7eHN2az85FBdxCfR5I9iLuGkSNlFL1YkQnymJwIDAQABoy0wKzAbBgNVHREEFDAS
gRB2YW5nZWxyQHJmZ3QubmV0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEADcxJ
PQaKXn4ANwxx4jm0WyeCqAfru8U22vFhBANjZ9vQ3wpybj0FbhYbRDCC+3UcjiefwXbTaauc
9AgqEPUWuLPMYBgsQUxF2+G1B+cezBTDcfWBan9/YmXiXCgnW9mHbtac8sSkxFHlf2FH/o1h
FLYvDzReBmRqIPJrhY+hoeYwggLNMIICNqADAgECAgMNbtIwDQYJKoZIhvcNAQEEBQAwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA0MTExNjAx
NTIyNFoXDTA1MTExNjAxNTIyNFowQjEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJl
cjEfMB0GCSqGSIb3DQEJARYQdmFuZ2VsckByZmd0Lm5ldDCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAJ1Y6F2zv3AissFH4JdCLdINxNVHR+DLPH1lGncun/VeWzUrBqMNAt3C
tkBwQsF+cSpRcvhsy/mvIWiRJz44caoSBrjqFfhNDSZLKDqnRKdFdM45m5vTb5b2mKzCCyEs
GHWPQqvE4rx492GGtpS6cDuN9+APbe57pav6idZBahV83JhW9PPj5QDZcdAS2QVcZe5TS4Em
isitTfLvQah2I/Qmajwf6gGsllY5A0e918SgRqBz43iGT3aEvIU9EMElZ23MwtekqHvrrZH4
QN4hLgS5RyJkZ26Gv6rCBxR+uzt5b45S/u3hzdms/ORQXcQn0eSPYi7hpEjZRS9WJEJ8picC
AwEAAaMtMCswGwYDVR0RBBQwEoEQdmFuZ2VsckByZmd0Lm5ldDAMBgNVHRMBAf8EAjAAMA0G
CSqGSIb3DQEBBAUAA4GBAA3MST0Gil5+ADcMceI5tFsngqgH67vFNtrxYQQDY2fb0N8Kcm49
BW4WG0Qwgvt1HI4nn8F202mrnPQIKhD1FrizzGAYLEFMRdvhtQfnHswUw3H1gWp/f2Jl4lwo
J1vZh27WnPLEpMRR5X9hR/6NYRS2Lw80XgZkaiDya4WPoaHmMIIDPzCCAqigAwIBAgIBDTAN
BgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTES
MBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UE
CxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBl
cnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1Ro
YXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAK
MNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTX
p6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYB
Af8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBl
cnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYD
VQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2as
Zw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSe
JVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHT
HUb/XV9lTzGCAzswggM3AgEBMGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAgMNbtIwCQYFKw4DAhoFAKCCAacwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDUwNTMxMDgyNDUyWjAjBgkqhkiG9w0BCQQxFgQUvtqy
s5OTqcSc2H9nbqkcbLaIPTEwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG
9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYB
BAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vpbmcg
Q0ECAw1u0jB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAgMNbtIwDQYJKoZIhvcNAQEBBQAEggEAHwgcnVM2cYCrX7hi
lNGQRGsf6bqBzmxASdZY9eXIjVeaP1c6Hqo5mrf3vdoxIXb35swTdBaXn8g7PYegUSpOvzdK
UBtKKC+y9VSB8SBuiIDCMzsP6TPC3tzyyncKBXzkvCw4nvKM5DQ9rwzaLZSddlhqdMbK7u7m
84jxHU07PqGwCVYLtjF3rv2k9/sNjV4vxJeRK+CyImLUlnr0SngeG0iHs1Fha4EGRcC9/CJF
oVaVvR+wG6TZYTHdsQDbdM9NjEkYXsO1dCOg3NZ8vUPiuxS4b1ZgtH2j57Q4g1xnf9FpayN2
R34r+hjToTmaivguHJIS2OQQ5wp7I2rkkuS4HwAAAAAAAA==
--------------ms050200020103070507040008--

