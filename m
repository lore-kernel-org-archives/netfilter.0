From: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Subject: AW: How to mark packet by reqid?
Date: Wed, 16 May 2012 06:34:56 +0000
Message-ID: <EDD810CD654E254F90731B425DE8AA6F106B55B1@dc2008r2.sh-solutions.intern>
References: <EDD810CD654E254F90731B425DE8AA6F106B555B@dc2008r2.sh-solutions.intern>
 <alpine.LNX.2.01.1205160116330.17751@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0009_01CD333E.C7795920"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1205160116330.17751@frira.zrqbmnf.qr>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_NextPart_000_0009_01CD333E.C7795920
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi


First, thanks for the answer, but I am stuck with those:


> xt_esp generates debug output if you have "printk" sysctl set to show it.

How would I do so? I never used sysctl for anything but enabling ip
forwarding....


Second: Below is the current output of `ip -s xfrm policy`, `ip -s xfrm
sate` and `setkey -D`.
I noticed, 
- `ip -s xfrm policy` contains "proto esp spi 0x00000000(0)".
- `setkey -D` contains "spi=3243547107(0xc15499e3)".
- `ip -s xfrm state` contains "esp spi 0xc4b51d18(3300203800)".

Is this to be expected?


Third, I tried you command:

# iptables -t mangle -A PREROUTING -p esp --spi 0xcdfebb11 -j MARK
--set-mark 1
iptables v1.4.12: Gives: unknown option "--spi"

# iptables -t mangle -A PREROUTING -p esp -m espspi --spi 0xcdfebb11 -j MARK
--set-mark 1
iptables v1.4.12: policy match: neither --dir in nor --dir out specified

# iptables -t mangle -A PREROUTING -p esp -m policy --spi 0xcdfebb11 --dir
out -j MARK --set-mark 1
iptables: Invalid argument. Run `dmesg' for more information.

# iptables -t mangle -A PREROUTING -p esp -m policy --spi 0xcdfebb11 --dir
in -j MARK --set-mark 1

That worked, however I still don't get the packets through.

Because of the different spi information mentioned above, I also tried:

# iptables -t mangle -A PREROUTING -p esp -m policy --spi 0xcdfebb11 --dir
in -j MARK --set-mark 1

Same result: Accepted but not matched.
I can still get it to work removing the conditions, so everything else is
fine:

# iptables -t mangle -A PREROUTING --proto esp -j MARK --set-mark 1


I am still stuck and very thankful for every hint...


Regards,
  Steffen




# setkey -D
10.5.0.1 10.5.0.2
        esp mode=tunnel spi=3243547107(0xc15499e3) reqid=1(0x00000001)
        E: aes-cbc  49e40f42 d0df7e1e 7202ad2e c45110bd
        A: hmac-sha1  afa4eefd b81a952d 68f9cf88 3287715b 3d4ae624
        seq=0x00000000 replay=32 flags=0x00000000 state=mature
        created: May 16 06:02:36 2012   current: May 16 06:16:15 2012
        diff: 819(s)    hard: 1200(s)   soft: 896(s)
        last: May 16 06:12:04 2012      hard: 0(s)      soft: 0(s)
        current: 21168(bytes)   hard: 0(bytes)  soft: 0(bytes)
        allocated: 252  hard: 0 soft: 0
        sadb_seq=1 pid=11397 refcnt=0
10.5.0.2 10.5.0.1
        esp mode=tunnel spi=3456023313(0xcdfebb11) reqid=1(0x00000001)
        E: aes-cbc  d5bcb28b 0378d65a 97ac2757 1afa6ff8
        A: hmac-sha1  1eeb8605 db1f4cc9 c3a4dc22 1a3306d2 b9928a9c
        seq=0x00000000 replay=32 flags=0x00000000 state=mature
        created: May 16 06:02:36 2012   current: May 16 06:16:15 2012
        diff: 819(s)    hard: 1200(s)   soft: 1014(s)
        last: May 16 06:12:04 2012      hard: 0(s)      soft: 0(s)
        current: 2100(bytes)    hard: 0(bytes)  soft: 0(bytes)
        allocated: 25   hard: 0 soft: 0
        sadb_seq=0 pid=11397 refcnt=0


# ip -s  xfrm policy
src 10.2.1.0/24 dst 10.1.1.0/24 uid 0
        dir fwd action allow index 1530 priority 1859 share any flag
(0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2012-05-16 06:16:40 use -
        mark 1/0xffffffff
        tmpl src 10.5.0.2 dst 10.5.0.1
                proto esp spi 0x00000000(0) reqid 1(0x00000001) mode tunnel
                level required share any
                enc-mask ffffffff auth-mask ffffffff comp-mask ffffffff
src 10.2.1.0/24 dst 10.1.1.0/24 uid 0
        dir in action allow index 1520 priority 1859 share any flag
(0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2012-05-16 06:16:40 use -
        mark 1/0xffffffff
        tmpl src 10.5.0.2 dst 10.5.0.1
                proto esp spi 0x00000000(0) reqid 1(0x00000001) mode tunnel
                level required share any
                enc-mask ffffffff auth-mask ffffffff comp-mask ffffffff
src 10.1.1.0/24 dst 10.2.1.0/24 uid 0
        dir out action allow index 1513 priority 1859 share any flag
(0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2012-05-16 06:16:40 use 2012-05-16 06:24:57
        mark 1/0xffffffff
        tmpl src 10.5.0.1 dst 10.5.0.2
                proto esp spi 0x00000000(0) reqid 1(0x00000001) mode tunnel
                level required share any
                enc-mask ffffffff auth-mask ffffffff comp-mask ffffffff


# ip -s  xfrm state
src 10.5.0.1 dst 10.5.0.2
        proto esp spi 0xc4b51d18(3300203800) reqid 1(0x00000001) mode tunnel
        replay-window 32 seq 0x00000000 flag af-unspec (0x00100000)
        mark 1/0xffffffff
        auth-trunc hmac(sha1) 0x597784c0a0905a2346a797daaa79145e17b1a2ca
(160 bits) 96
        enc cbc(aes) 0xd44a6ec5f13010267a2d145f9564b75e (128 bits)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 884(sec), hard 1200(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          49476(bytes), 589(packets)
          add 2012-05-16 06:16:40 use 2012-05-16 06:16:41
        stats:
          replay-window 0 replay 0 failed 0
src 10.5.0.2 dst 10.5.0.1
        proto esp spi 0xc2f9a112(3271139602) reqid 1(0x00000001) mode tunnel
        replay-window 32 seq 0x00000000 flag af-unspec (0x00100000)
        mark 1/0xffffffff
        auth-trunc hmac(sha1) 0x98af746b619e7d723696b2f67fc46a127fde097a
(160 bits) 96
        enc cbc(aes) 0xef5b3d9a4a0cb8c9cc9787dbba0c7c9c (128 bits)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 907(sec), hard 1200(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2012-05-16 06:16:40 use -
        stats:
          replay-window 0 replay 0 failed 0


------=_NextPart_000_0009_01CD333E.C7795920
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
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xMjA1MTYwNjM0NTlaMCMGCSqGSIb3DQEJBDEWBBRfPZBT
HODFfBeZK0qiquFXzFvLDTCBpQYJKwYBBAGCNxAEMYGXMIGUMIGMMQswCQYDVQQGEwJJTDEWMBQG
A1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUg
U2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBD
bGllbnQgQ0ECAwKjHzCBpwYLKoZIhvcNAQkQAgsxgZeggZQwgYwxCzAJBgNVBAYTAklMMRYwFAYD
VQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBT
aWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENs
aWVudCBDQQIDAqMfMIGrBgkqhkiG9w0BCQ8xgZ0wgZowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMAcGBSsOAwIHMA0GCCqG
SIb3DQMCAgFAMA0GCCqGSIb3DQMCAgEoMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQME
AgIwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKX77F1/OdnqXCVUYmphS1Sta5lQEdkA
BGaCxKxxOEMi4xPlLA4NC4CicybMZHwtrWJysi2HZA0Sk1zZ7AYI59P18Yy/Xtp+hlInz85g+FXz
u4eq29JmfVGFuPzFcqZG2+ennfr/U3oJf2NuHIjlUEpNI3JU3V1efF0bMdSpk4Hx2cXpQ5DX5cgJ
0aq+SwbgjKJrPKpgXyux1EhxuAmT35/uGpZH0ew24APe9Rj0BF97RLc/hS8gRbfY4Z/ZcAokaAmE
Gi23B0X7tWZsvcU2mBTAJ4E/sL4fDkQoY+S/Uwi+wbYru2W+4dIIcMhlevk57B4S+kw3AFQyjixA
acjeGVwAAAAAAAA=

------=_NextPart_000_0009_01CD333E.C7795920--
