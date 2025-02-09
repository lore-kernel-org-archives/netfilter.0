Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524417BB6
	for <netfilter@vger.kernel.org>; Sun,  9 Feb 2025 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739141145; cv=none; b=qJPkrMyPqrEMOMFd2gsgkHMdWnaf/BtoCv+KSVg/dyC8Iyfp/6m5cOyJq/INXBTKZ+8bTAf5UtT8uQzNjQDZIkPp9I+KYzDV5ulhPsAP8PUyZCEMnOtCmBHi1kmMJcsdThDbWGuUgwinCdlkNmWwCGcO+27E1T5fZpGco8SM2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739141145; c=relaxed/simple;
	bh=aejbQRUHsLaA3FjgJYkOXq+eB4e3gf3t3dxzhHwIjnA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uV2iVRvk1gXfFF4nmHqc2JAC9LIB+MvpgrCsgTrr9jyblMjn3HrhpB+vD4qiW5s00IxY+o83BuJdVvsS5M3umUZqycWq2GxuyETWlqHNg1dcQexcftaM3wDxF+k7WJPA9Td28XHbQtp1QlSmvoXrf5Fplm+mjlRpPLcjAZgqcvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=aRKaL7ZA; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="aRKaL7ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1739141137; x=1739400337;
	bh=aejbQRUHsLaA3FjgJYkOXq+eB4e3gf3t3dxzhHwIjnA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=aRKaL7ZAlsBjb8GM0kuhneKG/s95HteIEcerPhazMunLeMvl02zftIfCp8la6Mk1f
	 iQVU0gx1hBNkB2Q0wI9Eo3w4ZY/o3YeJqa54bBSEd9KgRA/sdryyq0DQjMKaAFNbJ8
	 Nj+doUMJsSjYxUx+FcIyey6oMkeP5oujKpfV/rsFGH/4CSefNhI/hpTf1h7ahVnokg
	 r5GTOQeAdbgJVzJ+JGUF2kcvSeHVn9z0tlBEaENI6bG1C97768hO4ApS3fIwBJPeMf
	 B/TZefEPtmYV6YLw5iTNAOkE1U87fb4Y3X/aseprTCKTlSHmVba/g5vyFZSfGVrzf/
	 GoYi+u59I5oIg==
Date: Sun, 09 Feb 2025 22:45:31 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <GkTCZ4QMPjhS04MCXYiLoDrM7d866Suc7ALxvplJpr9bcr6HRlooJ6_xsL4TUjr6Svkztc5Gz9FOqzQAON_GvpjFyPGPpUqaE_sGaBiNBgc=@protonmail.com>
In-Reply-To: <Z6kq8I6WG96GkNsI@calendula>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc> <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com> <20250128003706.GB29891@breakpoint.cc> <Z5jQgcbCXiLyPwV-@calendula> <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com> <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com> <20250209014753.GA1766@breakpoint.cc> <WBhjrc0cnQh1u_11--tRibauTRslpdAmnTsjeE4tfNg85IDiO5euCk3pLgdnqOZEhq5mbDD2IRo_XykzL7V0UeSisrebbDrIjGon0qifnag=@protonmail.com> <Z6kq8I6WG96GkNsI@calendula>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 9ca20b9955f4f97f7f9ed761dbcd51ac6d2f43fe
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> this is in bits.

> [ payload load 1 byte @ inner header + 6 bytes =3D> reg 1 ]
> [ bitwise reg 1 =3D ( reg 1 & 0xc0 ) ]
> [ payload write reg 1 =3D> 1 byte @ inner header + 6 bytes ... ]

haha

[ payload load 1 byte (8 bits) @ inner header + 7 bytes (56 bits) =3D> reg =
1 ]
[ bitwise reg 1 =3D ( reg 1 & 0xc0 ) ]
[ payload write reg 1 =3D> 1 byte (8 bits) @ inner header + 7 bytes (56 bit=
s) ... ]

I suppose you are correct there, I forgot to adjust the offset.

sunny
