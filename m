Received: from mx03.uni-tuebingen.de (mx03.uni-tuebingen.de [134.2.5.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467701EF36F
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.2.5.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755802; cv=none; b=ZhMNzbq3XdmBjY9H+OujfCxRIPVn6ol3JhK4m/xYaWx5v9CtcEoQUpoLl8JbSIhoxsiX+46xH/Iy4b/uI/Qtatjb1QGSJ/MiJ6orTE3SQUK8IY0GplSXNiWVmh6axFHKoYYa2b5rqZlV+7X4VIcePn7U6YxVyZ2wKK45g7ZTwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755802; c=relaxed/simple;
	bh=UocAHKxinbgW8btxLc7rModzOtV+04MVZ/vtuxyWr/c=;
	h=Date:Message-ID:From:To:Cc:Subject:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NgjlNP45y4/ixYgtI8wnxHx9LGarDVDvqvbVJkhETJt3a0gWptf4/gcIrmNQcjU6mke3/RF3KGddyn/LJFJJASaFRpmiv6GzSxKnxV7YhRE2v/egwiLPvP+JsfQEJxOQwm1czH1cY3ITkZ/gPICjni+oy7RlRrsX2pRhRaEiifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zdv.uni-tuebingen.de; spf=pass smtp.mailfrom=zdv.uni-tuebingen.de; dkim=pass (2048-bit key) header.d=uni-tuebingen.de header.i=@uni-tuebingen.de header.b=eWsljXZ3; arc=none smtp.client-ip=134.2.5.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zdv.uni-tuebingen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zdv.uni-tuebingen.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-tuebingen.de header.i=@uni-tuebingen.de header.b="eWsljXZ3"
Received: from webmail1.uni-tuebingen.de (webmail1.uni-tuebingen.de [IPv6:2001:7c0:300c:3105::8602:5c2])
	by mx03.uni-tuebingen.de (Postfix) with ESMTPS id 17A122106ED6;
	Fri, 28 Feb 2025 16:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx03.uni-tuebingen.de 17A122106ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-tuebingen.de;
	s=20211202prod; t=1740755797;
	bh=NCipgxDYAlnZ2uGC0r6PTSG8vk3tTudUQuHYMIlcVCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWsljXZ3j3e7YaNAGgi5MP+Za8/m54jGTdEIEj6qsCSa8gXOiDE9I3oo93le2wjd0
	 VY65TLiFoeMN+R1W8saJgHOEAUkWyyW8YAGm+8tIR1ocFACAtYc1EUqVYCfXwWs78T
	 rudpunIe0kJpV6Kn/+A+ijS9Uml+EihsfVmhNGwg+DxOXJd9VJbm54i1acCBvm0FbF
	 miKz5AmGRbgsc8ikgVmLaq8ffUvek1KNRrjEU2NscD+xPbCqS/G1d642oXUGU0ywAp
	 66FqeNKHBfKvfJykHo4cX4CbJk29YoyZkFYJpFDkeQaGbXdyM7BpXk2kDkO1+5Vth4
	 lnG7EpPij0cIw==
Received: from webmail1.uni-tuebingen.de (localhost [127.0.0.1])
	by webmail1.uni-tuebingen.de (Postfix) with ESMTPSA id 08D9060AE18C;
	Fri, 28 Feb 2025 16:16:37 +0100 (CET)
Received: from maxwell.wi113.uni-tuebingen.de
 (maxwell.wi113.uni-tuebingen.de [134.2.232.77]) by webmail.uni-tuebingen.de
 (Horde Framework) with HTTPS; Fri, 28 Feb 2025 16:16:37 +0100
Date: Fri, 28 Feb 2025 16:16:37 +0100
Message-ID: <20250228161637.Horde.iAhuaN_RigKhST4Av_sXpMo@webmail.uni-tuebingen.de>
From: Michael Menge <michael.menge@zdv.uni-tuebingen.de>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Subject: Re: nft reset element crashes with error BUG: unhandled op 8
References: <20250228151158.Horde.S7bxprjzrKb3P7rZjqTDZz_@webmail.uni-tuebingen.de>
 <20250228142507.GA24116@breakpoint.cc>
In-Reply-To: <20250228142507.GA24116@breakpoint.cc>
User-Agent: Horde Application Framework 5
Content-Type: multipart/signed; boundary="=_gQBbl7_sV3TI-5m6yASv7V2";
 protocol="application/pkcs7-signature"; micalg=sha-256
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

This is a cryptographically signed message in MIME format.

--=_gQBbl7_sV3TI-5m6yASv7V2
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Quoting Florian Westphal <fw@strlen.de>:

> Michael Menge <michael.menge@zdv.uni-tuebingen.de> wrote:
>> i want to use a named set in nftables to to restrict outgoing http(s)
>> connections only to
>> update servers. As the update servers are behind CDNs with multiple chan=
ging
>> IPs i need
>> to automatically update the named set.
>>
>> I discovered that "reset element" was added to the nft command which sho=
uld
>> enable me to reset
>> the timeout without removing the IPs already in the set, and to keep a c=
lean
>> list of IPs.
>
> No, you can update existing element timeouts:
> nft add element inet filter updatesv4 {1.2.3.4 timeout 1h expires 1h}

even better. IMHO the wiki needs to be clarified

Quoting https://wiki.nftables.org/wiki-nftables/index.php/Element_timeout :

> timeout and expires parameters cannot be modified in this case. The=20=20
>=20element should be recreated again if you need to reset them.



Quoting Florian Westphal <fw@strlen.de>:

> This should be the right fix, I will submit this formally later:

thx


--
---------------------------------------------------------------------------=
-----
Michael Menge                          Tel.: (49) 7071 / 29-70316
Universit=C3=A4t T=C3=BCbingen                   Fax.: (49) 7071 / 29-5912
Zentrum f=C3=BCr Datenverarbeitung          mail:=20=20
michael.menge@zdv.uni-tuebingen.de
W=C3=A4chterstra=C3=9Fe 76
72074 T=C3=BCbingen

--=_gQBbl7_sV3TI-5m6yASv7V2
Content-Type: application/pkcs7-signature; name=smime.p7s
Content-Description: S/MIME-Signatur
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIIZywYJKoZIhvcNAQcCoIIZvDCCGbgCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghXeMIIHTTCCBjWgAwIBAgIMJsZi9iD2GRQi+Q53MA0GCSqGSIb3DQEBCwUAMIGNMQswCQYDVQQG
EwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3Jz
Y2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWlu
IEdsb2JhbCBJc3N1aW5nIENBMB4XDTIyMDYxMzA3MjExM1oXDTI1MDYxMjA3MjExM1owgdsxCzAJ
BgNVBAYTAkRFMRswGQYDVQQIDBJCYWRlbi1XdWVydHRlbWJlcmcxEjAQBgNVBAcMCVR1ZWJpbmdl
bjEuMCwGA1UECgwlRWJlcmhhcmQgS2FybHMgVW5pdmVyc2l0YWV0IFR1ZWJpbmdlbjEOMAwGA1UE
BAwFTWVuZ2UxEDAOBgNVBCoMB01pY2hhZWwxFjAUBgNVBAMMDU1pY2hhZWwgTWVuZ2UxMTAvBgkq
hkiG9w0BCQEWIm1pY2hhZWwubWVuZ2VAemR2LnVuaS10dWViaW5nZW4uZGUwggIiMA0GCSqGSIb3
DQEBAQUAA4ICDwAwggIKAoICAQDOgo5p677pphF8db9Jgn9a6rG7nwFX1ZOKzY3xfMz6BtWHfUfk
3RLyFuNPa12p5TpMOuaO/KcpLh0D8E18XfYB281RVlSuQwSy1plMGLnRFvGvBbRoYCLWDKJAgx7/
SquHqsvO7dFF9u7p6nXzR8AHo4wqLbfDozNR47C4CB1CqJAlETU+7z1IarIbdw0lgZy31Lz6NBXS
bc5DBYWnG//rjlN0nuNrYrQr4DDc3evCmzxr7FLV8nf8Yjtlv0I3ippkt0dvCRNcXXgRzFs0BK+q
ZkX5t9H5uh0a8wCZ30hua+OOxwgLzGCY+hPKBAVsw9lwDJdNef/x5FHgLHJEDaMlo8NLMnAKo54w
SSWfIAiFmeeagHOk0U7VnY9ov8D2Fgrj7TkaRY1tadMG7IQEsQELHIFbXXxnTo74dgfXdwpLwjyc
iRhK4aVLvlEgW7bPZwIAPGpYu6LZeyv1zkKpFzAoQGwe2a+iJCkxAaePVmRfGqvkdtyCfoNT3EfJ
nB5zC97bGNkDLu86lQf+3U4XOJOKA2cDiG8h3t0g5LOp195NUj3I1nw6RE0Y2exXUnlVAbIJQ4mv
iQJxbGhD7fGnwC8RbCiALGcmNxA00O+YRtZ5mn8BErc0WkvsD8tA69ivY0f5qDiSGZAjawLMthdm
yXTjmGZTOuvu56HBfIUMHAqgwQIDAQABo4ICWzCCAlcwPgYDVR0gBDcwNTAPBg0rBgEEAYGtIYIs
AQEEMBAGDisGAQQBga0hgiwBAQQKMBAGDisGAQQBga0hgiwCAQQKMAkGA1UdEwQCMAAwDgYDVR0P
AQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUE1scxVoA
rjDjo5Ffz4XMDYczLbwwHwYDVR0jBBgwFoAUazqYi/nyU4na4K2yMh4JH+iqO3QwLQYDVR0RBCYw
JIEibWljaGFlbC5tZW5nZUB6ZHYudW5pLXR1ZWJpbmdlbi5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7
hjlodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5j
cmwwP6A9oDuGOWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3Js
L2NhY3JsLmNybDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBj
YS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRm
bi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0
LmNydDANBgkqhkiG9w0BAQsFAAOCAQEAkH+NPcF8sntXs1OsrxMTCaGBISEWN8+Ckb4+Tsis9eDw
mlbB7ny3hQ+yHvx+L/6Oax3l1//Jjvghl3ofriu8aUwIjLDLQux+6RXZ6VD0P502gXiZLE0EoSqZ
YeX0E3EnJ54/pzAl0aZeRtP6jkV2X3ZuNDKahYxFRQ4P2u889HAI3yYpPeTj7MZzordSxH0qVGws
6IHFtHCnbovuNHkBDSu8yqiwqGBg7MuKB8v6Ex5BXL/VBjspp11tMFff4r8gzGiF9K95SiiBGP+G
J0qcJ07j7ugo4uZnnQZgLjAY/pthC3K6P90J5hKENdZsqM3HfZCMIi/GYLx213JF2v9JmTCCBaww
ggSUoAMCAQICBxtjutAeLD0wDQYJKoZIhvcNAQELBQAwgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQK
EzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkgMjAeFw0xNjA1MjQxMTM4NDBaFw0zMTAyMjIyMzU5NTlaMIGNMQswCQYDVQQG
EwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3Jz
Y2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWlu
IEdsb2JhbCBJc3N1aW5nIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnTt5HEfe
H4bLxmnXEJ4519miMNtyHAV/KV9LaPGtGdZM4WsbsQt/oavge4uL2C3Obog6EO5X5R5/BFE267pw
bWOgvpYuQOHRg0xmPRxkaeWbpK1yrmg5UYd5zBfTri9dY3FLOXrrQqeXkGkFv5D/pEBwvQPnv54Y
iB+fmYhNDkeNSF9lmRDS2SpJ7cG5LR2fEssV0z9/HlQvOq6TV6d+eMrVSuIa5e1BfVNfyLMq9Yow
rO0XBSQ/tqALB/1NGpoDUqA2nN4kh2Xk5/rHlnMkFM3Q6BtonhhZrnZ+99EKeDyHS7A3z1PKOjgQ
88tHbYxkPTxaRUq6yoB8uPPnp0xMzQIDAQABo4ICBTCCAgEwEgYDVR0TAQH/BAgwBgEB/wIBATAO
BgNVHQ8BAf8EBAMCAQYwKQYDVR0gBCIwIDANBgsrBgEEAYGtIYIsHjAPBg0rBgEEAYGtIYIsAQEE
MB0GA1UdDgQWBBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAfBgNVHSMEGDAWgBST49gyJtrV8UqlkUrg
6kviogzP4TCBjwYDVR0fBIGHMIGEMECgPqA8hjpodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2dsb2Jh
bC1yb290LWcyLWNhL3B1Yi9jcmwvY2FjcmwuY3JsMECgPqA8hjpodHRwOi8vY2RwMi5wY2EuZGZu
LmRlL2dsb2JhbC1yb290LWcyLWNhL3B1Yi9jcmwvY2FjcmwuY3JsMIHdBggrBgEFBQcBAQSB0DCB
zTAzBggrBgEFBQcwAYYnaHR0cDovL29jc3AucGNhLmRmbi5kZS9PQ1NQLVNlcnZlci9PQ1NQMEoG
CCsGAQUFBzAChj5odHRwOi8vY2RwMS5wY2EuZGZuLmRlL2dsb2JhbC1yb290LWcyLWNhL3B1Yi9j
YWNlcnQvY2FjZXJ0LmNydDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDIucGNhLmRmbi5kZS9nbG9i
YWwtcm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBAIF4
RaROpH8OVfAJsWo+eMxoNakc85WeP/P432s4d4ksjbWtPsfylM2gBq66zKixrTMItiSGYjZMeG5Q
8NVuYI1PUjFDl0Z18GLkbmZRwUIxZ1DlSec5HsufyoZI3ggU/xVLK2aboDifAM79p+vRf1ctyExf
3BARlz6WBAJchKgpOWyU/BCSBnue7thGtBu1Aww42dywqT9xBguyAwczwo1IYyUlPHp7V273igU4
77igri/02wfVW4QYwam4S85skBqC5Lk9+nfx0h8zAr9T53b53CYlQW8vphv6pBOQ+nx+2QtgXey/
ykGgYfsRSSnYqC11FdhKGOoW71U0IhoTjQYwggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZI
hvcNAQELBQAwgYIxCzAJBgNVBAYTAkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBT
ZXJ2aWNlcyBHbWJIMR8wHQYDVQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxU
LVRlbGVTZWMgR2xvYmFsUm9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1
OVowgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMg
RGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNV
BAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0peQcA
IFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0WUU2SQXa
eMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1xDkesJQLEvHV
aY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekCAwEAAaOCAXQwggFw
MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL4qIMz+EwHwYDVR0jBBgw
FoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB/wIBAjAzBgNVHSAELDAqMA8G
DSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EMAQICMEwGA1UdHwRFMEMwQaA/oD2G
O2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVsZVNlY19HbG9iYWxSb290X0NsYXNzXzIu
Y3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUHMAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2Vj
LmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRwOi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxl
U2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5jZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3W
O5qYi3FP2ropqiH5Ri71sqQPrhE4eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD
2HlrtrdNUAtmB7Xts5et6u5/MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcP
ImxHhPalR6D90Bo0fa3SPXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD
5+32GPg8SecmqKc22CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9
SpIClxvyt7bPZYoaorVyGTkwggPDMIICq6ADAgECAgEBMA0GCSqGSIb3DQEBCwUAMIGCMQswCQYD
VQQGEwJERTErMCkGA1UECgwiVC1TeXN0ZW1zIEVudGVycHJpc2UgU2VydmljZXMgR21iSDEfMB0G
A1UECwwWVC1TeXN0ZW1zIFRydXN0IENlbnRlcjElMCMGA1UEAwwcVC1UZWxlU2VjIEdsb2JhbFJv
b3QgQ2xhc3MgMjAeFw0wODEwMDExMDQwMTRaFw0zMzEwMDEyMzU5NTlaMIGCMQswCQYDVQQGEwJE
RTErMCkGA1UECgwiVC1TeXN0ZW1zIEVudGVycHJpc2UgU2VydmljZXMgR21iSDEfMB0GA1UECwwW
VC1TeXN0ZW1zIFRydXN0IENlbnRlcjElMCMGA1UEAwwcVC1UZWxlU2VjIEdsb2JhbFJvb3QgQ2xh
c3MgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKpf2htf6HOR5dpc9KLmR+XzaFVg
BR0CpLObWfMeiq80rfwNwtlIGe5pj8kg/CGqBxntsFysZcdf7QJ8e3wtG9a6uYDCGIIWhPpmsAjG
VCOB5M25ST/2T243SCg4D8W+52hw/TmXTdLHmJFQqsREsyN9OUfpUmLWEpNetzGWQgX7dqceo/XC
/Ol6xWypcU/qy3i8YK/H3vTZy75+M6VulIPwNPohq+qOcqA/pN4wW++GTWqVW0NEqBAVHOUBV8WY
8eYGKJGqIMW3UyZRQ7ILEZVY4cAPdtnAjXyB83Jwnm/+Go7ZXzXGsm80fL5IT+JaOdfYnXien4Y+
A14Zi0Si1ccCAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0O
BBYEFL9ZIDYAeaCgImuM1fJh0rgsy4JKMA0GCSqGSIb3DQEBCwUAA4IBAQAxA6JhCx906HI2xm35
TZ76IqjhgVbPzbuf6quRGTivqnwVTfO2o42l9I72RKmn6CGVrT4AYhaI8AK6/GEj5jObMHprNmJ7
rQQjhFhl4tsriuclUzdiU1+82gFiKaKmJ3HmOiJ+wW8dlXAgSgc03+r/FYDlutd62Ft1fAV6KUd+
QKgxE3fNQDu0UUd6LhHjRxHenWbQi9VUZvqDVep8wimJG+lvs87iBYTJLz54hWJuyV/BeGN0WMBI
GAyZOeukzBq1eVqNFZzYFA32egdXxyKDBS08myUmPRizqUN8yMirZI8Oo7+cG50w29rQGS6qPPH7
M4B25M2tGU8FJ44ToW7CMYIDsTCCA60CAQEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxW
ZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4g
Vi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3Vpbmcg
Q0ECDCbGYvYg9hkUIvkOdzANBglghkgBZQMEAgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcN
AQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAyMjgxNTE2MzZaMC8GCSqGSIb3DQEJBDEiBCCbwNbbJ2yi
pNjQvUtDB3W/dHUDbhEh05q1o3OiSjyadDB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggq
hkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAgAXrQQU
/YYNfU37YYThuOR0cPe6sSOFXgBJ0UnwAj/XNGYEcrxSb054gX7w0HKGZB6WliCDblDdnteB+Won
tfbyfKlWrIBctu40BuhAgeZ3zo32O4vpsLgX22alEdxx1TY6N3VR+BZtP3/KoD6Vb5tLWuSUPxX1
RGZ2SfkgSKo6JMmuFD1revF6A6VlS4IM0tb1diDNOuGyKoTEgqACzJXEMrrRdXPRd2xe6B32g8pR
P4wdm3fNRdj2wHjAcmIDGzuiBJMuTY59stTtIBExpigO2Zq5JzRgAaN0gedtQAp0+Uw63eETe5Ht
D2pzURvnvOoOlPDEDMHtZQgBk/aWCdT/QoDTCmjpnEhjOTQp8c914TI31g7CZApwIHzF2Ye299Et
05Bcj81GbvsfbU4sdtSLNSwl4QVO3Ni8Rt5R6wC1NhO7ZcEb8ORh2SIZ3OBCWldZqbrG0vs8gP4A
f8Pgf85araqVe4jC7PF122Bxg4kcp3P13O0XGd9qPPqGq0liRedVzbB5JkC98Fddrv+TdbAL+w+V
kny3T7Bj9x0F1cJMzEdllS0XidDkKpAJQv3oVF2xdrVxrwnLTr4tu7vtqeNlNjYn+60ajPSYytV1
meoO//NBK+lGJEHNdKeCuNcpHLaeia+9fvYbBpcaZ5wcDR2RE9felTH1IiG9fZexcoPFxQ==
--=_gQBbl7_sV3TI-5m6yASv7V2--

