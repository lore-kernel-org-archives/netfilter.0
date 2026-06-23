Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522230F938
	for <netfilter@vger.kernel.org>; Tue, 23 Jun 2026 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209101; cv=none; b=diq7hG9V9B+NP4I22jvTJVY+lfYScHIvVnOn9mathT0nSQmD+iS/zoC5vLrXabwnS7n3XzCA9UnO4TPbhMXLQMxz9O/MDWhryMDsWTG4Bp/ieGAd8XLz16u2NscTsP9HMxS9Sf+MrVQm0iYJL+z47F27ubEAf4dkc1IuD9iWku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209101; c=relaxed/simple;
	bh=lXIbd4Qz1Sh079Ygeg/456qjXwXwTq0NstvF6I/Xi/0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=JInlhkU6Oj3DkD8sR1H7/4mncYgVFsC0MapAw1BeXYFd5aIj/B6DHx+tDZdXULt+adY8v0myDckkXWh6vDvkhVvGlHnxSLOB7QlHs8RRAp7mRgPy9X3rjmePYQKqMc8MTFhtYlapm/R5m2StOOzPoWd5zUkpgNHAWt6fXaR/kY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PhaD0JjT; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PhaD0JjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1782209087; x=1782468287;
	bh=lXIbd4Qz1Sh079Ygeg/456qjXwXwTq0NstvF6I/Xi/0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PhaD0JjTsibgirYKdgSCZWgtRkCQyfhSHfmkD0IGzXcn8uyyXHc7D6j2HA5t8Dq11
	 8Iq6KJr8qIr74vFu+59LJSGCY4V+OOYTVb/iXFwm4LyMZL3RZmEtUaQmajqQJto+hW
	 omIou4Fp8x4ycD2nYMe4guu3xOn9U30+K6aZt0G9u4YMVxuLWX32+G2dMjUtXJwuWI
	 u9xTyI90znzeLzdYQZNbnrIvj3fZO2ei0y0clazMSNpw1jz7dLaTGcMujSxf9N2p2d
	 u2WjX/1uCmV7rHkdl6QJTjU6f02orpOBC/cBTuhxy1m2tuRH5nz3Hj5qc19WMAlNhm
	 fWH5eu74skB7w==
Date: Tue, 23 Jun 2026 10:04:42 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Atlas <atlas-git@proton.me>
Subject: Automated L3 Leak Testing Framework for nftables (Network Sandbox Engine)
Message-ID: <pikD6W611JTG_qlz6Ts6YIdjQP6gvHlm_iF--Wb1r5mImR-P7xB76IwUxdTbr2qPkVPqVkd01eUF4AfgqZAQMmO9sh7HogXaoGz7cJ7GpWU=@proton.me>
Feedback-ID: 188920377:user:proton
X-Pm-Message-ID: 37e4a8695b415179c3bde1c7fe178163084eda4a
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------ad37fa301c9d7c9370a6972a510232decd40bcb9b0955cbaa7101e25b75bc9c5"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------ad37fa301c9d7c9370a6972a510232decd40bcb9b0955cbaa7101e25b75bc9c5
Content-Type: multipart/mixed;boundary=---------------------a084fd41d3cb923cb48cd613eed26112

-----------------------a084fd41d3cb923cb48cd613eed26112
Content-Type: multipart/alternative;boundary=---------------------d9e82492d5d04786e90217ae8cf716d5

-----------------------d9e82492d5d04786e90217ae8cf716d5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,
I am writing to share an open-source testing framework that heavily relies=
 on nftables and Linux network namespaces, which might be of interest to t=
hose working on automated firewall validation and proxy architectures.

While building a transparent proxy (TransparentTorProxy), I noticed a lack=
 of automated tools to empirically test L3/L4 cleartext leaks during proxy=
 teardown or daemon crashes (e.g., handling asynchronous TCP SYN retransmi=
ssions when a ruleset is flushed).

To solve this, I developed the Network Sandbox Engine (NSE). It dynamicall=
y spawns isolated network namespaces (ip netns), applies nftables rulesets=
, injects background traffic, and uses PCAP to verify the absence of leaks=
 during graceful teardowns.

To achieve a zero-leak teardown, the tool relies on a specific LIFO inject=
ion of reject with tcp reset rules applied just before flushing the tables=
, effectively clearing the kernel queues before the firewall goes down.

I thought this community might find the testing methodology-or the specifi=
c nftables state transition handling-useful for other proxying or containm=
ent projects.

The testing suite (and the resulting transparent proxy architecture) is av=
ailable here:=C2=A0https://github.com/onyks-os/NetworkSandboxEngine

Feedback on the nftables teardown logic or suggestions for further kernel-=
level hardening are highly appreciated.

Best regards,
onyks
-----------------------d9e82492d5d04786e90217ae8cf716d5
Content-Type: multipart/related;boundary=---------------------76cbb4169e0a0adc5d3c5228995578b2

-----------------------76cbb4169e0a0adc5d3c5228995578b2
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBsaW5lLWhlaWdodDogbm9ybWFsOyI+
SGksPC9zcGFuPjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJw
dDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiPkkgYW0gd3JpdGluZyB0byBzaGFyZSBhbiBvcGVuLXNv
dXJjZSB0ZXN0aW5nIGZyYW1ld29yayB0aGF0IGhlYXZpbHkgcmVsaWVzIG9uIG5mdGFibGVzIGFu
ZCBMaW51eCBuZXR3b3JrIG5hbWVzcGFjZXMsIHdoaWNoIG1pZ2h0IGJlIG9mIGludGVyZXN0IHRv
IHRob3NlIHdvcmtpbmcgb24gYXV0b21hdGVkIGZpcmV3YWxsIHZhbGlkYXRpb24gYW5kIHByb3h5
IGFyY2hpdGVjdHVyZXMuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZTogMTJwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiPldoaWxlIGJ1aWxkaW5n
IGEgdHJhbnNwYXJlbnQgcHJveHkgKDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB0
OyBsaW5lLWhlaWdodDogbm9ybWFsOyI+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29ueWtz
LW9zL1RyYW5zcGFyZW50VG9yUHJveHkiIHRpdGxlPSJUcmFuc3BhcmVudFRvclByb3h5Ij48c3Bh
biBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyI+VHJhbnNwYXJlbnRUb3JQcm94eTwvc3Bhbj48L2E+
PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7
Ij4pLCBJIG5vdGljZWQgYSBsYWNrIG9mIGF1dG9tYXRlZCB0b29scyB0byBlbXBpcmljYWxseSB0
ZXN0IEwzL0w0IGNsZWFydGV4dCBsZWFrcyBkdXJpbmcgcHJveHkgdGVhcmRvd24gb3IgZGFlbW9u
IGNyYXNoZXMgKGUuZy4sIGhhbmRsaW5nIGFzeW5jaHJvbm91cyBUQ1AgU1lOIHJldHJhbnNtaXNz
aW9ucyB3aGVuIGEgcnVsZXNldCBpcyBmbHVzaGVkKS48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBsaW5lLWhlaWdodDogbm9ybWFs
OyI+VG8gc29sdmUgdGhpcywgSSBkZXZlbG9wZWQgdGhlIDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOiAxMnB0OyBsaW5lLWhlaWdodDogbm9ybWFsOyI+PGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL29ueWtzLW9zL05ldHdvcmtTYW5kYm94RW5naW5lIiB0aXRsZT0iTmV0d29yayBTYW5k
Ym94IEVuZ2luZSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsiPk5ldHdvcmsgU2FuZGJv
eCBFbmdpbmU8L3NwYW4+PC9hPjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBs
aW5lLWhlaWdodDogbm9ybWFsOyI+IChOU0UpLiBJdCBkeW5hbWljYWxseSBzcGF3bnMgaXNvbGF0
ZWQgbmV0d29yayBuYW1lc3BhY2VzIChpcCBuZXRucyksIGFwcGxpZXMgbmZ0YWJsZXMgcnVsZXNl
dHMsIGluamVjdHMgYmFja2dyb3VuZCB0cmFmZmljLCBhbmQgdXNlcyBQQ0FQIHRvIHZlcmlmeSB0
aGUgYWJzZW5jZSBvZiBsZWFrcyBkdXJpbmcgZ3JhY2VmdWwgdGVhcmRvd25zLjwvc3Bhbj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHQ7IGxpbmUt
aGVpZ2h0OiBub3JtYWw7Ij5UbyBhY2hpZXZlIGEgemVyby1sZWFrIHRlYXJkb3duLCB0aGUgdG9v
bCByZWxpZXMgb24gYSBzcGVjaWZpYyBMSUZPIGluamVjdGlvbiBvZiByZWplY3Qgd2l0aCB0Y3Ag
cmVzZXQgcnVsZXMgYXBwbGllZCBqdXN0IGJlZm9yZSBmbHVzaGluZyB0aGUgdGFibGVzLCBlZmZl
Y3RpdmVseSBjbGVhcmluZyB0aGUga2VybmVsIHF1ZXVlcyBiZWZvcmUgdGhlIGZpcmV3YWxsIGdv
ZXMgZG93bi48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOiAxMnB0OyBsaW5lLWhlaWdodDogbm9ybWFsOyI+SSB0aG91Z2h0IHRoaXMgY29tbXVu
aXR5IG1pZ2h0IGZpbmQgdGhlIHRlc3RpbmcgbWV0aG9kb2xvZ3ktb3IgdGhlIHNwZWNpZmljIG5m
dGFibGVzIHN0YXRlIHRyYW5zaXRpb24gaGFuZGxpbmctdXNlZnVsIGZvciBvdGhlciBwcm94eWlu
ZyBvciBjb250YWlubWVudCBwcm9qZWN0cy48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBsaW5lLWhlaWdodDogbm9ybWFsOyI+VGhl
IHRlc3Rpbmcgc3VpdGUgKGFuZCB0aGUgcmVzdWx0aW5nIHRyYW5zcGFyZW50IHByb3h5IGFyY2hp
dGVjdHVyZSkgaXMgYXZhaWxhYmxlIGhlcmU6Jm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6IDEycHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7Ij48c3Bhbj48YSB0YXJnZXQ9Il9ibGFu
ayIgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiBocmVmPSJodHRwczovL2dpdGh1
Yi5jb20vb255a3Mtb3MvTmV0d29ya1NhbmRib3hFbmdpbmUiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6IDEycHQ7Ij5odHRwczovL2dpdGh1Yi5jb20vb255a3Mtb3MvTmV0d29ya1NhbmRib3hFbmdp
bmU8L3NwYW4+PC9hPjwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBsaW5lLWhlaWdodDogbm9ybWFsOyI+RmVlZGJhY2sg
b24gdGhlIG5mdGFibGVzIHRlYXJkb3duIGxvZ2ljIG9yIHN1Z2dlc3Rpb25zIGZvciBmdXJ0aGVy
IGtlcm5lbC1sZXZlbCBoYXJkZW5pbmcgYXJlIGhpZ2hseSBhcHByZWNpYXRlZC48L3NwYW4+PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBsaW5l
LWhlaWdodDogbm9ybWFsOyI+QmVzdCByZWdhcmRzLDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0
eWxlPSJmb250LXNpemU6IDEycHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7Ij5vbnlrczwvc3Bhbj48
L2Rpdj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTRweDsiIGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayI+CjwvZGl2
Pgo=
-----------------------76cbb4169e0a0adc5d3c5228995578b2--
-----------------------d9e82492d5d04786e90217ae8cf716d5--
-----------------------a084fd41d3cb923cb48cd613eed26112
Content-Type: application/pgp-keys; filename="publickey - atlas-git@proton.me - 0x1F67851E.asc"; name="publickey - atlas-git@proton.me - 0x1F67851E.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - atlas-git@proton.me - 0x1F67851E.asc"; name="publickey - atlas-git@proton.me - 0x1F67851E.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FYWNLOWt4WUpLd1lCQkFI
YVJ3OEJBUWRBajNYeDd2azNiWnBrMmF2b1dqWnlNUDRGMXF3aDVzYVAKbkYvUll0MUFvb1hOS1dG
MGJHRnpMV2RwZEVCd2NtOTBiMjR1YldVZ1BHRjBiR0Z6TFdkcGRFQndjbTkwCmIyNHViV1Urd3NB
UkJCTVdDZ0NEQllKcHdyMlRBd3NKQndrUW8zR1pBTnJmbjVoRkZBQUFBQUFBSEFBZwpjMkZzZEVC
dWIzUmhkR2x2Ym5NdWIzQmxibkJuY0dwekxtOXlaeUc5N0pHOTVxQXRpRFY2dkdMdkp5TUUKVzFX
V0J6eHkyaWdqazhFNTloTlJBeFVLQ0FRV0FBSUJBaGtCQXBzREFoNEJGaUVFSDJlRkhqQWljQnlr
CjhlMlpvM0daQU5yZm41Z0FBSVZMQVFDVHZhTzdtdHZRbTBGM2RhUDBhSlpabFFTeUF5STU3eDZt
ZlQzdgpqVkNsbndFQTRLeW9EWXhPMFF0dVAwaDVGSTk1MEtMTlkxWlpzN3J0RnBsN3dsRXc2d1BP
T0FScHdyMlQKRWdvckJnRUVBWmRWQVFVQkFRZEF3dkRnbGdIckR5SnQrcnR3KzFHV0VJdndUVHo3
eW8xemFyRkVPMVJvClR4Z0RBUWdId3I0RUdCWUtBSEFGZ21uQ3ZaTUpFS054bVFEYTM1K1lSUlFB
QUFBQUFCd0FJSE5oYkhSQQpibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21kVnFTaHFyRThp
QVpqbUt0SVpQSThyWmVHa01hL0kKdjhRTmtKT2x1aWVudXdLYkRCWWhCQjluaFI0d0luQWNwUEh0
bWFOeG1RRGEzNStZQUFBS0t3RCtOdit3CmZPRTE5N1VXQW9mbjZwcDJFL2N6emxQbjY3TmRGcytO
QnNhbmdjc0EvUnFUMDJIUlgvMGpFZUoxZndNMwpQUUZGby9od3d2RHBTYUJ1UXNjZXRYSUEKPVdU
bnQKLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQo=
-----------------------a084fd41d3cb923cb48cd613eed26112--

--------ad37fa301c9d7c9370a6972a510232decd40bcb9b0955cbaa7101e25b75bc9c5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wroEARYKAG0Fgmo6WiwJEKNxmQDa35+YRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfNoVLc9Tlka/yZ9PPhSdojpPplq6eYy8fbaxf8
dlDFtxYhBB9nhR4wInAcpPHtmaNxmQDa35+YAABkhgD4zKVJRIX9KZs6USgP
0uVme6Pr9qKAdssMNx57n9t0eAEA3qBt3QI5AB6zFZ3ahce8aEMkYyw+Kek8
LbWYXQ0P+wg=
=/K31
-----END PGP SIGNATURE-----


--------ad37fa301c9d7c9370a6972a510232decd40bcb9b0955cbaa7101e25b75bc9c5--

