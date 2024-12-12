Received: from mail.redxen.eu (chisa.nurnberg.hetzner.redxen.eu [157.90.22.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87F17F4F2
	for <netfilter@vger.kernel.org>; Thu, 12 Dec 2024 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.22.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999608; cv=none; b=MgSs04qfckgyDUP/VJeFV9ZF0jvhjPmJinFWhA8rAMpiZnsRs3Qb1RmVdSEdOJ5T9/ocMPkA8MMO3pR6Vm6xu5nx8zY5ASQz5h0X3U+Jmc8lyn0r+BQQTTBJ4APIe8kBFQJSsznTLJZsNGordsGf43IRuTOKQpQOQJOkWx2EG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999608; c=relaxed/simple;
	bh=utekxygjmZZWmx+AJJe2oHfyh5HdRiUP67GmPlRC+qk=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=Zm+pI9qseoNTYvygj0G+rQ7WzfzFoA8205E84s2u0j1eOIovx18sIO9HkSg2nl16X1U9mMMsCxF9nVk7u9yIKtTaYDrXbvzDt9InTa6KcbCfRe9dqYenrj4OyUn8oszmoKVPEt8Tj4EbiW6NZ4VG85FlCdr+qsyFl+hYL2oLubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redxen.eu; spf=pass smtp.mailfrom=redxen.eu; dkim=pass (2048-bit key) header.d=redxen.eu header.i=@redxen.eu header.b=iOERXfSw; arc=none smtp.client-ip=157.90.22.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redxen.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redxen.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=redxen.eu header.i=@redxen.eu header.b="iOERXfSw"
Received: from localhost (karu.nurnberg.hetzner.redxen.eu [157.90.160.106])
	by mail.redxen.eu (RedXen Mail Postfix) with ESMTPSA id C9F575FA85;
	Thu, 12 Dec 2024 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redxen.eu;
	s=2021.05.31.01-mail; t=1733999595;
	bh=utekxygjmZZWmx+AJJe2oHfyh5HdRiUP67GmPlRC+qk=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To;
	b=iOERXfSw/uMMzEk1DDLS+OHpxTh/c0MpCzFwaZ+s/2j4ZNmXRvlpDFTi1QpS5rKg5
	 L18QTRgeaZacNZh49JiNADVIz/BKTmZ2sTM6OCbhzoD/46UXu2iIMt3SgDwOdTyTJi
	 ee3JWV3Bk9d6UiVdEfJhYH99z0D2zdoRKUXqfPC6lcZ1qUu+sX09XbNd+GdmPODKaK
	 AaC8dWAW/tvrCq+SeFGIJrMr8c2BWS+o5AJbkD1aOR4Ar77p1SWbUekz9PVxPNhGSb
	 lhritR7ChZvJM26SGy4/4OwanF12F8ejvzLc9z9PhF+ru8v+o8Iz1NCTnAyiifHMx1
	 DRRzcwFB1Iimw==
Authentication-Results: mail.redxen.eu;
	auth=pass smtp.auth=caskd smtp.mailfrom=caskd@redxen.eu
Date: Thu, 12 Dec 2024 10:33:14 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Subject: Re: Regression 1.0.9..1.1.1 in glob inclusion behaviour
From: caskd <caskd@redxen.eu>
References: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
 <Z1n9Gj6UaA5CfQIj@calendula>
In-Reply-To: <Z1n9Gj6UaA5CfQIj@calendula>
Message-Id: <1YCABX5KN97Z8.2KUN1QSJDL07P@unix.is.love.unix.is.life>
User-Agent: mblaze/1.3
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="----_=_6747bbde093a18640fefe422_=_"

This is a multipart message in MIME format.

------_=_6747bbde093a18640fefe422_=_
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_0e68c20f12aca3077cc625be_=_"

This is a multipart message in MIME format.

------_=_0e68c20f12aca3077cc625be_=_
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I don't manage to reproduce such duplication with 1.1.1.
>=20
> Would you make a simpler reproducer?
Yes, surely. I've tested the following in a priviledged debian unstable con=
tainer and i have the same behavior.

mkdir -p /tmp/test/include
echo > /tmp/test/main <<-EOF
table inet test {
	chain test {
		include "include/*";
	}
}
EOF
echo "tcp dport 22 accept;" > /tmp/test/include/one
echo "tcp dport 25 accept;" > /tmp/test/include/two
nft -e -I /tmp/test/ -f /tmp/test/main

Executing this on 1.1.1 results in the following being executed/outputted:
root@nnd-navi:/tmp/test# nft -e -I /tmp/test/ -f /tmp/test/main
add table inet test
add chain inet test test
add rule inet test test tcp dport 22 accept
add rule inet test test handle 2 tcp dport 25 accept
add rule inet test test handle 3 tcp dport 22 accept
add rule inet test test tcp dport 25 accept

I've replicated it also on debian nftables with the following invokation:
# podman run --rm -it --privileged --network=3Dhost -w /tmp "debian:unstabl=
e"
# apt update
# apt install nftables
# ... (steps from reproducer go here)

> What default directory you have for nftables? You can guess via:
>=20
> # nft -h | grep "\-I"
While i highly suspect the include dir path is unrelated, here they are:
Alpine v3.21: /usr/share
Debian trixie/sid: /etc

> Thanks.


--=20
Alex D.
RedXen System & Infrastructure Administration
https://redxen.eu/

------_=_0e68c20f12aca3077cc625be_=_--

------_=_6747bbde093a18640fefe422_=_
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJEBAABCgAuFiEE2k4nnbsAOnatJfEW+SuoX2H0wXMFAmdau+kQHGNhc2tkQHJl
ZHhlbi5ldQAKCRD5K6hfYfTBcy92EACFe+Ps3LIEruSGw7g/n2/ZfAA9gxMnAVts
1Bt5G9Xmf1krygX9GBH4Ok7Zxi0fKhr8E1AOWkDXBAUsBalws2B6FFGiGDQH+pSN
RAtY/Z3I1QFI3lE+xNXwjbEC2Wu1a/VVUgxj9fB+oVPPuqPc5P0taUXn3pqVP3gf
YMccR4ea6SvbKjFFm8UFGeJj8UOxIM/Dz7VUKOiUBrDV5gJ7W51Q4atB1G/aOi6r
mQxv2U5xMEL+cjeKiRVEy838w3xhM3P4XGNZZdNQRhBl5+8BH1SJGHMGuvbNBur8
/+r03iUMURAw4u+A4jITQBmCt/FLZNtpZKVHK14laVbcRaPYqlfKs8FQEWTd7eWQ
K6Diy8fhAIO+wssCRJV/kNoWubWrmcLrOycpwyjbVSLPGuekGdNBi9mgYYc7xySp
TlqPxMil31GK05PFVDzXnlBQVi/yEknFoKd43LoVpr2n7U+JH50avooLo5k+BNsh
oBWj7Y1mFcCxssOL+yFTuJi4ftomJALC+Wx4+qmMN5CsskzY/sB/dkCXed3N4dgw
hq65lgbGiV+Krko/M9IvY7z7rOAOepjY10tka4XzwNJV+IwaRB3L0f1aYOTwnqLt
A/2+Zf5tTl8taFoHamoyGQNpC8wyjpVbQ5vDgSQ+Cmr9sKfyMRRcvV9elfB6nuc/
KirJ6q1S+Q==
=QC7F
-----END PGP SIGNATURE-----

------_=_6747bbde093a18640fefe422_=_--
