Received: from mail-200162.simplelogin.co (mail-200162.simplelogin.co [176.119.200.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1E290A
	for <netfilter@vger.kernel.org>; Wed, 27 Dec 2023 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="IGHkQDFw"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1703666298;
	cv=none; b=H6bL9zberXxghcwqQ/gtWnUbwQFfsqPaNRtyQTj6RZ3XW2CAqlj/q0DAuwztpA1dCP7ZPaLlXHHnZvIdrafELjO7gijPIc5KyeGY2b/4uyZyPy6Wn5hNjCLB766xXSBkjISf4ibjnhRtAq/OUENqFj0McE66ROP0RabrKyEoTT6GR1p9eZ+PMxerdGwzGg/XZ3E0ciUEdNIFRbsm8bwZQuXBNXSIVpALpAWWlaYEmxonmqiHQegrrqoUzBiuXAqvCoYoqr/dDC0HFXUKFi1fW2XUwURuQC7wOVU/htsuWeJ6wfee85K463ytcYWMB2bAY6vCLdpBnAZ6fW2xlFDkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1703666298; c=relaxed/simple;
	bh=XCt/FHtrST0j602f4aXtWkd4T3/MKG4/q04lI4pZdyw=;
	h=DKIM-Signature:Date:MIME-Version:Subject:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing; b=gPCCgYKOrjXA//tVmLxzTDEAGAZdm3u9wQZ3wUH+C/1+OWWYU4URL8wDAdryowyQLaMTq2xzvZ9Xc5C+Goq7zZywZan0HLQ8MnPBm96AvUkDvpfE74nWCiXPkUGiWVY413btqP55YgXwwsOKIKEFDtfqkBPlvtUOb0+o7yk0rkNm8Bal97DpfsJ+LKbCPBXZLaDVf0NazsoTj2oUq0YEGv+fq7mMVlIBg3I4Dc1r1KZA8QVjVu/4CagpYC70ErIYnG9yODJJmySKITLA28M7t2JBWpQhlMoDytglZOLSTlRb+GnHBRSvMoGBfPCtf4HvkJTNEIGbyEU/5zjmlVOPew==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1703666298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XCt/FHtrST0j602f4aXtWkd4T3/MKG4/q04lI4pZdyw=;
	b=IGHkQDFwfiBp8YRptt7e4ZT6pEB7jYKNGvAQd9I9gV883s+swYK6VQmT4YqylnTChB4SRr
	8uhoaV5JdRulrdArdoB3HOukcUlVPkr8xPa3TeJGiAcua3uLXkIvLi0TU0/3nf1y9etPly
	YvG2lR7i7PU93xKv/bjDFww8GRV27YI=
Date: Wed, 27 Dec 2023 16:38:12 +0800
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: How to match only one packet and no other subsequent new packets?
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xQMeC17MOE0Lt6QCwDjHH3Yn"
Content-Transfer-Encoding: 7bit
From: tabloid_scavenger345@slmail.me
To: netfilter@vger.kernel.org
Message-ID: <170366629807.7.80571760241706030.238169961@slmail.me>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 238169961
X-SimpleLogin-Want-Signing: yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xQMeC17MOE0Lt6QCwDjHH3Yn
Content-Type: multipart/mixed; boundary="------------w4ENVkz0wzloN0sX0B52LRSA";
 protected-headers="v1"
From: Jason Yip <ljyip@disroot.org>
To: "netfilter(a)vger.kernel.org"
 <netfilter_at_vger_kernel_org_phbdykrq@simplelogin.co>
Message-ID: <016ed412-75d8-4928-bb08-f7639e4e18e0@disroot.org>
Subject: How to match only one packet and no other subsequent new packets?

--------------w4ENVkz0wzloN0sX0B52LRSA
Content-Type: multipart/mixed; boundary="------------mn4w7daaM4BAoyHZyB4hoMfa"

--------------mn4w7daaM4BAoyHZyB4hoMfa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgaGF2ZSBhIHNjcmlwdCB0aGF0IGFkZHMgYSBpbnB1dCBmaWx0ZXIgcnVsZSB3aGVu
ZXZlciBpbnZva2VkLiBNeSANCmRlZmF1bHQgY29uZmlndXJhdGlvbiBhY2NlcHRzIGBjdCBzdGF0
ZSBlc3RhYmxpc2hlZCxyZWxhdGVkYC4gVGhlIGdvYWwgDQppcyB0byBhbGxvdyBvbmx5IG9uZSBw
YWNrZXQgb2YgYGlwIHNhZGRyIHtDTElFTlRfSVB9IGlwIGRhZGRyIA0Ke1NFUlZFUl9JUH0gdGNw
IGRwb3J0IDIwMjIgY3Qgc3RhdGUgbmV3YCAoYW5kIGFueSBvdGhlciBwYWNrZXRzIHJlbGF0ZWQg
DQp0byB0aGF0IG9uZSBvciBlc3RhYmxpc2hlZCBmcm9tIHRoYXQgb25lIHRoZXJlZm9yZSksIGFu
ZCBub3QgbWF0Y2ggDQpzdWJzZXF1ZW50IHBhY2tldHMgc2F0aXNmeWluZyB0aG9zZSBtYXRjaGVy
cyBhbmQgYGN0IHN0YXRlIG5ld2AuDQoNCkkgaGF2ZSB0cmllZCBgaXAgc2FkZHIge0NMSUVOVF9J
UH0gaXAgZGFkZHIge1NFUlZFUl9JUH0gdGNwIGRwb3J0IDIwMjIgDQpjdCBzdGF0ZSBuZXcgY291
bnRlciBjdCBvcmlnaW5hbCBwYWNrZXRzIDwgMSBhY2NlcHRgIGJ1dCBpdCBzZWVtcyB0aGF0IA0K
dGhlIGBjb3VudGVyYCBvciBgY3Qgb3JpZ2luYWwgcGFja2V0cyA8IDFgIGRvbid0IHJlYWxseSBk
byBhbnl0aGluZy4gVGhlIA0Kc2NyaXB0IGFkZHMgdGhlIHJ1bGUgdG8gdGhlIGBpbmV0IGZpbHRl
cmAgdGFibGUncyBgaW5wdXRgIGNoYWluLiBDYW4gDQphbnlvbmUgY29ycmVjdCBteSBydWxlPyBU
aGFua3MhDQo=
--------------mn4w7daaM4BAoyHZyB4hoMfa
Content-Type: application/pgp-keys; name="OpenPGP_0xB69A3DD87D22F506.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB69A3DD87D22F506.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
8wxPUwg3rTEhlY794Sg=3D
=3DtPTF
-----END PGP PUBLIC KEY BLOCK-----

--------------mn4w7daaM4BAoyHZyB4hoMfa--

--------------w4ENVkz0wzloN0sX0B52LRSA--

--------------xQMeC17MOE0Lt6QCwDjHH3Yn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEzo0UlbWeCxKxaQMntpo92H0i9QYFAmWL4nUFAwAAAAAACgkQtpo92H0i9Qao
9Q//WmJXftkNalRRBIru9Rg9Gs4UuRanLGsyfnp+Dd8z8Ey8blPPQxPQqTWIAaQxAgi740CfexAr
Z/pq1FuYbIUURBe1NnqS21NsS+g1qMIev4lvwmhllQ2+apXyXxciiypiR34nTgJwbnta13ienkU/
Qyjf05lDoqKoO8suxUf01cUR5OvfIlzdh/Scm2NRdyBM3uiMozZr83gcy1jma9opVfKqvlTAuhr2
jVREmTh5Scxiy9nLKPubhPjYLYAuURnEDv80ntxYOtMKFzbzk4aRLQF0AMmvK6hawF9JztWGP3ks
B+OmWTSi83cRtJWnz0/XvTY/B2qdHz+JYApIMKl2CUjaso1v1XFHLWcQdp1wm98Ejo9V6rrX/vpv
5KSncKF/ElVt4IoLdig6MvtGILZdDX6vIy0zJfrfusr64j3K631S2IIfslt9OoUxblQX16omBz/i
zKzAX6blPGHQJeJeNLCls3vfjNJ1T/6zBEl7iPoO/zw1cICHaB447hqvpjbtKF4Zci5FxE5A5O0e
aly/7Ze5ta29/WhcLnAFZ21qGPPYlQTQxj3aSz6UZjjSU5Zt+ezG7NgyAIF9uPGQ6L01BP6jM6XO
VVq00WUg4qQ1mlJf9k93m8MFBgMIRAeT7HqIMrEbWoFZ6K2h0ZySdjg2prGD0gqkXmwiUYfpg0Mc
p60=
=Cwk4
-----END PGP SIGNATURE-----

--------------xQMeC17MOE0Lt6QCwDjHH3Yn--

