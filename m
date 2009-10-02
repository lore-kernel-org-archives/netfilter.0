From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Using iptables with high volume mail
Date: Fri, 02 Oct 2009 16:52:27 +0200
Message-ID: <1254495147.3326.14.camel@enterprise.ims-firmen.de>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com>
	 <1254412984.11386.63.camel@enterprise.ims-firmen.de>
	 <4AC4DB93.6060707@freemail.hu>
	 <900981.20015.qm@web53108.mail.re2.yahoo.com>
	 <1254486676.19832.20.camel@enterprise.ims-firmen.de>
	 <150303.95092.qm@web53112.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1; protocol="application/x-pkcs7-signature"; boundary="=-RwIiI3ebnW5hkFMI45Mq"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <150303.95092.qm@web53112.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: John Little <jlittle_97@yahoo.com>
Cc: =?ISO-8859-1?Q?G=E1sp=E1r?= Lajos <swifty@freemail.hu>, netfilter@vger.kernel.org


--=-RwIiI3ebnW5hkFMI45Mq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Given your numbers of 8000 cps and the above comments it would seem
that we are well=20
> within any types of overload issues with any decent off the shelf
> server equipped with two dual core CPUs and the necessary memory.
> If I allocate 500 bytes per connection at the max connections I would
> need ~87Mb + machine overhead.  That's not much in today's world of
> servers.

I would say so, unless someone on the list says NAT has completely
different performance requirements from the connection tracking only
machines. But I did do some tests to find the breaking points of
such machines some time ago (see below) and there should
be plenty of resources left for any additional NAT requirements,
given your numbers.

As for memory, we are using 4GB RAM on our high performance machines
access throughput/latency is important here) with a 2GB Kernel / 2G Userspa=
ce-Setup
in order to allow for huge firewall rulesets and to have Linx
user larger default sizes for  various network caches (without us having
to fiddle with the setting).

    Thomas



=3D=3D=3D old test results =3D=3D=3D=3D

[..]

What we did is run a

system A)

CPU Intel=C2=AE XEON(TM) E3110 3000MHz 6MB FSB1333 S775
2x RAM DDR2 2GB PC667 Kingston ECC
NET INTEL Pro1000PT 1GBit 2xRJ45 NIC Dual Server
MBI SuperMicro X7SBi=20
        Intel=C2=AE 3210 + ICH9R Chipset.=20
        Intel=C2=AE 82573V + Intel=C2=AE 82573L
           PCI-E Gigabit Controllers


against

system B)

CPU AMD Opteron 2220 2,8 GHz DualCore Socket F
4XRAM DDr2 1GB PC667 Kingston ECC-Reg CL5 with Parity
   Dual Rank + 2 DDR2 1GB / ECC / CL5 / 667MHz / with Parity / Dual Rank
NET INTEL Pro1000PT 1GBit 2xRJ45 NIC Dual Server
MBA Tyan Thunder h2000m (S3992G3NR-RS) DUAL SKT F
  EATX

I was running pktgen both with generating
a single 64byte/packet UDP-Stream and with 8192 parallel
flows of flowlen 4 with randomization of dst/src ips
and ports (also UPD 64byte/packet) so that the number of conntrack
entries stabilized at almost 512k (most of them timing out
of course).

The result was that the Opteron-System is essential
as fast as the Xeon-System if you have just a
single flow, but for the second, more realistic
test case, the Xeon-System was faster by about 10-20%,
probably due to the much larger CPU-Cache.

RX/TX flow control was enabled, iptables and connection
tracking were loaded. Incoming
and outgoing interface had their smp_affinity set to
single CPU-Core each. Kernel was 2.6.23.14, e1000-drivers
version what was current in Feb 2008.

As a ruleset, I did have 2 chaintrees for 8192 IPs each,
for ingress and egress, each IP had 10 non-matching
rules associated  with it, but this ruleset
was only search for --state  NEW  of course... resulting
in about 13*2=3D26 chain jumps and (13+10)*2=3D46 matches per
NEW packet.
(I had ~32k chains and ~210k rules)

Unfortunately I only have the results for the Xeon-System,
the Opteron-Data got lost somehow ;-(

1 stream / default buffers

eth0:eth1  735kpps

500k streams / default buffers

eth0:eth1 254kpps

But those numbers are obviously not comparable to yours... so...

[..]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D snip  =3D=3D=3D=3D=3D=3D



--=-RwIiI3ebnW5hkFMI45Mq
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIRLTCCBN0w
ggPFoAMCAQICEHGS++YZX6xNEoV0cTSiGKcwDQYJKoZIhvcNAQEFBQAwezELMAkGA1UEBhMCR0Ix
GzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEaMBgGA1UECgwR
Q29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMMGEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczAeFw0w
NDAxMDEwMDAwMDBaFw0yODEyMzEyMzU5NTlaMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMCVVQx
FzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
ITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVROLVVTRVJGaXJz
dC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAsjmFpPJ9q0E7YkY3rs3BYHW8OWX5ShpHornMSMxqmNVNNRm5pELlzkniii8efNIx
B8dOtINknS4p1aJkxIW9hVE1eaROaJB7HHqkkqgX8pgV8pPMyaQylbsMTzC9mKALi+VuG6JG+ni8
om+rWV6lL8/K2m2qL+usobNqqrcuZzWLeeEeaYji5kbNoKXqvgvOdjp6Dpvq/NonWz1zHyLmSGHG
TPNpsaguG7bUMSAsvIKKjqQOpdeJQ/wWWq8dcdcRWdq6hw2v+vPhwvCkxWeM1tZUOt4KpLoDd7Nl
yP0e03RiqhjKaJMeoYV+9Udly/hNVyh00jT/MLbu9mIwFIws6wIDAQABo4IBJzCCASMwHwYDVR0j
BBgwFoAUoBEKIz6W8Qfs4q8p74Klf9AwpLQwHQYDVR0OBBYEFImCZ33EnSZwAEu0UEh83j2uBG59
MA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggr
BgEFBQcDBDARBgNVHSAECjAIMAYGBFUdIAAwewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5j
b21vZG9jYS5jb20vQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwu
Y29tb2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDARBglghkgBhvhCAQEEBAMCAQYw
DQYJKoZIhvcNAQEFBQADggEBAJ2Vyzy4fqUJxB6/C8LHdo45PJTGEKpPDMngq4RdiVTgZTvzbRx8
NywlVF+WIfw3hJGdFdwUT4HPVB1rbEVgxy35l1FM+WbKPKCCjKbI8OLp1Er57D9Wyd12jMOCAU9s
APMeGmF0BEcDqcZAV5G8ZSLFJ2dPV9tkWtmNH7qGL/QGrpxp7en0zykX2OBKnxogL5dMUbtGB8SK
N04g4wkxaMeexIud6H4RvDJoEJYRmETYKlFgTYjrdDrfQwYyyDlWjDoRUtNBpEMD9O3vMyfbOeAU
TibJ2PU54om4k123KSZB6rObroP8d3XK6Mq1/uJlSmM+RMTQw16Hc6mYHK9/FX8wggYiMIIFCqAD
AgECAhBSb3nPLwYVgYX7faItOKbyMA0GCSqGSIb3DQEBBQUAMIGuMQswCQYDVQQGEwJVUzELMAkG
A1UECBMCVVQxFzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNU
IE5ldHdvcmsxITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVRO
LVVTRVJGaXJzdC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMB4XDTA5MDgyNjAwMDAw
MFoXDTExMDgyNjIzNTk1OVowggEqMQswCQYDVQQGEwJERTEOMAwGA1UEERMFMDEwNjkxEDAOBgNV
BAgTB1NhY2hzZW4xEDAOBgNVBAcTB0RyZXNkZW4xGjAYBgNVBAkTEUJheXJpc2NoZSBTdHIuIDE4
MSgwJgYDVQQKEx9JTVMgSW50ZXJuZXQtTWVkaWEtU2VydmljZSBHbWJIMUUwQwYDVQQLEzxJc3N1
ZWQgdGhyb3VnaCBJTVMgSW50ZXJuZXQtTWVkaWEtU2VydmljZSBHbWJIIEUtUEtJIE1hbmFnZXIx
HzAdBgNVBAsTFkNvcnBvcmF0ZSBTZWN1cmUgRW1haWwxFTATBgNVBAMTDFRob21hcyBKYWNvYjEi
MCAGCSqGSIb3DQEJARYTamFjb2JAaW50ZXJuZXQyNC5kZTCB3zANBgkqhkiG9w0BAQEFAAOBzQAw
gckCgcEAnBr8Ofv/KgWvnP7jvCXiVcFjhQ/Tl4ZIvoG6Ku9D+ecI9D+9Rqg6nxv3KbyTtRL75Kws
HYEaIv8NYWQl+nn1VQUZjwq/afE4qsGQEkFu/w3hG8ceOIZt6H2FiLOoF3SeGbhl8K4fSDiLKCBf
KmJhTwYeg+VBUb0lovOjHHL44qasJSl3DXNaezyl79LJOmWqclrxDNOf6fLw7bXJ0K870qDV0gWZ
aOKYvnXfNNnNfd6RzhdBNNgUM4MhmiHA7K0zAgMBAAGjggH/MIIB+zAfBgNVHSMEGDAWgBSJgmd9
xJ0mcABLtFBIfN49rgRufTAdBgNVHQ4EFgQUqH1PlrTv+W5g+fiKAlxT/DO0LaowDgYDVR0PAQH/
BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMEYGA1Ud
IAQ/MD0wOwYMKwYBBAGyMQECAQMFMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9k
by5uZXQvQ1BTMIGlBgNVHR8EgZ0wgZowTKBKoEiGRmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL1VU
Ti1VU0VSRmlyc3QtQ2xpZW50QXV0aGVudGljYXRpb25hbmRFbWFpbC5jcmwwSqBIoEaGRGh0dHA6
Ly9jcmwuY29tb2RvLm5ldC9VVE4tVVNFUkZpcnN0LUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kRW1h
aWwuY3JsMGwGCCsGAQUFBwEBBGAwXjA2BggrBgEFBQcwAoYqaHR0cDovL2NydC5jb21vZG9jYS5j
b20vVVROQUFBQ2xpZW50Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5j
b20wHgYDVR0RBBcwFYETamFjb2JAaW50ZXJuZXQyNC5kZTANBgkqhkiG9w0BAQUFAAOCAQEAXAH3
We4u5Qazu+coCaP0qCQofv8wuGkBprdk24uktrrCSYf2MJIPQefBrOnhTB4Q5+21hoCHkrnJnwdw
e2HlsSClv4dLmEIqle+KNmG8A40yBQqEndAGjgg1gX368nIIb7gUmDbxHXZTn3rLU5B4TY8ip/ao
L9BCUPUCQQGQhzbR5qBv+VlQ8Txkpc3eWHHNlvb4Hpyw5xezfAbcgRNkHsbtJX9+04w8bqKSXBPV
BC/jfXP3Ao03xd8EFBj3Th9mSAldIrExFqBIe4dOLIChVjigZI49lrTlURayawi12JEWJM/sRgrj
MeARHOiPDiuSwFy5KAMszNM1m1S9ImoTkzCCBiIwggUKoAMCAQICEFJvec8vBhWBhft9oi04pvIw
DQYJKoZIhvcNAQEFBQAwga4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2Fs
dCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMYaHR0
cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYDVQQDEy1VVE4tVVNFUkZpcnN0LUNsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgRW1haWwwHhcNMDkwODI2MDAwMDAwWhcNMTEwODI2MjM1OTU5WjCCASox
CzAJBgNVBAYTAkRFMQ4wDAYDVQQREwUwMTA2OTEQMA4GA1UECBMHU2FjaHNlbjEQMA4GA1UEBxMH
RHJlc2RlbjEaMBgGA1UECRMRQmF5cmlzY2hlIFN0ci4gMTgxKDAmBgNVBAoTH0lNUyBJbnRlcm5l
dC1NZWRpYS1TZXJ2aWNlIEdtYkgxRTBDBgNVBAsTPElzc3VlZCB0aHJvdWdoIElNUyBJbnRlcm5l
dC1NZWRpYS1TZXJ2aWNlIEdtYkggRS1QS0kgTWFuYWdlcjEfMB0GA1UECxMWQ29ycG9yYXRlIFNl
Y3VyZSBFbWFpbDEVMBMGA1UEAxMMVGhvbWFzIEphY29iMSIwIAYJKoZIhvcNAQkBFhNqYWNvYkBp
bnRlcm5ldDI0LmRlMIHfMA0GCSqGSIb3DQEBAQUAA4HNADCByQKBwQCcGvw5+/8qBa+c/uO8JeJV
wWOFD9OXhki+gboq70P55wj0P71GqDqfG/cpvJO1EvvkrCwdgRoi/w1hZCX6efVVBRmPCr9p8Tiq
wZASQW7/DeEbxx44hm3ofYWIs6gXdJ4ZuGXwrh9IOIsoIF8qYmFPBh6D5UFRvSWi86Mccvjipqwl
KXcNc1p7PKXv0sk6ZapyWvEM05/p8vDttcnQrzvSoNXSBZlo4pi+dd802c193pHOF0E02BQzgyGa
IcDsrTMCAwEAAaOCAf8wggH7MB8GA1UdIwQYMBaAFImCZ33EnSZwAEu0UEh83j2uBG59MB0GA1Ud
DgQWBBSofU+WtO/5bmD5+IoCXFP8M7QtqjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAd
BgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUw
KzApBggrBgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwgaUGA1UdHwSBnTCB
mjBMoEqgSIZGaHR0cDovL2NybC5jb21vZG9jYS5jb20vVVROLVVTRVJGaXJzdC1DbGllbnRBdXRo
ZW50aWNhdGlvbmFuZEVtYWlsLmNybDBKoEigRoZEaHR0cDovL2NybC5jb21vZG8ubmV0L1VUTi1V
U0VSRmlyc3QtQ2xpZW50QXV0aGVudGljYXRpb25hbmRFbWFpbC5jcmwwbAYIKwYBBQUHAQEEYDBe
MDYGCCsGAQUFBzAChipodHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9VVE5BQUFDbGllbnRDQS5jcnQw
JAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNqYWNvYkBp
bnRlcm5ldDI0LmRlMA0GCSqGSIb3DQEBBQUAA4IBAQBcAfdZ7i7lBrO75ygJo/SoJCh+/zC4aQGm
t2Tbi6S2usJJh/Ywkg9B58Gs6eFMHhDn7bWGgIeSucmfB3B7YeWxIKW/h0uYQiqV74o2YbwDjTIF
CoSd0AaOCDWBffrycghvuBSYNvEddlOfestTkHhNjyKn9qgv0EJQ9QJBAZCHNtHmoG/5WVDxPGSl
zd5Ycc2W9vgenLDnF7N8BtyBE2Qexu0lf37TjDxuopJcE9UEL+N9c/cCjTfF3wQUGPdOH2ZICV0i
sTEWoEh7h04sgKFWOKBkjj2WtOVRFrJrCLXYkRYkz+xGCuMx4BEc6I8OK5LAXLkoAyzM0zWbVL0i
ahOTMYIDuzCCA7cCAQEwgcMwga4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMO
U2FsdCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMY
aHR0cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYDVQQDEy1VVE4tVVNFUkZpcnN0LUNsaWVudCBB
dXRoZW50aWNhdGlvbiBhbmQgRW1haWwCEFJvec8vBhWBhft9oi04pvIwCQYFKw4DAhoFAKCCAg0w
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDkxMDAyMTQ1MjE3WjAj
BgkqhkiG9w0BCQQxFgQUp1bO5H41WLIhrwH/+Ggc/FcuWLAwgdQGCSsGAQQBgjcQBDGBxjCBwzCB
rjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwG
A1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVz
dC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBF
bWFpbAIQUm95zy8GFYGF+32iLTim8jCB1gYLKoZIhvcNAQkQAgsxgcaggcMwga4xCzAJBgNVBAYT
AlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2FsdCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBV
U0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMYaHR0cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYD
VQQDEy1VVE4tVVNFUkZpcnN0LUNsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgRW1haWwCEFJvec8v
BhWBhft9oi04pvIwDQYJKoZIhvcNAQEBBQAEgcAYcce7WOHydRKDZu2m2xOgeWdo6+GOc4dlUyXK
DtiDk9YbnOncMiqcpf3SjyoBmYCzZYaLAh3+E8hy9llBZA9y+tkVSbl3Vw2G+MQ3DpNUZBZ2G4F5
COhaghW/DBl3EDUc9pJ7jA5l1eOnccbJts1tyvTG0FGcw8Y0kpHKWQu08+Zdk9H2ij4U9aHcsFum
zt9EoUXeBtvA3aYembv2OVJQxwvm7yaBCmj7Mlau/qo+fBnCjZrDJsZ8zDJ3lLH0CwcAAAAAAAA=


--=-RwIiI3ebnW5hkFMI45Mq--

