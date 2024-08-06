Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631ED15C133
	for <netfilter@vger.kernel.org>; Tue,  6 Aug 2024 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.187.255.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722921239; cv=none; b=gcKy0Uz/aQA+o/uaZJdDFtoxAOy0XVTPqSj8cO1MbDxqvj9Yn94Xp3LJDHQsgDTEz4QVL0tB02DjUfda8bbIbBrGp3XP5u1b7xow4PKWaXnWcNIAzuIygzj4mNR+r8EvsQGLNT+JiUhFSSPDrNKHtGmvMD/su4f5bWWzvCdkHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722921239; c=relaxed/simple;
	bh=v55zgQdaeEKk7JT04OAVZi24ZWz1dRgwJlPs3SmdgYk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SVAwAsFZR2fXn8di/ULUskm4ewUm7EUW/LFQdJG5zPwtHfohrWjxe/MpDZkyb6bJDvsiOi+GYtzg+S0XQh4YNZ84KmtittgMK1vS3CrwUp/KOpACkiiXiQA4GzCdhU+VM/3V3yzGfMfuU8Xm/96vLn6hrNZxhyOVmulK2PqMlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hm.edu; spf=pass smtp.mailfrom=hm.edu; dkim=pass (2048-bit key) header.d=hm.edu header.i=@hm.edu header.b=XH67zL0T; arc=none smtp.client-ip=129.187.255.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hm.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hm.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hm.edu header.i=@hm.edu header.b="XH67zL0T"
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4WdM0M3j2GzyVd
	for <netfilter@vger.kernel.org>; Tue,  6 Aug 2024 07:13:39 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
	reason="pass (just generated, assumed good)" header.d=hm.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hm.edu; h=
	mime-version:content-type:content-type:x-mailer:content-language
	:accept-language:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=hm-postout22; t=
	1722921219; bh=v55zgQdaeEKk7JT04OAVZi24ZWz1dRgwJlPs3SmdgYk=; b=X
	H67zL0TpklczxVo1biAi1f2DNXDpIpz+dmDtHzg18+DIYoArniG8Ot9sSLvJKYfP
	JyYP22CvTXczCKHeCmDIqQ0vsnT6IfsOdATkJv6F0NFIiaIv6KCjJIo/c4hnqsUu
	eEETfgZmvUwkUUXcwHEj0Gky7qvm+qtbm773kHp4DJkdGpc1q7JI4G7xXrtwTvzI
	nRKMmmQfCy0o4kv9JgJsqHzoyhv9Ipb+7VPOtP2iRcvDoA9Gcfjh2ajXftKeTsTu
	HfH+7TLOfxItA6H3wUR3E8yOKeIGrxQoU7bKCf6Arh/F9JLBQQPXkKwDVusLZPIJ
	5qQWXxEsgkYLO8NosCjdg==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.869
X-Spam-Level:
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Hxq5A0Z8LsBd for <netfilter@vger.kernel.org>;
	Tue,  6 Aug 2024 07:13:39 +0200 (CEST)
Received: from BADWLRZ-SWEX03A.ads.mwn.de (BADWLRZ-SWEX03A.ads.mwn.de [IPv6:2001:4ca0:0:108::195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWEX03A", Issuer "BADWLRZ-SWEX03A" (not verified))
	by postout2.mail.lrz.de (Postfix) with ESMTPS id 4WdM0M0ck3zyVZ
	for <netfilter@vger.kernel.org>; Tue,  6 Aug 2024 07:13:39 +0200 (CEST)
Received: from BADWLRZ-SWEX01B.ads.mwn.de (2001:4ca0:0:108::192) by
 BADWLRZ-SWEX03A.ads.mwn.de (2001:4ca0:0:108::195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 Aug 2024 07:13:38 +0200
Received: from BADWLRZ-SWEX01B.ads.mwn.de ([fe80::c716:c387:b6ff:6333]) by
 BADWLRZ-SWEX01B.ads.mwn.de ([fe80::c716:c387:b6ff:6333%21]) with mapi id
 15.02.1544.011; Tue, 6 Aug 2024 07:13:38 +0200
From: "Ritterhoff, Florian" <florian.ritterhoff@hm.edu>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Hardware Offloading Mellanox
Thread-Topic: Hardware Offloading Mellanox
Thread-Index: AQHa579lvS5CdqfsWUuCMqjmMBVrMQ==
Date: Tue, 6 Aug 2024 05:13:38 +0000
Message-ID: <118AD1B5-F128-4D50-95F9-B5A09D4FE803@hm.edu>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_58AFD1F1-5388-4A12-B435-E04B47B82D05";
	protocol="application/pkcs7-signature"; micalg=sha-256
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--Apple-Mail=_58AFD1F1-5388-4A12-B435-E04B47B82D05
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_814D83F6-D824-4662-82E3-5905F93E297F"


--Apple-Mail=_814D83F6-D824-4662-82E3-5905F93E297F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi together,

I recently read about the topic flowtables and hardware offloading.=20

Thankfully I also have some up to date mellanox NICs, so I tried to =
utilise these NICs for our firewall. So far I recognized that we must =
assign the representors to the flowtable but right now I was not able to =
assign an IP to these representors. Instead that only works for the =
virtual functions. Is there maybe a =E2=80=9Crecommended=E2=80=9D way =
how I can implement a =E2=80=9Cnormal=E2=80=9D statefull firewall using =
hardware offloading using these mellanox NICs?=20

I am aware that we probably will missuse this functionality a little bit =
but in case it works or anyone has some experience we are interested in =
some insights :).

Thanks!
Flo
--
Florian Ritterhoff - Zentrale IT
Hochschule M=C3=BCnchen University of Applied Sciences
Lothstra=C3=9Fe 34, 80335 M=C3=BCnchen, G2.21a
T +49 89 1265-1745


--Apple-Mail=_814D83F6-D824-4662-82E3-5905F93E297F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hi =
together,<div><br></div><div>I recently read about the topic flowtables =
and hardware offloading.&nbsp;</div><div><br></div><div>Thankfully I =
also have some up to date mellanox NICs, so I tried to utilise these =
NICs for our firewall. So far I recognized that we must assign the =
representors to the flowtable but right now I was not able to assign an =
IP to these representors. Instead that only works for the virtual =
functions. Is there maybe a =E2=80=9Crecommended=E2=80=9D way how I can =
implement a =E2=80=9Cnormal=E2=80=9D statefull firewall using hardware =
offloading using these mellanox NICs?&nbsp;</div><div><br></div><div>I =
am aware that we probably will missuse this functionality a little bit =
but in case it works or anyone has some experience we are interested in =
some insights =
:).</div><div><br></div><div>Thanks!</div><div>Flo</div><div><div>
<meta charset=3D"UTF-8"><div>--<br>Florian Ritterhoff - Zentrale =
IT<br>Hochschule M=C3=BCnchen University&nbsp;of =
Applied&nbsp;Sciences<br>Lothstra=C3=9Fe 34, 80335 =
M=C3=BCnchen,&nbsp;G2.21a<br>T +49 89 1265-1745</div>
</div>
<br></div></body></html>=

--Apple-Mail=_814D83F6-D824-4662-82E3-5905F93E297F--

--Apple-Mail=_58AFD1F1-5388-4A12-B435-E04B47B82D05
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
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwODA2MDUxMzI4WjAvBgkqhkiG
9w0BCQQxIgQgzCaO28TtF5rq7QMMAY3KSgR2q63K+SsUt+JBgYYUQMIwaQYJKwYBBAGCNxAEMVww
WjBGMQswCQYDVQQGEwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VB
TlQgUGVyc29uYWwgQ0EgNAIQdAa4Tvihqw/L6DIuvEvSnzBrBgsqhkiG9w0BCRACCzFcoFowRjEL
MAkGA1UEBhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdpbmcxHDAaBgNVBAMTE0dFQU5UIFBl
cnNvbmFsIENBIDQCEHQGuE74oasPy+gyLrxL0p8wDQYJKoZIhvcNAQELBQAEggIAKGnjR00uNxsj
Znd0fu8kjuNzjHMWvJzCt8GF9OuFGQwBDv5BglGpGcbcfbzF8TfPvVDXyoI6W4lBZ4U6b/QvN7w6
AQ+GdPgIK2kWzaC2wGkXr2z0w4mtDMYcDNFyuBo0ZSX6dD1wPLowvTlwo9+8byVg1HfcOKoEGtNR
oNfBJz+x2MzgDfYy2wWy6DfSPNZK18zcNfiWkOoDLBHa71yRKiA554zUHAhzWwhpbYdiV42Jt8Ti
wNPPSsvyItnoq2/bJ6CqGYJj949MRJmvwqndjCOQH6xBv4k0SFJ8qxau076dleeIJNOe2wn56r1e
h80QPANoLYUZwiKl8jbXFv+xVQcXgRULjrSKGO7nIecxrwMv9Ux++7IKURshMXe9F08XgoFe8z3Y
4zwXOA4E0mBj0v8+3NjHKcviWnet3jGNh7MadxSIj81sp0rQlSvaZV1q8CW/kJeK50SVInXR36oY
z5lodEqWfRB9oR4bMBE8rlwSBjYk7WpSUOY3X4Vz7v27jfMEC+GoQADuXio3oQ2xWVbUKIxIAtK+
BEKYQAJUgPMoIx7mSpMxJ/ljsZG6f03Ttm9AEg9qjFQPrWUVSUIQpwlXKg5QStRKEiSldJ/oDXFf
H/ddR4pgJnIy+0/l+c1thUn/aLC6OImZtHZh/ajTVN9j09piMEkGkjfTtpmcmM0AAAAAAAA=

--Apple-Mail=_58AFD1F1-5388-4A12-B435-E04B47B82D05--
