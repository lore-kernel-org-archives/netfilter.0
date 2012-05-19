From: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Subject: Packet dropped without reason
Date: Sat, 19 May 2012 19:12:22 +0000
Message-ID: <EDD810CD654E254F90731B425DE8AA6F106B5ADC@dc2008r2.sh-solutions.intern>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0008_01CD3604.1A9A47A0"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_NextPart_000_0008_01CD3604.1A9A47A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I follow a ping through my gateway with log-commands at the end of each
chain:


Receiving a echo request on eth1 and forwarding it encrypted to a gateway on
eth0 works as expected:
(Although nat_OUTPUT is missing between step 9 and 10 and nat_POSTROUTING is
missing after step 11 compared to http://inai.de/images/nf-packet-flow.png,
but I expect this to be correct, as I do not use nat.)

1. May 19 18:58:11 vpn-a kernel: [ 4396.217687] raw_PREROUTING: IN=eth1 OUT=
MAC=00:16:3e:0f:01:01:00:16:3e:0f:03:00:08:00 SRC=10.1.1.2 DST=10.2.1.2
LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=41230
SEQ=1

2. May 19 18:58:11 vpn-a kernel: [ 4396.217702] mangle_PREROUTING: IN=eth1
OUT= MAC=00:16:3e:0f:01:01:00:16:3e:0f:03:00:08:00 SRC=10.1.1.2 DST=10.2.1.2
LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=41230
SEQ=1 MARK=0x1

3. May 19 18:58:11 vpn-a kernel: [ 4396.217710] nat_PREROUTING: IN=eth1 OUT=
MAC=00:16:3e:0f:01:01:00:16:3e:0f:03:00:08:00 SRC=10.1.1.2 DST=10.2.1.2
LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=41230
SEQ=1 MARK=0x1

4. May 19 18:58:11 vpn-a kernel: [ 4396.217725] mangle_FORWARD: IN=eth1
OUT=eth0 MAC=00:16:3e:0f:01:01:00:16:3e:0f:03:00:08:00 SRC=10.1.1.2
DST=10.2.1.2 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=41230 SEQ=1 MARK=0x1

5. May 19 18:58:11 vpn-a kernel: [ 4396.217732] filter_FORWARD: IN=eth1
OUT=eth0 MAC=00:16:3e:0f:01:01:00:16:3e:0f:03:00:08:00 SRC=10.1.1.2
DST=10.2.1.2 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=41230 SEQ=1 MARK=0x1

6. May 19 18:58:11 vpn-a kernel: [ 4396.217739] mangle_POSTROUTING: IN=
OUT=eth0 SRC=10.1.1.2 DST=10.2.1.2 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF
PROTO=ICMP TYPE=8 CODE=0 ID=41230 SEQ=1 MARK=0x1

7. May 19 18:58:11 vpn-a kernel: [ 4396.217744] nat_POSTROUTING: IN=
OUT=eth0 SRC=10.1.1.2 DST=10.2.1.2 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF
PROTO=ICMP TYPE=8 CODE=0 ID=41230 SEQ=1 MARK=0x1

8. May 19 18:58:11 vpn-a kernel: [ 4396.217769] raw_OUTPUT: IN= OUT=eth0
SRC=10.5.0.1 DST=10.5.0.2 LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=ESP SPI=0xc509ff52 MARK=0x1

9. May 19 18:58:11 vpn-a kernel: [ 4396.217776] mangle_OUTPUT: IN= OUT=eth0
SRC=10.5.0.1 DST=10.5.0.2 LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=ESP SPI=0xc509ff52 MARK=0x1

10. May 19 18:58:11 vpn-a kernel: [ 4396.217781] filter_OUTPUT: IN= OUT=eth0
SRC=10.5.0.1 DST=10.5.0.2 LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=ESP SPI=0xc509ff52 MARK=0x1

11. May 19 18:58:11 vpn-a kernel: [ 4396.217786] mangle_POSTROUTING: IN=
OUT=eth0 SRC=10.5.0.1 DST=10.5.0.2 LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=ESP SPI=0xc509ff52 MARK=0x1


Receiving the encrypted echo reply on eth0 and decrypting it works as well,
but it does not get forwarded as expected:
(nat_PREROUTING is missing between steps 2 and 3 compared to
http://inai.de/images/nf-packet-flow.png, but again, I don't use nat so I
think this is correct.)

1. May 19 18:58:11 vpn-a kernel: [ 4396.218074] raw_PREROUTING: IN=eth0 OUT=
MAC=00:16:3e:0f:01:00:00:16:3e:0f:02:00:08:00 SRC=10.5.0.2 DST=10.5.0.1
LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=5897 PROTO=ESP SPI=0xc0321da6

2. May 19 18:58:11 vpn-a kernel: [ 4396.218082] mangle_PREROUTING: IN=eth0
OUT= MAC=00:16:3e:0f:01:00:00:16:3e:0f:02:00:08:00 SRC=10.5.0.2 DST=10.5.0.1
LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=5897 PROTO=ESP SPI=0xc0321da6 MARK=0x1

3. May 19 18:58:11 vpn-a kernel: [ 4396.218090] mangle_INPUT: IN=eth0 OUT=
MAC=00:16:3e:0f:01:00:00:16:3e:0f:02:00:08:00 SRC=10.5.0.2 DST=10.5.0.1
LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=5897 PROTO=ESP SPI=0xc0321da6 MARK=0x1

4. May 19 18:58:11 vpn-a kernel: [ 4396.218097] filter_INPUT: IN=eth0 OUT=
MAC=00:16:3e:0f:01:00:00:16:3e:0f:02:00:08:00 SRC=10.5.0.2 DST=10.5.0.1
LEN=152 TOS=0x00 PREC=0x00 TTL=64 ID=5897 PROTO=ESP SPI=0xc0321da6 MARK=0x1

5. May 19 18:58:11 vpn-a kernel: [ 4396.218120] raw_PREROUTING: IN=eth0 OUT=
MAC=00:16:3e:0f:01:00:00:16:3e:0f:02:00:08:00 SRC=10.2.1.2 DST=10.1.1.2
LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=60912 PROTO=ICMP TYPE=0 CODE=0 ID=41230
SEQ=1

6. May 19 18:58:11 vpn-a kernel: [ 4396.218129] mangle_PREROUTING: IN=eth0
OUT= MAC=00:16:3e:0f:01:00:00:16:3e:0f:02:00:08:00 SRC=10.2.1.2 DST=10.1.1.2
LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=60912 PROTO=ICMP TYPE=0 CODE=0 ID=41230
SEQ=1

But that's all. It never reaches mangle_FORWARD as expected.


My setup is below.
I don't understand why that packet does not get routed...
Can someone here tell me why?

Best regards,
  Steffen



# ip rule list
0:      from all lookup local
1:      from all fwmark 0x1 lookup 100
220:    from all lookup 220
32766:  from all lookup main
32767:  from all lookup default

# ip route list table 100
default via 10.5.0.2 dev eth0  proto static  src 10.1.1.1

# ip route list table 220
(empty)
4
# ip route list
default via 192.168.178.100 dev eth3
10.1.1.0/24 dev eth1  proto kernel  scope link  src 10.1.1.1
10.1.2.0/24 dev eth2  proto kernel  scope link  src 10.1.2.1
10.5.0.0/24 dev eth0  proto kernel  scope link  src 10.5.0.1
192.168.178.0/24 dev eth3  proto kernel  scope link  src 192.168.178.1

iptables (all chains ACCEPT) has only these rules (except for logging at the
end):
-t raw -A PREROUTING -j MARK --set-xmark 0x0/0xffffffff
-t mangle -A PREROUTING -s 10.1.1.0/24 -d 10.2.1.0/24 -j MARK --set-xmark
0x1/0xffffffff
-t mangle -A PREROUTING -p esp -j MARK --set-xmark 0x1/0xffffffff

# ip x s
src 10.5.0.1 dst 10.5.0.2
        proto esp spi 0xc509ff52 reqid 1 mode tunnel
        replay-window 32 flag af-unspec
        mark 1/0xffffffff
        auth-trunc hmac(sha1) 0xfb8cd76020e5bd6e78134961052af497cfbe819e 96
        enc cbc(aes) 0xbd46ce27cadc3f34930c39bd9abd5eb1
src 10.5.0.2 dst 10.5.0.1
        proto esp spi 0xc0321da6 reqid 1 mode tunnel
        replay-window 32 flag af-unspec
        mark 1/0xffffffff
        auth-trunc hmac(sha1) 0xebda4251938915491005779d63e31f4d0a42c34a 96
        enc cbc(aes) 0x48611761f98b6f260ce6db52923bd183

# ip x p
src 10.2.1.0/24 dst 10.1.1.0/24
        dir fwd priority 1859
        mark 1/0xffffffff
        tmpl src 10.5.0.2 dst 10.5.0.1
                proto esp reqid 1 mode tunnel
src 10.2.1.0/24 dst 10.1.1.0/24
        dir in priority 1859
        mark 1/0xffffffff
        tmpl src 10.5.0.2 dst 10.5.0.1
                proto esp reqid 1 mode tunnel
src 10.1.1.0/24 dst 10.2.1.0/24
        dir out priority 1859
        mark 1/0xffffffff
        tmpl src 10.5.0.1 dst 10.5.0.2
                proto esp reqid 1 mode tunnel
src ::/0 dst ::/0
        socket in priority 0
src ::/0 dst ::/0
        socket out priority 0
src ::/0 dst ::/0
        socket in priority 0
src ::/0 dst ::/0
        socket out priority 0
src ::/0 dst ::/0
        socket in priority 0
src ::/0 dst ::/0
        socket out priority 0
src 0.0.0.0/0 dst 0.0.0.0/0
        socket in priority 0
src 0.0.0.0/0 dst 0.0.0.0/0
        socket out priority 0
src 0.0.0.0/0 dst 0.0.0.0/0
        socket in priority 0
src 0.0.0.0/0 dst 0.0.0.0/0
        socket out priority 0
src 0.0.0.0/0 dst 0.0.0.0/0
        socket in priority 0
src 0.0.0.0/0 dst 0.0.0.0/0
        socket out priority 0



------=_NextPart_000_0008_01CD3604.1A9A47A0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIVSzCCBjQw
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
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIHQjCCBiqg
AwIBAgIDAqMfMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTEwNjA5MDgzMzUxWhcNMTIwNjA4MTYyMzU5WjBsMSAwHgYDVQQNExc0NDQxNzIta3d6aTlFTjdL
NHkzcjlDUjELMAkGA1UEBhMCREUxFTATBgNVBAMTDFN0ZWZmZW4gSGVpbDEkMCIGCSqGSIb3DQEJ
ARYVbGlzdHNAc3RlZmZlbi1oZWlsLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
1oGotqRB0h1VpIlAMYCbzPdFuug68ljvU5ZbbWZ+MjjIUhdAj9LUA88zcR28FW33LfMh/Qjd5eAW
6kjKOrf8NrxS6jqa5SO8K9pBqcnDMIOMucF6A4gyJ2SRdwTwCLeyerb1oyqVSUhE+1hjVs99KFbp
r61CBDNiGUra+FVbp2Lmi/ArrHVdKxe3pVOGn+iyvnGDXOa1sdzqb9Cd3uwKTkq7yaQsdEBSgujD
o/QbFwF21qS4LajJL3DYy1vWXtRM8ZjRAik2mZN7Dw8rBPd4GNbVAFg+yiOOr0u9RdTqUaRyRt6E
KsbND85YikTuX44vqhObi2Xw66NisnJsTs4SDQIDAQABo4IDyjCCA8YwCQYDVR0TBAIwADALBgNV
HQ8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBS6m1vC7bnw
j+eboJ/LAFSljTdhmjAfBgNVHSMEGDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAgBgNVHREEGTAX
gRVsaXN0c0BzdGVmZmVuLWhlaWwuZGUwggI7BgNVHSAEggIyMIICLjCCAioGCysGAQQBgbU3AQIC
MIICGTAuBggrBgEFBQcCARYiaHR0cDovL3d3dy5zdGFydHNzbC5jb20vcG9saWN5LnBkZjA0Bggr
BgEFBQcCARYoaHR0cDovL3d3dy5zdGFydHNzbC5jb20vaW50ZXJtZWRpYXRlLnBkZjCCARAGCCsG
AQUFBwICMIIBAjAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgEBGoHWVGhp
cyBjZXJ0aWZpY2F0ZSB3YXMgaXNzdWVkIGFjY29yZGluZyB0byB0aGUgU3RhcnRTU0wgV2ViLW9m
LVRydXN0IENvbW11bml0eSBWYWxpZGF0aW9uIHJlcXVpcmVtZW50cyBvZiB0aGUgU3RhcnRDb20g
Q0EgcG9saWN5LCByZWxpYW5jZSBvbmx5IGZvciB0aGUgaW50ZW5kZWQgcHVycG9zZSBpbiBjb21w
bGlhbmNlIG9mIHRoZSByZWx5aW5nIHBhcnR5IG9ibGlnYXRpb25zLjCBnAYIKwYBBQUHAgIwgY8w
JxYgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwAwIBAhpkTGlhYmlsaXR5IGFuZCB3
YXJyYW50aWVzIGFyZSBsaW1pdGVkISBTZWUgc2VjdGlvbiAiTGVnYWwgYW5kIExpbWl0YXRpb25z
IiBvZiB0aGUgU3RhcnRDb20gQ0EgcG9saWN5LjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
LnN0YXJ0c3NsLmNvbS9jcnR1MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkGCCsGAQUFBzAB
hi1odHRwOi8vb2NzcC5zdGFydHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2EwQgYIKwYBBQUH
MAKGNmh0dHA6Ly9haWEuc3RhcnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xpZW50LmNhLmNy
dDAjBgNVHRIEHDAahhhodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZIhvcNAQEFBQADggEB
ACVqcEaYWZGf96GPfhJ8HgFYuQkAIRpLqUfVtaH8A8iZyCbtqafsYKrqihNpe6L5VImIOPuc01TJ
e/6ec0N+eYc3j8G8kT+hpoBebxL914TNov4b7JbnHer+YdBb36tds+JKReY3H2PQo1R0fHuZSCGz
vo1qCDQslgeUAV61qHBAURO6D3LW2nD8loQyzFa0Dq44wkH/QmbIJkTTpH3k6mLTBUeaV/WocaW3
0Ow6QErb8leC+iOBvvXw2HTgW62n7Xd8PGD+6Vo0MVAwVagqR0AQkcGEPV9d7/ZeKJDnbCnbSmKE
n7tO3h9aP/qMPTzzIjXvyDUeFfnxGSbmmeoTiagwggfJMIIFsaADAgECAgEBMA0GCSqGSIb3DQEB
BQUAMH0xCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1
cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMSkwJwYDVQQDEyBTdGFydENvbSBDZXJ0aWZp
Y2F0aW9uIEF1dGhvcml0eTAeFw0wNjA5MTcxOTQ2MzZaFw0zNjA5MTcxOTQ2MzZaMH0xCzAJBgNV
BAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBD
ZXJ0aWZpY2F0ZSBTaWduaW5nMSkwJwYDVQQDEyBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhv
cml0eTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMGI2wm8bEZ8eJ+Ve7UzkPJyYtbB
NiAiJF7O6XfyQwqiBmSkzI42+DjmI/BubbE83XKjhRyh0z20MyvTL6/+6rBBWWe2xAZ9Cp50hdZ5
TIA3et85BVJZ9/QbRkOk0oWF0sNx83ViNLosin8ej+7tNNARx5bNUj26M9bdTd4LO0pLn8ImL/q1
FhxyNXfKPF3myuEmixo2dlwB23QUJf7ttaCID914yi0fB5cwAS1yefpG1hMqqLmmq4NJHeXy793k
AY4YCo9jUxaFYqkOGTrMtWamwmt0B+Qr4XY+tG3Y9kThc2IfO8S+oFNWJWxRCfeqq8q/dv1tm/Od
2789ZrwMVqqvmEiVOkvfp1hQ2Th1qVvqQwwC/5nr6GxNcFspZZzdql3MrwEx7Azr0o3o6px75m73
J2YMGkjXbkLjP94hPnvhDXD7Y6qobBpUtFwlesmiyYsWprssfhdeBU1YbhIdAe4SEA3GMn8Y//z0
+s1ukeg2Sb4aSGmLwpZNGhKyaRfBCpDW+nkiSL+6e2n4cMf6ejfY2A3Sdk9X/5C345HS3e/CYLdn
Ot3+qpzw1It/ciLOxp+XtviviqAQqNn7GMa2tVxSPIm2GSpzAQoPA7MSYPJ6L4Hbo27/JjCX9Yvd
iVe2rT2zryvFt3YC8KXWK5qGFCpy9uMzjF0JSxPfu4x0E1JLAgMBAAGjggJSMIICTjAMBgNVHRME
BTADAQH/MAsGA1UdDwQEAwIBrjAdBgNVHQ4EFgQUTgvvGqRAW6UXaYcwyjRoQ9BBrvIwZAYDVR0f
BF0wWzAsoCqgKIYmaHR0cDovL2NlcnQuc3RhcnRjb20ub3JnL3Nmc2NhLWNybC5jcmwwK6ApoCeG
JWh0dHA6Ly9jcmwuc3RhcnRjb20ub3JnL3Nmc2NhLWNybC5jcmwwggFdBgNVHSAEggFUMIIBUDCC
AUwGCysGAQQBgbU3AQEBMIIBOzAvBggrBgEFBQcCARYjaHR0cDovL2NlcnQuc3RhcnRjb20ub3Jn
L3BvbGljeS5wZGYwNQYIKwYBBQUHAgEWKWh0dHA6Ly9jZXJ0LnN0YXJ0Y29tLm9yZy9pbnRlcm1l
ZGlhdGUucGRmMIHQBggrBgEFBQcCAjCBwzAnFiBTdGFydCBDb21tZXJjaWFsIChTdGFydENvbSkg
THRkLjADAgEBGoGXTGltaXRlZCBMaWFiaWxpdHksIHJlYWQgdGhlIHNlY3Rpb24gKkxlZ2FsIExp
bWl0YXRpb25zKiBvZiB0aGUgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgUG9saWN5
IGF2YWlsYWJsZSBhdCBodHRwOi8vY2VydC5zdGFydGNvbS5vcmcvcG9saWN5LnBkZjARBglghkgB
hvhCAQEEBAMCAAcwOAYJYIZIAYb4QgENBCsWKVN0YXJ0Q29tIEZyZWUgU1NMIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MA0GCSqGSIb3DQEBBQUAA4ICAQAWbJn0Zgw09dCFXn0K7NoQTjgcXt+mJQVL
kTLB6DvxPd1ECVsHSYopy2YCt7Ga9yWYCTyOG+HdNocrS7to0zlmPaAmx/I5kR1Rq4J7ftXOWuTi
A1dwaZcI+V5YpgrfjAaaRRYWOApeV/Zix3oCBea8HrXynvSpKYP4shTjbiiHRMOQGt44qTysQ01k
Rc7dKKlc8nN7BPgX6Kux8y5cZG5zMToSuLyzEeR9j4FRmjuNifRNk2Z7PAPt05odmvNlUPWg0HWf
L6/w6oJDmPhpnIl5xEOORnLjZDYSr/clHjiJkHd+w2tqucPLREuseJCL58csHksRRMg0UifNCl2f
hcGJ1Rp48pUQUzLdgIRmddm1aCj7YS6+hKg4wJkShqUeZ2StBi4vqXCFx5YPfIll9Y5DVA6r3aWA
OZRgwDTJlnAsoxL1H0h7vRx+a7edkPQiO674/CrK+oJSoO+vS1WT68G18CKLrDROJiIEoYcsdUq3
5X0T17gMZMA20skvhhKMIwnBG4I7c0mjaleHlOXWeMWZQ2PjTeB3LeFlmXJpBBpHCeYPAVYk+x+/
DnmpWC65xAkBfpW6bQAGPrLqShA52NAr9b/sdb+XAsUJGwjcVTfigfs3hENiIMrnVktl6v5swSST
JKE06wX/miKum30/8WVRCqYwarP0iByADfxyiuiDXjGCBB0wggQZAgEBMIGUMIGMMQswCQYDVQQG
EwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2Vy
dGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVy
bWVkaWF0ZSBDbGllbnQgQ0ECAwKjHzAJBgUrDgMCGgUAoIICXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xMjA1MTkxOTEyMzFaMCMGCSqGSIb3DQEJBDEWBBRno3dY
iHAj0kR45v8dOD1+z7zyNDCBpQYJKwYBBAGCNxAEMYGXMIGUMIGMMQswCQYDVQQGEwJJTDEWMBQG
A1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUg
U2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBD
bGllbnQgQ0ECAwKjHzCBpwYLKoZIhvcNAQkQAgsxgZeggZQwgYwxCzAJBgNVBAYTAklMMRYwFAYD
VQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBT
aWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENs
aWVudCBDQQIDAqMfMIGrBgkqhkiG9w0BCQ8xgZ0wgZowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMAcGBSsOAwIHMA0GCCqG
SIb3DQMCAgFAMA0GCCqGSIb3DQMCAgEoMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQME
AgIwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJ/Obw4TzKg9oEtC6OVx2XRFGTfrJ+oV
MdtOWMAfGeZjuk4uuW2Z3otZoK2SsLb/MD/bwD8C8aM7Xmr06LN/eJsfzvvfsVtVyavXFm4ryf9x
YvocoSnSp4jjSD7KMVNv09+ItShroHsDUfW6DZlTL7y0TlUNYPxWfBflupZ3U99ZyGAUx68EMj2E
nsanq5ACkbr2HvLIkjD5pzziJ4T/LmHWjM96+icoPmKmHpq3jWiiheN3XHe39ZTkRyDFCLdVxzOu
KmUmI2VrXIcJwrnxZHTC7vQ/fikl76hzf19EyOHtIA1GzA8E4CMyY773g26hpLAP6++LryjS4+Pf
q7bmaVIAAAAAAAA=

------=_NextPart_000_0008_01CD3604.1A9A47A0--
