From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: interesting behavior of ftp helper
Date: Sun, 19 Aug 2007 20:14:44 -0300
Message-ID: <46C8CEE4.2050304@solutti.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms020503070303040507000104"
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
To: netfilter ML <netfilter@lists.netfilter.org>

This is a cryptographically signed message in MIME format.

--------------ms020503070303040507000104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable


    Hello Guys,

    I have always read on documentations and messages on this mailing=20
list that the several helpers available for netfilter would 'recognize'=20
some complex protocols and make them became RELATED connections. But on=20
the development of one firewall script, i found an interesting situation.=


    I was running with the following situation:

    forward_interna_externa is the created table that receives all=20
traffic flowing from internal to external network. It has, among several =

others, the following rules:

-A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m tcp=20
--dport 20:21 -j ACCEPT
-A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m state=20
--state RELATED -j ACCEPT
-A forward_interna_externa -j LOG --log-prefix "bloq_forward_externa:"=20
--log-level 6 --log-tcp-sequence --log-tcp-options --log-ip-options
-A forward_interna_externa -j DROP


    ip_conntrack_ftp and ip_nat_ftp modules are correctly loaded.

    So, with these rules and all i have read, i was expecting that 20=20
and 21 TCP ports would handle the active FTP connections and=20
ip_conntrack_ftp+RELATED rule would handle the passive FTP connections.

    But ..... altough i was doing what i tought to be the correct rules=20
and loading the needed modules, i couldnt passive FTP. Active FTP was=20
OK, but passive wasn't. My connections were blocked and no packets were=20
hitting the RELATED rule:

Aug 15 15:20:02 fenix kernel: bloq_forward_externa:IN=3Deth0 OUT=3Deth1=20
SRC=3D192.168.0.54 DST=3D200.182.XX.YY LEN=3D40 TOS=3D0x00 PREC=3D0x00 TT=
L=3D127=20
ID=3D756 DF PROTO=3DTCP SPT=3D1113 DPT=3D4846 SEQ=3D1838929699 ACK=3D3064=
370605=20
WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0

Aug 15 15:20:08 fenix kernel: bloq_forward_externa:IN=3Deth0 OUT=3Deth1=20
SRC=3D192.168.0.54 DST=3D200.182.XX.YY LEN=3D40 TOS=3D0x00 PREC=3D0x00 TT=
L=3D127=20
ID=3D758 DF PROTO=3DTCP SPT=3D1113 DPT=3D4846 SEQ=3D1838929699 ACK=3D3064=
370605=20
WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0


    Altough i always tought that helpers would make 'related'=20
connections became RELATED ones, i made one modification on my firewall=20
rules. The RELATED rule got a 'brother' rule, the ESTABLISHED one:

-A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m tcp=20
--dport 20:21 -j ACCEPT
-A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m state=20
--state RELATED -j ACCEPT
-A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m state=20
--state ESTABLISHED -j ACCEPT
-A forward_interna_externa -j LOG --log-prefix "bloq_forward_externa:"=20
--log-level 6 --log-tcp-sequence --log-tcp-options --log-ip-options
-A forward_interna_externa -j DROP


    And then, passive FTP starts working !!! I could see, with 'iptables =

-nL forward_interna_externa -v' that ESTABLISHED rule was getting hit by =

the passive FTP packets and not the RELATED one. With some more=20
experiences, i tried removing FTP helpers and FTP really stopped working =

because packets werent RELATED not ESTABLISHED. Loading FTP modules made =

packets correctly get identified and were allowed by the ESTABLISHED rule=
=2E

    Question is ..... did i always get wrong about the helpers and=20
RELATED state ??? Is it possible that helper connections get treated as=20
ESTABLISHED ??

    The other theory i got is that only the FIRST packet of a helper=20
identified connection is RELATED and all the other packets that belong=20
to that RELATED connection are indeed ESTABLISHED ones. That would=20
explain this situation i got.

    Where did i get it wrong ?? :)

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it






--------------ms020503070303040507000104
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIRlzCC
BN0wggPFoAMCAQICEHGS++YZX6xNEoV0cTSiGKcwDQYJKoZIhvcNAQEFBQAwezELMAkGA1UE
BhMCR0IxGzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEa
MBgGA1UECgwRQ29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMMGEFBQSBDZXJ0aWZpY2F0ZSBT
ZXJ2aWNlczAeFw0wNDAxMDEwMDAwMDBaFw0yODEyMzEyMzU5NTlaMIGuMQswCQYDVQQGEwJV
UzELMAkGA1UECBMCVVQxFzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUg
VVNFUlRSVVNUIE5ldHdvcmsxITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2
MDQGA1UEAxMtVVROLVVTRVJGaXJzdC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWls
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsjmFpPJ9q0E7YkY3rs3BYHW8OWX5
ShpHornMSMxqmNVNNRm5pELlzkniii8efNIxB8dOtINknS4p1aJkxIW9hVE1eaROaJB7HHqk
kqgX8pgV8pPMyaQylbsMTzC9mKALi+VuG6JG+ni8om+rWV6lL8/K2m2qL+usobNqqrcuZzWL
eeEeaYji5kbNoKXqvgvOdjp6Dpvq/NonWz1zHyLmSGHGTPNpsaguG7bUMSAsvIKKjqQOpdeJ
Q/wWWq8dcdcRWdq6hw2v+vPhwvCkxWeM1tZUOt4KpLoDd7NlyP0e03RiqhjKaJMeoYV+9Udl
y/hNVyh00jT/MLbu9mIwFIws6wIDAQABo4IBJzCCASMwHwYDVR0jBBgwFoAUoBEKIz6W8Qfs
4q8p74Klf9AwpLQwHQYDVR0OBBYEFImCZ33EnSZwAEu0UEh83j2uBG59MA4GA1UdDwEB/wQE
AwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAR
BgNVHSAECjAIMAYGBFUdIAAwewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5jb21vZG9j
YS5jb20vQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwuY29t
b2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDARBglghkgBhvhCAQEEBAMCAQYw
DQYJKoZIhvcNAQEFBQADggEBAJ2Vyzy4fqUJxB6/C8LHdo45PJTGEKpPDMngq4RdiVTgZTvz
bRx8NywlVF+WIfw3hJGdFdwUT4HPVB1rbEVgxy35l1FM+WbKPKCCjKbI8OLp1Er57D9Wyd12
jMOCAU9sAPMeGmF0BEcDqcZAV5G8ZSLFJ2dPV9tkWtmNH7qGL/QGrpxp7en0zykX2OBKnxog
L5dMUbtGB8SKN04g4wkxaMeexIud6H4RvDJoEJYRmETYKlFgTYjrdDrfQwYyyDlWjDoRUtNB
pEMD9O3vMyfbOeAUTibJ2PU54om4k123KSZB6rObroP8d3XK6Mq1/uJlSmM+RMTQw16Hc6mY
HK9/FX8wggZXMIIFP6ADAgECAhEAtQOW9QEF+4D7358uHbrqtDANBgkqhkiG9w0BAQUFADCB
rjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVz
ZXJ0cnVzdC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0
aW9uIGFuZCBFbWFpbDAeFw0wNzA3MjUwMDAwMDBaFw0wODA3MjQyMzU5NTlaMIHwMTUwMwYD
VQQLEyxDb21vZG8gVHJ1c3QgTmV0d29yayAtIFBFUlNPTkEgTk9UIFZBTElEQVRFRDFGMEQG
A1UECxM9VGVybXMgYW5kIENvbmRpdGlvbnMgb2YgdXNlOiBodHRwOi8vd3d3LmNvbW9kby5u
ZXQvcmVwb3NpdG9yeTEfMB0GA1UECxMWKGMpMjAwMyBDb21vZG8gTGltaXRlZDElMCMGA1UE
AxMcTGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaGFlczEnMCUGCSqGSIb3DQEJARYYbGVvbGlz
dGFzQHNvbHV0dGkuY29tLmJyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvmPE
RsBVfxgAuuEeQFqd9PufbFYFkHgS1t+OjeXRxuEMM3J2powPOrd+LQl9n6ufyxT8BUWDlY5m
WbOJLdYeBkBpyZuGbKXdiwISOgv7gmf5P2t1dxXnZ4iv878BOCE7oxnky++E6U913Htp2MQR
Jtimsnyj6en/MltAuzV/sHaL/9ho2LMPilUMVZqOv7h3IdbyMA2VwRV+GoPulUEC+Ft9vVN7
wkOwNVx9fvPeQz1xqisMMghSQ4vIpRLPI2CbPdWf35FV4cpjQOzxdPIgvv6cu1v5gHj07JRK
aPMz5Iko9XQnecXdN32EYaJPstHCZYqi80WbkxqBAx+O0/cG7wIDAQABo4ICKjCCAiYwHwYD
VR0jBBgwFoAUiYJnfcSdJnAAS7RQSHzePa4Ebn0wHQYDVR0OBBYEFG+PJOF4e+6ExlTxx36j
W7cVS+ULMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcGCCsGAQUF
BwMEBgsrBgEEAbIxAQMFAjARBglghkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7BgwrBgEE
AbIxAQIBAQEwKzApBggrBgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMw
gaUGA1UdHwSBnTCBmjBMoEqgSIZGaHR0cDovL2NybC5jb21vZG9jYS5jb20vVVROLVVTRVJG
aXJzdC1DbGllbnRBdXRoZW50aWNhdGlvbmFuZEVtYWlsLmNybDBKoEigRoZEaHR0cDovL2Ny
bC5jb21vZG8ubmV0L1VUTi1VU0VSRmlyc3QtQ2xpZW50QXV0aGVudGljYXRpb25hbmRFbWFp
bC5jcmwwfAYIKwYBBQUHAQEEcDBuMDYGCCsGAQUFBzAChipodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9VVE5BQUFDbGllbnRDQS5jcnQwNAYIKwYBBQUHMAKGKGh0dHA6Ly9jcnQuY29tb2Rv
Lm5ldC9VVE5BQUFDbGllbnRDQS5jcnQwIwYDVR0RBBwwGoEYbGVvbGlzdGFzQHNvbHV0dGku
Y29tLmJyMA0GCSqGSIb3DQEBBQUAA4IBAQA3/bG1wT5OJ+cmq5RKB7LV/nFn0cmJ6EfSzs+d
gleCZyn8QyL79F+0E9NjzR6mrcbEcz/uPYBLNJRYa7IjRqi25BSHC+gKRRy3PDagnWDlSp9U
pnQ2yiOzaXiEk2NlC0K7Dpglw9FTijsoMoB4WbXfc4h/BLehVZ11Pd3zBwuYgv/cW1poF3Vu
Yca7eBHSegHPZrwetxDkGLRTOHmrXuUJwrPJm7bE5OtFWddU9RBXfOR+NK68q5Ekb1Zc+9+A
WYOuXKevHMsDAOZcE2iY//MSoimBJ2VhQ1h9dk/SrVI43TTmvKTBe7TOk/+uBIInrurVYLEr
ZeYiQoYr5cSLCHaDMIIGVzCCBT+gAwIBAgIRALUDlvUBBfuA+9+fLh266rQwDQYJKoZIhvcN
AQEFBQAwga4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2FsdCBMYWtl
IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMYaHR0cDov
L3d3dy51c2VydHJ1c3QuY29tMTYwNAYDVQQDEy1VVE4tVVNFUkZpcnN0LUNsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgRW1haWwwHhcNMDcwNzI1MDAwMDAwWhcNMDgwNzI0MjM1OTU5WjCB
8DE1MDMGA1UECxMsQ29tb2RvIFRydXN0IE5ldHdvcmsgLSBQRVJTT05BIE5PVCBWQUxJREFU
RUQxRjBEBgNVBAsTPVRlcm1zIGFuZCBDb25kaXRpb25zIG9mIHVzZTogaHR0cDovL3d3dy5j
b21vZG8ubmV0L3JlcG9zaXRvcnkxHzAdBgNVBAsTFihjKTIwMDMgQ29tb2RvIExpbWl0ZWQx
JTAjBgNVBAMTHExlb25hcmRvIFJvZHJpZ3VlcyBNYWdhbGhhZXMxJzAlBgkqhkiG9w0BCQEW
GGxlb2xpc3Rhc0Bzb2x1dHRpLmNvbS5icjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAL5jxEbAVX8YALrhHkBanfT7n2xWBZB4Etbfjo3l0cbhDDNydqaMDzq3fi0JfZ+rn8sU
/AVFg5WOZlmziS3WHgZAacmbhmyl3YsCEjoL+4Jn+T9rdXcV52eIr/O/ATghO6MZ5MvvhOlP
ddx7adjEESbYprJ8o+np/zJbQLs1f7B2i//YaNizD4pVDFWajr+4dyHW8jANlcEVfhqD7pVB
Avhbfb1Te8JDsDVcfX7z3kM9caorDDIIUkOLyKUSzyNgmz3Vn9+RVeHKY0Ds8XTyIL7+nLtb
+YB49OyUSmjzM+SJKPV0J3nF3Td9hGGiT7LRwmWKovNFm5MagQMfjtP3Bu8CAwEAAaOCAiow
ggImMB8GA1UdIwQYMBaAFImCZ33EnSZwAEu0UEh83j2uBG59MB0GA1UdDgQWBBRvjyTheHvu
hMZU8cd+o1u3FUvlCzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAX
BggrBgEFBQcDBAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0w
OwYMKwYBBAGyMQECAQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5u
ZXQvQ1BTMIGlBgNVHR8EgZ0wgZowTKBKoEiGRmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL1VU
Ti1VU0VSRmlyc3QtQ2xpZW50QXV0aGVudGljYXRpb25hbmRFbWFpbC5jcmwwSqBIoEaGRGh0
dHA6Ly9jcmwuY29tb2RvLm5ldC9VVE4tVVNFUkZpcnN0LUNsaWVudEF1dGhlbnRpY2F0aW9u
YW5kRW1haWwuY3JsMHwGCCsGAQUFBwEBBHAwbjA2BggrBgEFBQcwAoYqaHR0cDovL2NydC5j
b21vZG9jYS5jb20vVVROQUFBQ2xpZW50Q0EuY3J0MDQGCCsGAQUFBzAChihodHRwOi8vY3J0
LmNvbW9kby5uZXQvVVROQUFBQ2xpZW50Q0EuY3J0MCMGA1UdEQQcMBqBGGxlb2xpc3Rhc0Bz
b2x1dHRpLmNvbS5icjANBgkqhkiG9w0BAQUFAAOCAQEAN/2xtcE+TifnJquUSgey1f5xZ9HJ
iehH0s7PnYJXgmcp/EMi+/RftBPTY80epq3GxHM/7j2ASzSUWGuyI0aotuQUhwvoCkUctzw2
oJ1g5UqfVKZ0Nsojs2l4hJNjZQtCuw6YJcPRU4o7KDKAeFm133OIfwS3oVWddT3d8wcLmIL/
3FtaaBd1bmHGu3gR0noBz2a8HrcQ5Bi0Uzh5q17lCcKzyZu2xOTrRVnXVPUQV3zkfjSuvKuR
JG9WXPvfgFmDrlynrxzLAwDmXBNomP/zEqIpgSdlYUNYfXZP0q1SON005rykwXu0zpP/rgSC
J67q1WCxK2XmIkKGK+XEiwh2gzGCBFMwggRPAgEBMIHEMIGuMQswCQYDVQQGEwJVUzELMAkG
A1UECBMCVVQxFzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRS
VVNUIE5ldHdvcmsxITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UE
AxMtVVROLVVTRVJGaXJzdC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsAhEAtQOW
9QEF+4D7358uHbrqtDAJBgUrDgMCGgUAoIICYzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0wNzA4MTkyMzE0NDRaMCMGCSqGSIb3DQEJBDEWBBRS54xA7LXs
XoXsqA7voEXoF0O8SjBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMC
AgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCB1QYJKwYBBAGC
NxAEMYHHMIHEMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMCVVQxFzAVBgNVBAcTDlNhbHQg
TGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxITAfBgNVBAsTGGh0
dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVROLVVTRVJGaXJzdC1DbGllbnQg
QXV0aGVudGljYXRpb24gYW5kIEVtYWlsAhEAtQOW9QEF+4D7358uHbrqtDCB1wYLKoZIhvcN
AQkQAgsxgceggcQwga4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMOU2Fs
dCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8GA1UECxMY
aHR0cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYDVQQDEy1VVE4tVVNFUkZpcnN0LUNsaWVu
dCBBdXRoZW50aWNhdGlvbiBhbmQgRW1haWwCEQC1A5b1AQX7gPvfny4duuq0MA0GCSqGSIb3
DQEBAQUABIIBAHDzr7K7PW1Dw/mSbGdE1uzsgSaMU9my6eiG+L1NbklhdMJd9sFPDEQeJMjX
4hfFs6BQL0RB9MdndplyINU/5+5VoA6YanQXmLJDdhWQtR8tYHNyU/aSc1Qk1Np5juHZqV7R
i+PVZAY+E1FRfE7EaRzhLlPwf7TojllxigEDkvJW57auUogzgd40mGGI+BD9EYblwkeNX9Hf
LwLEtyxEl9bsFTuoafBzq9Wjwi273HBTBznKm7H5ZJOBVfxZDM0lMe/FDVcnGcZfbd4/VPnd
nQ/uBH/rLXe7HVURJj5gnFo1rxHs9Z/c/1Qrvl4b2SHp/ULBtF5Bts3S3NZ6hT08uc4AAAAA
AAA=
--------------ms020503070303040507000104--

