From: Thomas Jacob <jacob@internet24.de>
Subject: Re: conntrack generates UDP 'ghost traffic'
Date: Fri, 16 Oct 2009 11:56:03 +0200
Message-ID: <1255686963.25297.22.camel@enterprise.ims-firmen.de>
References: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1; protocol="application/x-pkcs7-signature"; boundary="=-8iTq2GO6KPeYI/yBb+QC"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Roderick Groesbeek <r.groesbeek@triple-it.nl>
Cc: netfilter@vger.kernel.org


--=-8iTq2GO6KPeYI/yBb+QC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-10-15 at 18:23 +0200, Roderick Groesbeek wrote:
> Hi list,
>=20
> We have a situation where the result is that UDP traffic is flooded to al=
l our ports on our switch infrastructure.
>=20
> Situation:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Android <-> {wifi} <-> Linux Nat <-> Tiss (Triple streaming server produc=
t)
>=20
> We have an ESTABLISHED TCP connection...
>=20
> [root@pollux conntrack-tools-0.9.13 ]# conntrack -L -p tcp --dport 554
> tcp      6 405224 ESTABLISHED src=3D192.168.14.57 dst=3D93.187.9.29 sport=
=3D54148 dport=3D554 packets=3D11 bytes=3D1733 src=3D93.187.9.29 dst=3D213.=
132.176.3 sport=3D554 dport=3D54148 packets=3D7 bytes=3D1877 [ASSURED] mark=
=3D0 secmark=3D0 use=3D1
> conntrack v0.9.13 (conntrack-tools): 1 flow entries have been shown.
>=20
> And running UDP connections with it...
> [root@pollux conntrack-tools-0.9.13 ]# cat nf_conntrack|grep 93.187.9.29|=
grep udp
> ipv4     2 udp      17 178 src=3D192.168.14.57 dst=3D93.187.9.29 sport=3D=
8634 dport=3D13104 packets=3D3 bytes=3D120 src=3D93.187.9.29 dst=3D213.132.=
176.3 sport=3D13104 dport=3D8634 packets=3D100514 bytes=3D34886806 [ASSURED=
] mark=3D0 secmark=3D0 use=3D1
> ipv4     2 udp      17 179 src=3D192.168.14.57 dst=3D93.187.9.29 sport=3D=
8632 dport=3D13102 packets=3D3 bytes=3D120 src=3D93.187.9.29 dst=3D213.132.=
176.3 sport=3D13102 dport=3D8632 packets=3D333066 bytes=3D266119819 [ASSURE=
D] mark=3D0 secmark=3D0 use=3D1
> ipv4     2 udp      17 28 src=3D93.187.9.29 dst=3D213.132.176.3 sport=3D1=
3105 dport=3D8635 packets=3D6251 bytes=3D525064 [UNREPLIED] src=3D213.132.1=
76.3 dst=3D93.187.9.29 sport=3D8635 dport=3D13105 packets=3D0 bytes=3D0 mar=
k=3D0 secmark=3D0 use=3D1
> ipv4     2 udp      17 29 src=3D93.187.9.29 dst=3D213.132.176.3 sport=3D1=
3103 dport=3D8633 packets=3D28080 bytes=3D2358680 [UNREPLIED] src=3D213.132=
.176.3 dst=3D93.187.9.29 sport=3D8633 dport=3D13103 packets=3D0 bytes=3D0 m=
ark=3D0 secmark=3D0 use=3D1
> [root@pollux conntrack-tools-0.9.13 ]#=20
> (Btw the RTCP are UNREPLIED, that's probably because the android is not s=
ending RTCP back? At least not on the same ports?)
>=20
> But the SOURCE is dead!
> [root@pollux conntrack-tools-0.9.13 ]# ping  -w 3 192.168.14.57
> PING 192.168.14.57 (192.168.14.57) 56(84) bytes of data.
> --- 192.168.14.57 ping statistics ---
> 4 packets transmitted, 0 received, 100% packet loss, time 2999ms
> [root@pollux conntrack-tools-0.9.13 ]#
> [root@pollux conntrack-tools-0.9.13 ]# arp -na |grep 192.168.14.57
> [root@pollux conntrack-tools-0.9.13 ]#
>=20
> Problem:
> =3D=3D=3D=3D=3D=3D=3D=3D
> In this situation the UDP traffic is flooded through our SWITCH infrastru=
cture!
>=20
>=20
> Question:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> How can we avoid this?

Not that I fully understand your setup from your description, but unless
you are doing something with broadcasts/multicasts (which I don't see
from your post):

Assuming that pollux is the NAT router, Tiss has IP 192.168.14.57, the
public IP of your NAT router is 213.132.176.3  and the Anroid device has
IP 93.187.9.29, the most likely cause of the flood is that the standard
algorithm of Ethernet switches is sending your packets out to all ports
because the switch has not learned a source port for the MAC you are
sending your packets to (i.e. the MAC of pollux), which=20
usually only happens when the switch does not receive any packets from
that MAC (i.e. your NAT router). This should be visible in the station
table of your switch.=20

And since you cannot even do ARP resolution for Tiss from pollux, there
is definitely something blocking communications. You should investigate
what that something is...



--=-8iTq2GO6KPeYI/yBb+QC
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
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDkxMDE2MDk1NjAzWjAj
BgkqhkiG9w0BCQQxFgQUZ66bNBrRvwdI7WqnJdtmZq9rt+UwgdQGCSsGAQQBgjcQBDGBxjCBwzCB
rjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwG
A1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVz
dC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBF
bWFpbAIQUm95zy8GFYGF+32iLTim8jCB1gYLKoZIhvcNAQkQAgsxgcaggcMwga4xCzAJBgNVBAYT
AlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2FsdCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBV
U0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMYaHR0cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYD
VQQDEy1VVE4tVVNFUkZpcnN0LUNsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgRW1haWwCEFJvec8v
BhWBhft9oi04pvIwDQYJKoZIhvcNAQEBBQAEgcCR8Rby1eDXoiORMLZeXvxF4XEjqoyXw4ISVT5y
/WkjlaANgttk0iWGtkbh2tZyEa/EM//b9kPCY9mOzNPfBv45lN8pB1/r7sJOFsEYoQV6ZZZgex+W
kNUzW8yM8xoheZyWGz0FT7jywuxeRHzj+ld0A4cjTUYRg0UfjPDPm97efZ14FJnSGeIuToP/80wm
B7c82BYBgXK9Ev/YAaUpeF8REsT2iR321z+ZEJxfvz3IrYctDFucV34/uCus0TCPlWsAAAAAAAA=


--=-8iTq2GO6KPeYI/yBb+QC--

