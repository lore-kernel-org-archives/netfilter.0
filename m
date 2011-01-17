From: Giles Coochey <giles@coochey.net>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 11:55:11 +0100
Message-ID: <4D34200F.5050307@coochey.net>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms000302050005020201020308"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D341C26.2010207@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>, netfilter list <netfilter@vger.kernel.org>

This is a cryptographically signed message in MIME format.

--------------ms000302050005020201020308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17/01/2011 11:38, G=E1sp=E1r Lajos wrote:
> Hi,
>
> 2011-01-17 11:16 keltez=E9ssel, GMail Isaac Gonzalez =EDrta:
>> Hi,
>>
>
>> I've doing some testing and seems that iptables only do SNAT on NEW=20
>> connections, and I need to change the ip address of replied packets.=20
>> Anybody know some workaround? If anobody do not know some workaround=20
>> can you confirm that it's not posible to do this with iptables?
>
> read again the NAT part in the manual:
> man iptables
>
> nat table:
>               nat:
>                   This table is consulted when a packet that creates a =

> new connection is encountered.  It consists of three built-ins:=20
> PREROUTING (for altering packets as soon as they come in), OUTPUT=20
> (for  altering  locally-gener-
>                   ated packets before routing), and POSTROUTING (for=20
> altering packets as they are about to go out).
>
> DNAT target:
>
>    DNAT
>        This  target  is  only valid in the nat table, in the=20
> PREROUTING and OUTPUT chains, and user-defined chains which are only=20
> called from those chains.  It specifies that the destination address=20
> of the packet should be modified
>        (and all future packets in this connection will also be=20
> mangled), and rules should cease being examined.  It takes one type of =

> option:
>
> SNAT target:
>
>    SNAT
>        This target is only valid in the nat table, in the POSTROUTING=20
> chain.  It specifies that the source address of the packet should be=20
> modified (and all future packets in this connection will also be=20
> mangled), and rules  should
>        cease being examined.  It takes one type of option:
>
>
>> I've tried the next ip tables rules and only work when I do NEW=20
>> connections from the web server.
>>
>> -A POSTROUTING -o br0 -s WE_SERVER_ADDR -p tcp -m tcp --sport 80=20
>> --dport 1024:65535 -j SNAT --to-source LOAD_BALANCER_ADDR
>>
>> Thanks in advance.
>>
>> Isaac Gonz=E1lez
>>
>
> You should do all of the NAT-ing ON THE LOAD BALANCER:
>

I have to agree - if you are doing NAT you want to avoid any type of=20
asymmetric routing - especially you NEED to make sure that the device=20
that is doing the NAT (be it for load balancing or other reasons)=20
receives the return packets. You cannot keep a TCP connection going if=20
there is not some sort of state information being shared between the=20
devices otherwise.

--=20
Best Regards,

Giles Coochey
NetSecSpec Ltd
NL T-Systems Mobile: +31 681 265 086
NL Mobile: +31 626 508 131
Gib Mobile: +350 5401 6693
Email/MSN/Live Messenger: giles@coochey.net
Skype: gilescoochey




--------------ms000302050005020201020308
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIPdjCC
BIowggNyoAMCAQICECf06hH0eobEbp27bqkXBwcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UE
BhMCU0UxFDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5h
bCBUVFAgTmV0d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0w
NTA2MDcwODA5MTBaFw0yMDA1MzAxMDQ4MzhaMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMC
VVQxFzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVRO
LVVTRVJGaXJzdC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsjmFpPJ9q0E7YkY3rs3BYHW8OWX5ShpHornMSMxqmNVN
NRm5pELlzkniii8efNIxB8dOtINknS4p1aJkxIW9hVE1eaROaJB7HHqkkqgX8pgV8pPMyaQy
lbsMTzC9mKALi+VuG6JG+ni8om+rWV6lL8/K2m2qL+usobNqqrcuZzWLeeEeaYji5kbNoKXq
vgvOdjp6Dpvq/NonWz1zHyLmSGHGTPNpsaguG7bUMSAsvIKKjqQOpdeJQ/wWWq8dcdcRWdq6
hw2v+vPhwvCkxWeM1tZUOt4KpLoDd7NlyP0e03RiqhjKaJMeoYV+9Udly/hNVyh00jT/MLbu
9mIwFIws6wIDAQABo4HhMIHeMB8GA1UdIwQYMBaAFK29mHo0tCb3+sQmVO8DveAky1QaMB0G
A1UdDgQWBBSJgmd9xJ0mcABLtFBIfN49rgRufTAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/
BAUwAwEB/zB7BgNVHR8EdDByMDigNqA0hjJodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9BZGRU
cnVzdEV4dGVybmFsQ0FSb290LmNybDA2oDSgMoYwaHR0cDovL2NybC5jb21vZG8ubmV0L0Fk
ZFRydXN0RXh0ZXJuYWxDQVJvb3QuY3JsMA0GCSqGSIb3DQEBBQUAA4IBAQAZ2IkRbyispgCi
54fBm5AD236hEv0e8+LwAamUVEJrmgnEoG3XkJIEA2Z5Q3H8+G+v23ZF4jcaPd3kWQR4rBz0
g0bzes9bhHIt5UbBuhgRKfPLSXmHPLptBZ2kbWhPrXIUNqi5sf2/z3/wpGqUNVCPz4FtVbHd
WTBK322gnGQfSXzvNrv042n0+DmPWq1LhTq3Du3Tzw1EovsEv+QvcI4l+1pUBrPQxLxtjftz
Mizpm4QkLdZ/kXpoAlAfDj9N6cz1u2fo3BwuO/xOzf4CjuOoEwqlJkRl6RDyTVKnrtw+ymsy
XEFs/vVdoOr/0fqbhlhtPZZH5f4ulQTCAMyOofK7MIIFcDCCBFigAwIBAgIQO65j2DnDlPzM
SJXaXTR0YjANBgkqhkiG9w0BAQUFADCBrjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcw
FQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3Jr
MSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20xNjA0BgNVBAMTLVVUTi1VU0VS
Rmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFpbDAeFw0xMDEwMTQwMDAwMDBa
Fw0xMTEwMTQyMzU5NTlaMCIxIDAeBgkqhkiG9w0BCQEWEWdpbGVzQGNvb2NoZXkubmV0MIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnEfShIvQWyy4AujOORPKowIgIbqFDVT+
tphbbz8UQ4Ndh8wq0u/Rqp0EHvJw4ZTFUjzbSPrtrvyrkkj2Vmwigfy/hdz3tX7YHjEJYvd2
5lO/MBioYmG9Kwb6RS+XWjoT3hiO7iDMTLtvwSeYkDFv8tpTjNuKi3yIU7cLC0NQ+7DXl5Fo
rP+BbcHPGRgEsQGvH89JOkshlyT0YvKJydwKBbGlag4h/VDRznauPDJJl6usnyyLUD2byvYY
azUEAgUrrHRsaAUELH8yPGbQUC0MEgyhC+3aLl7qCXvB2JKBCZjBEz9dQ9DEQf7opV1tlKLD
qcl9ve2+2GF7OyxzvgzrewIDAQABo4ICEzCCAg8wHwYDVR0jBBgwFoAUiYJnfcSdJnAAS7RQ
SHzePa4Ebn0wHQYDVR0OBBYEFNzIQP5P3sjDYNUkLmRKk2xVYwJEMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcGCCsGAQUFBwMEBgsrBgEEAbIxAQMFAjARBglg
hkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAQEwKzApBggrBgEFBQcC
ARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwgaUGA1UdHwSBnTCBmjBMoEqgSIZG
aHR0cDovL2NybC5jb21vZG9jYS5jb20vVVROLVVTRVJGaXJzdC1DbGllbnRBdXRoZW50aWNh
dGlvbmFuZEVtYWlsLmNybDBKoEigRoZEaHR0cDovL2NybC5jb21vZG8ubmV0L1VUTi1VU0VS
Rmlyc3QtQ2xpZW50QXV0aGVudGljYXRpb25hbmRFbWFpbC5jcmwwbAYIKwYBBQUHAQEEYDBe
MDYGCCsGAQUFBzAChipodHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9VVE5BQUFDbGllbnRDQS5j
cnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAcBgNVHREEFTATgRFn
aWxlc0Bjb29jaGV5Lm5ldDANBgkqhkiG9w0BAQUFAAOCAQEAkgncYO0fVM5mTDtsFLNgeEQU
tfupHDPpwjnvDtQAcCOTPOmvbNs3Cct9u85R5T1HUFlJ9bZMfAUwi1EVQf44SUMrFfR/uyH5
Qhe+TEIkHGA6/82Cl1pOcw0ugVF0IDt4jIX+RMoh2izp+VtCXyvzC7Sk9oM4LmMaAToSTjnb
J774U0tY3lgYt8vSCaqjbaPo2vAsekZ82h36T+FVI03PBacxItsm1WmRRCoAXHCFVKVF1ArT
hOKXcxvsuEiOXsRmy09b4N1ztVaOpaCareyGbW/Cp3ObpKcrldtvzE4blwAQOY9zOYbgszS4
Pmps83QjO9WETrH3t8WHYUGsPIAvwjCCBXAwggRYoAMCAQICEDuuY9g5w5T8zEiV2l00dGIw
DQYJKoZIhvcNAQEFBQAwga4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UEBxMO
U2FsdCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8GA1UE
CxMYaHR0cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYDVQQDEy1VVE4tVVNFUkZpcnN0LUNs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgRW1haWwwHhcNMTAxMDE0MDAwMDAwWhcNMTExMDE0
MjM1OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFnaWxlc0Bjb29jaGV5Lm5ldDCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAJxH0oSL0FssuALozjkTyqMCICG6hQ1U/raYW28/FEOD
XYfMKtLv0aqdBB7ycOGUxVI820j67a78q5JI9lZsIoH8v4Xc97V+2B4xCWL3duZTvzAYqGJh
vSsG+kUvl1o6E94Yju4gzEy7b8EnmJAxb/LaU4zbiot8iFO3CwtDUPuw15eRaKz/gW3BzxkY
BLEBrx/PSTpLIZck9GLyicncCgWxpWoOIf1Q0c52rjwySZerrJ8si1A9m8r2GGs1BAIFK6x0
bGgFBCx/Mjxm0FAtDBIMoQvt2i5e6gl7wdiSgQmYwRM/XUPQxEH+6KVdbZSiw6nJfb3tvthh
ezssc74M63sCAwEAAaOCAhMwggIPMB8GA1UdIwQYMBaAFImCZ33EnSZwAEu0UEh83j2uBG59
MB0GA1UdDgQWBBTcyED+T97Iw2DVJC5kSpNsVWMCRDAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0T
AQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcDBAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEB
BAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQECAQEBMCswKQYIKwYBBQUHAgEWHWh0dHBz
Oi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMIGlBgNVHR8EgZ0wgZowTKBKoEiGRmh0dHA6Ly9j
cmwuY29tb2RvY2EuY29tL1VUTi1VU0VSRmlyc3QtQ2xpZW50QXV0aGVudGljYXRpb25hbmRF
bWFpbC5jcmwwSqBIoEaGRGh0dHA6Ly9jcmwuY29tb2RvLm5ldC9VVE4tVVNFUkZpcnN0LUNs
aWVudEF1dGhlbnRpY2F0aW9uYW5kRW1haWwuY3JsMGwGCCsGAQUFBwEBBGAwXjA2BggrBgEF
BQcwAoYqaHR0cDovL2NydC5jb21vZG9jYS5jb20vVVROQUFBQ2xpZW50Q0EuY3J0MCQGCCsG
AQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHAYDVR0RBBUwE4ERZ2lsZXNAY29v
Y2hleS5uZXQwDQYJKoZIhvcNAQEFBQADggEBAJIJ3GDtH1TOZkw7bBSzYHhEFLX7qRwz6cI5
7w7UAHAjkzzpr2zbNwnLfbvOUeU9R1BZSfW2THwFMItRFUH+OElDKxX0f7sh+UIXvkxCJBxg
Ov/NgpdaTnMNLoFRdCA7eIyF/kTKIdos6flbQl8r8wu0pPaDOC5jGgE6Ek452ye++FNLWN5Y
GLfL0gmqo22j6NrwLHpGfNod+k/hVSNNzwWnMSLbJtVpkUQqAFxwhVSlRdQK04Til3Mb7LhI
jl7EZstPW+Ddc7VWjqWgmq3shm1vwqdzm6SnK5Xbb8xOG5cAEDmPczmG4LM0uD5qbPN0IzvV
hE6x97fFh2FBrDyAL8IxggRdMIIEWQIBATCBwzCBrjELMAkGA1UEBhMCVVMxCzAJBgNVBAgT
AlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBO
ZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20xNjA0BgNVBAMTLVVU
Ti1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFpbAIQO65j2DnDlPzM
SJXaXTR0YjAJBgUrDgMCGgUAoIICbjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqG
SIb3DQEJBTEPFw0xMTAxMTcxMDU1MTFaMCMGCSqGSIb3DQEJBDEWBBSsH0uAc5FBHKsEZEx9
2ufV5jxqZTBfBgkqhkiG9w0BCQ8xUjBQMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggq
hkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgdQG
CSsGAQQBgjcQBDGBxjCBwzCBrjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQH
Ew5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYD
VQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3Qt
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFpbAIQO65j2DnDlPzMSJXaXTR0YjCB1gYL
KoZIhvcNAQkQAgsxgcaggcMwga4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVVDEXMBUGA1UE
BxMOU2FsdCBMYWtlIENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEhMB8G
A1UECxMYaHR0cDovL3d3dy51c2VydHJ1c3QuY29tMTYwNAYDVQQDEy1VVE4tVVNFUkZpcnN0
LUNsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgRW1haWwCEDuuY9g5w5T8zEiV2l00dGIwDQYJ
KoZIhvcNAQEBBQAEggEAiTTfqr1IurceWLn7NHRqAgED1QuUVPThkL9a0qODch7XIbg6aXIl
osf8Ok5C36iQPRzRbbZnD52LSWSbhnjo4fEOBVrSw0WmkNYKeiZ2/nz2O3Iu9aaOyFwBRpkH
1aR0WdP/Gm+17XJtLuiHFz9S8Mt330ukVnHqAqDJH1/lBfPVqskczyX9sqLnhG92fRbHz9CM
MvzBCmX5zscbbUMzJP55JQR56Fgd9z12COno/OiZM2pbE8nFQYlp7HE+EWnB7+Nuvs+cV5Qv
uw6gBPK/Oy4m7q8H2Z/kErVlA36C1QY8SPwqEH/sYN2PFfcNFJ8Y8OLK9EHeS0Xwg8tuQBrY
LAAAAAAAAA==
--------------ms000302050005020201020308--
