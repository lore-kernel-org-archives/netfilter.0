From: "Walter H." <Walter.H@mathemainzel.info>
Subject: Re: IPv6: unknown packet logged ...
Date: Tue, 22 Aug 2017 17:36:05 +0200
Message-ID: <599C4F65.8080906@mathemainzel.info>
References: <f1a8f3cdd11c6f2fa7a5946a0cf4c66f.1503412939@squirrel.mail> <3c69b7a5-7e01-de66-02be-acd6029be63a@pkfnet.co.za> <2209fd5722f46870a684a9f6604fd12e.1503413970@squirrel.mail> <5d75f004-0072-7e6a-f098-c20f8364ee05@pkfnet.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms080805010601040002000907"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=t8AVpk4azMNAfuVSCJkL69x45ADK2S2Gr1Tm/UjKKko=;
        b=VMhAk6KuM4ypr6IOmcFXsrwtdFrUTIKixO5Gm85RuABu1UnTI8OcPg1WoSmC/pTDY/qBETF4F+SRvmg9AcEEWR1ZvCw7PPMl49YJLAKFZOHkO3R9OqjCIdwYGSCEQDpC40KKPxf1C8lvLY4jJW0bnLScQO2DVytzejw/Doj/6H0=;
In-Reply-To: <5d75f004-0072-7e6a-f098-c20f8364ee05@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mark Coetser <mark@pkfnet.co.za>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms080805010601040002000907
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.08.2017 17:08, Mark Coetser wrote:
> On 22/08/2017 16:59, Walter H. wrote:
>> On Tue, August 22, 2017 16:47, Mark Coetser wrote:
>>> On 22/08/2017 16:42, Walter H. wrote:
>>>> Hello,
>>>>
>>>> I have these rules at the beginning of /etc/sysconfig/ip6tables
>>>>
>>>> # Filter all packets with state INVALID
>>>> -A INPUT -m state --state INVALID -j DROP
>>>> -A FORWARD -m state --state INVALID -j DROP
>>>> -A OUTPUT -m state --state INVALID -j DROP
>>>>
>>>> and on bottom these rules:
>>>>
>>>> # Log all other
>>>> -A INPUT -j LOG --log-prefix "IPv6[IN]: " --log-level 7
>>>> -A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7
>>>> -A OUTPUT -j LOG --log-prefix "IPv6[OUT]: " --log-level 7
>>>>
>>>> which rule would have catched these logged packets:
>>>>
>>>> [70223.386265] IPv6[FWD]: IN=3Dsit1 OUT=3Dbr0
>>>> SRC=3D2a00:1450:4001:081a:0000:0000:0000:200e DST=3Dmyipv6addr LEN=3D=
123=20
>>>> TC=3D0
>>>> HOPLIMIT=3D60 FLOWLBL=3D617912 PROTO=3DTCP SPT=3D443 DPT=3D59073 WIN=
DOW=3D1171
>>>> RES=3D0x00 ACK PSH URGP=3D0
>>>> [70232.150311] IPv6[FWD]: IN=3Dsit1 OUT=3Dbr0
>>>> SRC=3D2a00:1450:4001:081a:0000:0000:0000:200e DST=3Dmyipv6addr LEN=3D=
123=20
>>>> TC=3D0
>>>> HOPLIMIT=3D60 FLOWLBL=3D949795 PROTO=3DTCP SPT=3D443 DPT=3D59073 WIN=
DOW=3D1171
>>>> RES=3D0x00 ACK PSH URGP=3D0
>>>> [70249.740932] IPv6[FWD]: IN=3Dsit1 OUT=3Dbr0
>>>> SRC=3D2a00:1450:4001:081a:0000:0000:0000:200e DST=3Dmyipv6addr LEN=3D=
123=20
>>>> TC=3D0
>>>> HOPLIMIT=3D60 FLOWLBL=3D811062 PROTO=3DTCP SPT=3D443 DPT=3D59073 WIN=
DOW=3D1171
>>>> RES=3D0x00 ACK PSH URGP=3D0
>>>
>>> those logged packets are from packets traversing your filter FORWARD
>>> chain obviously no rule is matching which is why its triggering the=20
>>> last
>>> rule which is
>>>
>>> -A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7
>>>
>> of course, and which rule would I have to add bevor this rule, so that=

>> these are not logged ...?
>
> It depends on what you want to allow, if you want to allow all traffic =

> between interface sit1 and br0
>
> -I FORWARD -i sit1 -o br0 -j ACCEPT
>
> although the logged packets above show the source port being tcp/443=20
> which means this connection came in br0 and out sit1 so you are=20
> probably missing an established/related rule.=20
this rules are after dropping invalid and before logging

# Enable forwarding to IPv6-Tunnel interface
-A FORWARD -i br0 -o sit1 -j ACCEPT
# Enable established, related packets back through
-I FORWARD -i sit1 -o br0 -m state --state ESTABLISHED,RELATED -j ACCEPT

so I have the problem, that I cannot really know, why these packets were =

logged ...



--------------ms080805010601040002000907
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
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcwODIyMTUzNjA1
WjAjBgkqhkiG9w0BCQQxFgQUzRLZghUPQQoHETkbZ686olLa0lEwbAYJKoZIhvcNAQkPMV8w
XTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB8BgkrBgEEAYI3EAQx
bzBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDDf7Me/cd27V
i+FlDzB+BgsqhkiG9w0BCRACCzFvoG0wXTELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExMzAxBgNVBAMTKkdsb2JhbFNpZ24gUGVyc29uYWxTaWduIDIgQ0EgLSBT
SEEyNTYgLSBHMwIMN/sx79x3btWL4WUPMA0GCSqGSIb3DQEBAQUABIIBAJFcEA5YC8AbAFpn
IpnOWu1sq2Cx70vwKlocY2a7agBcBXbQOY5H7g4du6ZQeYWohBYkKz64Jcw+cPELBVS2VPgc
7pOjl50VbSONRLEvQY1yQ4Tzuf9iTFZ2VkOhyX/EKp4+clLVapt88xSJNQMzLC0xv9OzemE/
eEoiDARKeqJreV/UHsxifHK08EUzR76mrI0fzU4eFrkU2dKJuwkDf2iJgYc/V23OjHpaZ/Ga
wY/gvdVP5bLVFwPRDIjIup3+CcxL61xzQiPT2TqF8CIV6+0GCLcwUoSsGx7IwaasWu28k2B3
cfXN2/3o0Xvjf6LbKdrWHnGdHDHaWrZxbfO3OGwAAAAAAAA=
--------------ms080805010601040002000907--
