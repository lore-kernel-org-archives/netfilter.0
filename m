Received: from mail.redxen.eu (chisa.nurnberg.hetzner.redxen.eu [157.90.22.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBA236F8D
	for <netfilter@vger.kernel.org>; Wed, 11 Dec 2024 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.22.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910049; cv=none; b=gwgwAakpj5GJ6xRjWgG1IUgM6Ckt7B124nv8CvKmJXBlOikE0iWrgHb9kJ0rTT+XCGACjHatdZVLs3bX48D8PMhxy54M1G7UCv4mVVJp0kqRCnXrGufr69mB4rb+OI5XEWqmujnp4WiPY+TG+3oTivL/xxsdNK43Yity/FJc79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910049; c=relaxed/simple;
	bh=24qSlq+upSZoCyZ02AGJQDb7dqnzhMIIN9WjlU/QUP8=;
	h=Date:To:Subject:From:Message-Id:MIME-Version:Content-Type; b=McHGVRL8UKN8NboAijl9tXPNktt54O2e+9ehlKlxw7g/aoeudPX6o30gu1yxig1QjdMk+tWGyLwJA9ScIV+3m6Vjb402hOUO9XRwSE+dMXeadMIa+X6UtXu2k94leCeluEpT9trtB5b1Kfsiv0mZ6JjePT59q7E7tVBbKpulz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redxen.eu; spf=pass smtp.mailfrom=redxen.eu; dkim=pass (2048-bit key) header.d=redxen.eu header.i=@redxen.eu header.b=o3jSWwtg; arc=none smtp.client-ip=157.90.22.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redxen.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redxen.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=redxen.eu header.i=@redxen.eu header.b="o3jSWwtg"
Received: from localhost (karu.nurnberg.hetzner.redxen.eu [157.90.160.106])
	by mail.redxen.eu (RedXen Mail Postfix) with ESMTPSA id 59B875FA8F
	for <netfilter@vger.kernel.org>; Wed, 11 Dec 2024 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redxen.eu;
	s=2021.05.31.01-mail; t=1733910044;
	bh=24qSlq+upSZoCyZ02AGJQDb7dqnzhMIIN9WjlU/QUP8=;
	h=Date:To:Subject:From;
	b=o3jSWwtgdsUjZ0nfV6mV1/3jYmYoKlAPcIfumCj61ddY4xtD6v76tmtg4LG6q06gj
	 A1DrXWy/BqIkBdXuMTSKVYbRhXlrU7DpshTrnoUNFJSXjSkDOXtBfAGOh2iwmKOkCO
	 pvaw9IQrfyDNqmQzvTpOZ+N3Wmal3RcbyT9kZbPby05Myh6s1a511PvsUBWbsefNig
	 TTrxJi4YwCQHqFBTH+Jprx9Ts++GRU0GP+bE0dTIpXtDCj5gyYjo+LUa19WoTSNYMb
	 Ub0I+WbsanUwAXUsLVlA0u89LWpldeSpQz/mWeixOaRSpWj2EQ8TvNbLF7p5XmoTSA
	 NnfAngHeM9tTA==
Authentication-Results: mail.redxen.eu;
	auth=pass smtp.auth=caskd smtp.mailfrom=caskd@redxen.eu
Date: Wed, 11 Dec 2024 09:40:43 +0000
To: netfilter@vger.kernel.org
Subject: Regression 1.0.9..1.1.1 in glob inclusion behaviour
From: caskd <caskd@redxen.eu>
Message-Id: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
User-Agent: mblaze/1.3
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="----_=_0fdc8f6d0124a31d5d91d06c_=_"

This is a multipart message in MIME format.

------_=_0fdc8f6d0124a31d5d91d06c_=_
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_728c4c8a4082668e78ac4f01_=_"

This is a multipart message in MIME format.

------_=_728c4c8a4082668e78ac4f01_=_
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello netfilter users and devs,

Following upgrade to 1.1.1 i've noticed strange behavior in the inclusion o=
f my netfilter rulesets. Entries included via glob were duplicated. This on=
ly occurs when both -I and -f is used, due to the follwing commits:

6ef04f99382c074c3669de31cf0a70651662b261 libnftables: search for default in=
clude path last
302e9f8b3a1382cf09db32541693b5df7d80ca1e libnftables: add base directory of=
 -f/--filename to include path

Steps to replicate:

Create a directory with one or more rule files.
Include everything in the directory with include 'dir/*' from /etc/nft/rule=
s
Apply the rules with nft -I /etc/nft -f /etc/nft/rules

If the include dir is defined as a command-line parameter then entries are =
duplicated, while without it they are not.
This was not the case on 1.0.9 before these commits were present.

Has someone worked on a patch for this yet? If not, i might give it a shot =
myself.

--=20
Alex D.
RedXen System & Infrastructure Administration
https://redxen.eu/

------_=_728c4c8a4082668e78ac4f01_=_--

------_=_0fdc8f6d0124a31d5d91d06c_=_
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJEBAABCgAuFiEE2k4nnbsAOnatJfEW+SuoX2H0wXMFAmdZXhkQHGNhc2tkQHJl
ZHhlbi5ldQAKCRD5K6hfYfTBcz8GD/9416A6jhnlqaaQ6ypwX7DnfFSSW5kd0fyw
IOSSsvr63KiAR4T7PLlb/MK6+9UmA4B1zHEwHJCOVCbGzlHCegZ2xXouCrpoTdNZ
zAprK6MHQD/oeYHvuy3wIIDYsejdDDwC2s+Arql6X1p5ifLwN2+E7KQwhNt50U/t
Av2g1g7gjqpCRf311Bc1aj4QjImATD8iA1EfcI3aa5WFiFuHGUHn9wIYKST68Gam
C44VjIZwu5dtKNP+ronjxHo0V0S2tCX0feBsx59/IGeGwEBh1if45DqCIyBwq3ca
/jX1obLpcePDXpSetozFNw3RmcUuQveW5sB9eat5hkys/PUMPxb0ROzguNhX/kWT
ocSCTIx96C3Kxzh+WZLFJBRTf26B8XMKi0xqBjVd3jcDjGE+xD4AFUh5ecVmBv6O
HqOY4bHadL6cU1nkzFG1wyLUVTNkehgNmZQNLubFKsm7RR2uZ3fXZhdgI4qS9XWZ
9DMU2d0JAfpYZIzsRnD75H1vNKGgvuuOtwMbaQcSOT6Xox7pDQCHeE9wbukdwSLB
pg+3LuVkinfO/6RV9ine0q+++T9DMYBKWVW6kILwWjCjzjfk+kKts4+2XZRtV9K5
PhMlaeKBBitFCia+qq0ei6SgNVepr7mPnR+UJwN1iH+4/awgk6B9S7UYNtoJLD5I
akQXld4zEA==
=ZVIc
-----END PGP SIGNATURE-----

------_=_0fdc8f6d0124a31d5d91d06c_=_--
