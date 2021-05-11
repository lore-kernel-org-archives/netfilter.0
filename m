From: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Tue, 11 May 2021 11:28:23 +0200
Message-ID: <6279603e-9db2-c519-7834-3217c809edd5@physik.uni-bonn.de>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
 <20210510221907.GA15863@salvia>
 <d05f4990-b3d3-52e6-ac22-ad55620b866a@physik.uni-bonn.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms080200010501050702090205"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=physik.uni-bonn.de; s=mail;
        bh=49WTsq5trVde3FZxTVUGgyDS8x1njgC40v0Ri+UxfNo=;
        h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From
        :Subject; b=WnDa4Cx6sxJF12ENCIVIp1MqjPmWv/f5gqMLkPQ0pzAkh8Iy/6Hka4MHdJK5/YBwp
        T5TaL9ydhqRU71wl5WDMbw6qyoobuM9WUFs3XJC7yVUf38w5Vvq06BRMGhshKBiqbe2CAPjDR+GAU
        eXI6mlt2EfyUaD/yKl1GRyLq8/5Rw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=physik.uni-bonn.de; s=mail;
        bh=49WTsq5trVde3FZxTVUGgyDS8x1njgC40v0Ri+UxfNo=;
        h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From
        :Subject; b=WnDa4Cx6sxJF12ENCIVIp1MqjPmWv/f5gqMLkPQ0pzAkh8Iy/6Hka4MHdJK5/YBwp
        T5TaL9ydhqRU71wl5WDMbw6qyoobuM9WUFs3XJC7yVUf38w5Vvq06BRMGhshKBiqbe2CAPjDR+GAU
        eXI6mlt2EfyUaD/yKl1GRyLq8/5Rw=
In-Reply-To: <d05f4990-b3d3-52e6-ac22-ad55620b866a@physik.uni-bonn.de>
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms080200010501050702090205
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

a short additional question after considering this for a while longer:

Am 11.05.21 um 00:58 schrieb Oliver Freyermuth:
>>> [...]
>>> Basic tests show that this works as expected, but the details get mes=
sy.
>>>
>>> 1. Certainly, conntrackd is needed to synchronize connection states.
>>> =C2=A0=C2=A0=C2=A0 But is it always "fast enough"?=C2=A0 xt_cluster s=
eems to match by the
>>> =C2=A0=C2=A0=C2=A0 src_ip of the original direction of the flow[0] (i=
f I read the code
>>> =C2=A0=C2=A0=C2=A0 correctly), but what happens if the reply to an ou=
tgoing packet
>>> =C2=A0=C2=A0=C2=A0 arrives at both firewalls before state is synchron=
ized?
>>
>> You can avoid this by setting DisableExternalCache to off. Then, in
>> case one of your firewall node goes off, update the cluster rules and
>> inject the entries (via keepalived, or your HA daemon of choice).
>>
>> Recommended configuration is DisableExternalCache off and properly
>> configure your HA daemon to assist conntrackd. Then, the conntrack
>> entries in the "external cache" of conntrackd are added to the kernel
>> when needed.
>=20
> You caused a classic "facepalming" moment. Of course, that will solve (=
1)
> completely. My initial thinking when disabling the external cache
> was before I understood how xt_cluster works, and before I found that i=
t uses the direction
> of the flow, and then it just escaped my mind.
> Thanks for clearing this up! :-)

Thinking about this, the conntrack synchronization requirements would ess=
entially be "zero",
since after a flow is established, it stays on the same machine, and conn=
trackd synchronization is only relevant
on failover =E2=80=94 right?
So this approach would not limit / reduce the achievable bandwidth, since=
 the only ingredient are the mangling filters =E2=80=94
so in case we can't go for dynamic routing with Quagga and hardware route=
r stacks, this could even be a solution
for high bandwidths?

Cheers and thanks,
	Oliver

--=20
Oliver Freyermuth
Universit=C3=A4t Bonn
Physikalisches Institut, Raum 1.047
Nu=C3=9Fallee 12
53115 Bonn
--
Tel.: +49 228 73 2367
Fax:  +49 228 73 7869
--


--------------ms080200010501050702090205
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EOswggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIGITCCBQmgAwIBAgIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE4MTExNTEyNDMyOFoXDTIxMTEx
NDEyNDMyOFowgbIxCzAJBgNVBAYTAkRFMRwwGgYDVQQIDBNOb3JkcmhlaW4tV2VzdGZhbGVu
MQ0wCwYDVQQHDARCb25uMTgwNgYDVQQKDC9SaGVpbmlzY2hlIEZyaWVkcmljaC1XaWxoZWxt
cy1Vbml2ZXJzaXRhZXQgQm9ubjEgMB4GA1UECwwXUGh5c2lrYWxpc2NoZXMgSW5zdGl0dXQx
GjAYBgNVBAMMEU9saXZlciBGcmV5ZXJtdXRoMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAwKdVNE7QbQkmWwUVE7N+izRfbbEalPrylpwB9Mgm/YIjJCVfzpcdF7g63VY1TSFP
Uxh4yDSpw0lVruJZ6Gd6A1JCQEcw/yiG88Y806POHQEM0LTOYYmkKKG+iz8DEvTQbxC5+DyQ
shU2tYSi5druehKqylyReTun9NfJ1gTdLueKjpGqJnsG3CZOaVUx4eMFj7pMmHzPnZsfe/Nr
w3lTdmtaG0RoKHLDq3jK2LkDC3vgej/FyOVclUfwkEpxrm1l1GegqYMRZ5qAhwJ0d/FdD1Gt
HVdISFHrpHDDJAFZ2dVB+G4bhif1dvXsQK4qWOWT6M2+71xLhDdf9Qawci+isQIDAQABo4IC
WDCCAlQwQAYDVR0gBDkwNzAPBg0rBgEEAYGtIYIsAQEEMBEGDysGAQQBga0hgiwBAQQDCDAR
Bg8rBgEEAYGtIYIsAgEEAwgwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYw
FAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRVYUmFlJJi/QG+QVTQn2tfh4wnhTAf
BgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAoBgNVHREEITAfgR1mcmV5ZXJtdXRo
QHBoeXNpay51bmktYm9ubi5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7hjlodHRwOi8vY2RwMS5w
Y2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwP6A9oDuGOWh0
dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3JsL2NhY3JsLmNy
bDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4u
ZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRmbi5k
ZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2Fj
ZXJ0LmNydDANBgkqhkiG9w0BAQsFAAOCAQEARUAUNWOOOT8zUouetmweHEU3pYU3Wt5yEWao
KoayF1t5FTdeY9nvOrTss2kKzskO1lH5QodZP+nYGF4nA1YI37J115K8YJN+tjx7A8bVc34C
RAX6R2KXhTM6ToVTr6IsROkO7kj0HMLBcxbCgui635+Pu2PuPw86cd9rP+PxjHIXfQc0dIRi
z2eWG+nY7GwBZDBhpyQwqEBVBD09h8TN9Nz40WrO6fTu3unq7+JV5n7ccqef2ioc6fmI8Aqp
GBK1sl8MUuqD0e7gBdYqGwmZsB/faEgIRC1dKugq5UngD68gfn5rUzchoBAMWxoRcfQ+NEpb
8cw+P7/rk+/cwdD1vTGCBAswggQHAgEBMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8
VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVz
IGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJ
c3N1aW5nIENBAgwgDOd9xCyYowfAqlgwDQYJYIZIAWUDBAIBBQCgggI9MBgGCSqGSIb3DQEJ
AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDUxMTA5MjgyNFowLwYJKoZIhvcN
AQkEMSIEIEes8HR3/HZGClZ69PivnljLvGTkkkWf2PZOhIr2vW0HMGwGCSqGSIb3DQEJDzFf
MF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga8GCSsGAQQBgjcQ
BDGBoTCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVu
ZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZO
LVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMIAznfcQsmKMH
wKpYMIGxBgsqhkiG9w0BCRACCzGBoaCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZl
cmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBl
LiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNz
dWluZyBDQQIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBAQUABIIBAJF0DXjmJsdVm3llW45h
w/w0AcWKn/4H6JR/Wn/DznjTxza5l9hJTcpz5q79d/XwW6sFkBBqzFF7vYrhQAoO6c9gR23e
1HkXVtLA/4t3QSAPWmyFbuIDK4ouzsDBDt96IhX9Wf3eAj7IFQ8OHoclhZjlY75QRGzvuzYf
D1WL62PpmGGmTIhOyBGmrjl3N9kjwDr1tpQ0WmeV2CU1gJeoOycdr0gaiSoLoKbSZDCX+mzU
7031cDtMhcY8tLVjepiExDswMsxPgnJAzGSI1xWK9pdJKNWlUZ18l5KDKp8YfI9meHzz5ld2
hkbo0rz2gVmm0Icg3qJ66WU0rI3vyluj10EAAAAAAAA=
--------------ms080200010501050702090205--
