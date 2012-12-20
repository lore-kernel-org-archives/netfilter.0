From: Christoph Anton Mitterer <christoph.anton.mitterer@lmu.de>
Subject: Re: ipset save and restore
Date: Thu, 20 Dec 2012 17:12:10 +0100
Message-ID: <1356019930.11041.13.camel@heisenberg.scientia.net>
References: <1355928786.30355.22.camel@heisenberg.scientia.net>
	  <alpine.DEB.2.00.1212192146330.23162@blackhole.kfki.hu>
	  <1355955834.5199.27.camel@fermat.scientia.net>
	  <alpine.DEB.2.00.1212200011460.23577@blackhole.kfki.hu>
	 <1355963003.5199.52.camel@fermat.scientia.net>
	 <alpine.DEB.2.00.1212201244070.24774@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="sha512";
	protocol="application/x-pkcs7-signature";
	boundary="=-zsz0yd/7xBYlIb8cORcm"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1212201244070.24774@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-zsz0yd/7xBYlIb8cORcm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-20 at 13:00 +0100, Jozsef Kadlecsik wrote:
> No, "ipset restore" is not identical with iptables-restore. For example=
=20
> with the latter you are not able to incrementally update existing=20
> rulesets.
Well incrementally updating would also mean removing entries that are no
longer existing.... otherwise it's only making a union.

And as I said before... anyone who wants to do this can easily sed
"s/^/ipset //" | sh


> Nothing prevents you to write a few liner in any scripting language, whic=
h=20
> either adds a "flush" command or wraps "create, add" into "create temp,=
=20
> add to temp, swap, destroy temp".
Of course one can do this and actually I'm doing right now... but it's
quite unhandy if anybody has to do this just to get a proper restore.

And when doing it "proper" it's not just a one liner... it has to work
with different names for the actions like create, creat, crea, etc. and
one always risks to break things (and even get security issues by that)
when the syntax of ipset should change or be extended.
With temp names there's the issue, that (I guess) there is a maximum
name for set names, so one cannot just add all new sets as
tmp_<originalname> as this might already fail

Last but not least, while this allows atomic swaps of single set... one
cannot swap the whole ipset configuration in one atomic step.


ipset's current restore should actually be called exec, or merge, or
load...




btw: I might have noticed a bug(?) in at least 6.11
With the following output of store:
# ipset list | grep ^Name

I'd have expected to get the same sets with
list -names
but it gives me one twice:
# ipset list -name
lrz_lcg_se_cn
lrz_lcg_se_pn
lrz_lcg_ce_cn
lrz_lcg_ce_compn
lrz_lcg_ce_compn
lrz_lcg_se
lrz_lcg_ce
DROPPED

Is that expected?


Thanks,
Chris.

--=-zsz0yd/7xBYlIb8cORcm
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
hvcNAQkFMQ8XDTEyMTIyMDE2MTIxMFowTwYJKoZIhvcNAQkEMUIEQE4hb4Ze+Yg2vqD1ZJqFK0XF
23BT6RnjYMwSbebHLYMGeG38Fdp1Bl+1HepjmK9aAIVD4TlWb8WGnR1oJz3VopAwcgYJKwYBBAGC
NxAEMWUwYzBYMQswCQYDVQQGEwJERTETMBEGA1UEChMKREZOLVZlcmVpbjEQMA4GA1UECxMHREZO
LVBLSTEiMCAGA1UEAxMZREZOLVZlcmVpbiBQQ0EgR3JpZCAtIEcwMQIHFOfBMbacrTB0BgsqhkiG
9w0BCRACCzFloGMwWDELMAkGA1UEBhMCREUxEzARBgNVBAoTCkRGTi1WZXJlaW4xEDAOBgNVBAsT
B0RGTi1QS0kxIjAgBgNVBAMTGURGTi1WZXJlaW4gUENBIEdyaWQgLSBHMDECBxTnwTG2nK0wDQYJ
KoZIhvcNAQEBBQAEggEAI+kcRWcmLhxLFbIaMgL9oKmdS0dAvE8g+aLIFM8TD2ue00wXibehHABC
re26LVEB+fE/QT8BwAnr3QelOu05EZbc7wMSkbVU3G+LcVymH4ZANMWn4zjJ9O5XeWzT5CiYguYw
0TRFUr3OlVNtk5Jj5d3a9RM7rjPIg/5R/ST3M2QakZ2Qr8m1L6wpNhxSEuUdL3jcxrAWIxszZkD3
JYdDEwRDeZe6sxPIsmAI94NWr9rCeoFqayxaAx3oHGOyIs9H1s2FJJhaO6UULJ/urHNswRfnIArP
D7LYq85XErP0JeXObASerMuFBOGhMvcjGPFqr17c8Ap485jqdgjVhoDajAAAAAAAAA==


--=-zsz0yd/7xBYlIb8cORcm--

