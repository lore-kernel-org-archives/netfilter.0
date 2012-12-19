From: Christoph Anton Mitterer <christoph.anton.mitterer@lmu.de>
Subject: Re: ipset save and restore
Date: Wed, 19 Dec 2012 23:23:54 +0100
Message-ID: <1355955834.5199.27.camel@fermat.scientia.net>
References: <1355928786.30355.22.camel@heisenberg.scientia.net>
	 <alpine.DEB.2.00.1212192146330.23162@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="sha512"; protocol="application/x-pkcs7-signature"; boundary="=-cCeL+GFoGrwlhCgl/U+G"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1212192146330.23162@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-cCeL+GFoGrwlhCgl/U+G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Jozsef.=20

On Wed, 2012-12-19 at 22:01 +0100, Jozsef Kadlecsik wrote:
> > Of course I understand that it could not delete sets which are in use,
> > but at least it could empty them.
> Restore mode is flexible. If you want the sets to be emptied first, then=
=20
> start with the flush command (in the file).
Phew... I'd rather say it's less powerful... if someone really want's
fine grained control, he can still use the single commands.

restore is even documented in the ipset manpage to do what e.g. iptables
restore does... getting the session back... but it doesn't.
I think that should definitely be documented better.


> > Now when I use the following instead:
> > ipset flush
> > ipset destroy
> > ipset restore < file
>=20
> Why do you destroy the sets?
Well if you have long running systems and sets get unused one probably
want's to release their memory.

btw: "ipset destroy" fails if a single set still contains entries...
wouldn't it be better if all empty sets are destroyed and it only fails
on those which are not?



> If the sets are in use then you cannot delete=20
> them at all.
I understand that this might be necessary from a technical point of
view,.. but wouldn't it be simply possible to consider non-existing sets
to be empty sets?


> If you are not concerned that for a very small time the sets are empty,=
=20
> then simply start with the flush command in the restore file and that's=
=20
> all (I don't see why you'd want to destroy those).
Well I'd have expected that everybody would be concerned... when you
have some high speed network you surely will loose packets...


> If you want to avoid the time while the sets are empty, then use the=20
> sequence of
>=20
> - restore into a temporary set
> - swap the set with the temporary one
> - destroy the temporary set
Thanks... this is at least a way... but unfortunately someone that
implies some additional programming effort...

Actually the above would be what one would expect from the restore
command, I guess.

No chance that the semantics are changed here?



Cheers,
Chris.

--=-cCeL+GFoGrwlhCgl/U+G
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCCC5ww
ggXKMIIEsqADAgECAgcU58ExtpytMA0GCSqGSIb3DQEBBQUAMFgxCzAJBgNVBAYTAkRFMRMwEQYD
VQQKEwpERk4tVmVyZWluMRAwDgYDVQQLEwdERk4tUEtJMSIwIAYDVQQDExlERk4tVmVyZWluIFBD
QSBHcmlkIC0gRzAxMB4XDTEyMTIxMjA4NDMxM1oXDTE0MDEwOTA4NDMxM1oweTELMAkGA1UEBhMC
REUxFDASBgNVBAoTC0dyaWRHZXJtYW55MTEwLwYDVQQLEyhMdWR3aWctTWF4aW1pbGlhbnMtVW5p
dmVyc2l0YWV0IE11ZW5jaGVuMSEwHwYDVQQDExhDaHJpc3RvcGggQW50b24gTWl0dGVyZXIwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC9X0sutkL97kWEpV8WpoTvg9h4/9ghtoDNSVx9
XFLSR0ce2QWp+WuYs1l+i39vGd/0zvCMI5ioIAm7JMD4hyu2Ni4IMxbZ/B6IhFYhb+peEYozB8Es
wJYXIHCo24qR6V3FpNiOUoF/wq1Em8p28ejHp9rX8aokkB2s0059i4gn9vn3xVY3z6U7zW4giCLK
s5qG8r4w7bBuzkQshtjn9+VsKicemHcfrH/gM33ZFBuFqTgDZPsphBLupE60Nylf0br2jrinFt0K
kkxTDQhR021lZ01XFsPf1AtMjqBh+vsGvCfZGSt4wZ7qwIrHI88P6dkhSiP6+5v0haLsJ1vkKhbp
AgMBAAGjggJ2MIICcjAMBgNVHRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIEsDAdBgNVHSUEFjAUBggr
BgEFBQcDAgYIKwYBBQUHAwQwHQYDVR0OBBYEFMZatm//jhCHTlmzPd8Oc9IvwmyQMB8GA1UdIwQY
MBaAFJbs3K2aw/5Qozwi5T3Cxf/K2SLGMCoGA1UdEQQjMCGBH2NocmlzdG9waC5hbnRvbi5taXR0
ZXJlckBsbXUuZGUwKgYDVR0gBCMwITARBg8rBgEEAYGtIYIsAQEDAQYwDAYKKoZIhvdMBQICATCB
wQYDVR0fBIG5MIG2MFmgV6BVhlNodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1wa2kvY2VydGlm
aWNhdGlvbi94NTA5L2dyaWQvZzEvZGF0YS9jcmxzL3Jvb3QtY2EtY3JsLmNybDBZoFegVYZTaHR0
cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tcGtpL2NlcnRpZmljYXRpb24veDUwOS9ncmlkL2cxL2Rh
dGEvY3Jscy9yb290LWNhLWNybC5jcmwwgdYGCCsGAQUFBwEBBIHJMIHGMGEGCCsGAQUFBzAChlVo
dHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1wa2kvY2VydGlmaWNhdGlvbi94NTA5L2dyaWQvZzEv
ZGF0YS9jZXJ0cy9yb290LWNhLWNlcnQuY3J0MGEGCCsGAQUFBzAChlVodHRwOi8vY2RwMi5wY2Eu
ZGZuLmRlL2Rmbi1wa2kvY2VydGlmaWNhdGlvbi94NTA5L2dyaWQvZzEvZGF0YS9jZXJ0cy9yb290
LWNhLWNlcnQuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQBC8rkXZzIbWa6lhtcA4z9zJ6XqDgD4hloG
ZxLowGI6QyYeeZJngIJ2Zzbf9NLoqp68kjA3paZdNNfbgHO/hLCz+23VwyJ0b54rrGWXQ9b2VVNF
LB1H43VmXxLU78vurvREk6K/uAeXl7h8hKSsI9Wc8GOeJ7abe0FhkpCjT0O3cwxs3v53DS8XZmoQ
hQ6oRPKRk/K+ahbP6KbVYWuhNLqmKUVCJqlFYawtccrHWFtuiKQqfyQqH7Rv51CFWyL7SRfxOSrM
a0HVQcftW7F/7zQqJpltpvZFHiMEZatfuYldNVYLwA3P5VzFpPfJ5K4xzgiS/pJ0d+Fl55zssL2E
/mhLMIIFyjCCBLKgAwIBAgIHFOfBMbacrTANBgkqhkiG9w0BAQUFADBYMQswCQYDVQQGEwJERTET
MBEGA1UEChMKREZOLVZlcmVpbjEQMA4GA1UECxMHREZOLVBLSTEiMCAGA1UEAxMZREZOLVZlcmVp
biBQQ0EgR3JpZCAtIEcwMTAeFw0xMjEyMTIwODQzMTNaFw0xNDAxMDkwODQzMTNaMHkxCzAJBgNV
BAYTAkRFMRQwEgYDVQQKEwtHcmlkR2VybWFueTExMC8GA1UECxMoTHVkd2lnLU1heGltaWxpYW5z
LVVuaXZlcnNpdGFldCBNdWVuY2hlbjEhMB8GA1UEAxMYQ2hyaXN0b3BoIEFudG9uIE1pdHRlcmVy
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvV9LLrZC/e5FhKVfFqaE74PYeP/YIbaA
zUlcfVxS0kdHHtkFqflrmLNZfot/bxnf9M7wjCOYqCAJuyTA+IcrtjYuCDMW2fweiIRWIW/qXhGK
MwfBLMCWFyBwqNuKkeldxaTYjlKBf8KtRJvKdvHox6fa1/GqJJAdrNNOfYuIJ/b598VWN8+lO81u
IIgiyrOahvK+MO2wbs5ELIbY5/flbConHph3H6x/4DN92RQbhak4A2T7KYQS7qROtDcpX9G69o64
pxbdCpJMUw0IUdNtZWdNVxbD39QLTI6gYfr7Brwn2RkreMGe6sCKxyPPD+nZIUoj+vub9IWi7Cdb
5CoW6QIDAQABo4ICdjCCAnIwDAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYw
FAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBTGWrZv/44Qh05Zsz3fDnPSL8JskDAfBgNV
HSMEGDAWgBSW7NytmsP+UKM8IuU9wsX/ytkixjAqBgNVHREEIzAhgR9jaHJpc3RvcGguYW50b24u
bWl0dGVyZXJAbG11LmRlMCoGA1UdIAQjMCEwEQYPKwYBBAGBrSGCLAEBAwEGMAwGCiqGSIb3TAUC
AgEwgcEGA1UdHwSBuTCBtjBZoFegVYZTaHR0cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tcGtpL2Nl
cnRpZmljYXRpb24veDUwOS9ncmlkL2cxL2RhdGEvY3Jscy9yb290LWNhLWNybC5jcmwwWaBXoFWG
U2h0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLXBraS9jZXJ0aWZpY2F0aW9uL3g1MDkvZ3JpZC9n
MS9kYXRhL2NybHMvcm9vdC1jYS1jcmwuY3JsMIHWBggrBgEFBQcBAQSByTCBxjBhBggrBgEFBQcw
AoZVaHR0cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tcGtpL2NlcnRpZmljYXRpb24veDUwOS9ncmlk
L2cxL2RhdGEvY2VydHMvcm9vdC1jYS1jZXJ0LmNydDBhBggrBgEFBQcwAoZVaHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9kZm4tcGtpL2NlcnRpZmljYXRpb24veDUwOS9ncmlkL2cxL2RhdGEvY2VydHMv
cm9vdC1jYS1jZXJ0LmNydDANBgkqhkiG9w0BAQUFAAOCAQEAQvK5F2cyG1mupYbXAOM/cyel6g4A
+IZaBmcS6MBiOkMmHnmSZ4CCdmc23/TS6KqevJIwN6WmXTTX24Bzv4Sws/tt1cMidG+eK6xll0PW
9lVTRSwdR+N1Zl8S1O/L7q70RJOiv7gHl5e4fISkrCPVnPBjnie2m3tBYZKQo09Dt3MMbN7+dw0v
F2ZqEIUOqETykZPyvmoWz+im1WFroTS6pilFQiapRWGsLXHKx1hbboikKn8kKh+0b+dQhVsi+0kX
8TkqzGtB1UHH7Vuxf+80KiaZbab2RR4jBGWrX7mJXTVWC8ANz+VcxaT3yeSuMc4Ikv6SdHfhZeec
7LC9hP5oSzGCAwUwggMBAgEBMGMwWDELMAkGA1UEBhMCREUxEzARBgNVBAoTCkRGTi1WZXJlaW4x
EDAOBgNVBAsTB0RGTi1QS0kxIjAgBgNVBAMTGURGTi1WZXJlaW4gUENBIEdyaWQgLSBHMDECBxTn
wTG2nK0wDQYJYIZIAWUDBAIDBQCgggFzMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTEyMTIxOTIyMjM1MlowTwYJKoZIhvcNAQkEMUIEQKIzqNB95koOB3HJwpy63OyR
jPt2vrdRmzryfYuY0n3JhojDv+wxjCewE6+9TUmfP6U9hqbfU5Z2Ylbqbgm3bekwcgYJKwYBBAGC
NxAEMWUwYzBYMQswCQYDVQQGEwJERTETMBEGA1UEChMKREZOLVZlcmVpbjEQMA4GA1UECxMHREZO
LVBLSTEiMCAGA1UEAxMZREZOLVZlcmVpbiBQQ0EgR3JpZCAtIEcwMQIHFOfBMbacrTB0BgsqhkiG
9w0BCRACCzFloGMwWDELMAkGA1UEBhMCREUxEzARBgNVBAoTCkRGTi1WZXJlaW4xEDAOBgNVBAsT
B0RGTi1QS0kxIjAgBgNVBAMTGURGTi1WZXJlaW4gUENBIEdyaWQgLSBHMDECBxTnwTG2nK0wDQYJ
KoZIhvcNAQEBBQAEggEAnrT+wDK/W71f//fQQ5MvaUMiLyWTX5q4HkwzqrUZ1GSgfcN4Ca9YI4jA
WF1Iyppe1KAueNagdTho8RSPJX1eFiELHSZ9gpAhjiZ4Jzzr1ck192oD9UxPU/bXXdrF9jBWz4e6
ikr1eE8ZG4VrNrBO5JfBjAbvIR/Bv3eZ3F0zprzbcQC+QVk5R88vV8I4+kGTUAb/oWc3dZHS3jsW
tPH7/NQ5MN5wZRfPNGYrnsNauj2Ybrdd73FcGvtrPa94n4k5fF6orXcloE4LyzgR63Tgh5IgjTgm
znMko+Jjx0qtJT+j1FhOJFqqYHixJ0LguTPhZoDRxLbN/JgLaCfOeBIx/AAAAAAAAA==


--=-cCeL+GFoGrwlhCgl/U+G--

