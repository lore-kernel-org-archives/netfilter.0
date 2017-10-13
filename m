From: "Walter H." <Walter.H@mathemainzel.info>
Subject: Re: Probably bug detected with ip6tables in CentOS6 ...
Date: Fri, 13 Oct 2017 23:08:30 +0200
Message-ID: <59E12B4E.9020005@mathemainzel.info>
References: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail> <alpine.DEB.2.11.1710131601520.2159@blackhole.kfki.hu> <59E0DDB6.5030300@mathemainzel.info> <alpine.DEB.2.11.1710132201440.6854@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms060401090705010000080906"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=rp5NEIFh3AWXxOqPoQwalNyrBw3hGVVhA873w7QeAJg=;
        b=cGOUmyYkrLbLxrm/yt97afVpc89PW3a9Hasr0G7wWrs+ZCkCasOWeBBSmzJvVY807QOIeKGzz/hpT0qaN/UsDaZhfAPC/FkohiAau5AD0/doG43XxUKVEq76aX7c4t2yUTsfzI1QE7tX8R3RVPgKTOkSt4ZQUoZbBoKT2r0yrCw=;
In-Reply-To: <alpine.DEB.2.11.1710132201440.6854@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "centos@centos.org >> CentOS mailing list" <centos@centos.org>

This is a cryptographically signed message in MIME format.

--------------ms060401090705010000080906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.10.2017 22:05, Jozsef Kadlecsik wrote:
> On Fri, 13 Oct 2017, Walter H. wrote:
>
>> On 13.10.2017 16:05, Jozsef Kadlecsik wrote:
>>> On Fri, 13 Oct 2017, Walter H. wrote:
>>>
>>>> I have a virtual server at a hoster, where I have a full /64-prefix,=
 so
>>>> I declared a few addeesses with special numbers ...
>>>>
>>>> e.g.  pi =3D 3.141592653589 and the IPv6 address is
>>>> [prefix:3:1415:9265:3589] there is also a special number below 1, th=
e
>>>> IPv6 [prefix:0:5772:1566:4901]
>>>>
>>>> now the bug:
>>>>
>>>> this works:
>>>> -A INPUT -i eth0 -d prefix::5772:1566:4901 -m tcp -p tcp --dport 25 =
-m
>>>> state --state NEW -j ACCEPT
>>>>
>>>> but this not:
>>>> -A INPUT -i eth0 -d prefix:0:5772:1566:4901 -m tcp -p tcp --dport 25=
 -m
>>>> state --state NEW -j ACCEPT
>>> An IPv6 address is represented as eight groups of four hexadecimal di=
gits
>>> and '::' can be used to shorten just 0 fields.
>> I know ...
>>> The first command works if the prefix contains four or less number of=

>>> groups.
>> yes, it is a /64 prefix
>>> The second command works only if the prefix contains exactly four num=
ber
>>> of groups.
>> better say, it should work, because it doesn't , even if the prefix co=
ntains
>> exactly four number of groups
> What does it exactly mean "doesn't work"?
this rule should open tcp/25 for SMTP but it doesn't ...
> The command fails with an error message? The rule does not match?
>
> What it the kernel version? What is the version number of the iptables
> package?
CentOS 6 with latest updates ...

ip6tables -V ... ip6tables v1.4.7

uname -a ... Linux myvhost 2.6.32-696.13.2.el6.x86_64 #1 SMP Thu Oct 5=20
21:22:16 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

Thanks,
Walter


--------------ms060401090705010000080906
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
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcxMDEzMjEwODMw
WjAjBgkqhkiG9w0BCQQxFgQUA7FiGCJHosFtLpMrPai+gQ/LVsYwbAYJKoZIhvcNAQkPMV8w
XTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB8BgkrBgEEAYI3EAQx
bzBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDDf7Me/cd27V
i+FlDzB+BgsqhkiG9w0BCRACCzFvoG0wXTELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExMzAxBgNVBAMTKkdsb2JhbFNpZ24gUGVyc29uYWxTaWduIDIgQ0EgLSBT
SEEyNTYgLSBHMwIMN/sx79x3btWL4WUPMA0GCSqGSIb3DQEBAQUABIIBAG7ATGXyr4uNxcE9
Axy133V8awhBR9Zirjnn+8SpQeTrh/qdee4bKTfbK3OCrdIPo7IHQP4NqAy1qZIcPUlDiRQl
rqf7OHSy+tRMeAb7EukU+bwCWlfhn7XCUC/otoBkQcHILHKL5DpyxIy+QXuWSmkOuA3QfPiv
ADNG3RWbB65ZrjcU6tTsb9N74T55VXYa+hheKzM7DwLU2Fp2EUIVg9KMRhY5cs5Qur3M/Wr1
/SyKxhWQNXTESjOFdHAh/MlH0eHP7Qcim3MDSzNA7v8IHI/UvhNRjTC0UQZLp5Au3lFafe/O
4UJOflZ+z+xRUG87EkHz/nvEIli4r65whVoD0iIAAAAAAAA=
--------------ms060401090705010000080906--
