From: "Walter H." <Walter.H@mathemainzel.info>
Subject: Re: Probably bug detected with ip6tables ...
Date: Fri, 13 Oct 2017 17:37:26 +0200
Message-ID: <59E0DDB6.5030300@mathemainzel.info>
References: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail> <alpine.DEB.2.11.1710131601520.2159@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms090801010506030605060101"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=yb44LjtA3qszy4Jw7lUyW3SCGtpNUp6c5yCQMbfauEg=;
        b=qFX1sj5HPq9YQ0wXLOvUdVoGrtpvZdFZUIepIlfQ+rfMfC16RdTXVHijVl0UoANF0Y5nkpJK0I0HL+y8ELcBKJdftNPZwrMv/BaM8QSdNNo6R6IxfLvcb2gR9W9yn87Z+IcQy5LmmeVnqcQpB007lxLFPObpjS59o8wjQMiZ+U0=;
In-Reply-To: <alpine.DEB.2.11.1710131601520.2159@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms090801010506030605060101
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.10.2017 16:05, Jozsef Kadlecsik wrote:
> On Fri, 13 Oct 2017, Walter H. wrote:
>
>> I have a virtual server at a hoster, where I have a full /64-prefix, s=
o
>> I declared a few addeesses with special numbers ...
>>
>> e.g.  pi =3D 3.141592653589 and the IPv6 address is
>> [prefix:3:1415:9265:3589] there is also a special number below 1, the
>> IPv6 [prefix:0:5772:1566:4901]
>>
>> now the bug:
>>
>> this works:
>> -A INPUT -i eth0 -d prefix::5772:1566:4901 -m tcp -p tcp --dport 25 -m=

>> state --state NEW -j ACCEPT
>>
>> but this not:
>> -A INPUT -i eth0 -d prefix:0:5772:1566:4901 -m tcp -p tcp --dport 25 -=
m
>> state --state NEW -j ACCEPT
> An IPv6 address is represented as eight groups of four hexadecimal digi=
ts
> and '::' can be used to shorten just 0 fields.
I know ...
> The first command works if the prefix contains four or less number of
> groups.
yes, it is a /64 prefix
> The second command works only if the prefix contains exactly four numbe=
r
> of groups.
better say, it should work, because it doesn't , even if the prefix=20
contains exactly four number of groups
> Best regards,
> Jozsef



--------------ms090801010506030605060101
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKBDCC
BOgwggPQoAMCAQICDkgbagkTvYAkyl0i8BTzMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQD
EwpHbG9iYWxTaWduMB4XDTE2MDYxNTAwMDAwMFoXDTI0MDYxNTAwMDAwMFowXTELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMzAxBgNVBAMTKkdsb2JhbFNpZ24g
UGVyc29uYWxTaWduIDIgQ0EgLSBTSEEyNTYgLSBHMzCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBALaWaJNl/SwB7GKjDVS/i8ukQ5Gimq+xg/K1bW/Z8OrczxZ71xnjhAOF+cYf
cI8fbEnFaRkecJE4NX4CSF05axhEpmqlyHT0XfWEPmMfcUSCCD7tyaf26W4mQSmAyUm6/9l2
oKO7G/Z530so00p7nFHCD2VQoZ+oSp3lRgSNg0/cssg9z5ghCZhMwPGPeqk/NyZlR9hmj0km
wsNAvmY9bP86rSlG8BOc4fLrmaeLwtNfUG2iDm/HBpc4L06hjkcCtIMA2KTjukEHYOXdN1ry
B8E7p5yXaC6376lINrzpaaiZqkfpx/ZR0vmxLLbFSbWYnlNT2vty83wP+HE+1wP6Z8MCAwEA
AaOCAbUwggGxMA4GA1UdDwEB/wQEAwIBBjBqBgNVHSUEYzBhBggrBgEFBQcDAgYIKwYBBQUH
AwQGCCsGAQUFBwMJBgorBgEEAYI3FAICBgorBgEEAYI3CgMEBgkrBgEEAYI3FQYGCisGAQQB
gjcKAwwGCCsGAQUFBwMHBggrBgEFBQcDETASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQW
BBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAfBgNVHSMEGDAWgBSP8Et/qC5FJK5NUPpjmove4t0b
vDA+BggrBgEFBQcBAQQyMDAwLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxzaWdu
LmNvbS9yb290cjMwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNv
bS9yb290LXIzLmNybDBnBgNVHSAEYDBeMAsGCSsGAQQBoDIBKDAMBgorBgEEAaAyASgKMEEG
CSsGAQQBoDIBXzA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9y
ZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEAqJ3NMsx8Z+ILUNelXHCjZuIl7+q0tlMw
bocSN1wz4sIoVuOTvUWV81jYFXFM8+SCiRS+/qXMR73rBlSCPua/vvXqiPV5xCgiC4x69g4L
4yquSZoOm8In8my2G1VKAbYZ4WhQdFi8EkUYT67eXhsTMOdVJjSAov4UigSrB4RhUhGiUAC2
cuBy9BFnbhOiC2AI1+gUl0Q7RxXlD3XW+On+R3+a8yExi7J/QSKaDla4EvO/DuCZ31FkItvc
gX5++R2o4nxbzwvrqp/q3FZ766S4LCzmBv+uJFl/xUR/PpoVXvpnEl98bFKXMSvavby01ba6
FP8iVJhAuDnB+XULGxwaozCCBRQwggP8oAMCAQICDDf7Me/cd27Vi+FlDzANBgkqhkiG9w0B
AQsFADBdMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UE
AxMqR2xvYmFsU2lnbiBQZXJzb25hbFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMB4XDTE3MDQy
NDEwNDQxOFoXDTIwMDQyNDEwNDQxOFowVTELMAkGA1UEBhMCQVQxGzAZBgNVBAMTEldhbHRl
ciBIb2VobGh1Ym1lcjEpMCcGCSqGSIb3DQEJARYad2FsdGVyLmhAbWF0aGVtYWluemVsLmlu
Zm8wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDROn0wc2eBzHcRoKiSnUFz1H4T
SN5QEKhssd+B8F0YMDxEzXyvnOeCLAN+8+ui/fyZ0g1A8qgWIGkerNeJJgVes9Xf5EpemE5b
zksNPIoVQVB7sBfWezlJ6E12FUNssdLdcQlVqNtFnHtfZV0SD0BS87mW5GL75Ay8XpSkwwTV
6XpIAcKRyd7EFCw+7g2Udp/ZAjPZ4X7oZl8sFFlOClPvWu8LCjbnDcWHpE93QeXnmMx86LQg
tACrTy1PDX0yAOeCTan6F3sX0tz5Cp8sWduQiMaKof8yxW/t2V7BJwXhZhiDhax3y/AFREOH
NC5dJ2w1sFiwidK7sljogU7/orGHAgMBAAGjggHaMIIB1jAOBgNVHQ8BAf8EBAMCBaAwgZ4G
CCsGAQUFBwEBBIGRMIGOME0GCCsGAQUFBzAChkFodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24u
Y29tL2NhY2VydC9nc3BlcnNvbmFsc2lnbjJzaGEyZzNvY3NwLmNydDA9BggrBgEFBQcwAYYx
aHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL2dzcGVyc29uYWxzaWduMnNoYTJnMzBMBgNV
HSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6
Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczLmNybDAlBgNVHREE
HjAcgRp3YWx0ZXIuaEBtYXRoZW1haW56ZWwuaW5mbzAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwHQYDVR0OBBYEFOQybe9sZCmROEwJqrOUU1qsTrgqMB8GA1UdIwQYMBaAFGly
gmIxZ5VEhXeRgMQENkmdewthMA0GCSqGSIb3DQEBCwUAA4IBAQBY5Zn+1HTT58xtZQgu1IcN
UI9t2PC0ps6sELyN3eCBvqYiqk5D8J58hNl9j0hnht5oM0aKVgTL1GNFu6J9DDd3Bk2sNmG6
8uIvo0NsJAFk23lMzKt+YOm3C6+oveuxICFhHeiTxn9z2jLfU+xYLg8UXpSl5U6m0uZcVoLA
YYYhLgpaSM8jNYgAv8U2NVK+f8hd4AVEpwyF2edKbZTAdj/iDmjmOm9lkUIzacemNR8DRxiD
Eb2XTZa5pcrsPOe1bisJ5wcHoIx+217fm8WJF7Vk2amB9fg8AM3cGU7V7D2Ynbg5tJdV5Et6
ff+sk9Fv1HRaFDqKQVorlDY1P5h1HsoxMYIDYTCCA10CAQEwbTBdMQswCQYDVQQGEwJCRTEZ
MBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczAgw3+zHv3Hdu1YvhZQ8wCQYFKw4DAhoFAKCCAckw
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcxMDEzMTUzNzI2
WjAjBgkqhkiG9w0BCQQxFgQUn6YQhXNhrv0p0fO5bIcchsm7NI8wbAYJKoZIhvcNAQkPMV8w
XTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB8BgkrBgEEAYI3EAQx
bzBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDDf7Me/cd27V
i+FlDzB+BgsqhkiG9w0BCRACCzFvoG0wXTELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExMzAxBgNVBAMTKkdsb2JhbFNpZ24gUGVyc29uYWxTaWduIDIgQ0EgLSBT
SEEyNTYgLSBHMwIMN/sx79x3btWL4WUPMA0GCSqGSIb3DQEBAQUABIIBALvdzpaagnk5149n
Zg0/e7Ng0jpw5xBsjtjGYJDR+qdJoXtdsBHmsi7Vn4OCHeSKa1OSh38UgswIDe4BpV3Igjg7
/F0lXaSYiYNv1bKFKpZ4tEGfyNu95QxDGO08+hsS/yunaxJ+KqNlZkHhut2ZtWbhw04OvLIS
sa1ONxbZSq7UmX6fDBR+X3EeSOltSxOU249nCyniSfchtiKTIbYmGXNtCXnKteOddCofXGSL
qACWpL3Oz+h7KfPXnin/Fq75ZpbAyIAENlyicKqpYZn2WIx8uLGaj5TCjZzeJONR9Ul4QqYN
154WU9K+KVpRk9hfUZCOj9rgSrXb1rM2p+Cac6wAAAAAAAA=
--------------ms090801010506030605060101--
