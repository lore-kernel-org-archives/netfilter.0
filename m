From: "Luiz Fernando T. Campos" <ryche@multibroker.com.br>
Subject: --set-mark limit
Date: Tue, 18 Jun 2002 15:31:06 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0F7C6A.BED7E33F@multibroker.com.br>
References: <20020618130639.2ec22286.mt@open2web.com> <200206181802.g5II2pA29007@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms2C21B3BA17677B008DE83E55"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.samba.org>

This is a cryptographically signed message in MIME format.

--------------ms2C21B3BA17677B008DE83E55
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hello guys,

I have several links to limit the bandwidth,
so I need to know what is the maximum value
for the --set-mark value in the mangle table

I need something near a thousand diferent marks

like this one:
iptables -t mangle -A OUTPUT -o eth0 -p tcp -s ..... --dport smtp -j MARK --set-mark 0811
iptables -t mangle -A OUTPUT -o eth1 -p tcp --sport smtp -d ..... -j MARK --set-mark 0812

why the numbers are so high?

1) there are SEVERAL partitions to be made.
2) the numbers are related with the service being limited for better administration.

I use TC from iproute2 and iptables 1.26a kernel 2.4.18

if someone knows that it will work or if I need a patch, 
I'll be very thankfull.




-- 
Luiz Fernando T. Campos
Sys Admin
Multibroker S/A
ryche@multibroker.com.br

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: PGP 6.5.8

mQENAzsAMEIAAAEIAN/mqLpQ3tWJiXFJB/xvISaA7iKcEq2PrSnu9jx9xGV50sLI
DaAFn5aPSXyWAYwHQz83srwkPbsxbKLCGiCLIaGq4Q9LClomuaBt6vtZvsE1fOyq
EcYZBYRgu6PBYzrsvhHwsZb98h2Rxj1OaRYnCfjiVqiOrtmFe7j62mrDYO7mdtvL
DRLNF5eyHoqzTMCneAimwt8FK3mLH71j/pJTbsLkViynOX6H+qlJcVT+Oeh4/zcy
l2HSsSy+ygiAyZWQ64dhiAvMAPcgnn2e3wXFuwzAX0ff9cO3qQmNH47x/7IS2og1
vHkAL2oQVsx3yAvXGbBikQgOd6YSpcV2xt216dkABRG0EHJ5Y2hlQHVvbC5jb20u
YnKJARUDBRA7ADBCpcV2xt216dkBAc0gB/4ma/OGKgIpZcVsLsLAacxW4r/wKsHS
1vyXdxzbp1hO+Py4Uh7CgCFE4jsL9iGaIfhnjudPIbJGYuGFFRVrq1d4NnYI1D8c
10xH9WqK7k1K7nMe/Jeirkr/RHFC/OF80/Q0qlgdRYYNpkjvkf98RWbfhAgJTqbB
73x8cgtt0fIS3yRczUA1V2wWRk1usHojl6pzqnmBqPQPavy8OYnBjw6r2/gJO53e
KQLWqIRqsC+gEYaGxnL3wspG4NudfdupxtzBMrLwA6qmpmCgCDDFoGc7dpahd9vd
hR7ID7YdA7mmO/ulSuXyZMUdkSARhqMDno5KdwS3UXYzzM5D9u2poOfE
=/ZNV
-----END PGP PUBLIC KEY BLOCK-----
--------------ms2C21B3BA17677B008DE83E55
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIH6AYJKoZIhvcNAQcCoIIH2TCCB9UCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
BbswggKKMIIB86ADAgECAgMHgPEwDQYJKoZIhvcNAQEEBQAwgZIxCzAJBgNVBAYTAlpBMRUw
EwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEPMA0GA1UEChMGVGhh
d3RlMR0wGwYDVQQLExRDZXJ0aWZpY2F0ZSBTZXJ2aWNlczEoMCYGA1UEAxMfUGVyc29uYWwg
RnJlZW1haWwgUlNBIDIwMDAuOC4zMDAeFw0wMjA1MjAxMzAzMDZaFw0wMzA1MjAxMzAzMDZa
MEoxHzAdBgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBNZW1iZXIxJzAlBgkqhkiG9w0BCQEWGHJ5
Y2hlQG11bHRpYnJva2VyLmNvbS5icjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwt9T
NOuyLnMI6U4/lEw6KKk8IIqT7cdG4r0+vQIgXPonPRvITewUGhM7hB78yuUu90U+39exemOd
oeEWcA2+iwh+pP+ePT0OeDIfPQCFgvj//HFMP5PbkvqN9ZWD0mRRQUucX008IJumc5PzPUst
bNUMTxGBAdQfGvRwXrAPbqMCAwEAAaM1MDMwIwYDVR0RBBwwGoEYcnljaGVAbXVsdGlicm9r
ZXIuY29tLmJyMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAeY5+m11FvGwji5Yr
3tLbapmdzY0sVvD0gnTEcXvJYGP7+0kvJBPwaK2DZ1biHDhreSI8cJU9u7qoRz8M67O0jKjs
uH/hUXZBJu25wrnU6wwt41+arz41onrp2/QJv0YCTQbD8QeSo/Kx8L9SqgUTcVGjW3aJJ+3C
NEpaw0LX83kwggMpMIICkqADAgECAgEMMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJa
QTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoT
EVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG
9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDAwODMwMDAwMDAwWhcN
MDIwODI5MjM1OTU5WjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTES
MBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmlj
YXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMw
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDeMzKmY8cJJUU+0m54J2eBxdqIGYKXDuNE
KYpjNSptcDz63K737nRvMLwzkH/5NHGgo22Y8cNPomXbDfpL8dbdYaX5hc1VmjUanZJ1qCeu
2HL5ugL217CR3hzpq+AYA6h8Q0JQUYeDPPA5tJtUihOH/7ObnUlmAC0JieyUa+mhaQIDAQAB
o04wTDApBgNVHREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMS0yOTcwEgYDVR0T
AQH/BAgwBgEB/wIBADALBgNVHQ8EBAMCAQYwDQYJKoZIhvcNAQEEBQADgYEAcxtvJmWL/xU0
S1liiu1EvknH6A27j7kNaiYqYoQfuIdjdBxtt88aU5FL4c3mONntUPQ6bDSSrOaSnG7BIwHC
CafvS65y3QZn9VBvLli4tgvBUFe17BzX7xe21Yibt6KIGu05Wzl9NPy2lhglTWr0ncXDkS+p
lrgFPFL83eliA0gxggH1MIIB8QIBATCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdl
c3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNV
BAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBS
U0EgMjAwMC44LjMwAgMHgPEwCQYFKw4DAhoFAKCBsTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcN
AQcBMBwGCSqGSIb3DQEJBTEPFw0wMjA2MTgxODMxMDZaMCMGCSqGSIb3DQEJBDEWBBSCpdJm
vQT21xMu4TkMu5C81UlvmzBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDAHBgUrDgMCBzANBggqhkiG9w0DAgIBQDANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASBgFhGOFcax1M7VV6muc2e8cIklNjHk+KvX2zI8DQzPv4nspEWhsb4+tv5Uvpz
wRaNDlwVVsSki64doMkeVyDqpxU9RluEF2vDy+CXK9YCtCFq8zAX0Mmz6/o247y2fYw8xrPj
3xg5ddf6CFLOY6AhU3m23ePWeGNVgr5QMH0TI8pC
--------------ms2C21B3BA17677B008DE83E55--


