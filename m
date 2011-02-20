From: "Feasey, Nicholas" <nfeasey@utpress.utoronto.ca>
Subject: Re: DMZ issue - redirect works as expected but behaviour not desired
Date: Sun, 20 Feb 2011 00:24:59 +0000
Message-ID: <FCF5BC26-F3C1-4533-AF80-DC33AAE3F772@utpress.utoronto.ca>
References: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
 <4D604DCB.8030409@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Apple-Mail-4--120873044";
	protocol="application/pkcs7-signature"; micalg=sha1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D604DCB.8030409@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

--Apple-Mail-4--120873044
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Thank you for your response and explanation of the difference between =
MASQUERADE and SNAT.

I really do not want to use MASQUERADE for exactly the reason that you =
state.

My explanation is confusing because I was using the same ethernet port =
just for testing.

In the real world I'm trying to achieve a box that acts as a firewall =
and depending on the service requested routes to an internal machine =
lying on a DMZ.

So,  I'd be using multiple ethernet ports as you would expect.

To be clear (I hope) users would enter http://somesite.somewhere.com and =
it would resolve to an IP address on the firewall box.
They hit the outside interface (port 80 or 443) and it would forward =
this to a machine on the DMZ.  That's all I'm trying to achieve here.

Is this just achieved via a series of FORWARD commands like any other?


On 2011-02-19, at 6:10 PM, Pascal Hambourg wrote:

> Hello,
>=20
> Feasey, Nicholas a =E9crit :
>> I'm setting up a box that will be the only device on the Internet and
>> will forward requested services to other servers sitting on a DMZ.
>>=20
>> As a test I started with redirecting a web server.
>>=20
>> To test my arrangement I first merely set up a simple masquerade =
(just
>> on my internal network) in my iptables like so:
>>=20
>> *nat
>> :PREROUTING ACCEPT [0:0]
>> :POSTROUTING ACCEPT [0:0]
>> -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to 192.168.40.15
>> -A POSTROUTING -j MASQUERADE
>=20
> Be aware that using MASQUERADE on all interfaces may not do what you
> want. Usually, it is used only on the public internet side.
>=20
>> *filter
>> ...normal filtering lines follow.
>>=20
>> This POSTROUTING entry works as well:
>>=20
>> -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.40.15
>>=20
>> I think this is because the above line is doing the same as the =
shortcut
>> MASQUERADE.
>=20
> Not exactly. This rule replaces the source address of any connection
> going out eth0 with 192.168.40.15 whereas the above MASQUERADE rule
> replaces the source address of any connection going out any interface
> with the address of the interface.
>=20
> By the way, it is weird that you use the address of a remote host (the
> server in the DMZ).
>=20
>> When I check the httpd access_log it shows that the connection came =
from
>> 192.168.40.15 as expected.  It works.
>=20
> I'm puzzled. A connection cannot match both the DNAT and SNAT rules as
> they have the same input and output interface eth0. Even if it did =
(the
> connection goes out the interface it came in), this connection would =
end
> up having the same address as source and destination 192.168.40.15.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


--Apple-Mail-4--120873044
Content-Disposition: attachment; filename="smime.p7s"
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJojCCBEYw
ggOvoAMCAQICEGb9R+PCGeToms2Z3fU6yyQwDQYJKoZIhvcNAQEFBQAwXzELMAkGA1UEBhMCVVMx
FzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAxIFB1YmxpYyBQcmltYXJ5
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA1MTAyODAwMDAwMFoXDTE1MTAyNzIzNTk1OVow
gd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNp
Z24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZl
cmlzaWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUG
A1UEAxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMjCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMnfrOfq+PgDFMQAktXBfjbCPO98chXLwKuMPRyV
zm8eECw/AO2XJua2x+atQx0/pIdHR0w+VPhs+Mf8sZ69MHC8l7EDBeqV8a1AxUR6SwWi8mD81zpl
Yu//EHuiVrvFTnAt1qIfPO2wQuhejVchrKaZ2RHp0hoHwHRHQgv8xTTq/ea6JNEdCBU3otdzzwFB
L2OyOj++pRpu9MlKWz2VphW7NQIZ+dTvvI8OcXZZu0u2Ptb8Whb01g6J8kn+bAztFenZiHWcec5g
J925rXXOL3OVekA6hXVJsLjfaLyrzROChRFQo+A8C67AClPN1zBvhTJGG+RJEMJs4q8fef/btLUC
AwEAAaOB/zCB/DASBgNVHRMBAf8ECDAGAQH/AgEAMEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwEw
KjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYTALBgNVHQ8EBAMCAQYw
EQYJYIZIAYb4QgEBBAQDAgEGMC4GA1UdEQQnMCWkIzAhMR8wHQYDVQQDExZQcml2YXRlTGFiZWwz
LTIwNDgtMTU1MB0GA1UdDgQWBBQRfV4ZfTwE32ps1qKKGj8x2DuUUjAxBgNVHR8EKjAoMCagJKAi
hiBodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9wY2ExLmNybDANBgkqhkiG9w0BAQUFAAOBgQA8o9oC
YzrEk6qrctPcrVA4HgyeFkqIt+7r2f8PjZWg1rv6aguuYYTYaEeJ70+ssh9JQZtJM3aTi55uuUMc
YL3C3Ioth8FFwBFyBBprJCpsb+f8BxMp0Hc6I+f1wYVoGb/GAVQgGa41gsxiPGEJxvTV67APpp8z
hZrTcY5Qj5ndYjCCBVQwggQ8oAMCAQICEFUWx+ZIdSkGSt3gI2HfhUMwDQYJKoZIhvcNAQEFBQAw
gd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNp
Z24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZl
cmlzaWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUG
A1UEAxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMjAeFw0x
MDA0MTUwMDAwMDBaFw0xMTA0MTUyMzU5NTlaMIIBHTEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4x
HzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5j
b20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBieSBSZWYuLExJQUIuTFREKGMpOTgxHjAcBgNVBAsT
FVBlcnNvbmEgTm90IFZhbGlkYXRlZDEzMDEGA1UECxMqRGlnaXRhbCBJRCBDbGFzcyAxIC0gTmV0
c2NhcGUgRnVsbCBTZXJ2aWNlMRgwFgYDVQQDFA9OaWNob2xhcyBGZWFzZXkxKjAoBgkqhkiG9w0B
CQEWG25mZWFzZXlAdXRwcmVzcy51dG9yb250by5jYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAMu11FeHkEnDfAm5N3kts2cJclvZ6ANJR9FwDOGp/P40dzT8kEoE5p+TLWl62k9buACr
MFw2Btlc5yc2VKuEpRYz7NRScsokmKeYtq9rjzdoC3qM18FgvaflPHIxD2axrolkH4w3lTX+ImXc
tnAi9EoAVfBSYyMYxgLs9J/4EbV98tI1dc+aaKiPxPk/yJ8GwstCTI0uYcwpSAhdBVcbJy8Loj/R
NbZ2LY81mEybjiK/bgpdPdpwj2mxIU+xZoMmbvEMQxlZzigsaGmCCJc1u/iJiBeOh6XGq4HQxd47
ZTjR5QICXPE7g31L4h2/kbLut/zndNOMw2mE7a3QEGVUHVUCAwEAAaOBzDCByTAJBgNVHRMEAjAA
MEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwEwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVy
aXNpZ24uY29tL3JwYTALBgNVHQ8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEoGA1UdHwRDMEEwP6A9oDuGOWh0dHA6Ly9JbmRDMURpZ2l0YWxJRC1jcmwudmVyaXNpZ24uY29t
L0luZEMxRGlnaXRhbElELmNybDANBgkqhkiG9w0BAQUFAAOCAQEAFwVrTwvlkFm4tzzCkR4TiPAB
cPp7Jja6fTT33XSq7PtUBVL17jqYndKQjo9AvNGsVnJ1DH/Do/bTjq0NKkyo9zcPcyV2SwuohgHc
aYG/hhP9U3nBTso447GryLlWPxv43e/s6c9agsGIMoJBSmQJwDlJzLwyzLE4Spyzn4sr76qwrbrN
RbLc6NbcQtC863gCPnYXVZk60iBYCVx5QwOSDgwVPxtpd30KiICcUzwwtfU4kr4kjuPSHwFxWc+A
ub2D44i7isgOFOnzfxFL4Hb6bLDn0PHRWggrtS3Ss49bXKo8U45OSa0I6SfIYkho3zaHqRDP76IP
uAWUze2Zbl4fnjGCBIswggSHAgEBMIHyMIHdMQswCQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNp
Z24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNVBAsTMlRlcm1z
IG9mIHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTA1MR4wHAYDVQQLExVQ
ZXJzb25hIE5vdCBWYWxpZGF0ZWQxNzA1BgNVBAMTLlZlcmlTaWduIENsYXNzIDEgSW5kaXZpZHVh
bCBTdWJzY3JpYmVyIENBIC0gRzICEFUWx+ZIdSkGSt3gI2HfhUMwCQYFKw4DAhoFAKCCAm0wGAYJ
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTEwMjIwMDAyMzEwWjAjBgkq
hkiG9w0BCQQxFgQU7UJNEGwU7q0AjclUJXIVbm8op0AwggEDBgkrBgEEAYI3EAQxgfUwgfIwgd0x
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24g
VHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZlcmlz
aWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUGA1UE
AxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMgIQVRbH5kh1
KQZK3eAjYd+FQzCCAQUGCyqGSIb3DQEJEAILMYH1oIHyMIHdMQswCQYDVQQGEwJVUzEXMBUGA1UE
ChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNV
BAsTMlRlcm1zIG9mIHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTA1MR4w
HAYDVQQLExVQZXJzb25hIE5vdCBWYWxpZGF0ZWQxNzA1BgNVBAMTLlZlcmlTaWduIENsYXNzIDEg
SW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBIC0gRzICEFUWx+ZIdSkGSt3gI2HfhUMwDQYJKoZIhvcN
AQEBBQAEggEAcheXe6fDfUCJqygymBXv94MjQfytXI01TS7D1mMaUPxMOepm+p/g22dsZZ1tzLME
gU/CA5ettiRRBzS9jKpmTE+3Rab1p+iQ704y8rVggIOau8tM3wKyE2cdXCz0JLO4BxMISFhAZj8k
p1m6rpypT5eipRBX7C4321k62m+VoeYUCAKCJSHN/FZ9mBDYYRnyPOsy/Mr/ccCF6DQagU6hvHeT
nVk6O1IGMq1m8JQ8j1a62niM9lHZoWx2NdCBtAhsdXmTktJfvDZXgwj5zBjxuWOdLVAaEP/9TQuS
2G4Q4h2TLDKUY08pgdw8WpVJIFZWUevJvHWxaVGOmZCROGZeZgAAAAAAAA==

--Apple-Mail-4--120873044--
