Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC812CD96
	for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.187.255.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475274; cv=none; b=gaqBv60c1bx/afrLnKIu924DV2nI3a5+5lUP6xGWgU/0SME/pVhv4iyQAc9nXYt+uKcI27XRpwM2TfMo64Uiq+TUjQ/DIo6+HV/v+4xk94QxVWf6/Dtbco3hlVJ1XJSgjCo0STbSfuRx7TmFfu/HD7cwzhT+rr9pk7furYSME8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475274; c=relaxed/simple;
	bh=33qfropgzhY0IZu7LNmv6NvScWtfPrkSToufz0veJv0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dgLU5Jlm/6bd0+VxzianGkaIyStTCzUmvR/h+46Rmc/EZNdB9aJtEgcxOvysJvcTj1L44y0PWG5pS9FV5HfrxaBLMFNq4yVOnJ2kHW8ZAc3jJgtAS7SwLyPwBOdALK008oeVJ8ymTnuIqcRy4/p5liXheHlS7OkMVFYfVVz81Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hm.edu; spf=pass smtp.mailfrom=hm.edu; dkim=pass (2048-bit key) header.d=hm.edu header.i=@hm.edu header.b=tMRxljNH; arc=none smtp.client-ip=129.187.255.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hm.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hm.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hm.edu header.i=@hm.edu header.b="tMRxljNH"
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4VTHMS5x27zySq
	for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 13:01:56 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
	reason="pass (just generated, assumed good)" header.d=hm.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hm.edu; h=
	mime-version:content-type:content-type:x-mailer:content-language
	:accept-language:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=hm-postout22; t=
	1714474916; bh=33qfropgzhY0IZu7LNmv6NvScWtfPrkSToufz0veJv0=; b=t
	MRxljNHdKfqyD/I/R4CyvL3lwgKrl/ZIZ3cKrZYTIKtgwSSADvzzz3tKBZLP53Fl
	WNGPCdLGAO8IMGeYwJqolJFuvDvZV8PkUdCU6UX15JBo4sS9REiJqIy4L9eIux6B
	tpmfoI7Q57FHKgYJAEDB6/2hy5iqo+rOoc7tCeT4ydGrY27W5KBQ11e55+UY/AHk
	9pOQ/Nawwv4oezJvO88Yxm1RqxNWAnbk6PlRT8eoxFDNbPqayND7jyIYGz7ZQKMz
	eQlnRLvtfj3LCq4g5ODOgNVIqJ3CKlulh2dC0yXX0Nv3+E0TmjRgTBa/BraXyzZm
	iQbHDjMphGaHP5CG4LKew==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.868
X-Spam-Level:
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id glg6NziEfcTp for <netfilter@vger.kernel.org>;
	Tue, 30 Apr 2024 13:01:56 +0200 (CEST)
Received: from BADWLRZ-SWEX02B.ads.mwn.de (BADWLRZ-SWEX02B.ads.mwn.de [IPv6:2001:4ca0:0:108::194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWEX02B", Issuer "BADWLRZ-SWEX02B" (not verified))
	by postout2.mail.lrz.de (Postfix) with ESMTPS id 4VTHMS36fpzyVv
	for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 13:01:56 +0200 (CEST)
Received: from BADWLRZ-SWEX01B.ads.mwn.de (2001:4ca0:0:108::192) by
 BADWLRZ-SWEX02B.ads.mwn.de (2001:4ca0:0:108::194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 30 Apr 2024 13:01:56 +0200
Received: from BADWLRZ-SWEX01B.ads.mwn.de ([fe80::c716:c387:b6ff:6333]) by
 BADWLRZ-SWEX01B.ads.mwn.de ([fe80::c716:c387:b6ff:6333%21]) with mapi id
 15.02.1544.011; Tue, 30 Apr 2024 13:01:56 +0200
From: "Ritterhoff, Florian" <florian.ritterhoff@hm.edu>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: HW Offloading Mellanox ConnectX-6DX
Thread-Topic: HW Offloading Mellanox ConnectX-6DX
Thread-Index: AQHamu3QqUsk2HBP3UuxPITAmpR8tw==
Date: Tue, 30 Apr 2024 11:01:56 +0000
Message-ID: <E16EB255-A060-4569-8945-B7ADCEBCEF47@hm.edu>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_009ABEE8-F212-433A-BF51-19429F6F1D61";
	protocol="application/pkcs7-signature"; micalg=sha-256
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--Apple-Mail=_009ABEE8-F212-433A-BF51-19429F6F1D61
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6A07595B-DC43-4D9E-91CF-B55D25FAE2B7"


--Apple-Mail=_6A07595B-DC43-4D9E-91CF-B55D25FAE2B7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi together,

we are currently trying to offload flowtables to a Mellanox 6DX. Right =
now we are struggling with an unclear =E2=80=9COperation not =
supported=E2=80=9D error.

Are there any hints where we can figure out whats the reason for this =
error? hw-tc-offload is of course enabled.

Thanks!
Flo

--
Florian Ritterhoff - Zentrale IT
Hochschule M=C3=BCnchen University of Applied Sciences
Lothstra=C3=9Fe 34, 80335 M=C3=BCnchen, G2.21a
T +49 89 1265-1745


--Apple-Mail=_6A07595B-DC43-4D9E-91CF-B55D25FAE2B7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hi =
together,<div><br></div><div>we are currently trying to offload =
flowtables to a Mellanox 6DX. Right now we are struggling with an =
unclear =E2=80=9COperation not supported=E2=80=9D =
error.</div><div><br></div><div>Are there any hints where we can figure =
out whats the reason for this error? hw-tc-offload is of course =
enabled.</div><div><br></div><div>Thanks!</div><div>Flo</div><div><br><div=
>
<meta charset=3D"UTF-8"><div>--<br>Florian Ritterhoff - Zentrale =
IT<br>Hochschule M=C3=BCnchen University&nbsp;of =
Applied&nbsp;Sciences<br>Lothstra=C3=9Fe 34, 80335 =
M=C3=BCnchen,&nbsp;G2.21a<br>T +49 89 1265-1745</div>
</div>
<br></div></body></html>=

--Apple-Mail=_6A07595B-DC43-4D9E-91CF-B55D25FAE2B7--

--Apple-Mail=_009ABEE8-F212-433A-BF51-19429F6F1D61
Content-Disposition: attachment; filename="smime.p7s"
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDjIw
ggbmMIIEzqADAgECAhAxAnDUNb6bJJr4VtDh4oVJMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0yMDAyMTgwMDAwMDBaFw0zMzA1MDEyMzU5NTlaMEYxCzAJBgNVBAYT
Ak5MMRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBD
QSA0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAs0riIl4nW+kEWxQENTIgFK600jFA
xs1QwB6hRMqvnkphfy2Q3mKbM2otpELKlgE8/3AQPYBo7p7yeORuPMnAuA+oMGRb2wbeSaLcZbpw
XgfCvnKxmq97/kQkOFX706F9O7/h0yehHhDjUdyMyT0zMs4AMBDRrAFn/b2vR3j0BSYgoQs16oSq
adM3p+d0vvH/YrRMtOhkvGpLuzL8m+LTAQWvQJ92NwCyKiHspoP4mLPJvVpEpDMnpDbRUQdftSpZ
zVKTNORvPrGPRLnJ0EEVCHR82LL6oz915WkrgeCY9ImuulBn4uVsd9ZpubCgM/EXvVBlViKqusCh
SsZEn7juIsGIiDyaIhhLsd3amm8BS3bgK6AxdSMROND6hiHT182Lmf8C+gRHxQG9McvG35uUvRu8
v7bPZiJRaT7ZC2f50P4lTlnbLvWpXv5yv7hheO8bMXltiyLweLB+VNvg+GnfL6TW3Aq1yF1yrZAZ
zR4MbpjTWdEdSLKvz8+0wCwscQ81nbDOwDt9vyZ+0eJXbRkWZiqScnwAg5/B1NUD4TrYlrI4n6zF
p2pyYUOiuzP+as/AZnz63GvjFK69WODR2W/TK4D7VikEMhg18vhuRf4hxnWZOy0vhfDR/g3aJbds
Gac+diahjEwzyB+UKJOCyzvecG8bZ/u/U8PsEMZg07iIPi8CAwEAAaOCAYswggGHMB8GA1UdIwQY
MBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBRpAKHHIVj44MUbILAK3adRvxPZ5DAO
BgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwOAYDVR0gBDEwLzAtBgRVHSAAMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VU0VS
VHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYB
BQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNy
dDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOC
AgEACgVOew2PHxM5AP1v7GLGw+3tF6rjAcx43D9Hl110Q+BABABglkrPkES/VyMZsfuds8fcDGvG
E3o5UfjSno4sij0xdKut8zMazv8/4VMKPCA3EUS0tDUoL01ugDdqwlyXuYizeXyH2ICAQfXMtS+r
az7mf741CZvO50OxMUMxqljeRfVPDJQJNHOYi2pxuxgjKDYx4hdZ9G2o+oLlHhu5+anMDkE8g0tf
fjRKn8I1D1BmrDdWR/IdbBOj6870abYvqys1qYlPotv5N5dm+XxQ8vlrvY7+kfQaAYeO3rP1DM8B
GdpEqyFVa+I0rpJPhaZkeWW7cImDQFerHW9bKzBrCC815a3WrEhNpxh72ZJZNs1HYJ+29NTB6uu4
NJjaMxpk+g2puNSm4b9uVjBbPO9V6sFSG+IBqE9ckX/1XjzJtY8Grqoo4SiRb6zcHhp3mxj3oqWi
8SKNohAOKnUc7RIP6ss1hqIFyv0xXZor4N9tnzD0Fo0JDIURjDPEgo5WTdti/MdGTmKFQNqxyZuT
9uSI2Xvhz8p+4pCYkiZqpahZlHqMFxdw9XRZQgrP+cgtOkWEaiNkRBbvtvLdp7MCL2OsQhQEdEbU
vDM9slzZXdI7NjJokVBq3O4pls3VD2z3L/bHVBe0rBERjyM2C/HSIh84rfmAqBgklzIOqXhd+4Rz
adUwggdEMIIFLKADAgECAhB0BrhO+KGrD8voMi68S9KfMA0GCSqGSIb3DQEBDAUAMEYxCzAJBgNV
BAYTAk5MMRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25h
bCBDQSA0MB4XDTIyMDkwMTAwMDAwMFoXDTI1MDgzMTIzNTk1OVowgcsxDjAMBgNVBBETBTgwMzM1
MTswOQYDVQQKEzJIb2Noc2NodWxlIGZ1ZXIgYW5nZXdhbmR0ZSBXaXNzZW5zY2hhZnRlbiBNdWVu
Y2hlbjEXMBUGA1UECQwOTG90aHN0cmHDn2UgMzQxDzANBgNVBAgTBkJheWVybjELMAkGA1UEBhMC
REUxGzAZBgNVBAMTEkZsb3JpYW4gUml0dGVyaG9mZjEoMCYGCSqGSIb3DQEJARYZZmxvcmlhbi5y
aXR0ZXJob2ZmQGhtLmVkdTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJk8ArDFx9uN
spymiVTVAZ7xbmL5Cckv/aUcSHiGdTqigVaSsIa56Eo0vM1zUNCEjMHdXd8jsLQ1QlXVFf6jmrf+
qqYgoHZ918AbEouLzQdkZnfEgjhS+ETtjUACa1L7CLl71AT2dsidsl8vWM3FMmO6Zl3IhP3C+5nQ
xAoxykBDmOBcbHDM4hQmDDF8WHGxz+bb41Sj3vSyEqddwJGCItjp7hKuChQrnOspYP6uRFFtI3a4
sp5M5cY7jIMIz+C8QkdjEEOJgZHtfv/51DgftHG9u5wQGnemp9K9tgML7suBANeEACzhGkwrhbtK
mh76rXJOqF6DiG2L/uC3dl9r3fnC5sWEUZ8zL/N9zT5XF8yQ/SE2VwUIq2yLQCAK/fX12ihSzNFo
8EfXpyrIuED4rCQG0CJCACPhU2rSXxiJTX4IqVykoYvOmc5zpbCSYoXkz8LNFwD2dINBWuVipnBp
nkoM+l65LGcipw0B+U4v0N1OL4N0uzdjTHfUPCsbK65fq4ZWrgd7jjs1jtQR0x2fSU6ClwsYweL1
XuuqGtwjZnT71MzQpsXsiINdzEvYfdHCapmmUbS2pNnHdKklMp9s4JnJXPpcvzbcfU5L+0i2QeGH
uBr21GOy3ZeE74JeK8vFOS4HI53arNgRAt54CHyOc64bfNyP6VmOcf/HudQMH2BfAgMBAAGjggGm
MIIBojAfBgNVHSMEGDAWgBRpAKHHIVj44MUbILAK3adRvxPZ5DAdBgNVHQ4EFgQU5JibsxzGqMkH
eJtM6Fyd74DMXccwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYB
BQUHAwQGCCsGAQUFBwMCMD8GA1UdIAQ4MDYwNAYLKwYBBAGyMQECAk8wJTAjBggrBgEFBQcCARYX
aHR0cHM6Ly9zZWN0aWdvLmNvbS9DUFMwQgYDVR0fBDswOTA3oDWgM4YxaHR0cDovL0dFQU5ULmNy
bC5zZWN0aWdvLmNvbS9HRUFOVFBlcnNvbmFsQ0E0LmNybDB4BggrBgEFBQcBAQRsMGowPQYIKwYB
BQUHMAKGMWh0dHA6Ly9HRUFOVC5jcnQuc2VjdGlnby5jb20vR0VBTlRQZXJzb25hbENBNC5jcnQw
KQYIKwYBBQUHMAGGHWh0dHA6Ly9HRUFOVC5vY3NwLnNlY3RpZ28uY29tMCQGA1UdEQQdMBuBGWZs
b3JpYW4ucml0dGVyaG9mZkBobS5lZHUwDQYJKoZIhvcNAQEMBQADggIBACOiGH6Y04xDjaHhxgom
qBiZ8KotveO4SB/FztQUF1m9ZytHrlmAVyhOw7r+yP0WeMD9v1xEnbVJBu9oLgN4/SvzhJxZyXtV
XYqLULvfSfu+AwRxQ9cKTuq/VMGUCH2Bum7CPFy5cgYl39nZfpTyzVfWFWDmc3NzLXcLTpnrGe1f
LM0AkgPREWEJwxQMxuNf9c+sxhXv8EDZAtmkgf3vUou3vVDCH3802RrgCM6aOkwO+weTWSptSq3g
dRfaLvmrhgX/E6idYuyoqmoamFgGacw/rGha+Qln//8dZuQC1Vdp82bqQap78PexAtvr4OIu1Xoi
vHNysDrwZ6lMD3g3JlReuWeIzACOSrehl5CWfkVM5g9lsTf3QH66XgCmhEdlODQZyothLq2TpjgT
BW4VQc/+9fUKDgHDkR9sNsLWwoaIlZSZcMqOPwPQlA78GYCzgUQu673ID8fW9LckNu2c8Bp+Oueq
DEQuKZeVE+LuCWZ2jQp2TzbCy/7eTEW84g5AIYegTyAeALSSvaoBaPoaYBKahV3IIHs3uN5mrNSc
apK40736SvldZGVZkSMJk7DmGcNMrVFjLeW6Jn/eZu6TIS4+QDoNoPynLmG8jJ+Wm8wi/7Ofdoy4
ms0kQX2Y0FTHqFDqun70YX+fhQDD/AxVr3NI//B6TlsxxZ7krMYYz87CMYIDyjCCA8YCAQEwWjBG
MQswCQYDVQQGEwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQg
UGVyc29uYWwgQ0EgNAIQdAa4Tvihqw/L6DIuvEvSnzANBglghkgBZQMEAgEFAKCCAUEwGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNDMwMTEwMTQ1WjAvBgkqhkiG
9w0BCQQxIgQgyXkge+H8xxrYkKmTGmyt5tYQIQeTd1+WVUXfAU1jBqYwaQYJKwYBBAGCNxAEMVww
WjBGMQswCQYDVQQGEwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VB
TlQgUGVyc29uYWwgQ0EgNAIQdAa4Tvihqw/L6DIuvEvSnzBrBgsqhkiG9w0BCRACCzFcoFowRjEL
MAkGA1UEBhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdpbmcxHDAaBgNVBAMTE0dFQU5UIFBl
cnNvbmFsIENBIDQCEHQGuE74oasPy+gyLrxL0p8wDQYJKoZIhvcNAQELBQAEggIAj/QCkVSulxBr
+2A3EaVwhQtECAS6s0rAEBUFSCIf803scG1Qi8GZtGnrnwnkAWToxQOk2+Id/3aMQmUWDYHHSPsN
fm6kfRX01zP7Ou2nlmV1lo+kfrBKqlxSV/EwIEjBK9Cf7GBSGZnM6VrBWMIM5U91F893DXUitLxV
hSaKSgQZYl17x+dyciIR0tbRjiN0RR4RO0TQ8CqebXWbskOToM07Gu1yHUaJ7CSBrzfODOd/fjHG
/CKhBkFQUjvKS3xCvTPcyKqKuNvfyF3srVZg+j/9SJ0HHKmjgBBTUTpji6LRtUKWkJLG+h/mqTAy
ZzS3mRhFP/s4WDWwhFs8jkgwI92GKRRhe2SEzZv7yRO4ljYFZi72weW6NEES7Oa8wZASs1DrGkmI
QcquBkPGRHJFs+C6wm/8C3lteSXnca8IXTb94ZW93w1fU2w+FKBjMyw5rjmZJ8NKIgF1bAD3MrFb
xxpEGDQaOEOBNpA76KrTySRYfx2YlOHFo21bc63zqCkrK5+Jw/S4pvCeAO5FiPwnqKaieD7iQeTH
6R8R9paBGbc1nD4GWvY7TbwLkfU9NHcxICIESSkTqsF7StfDemmd80dl/QmDhZ3xAbtsx36Oh/xZ
N/26HYgJDZwLhgK+PUaPTxu8ycYPzYs7YVge0Hdtt18ZvDaIZBJPo0fpAgW2XwEAAAAAAAA=

--Apple-Mail=_009ABEE8-F212-433A-BF51-19429F6F1D61--
