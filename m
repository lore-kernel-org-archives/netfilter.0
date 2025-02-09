Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ABF8462
	for <netfilter@vger.kernel.org>; Sun,  9 Feb 2025 03:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739070782; cv=none; b=ozyj0fRAgT/t9tyNm+oixZYBRNB0TyHn5EpAg9KqxQTayjBSRsIWpp34qI0udng6dMAAEwGzfc6AISsuDG91Zwsz4OVDfOugvoBKigR9d69jESwMpRT0N8Yt+TXl1IEORpFz6wnzBqbdy67Wjva+gp92Bu1wFRc4r/UE/IaG1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739070782; c=relaxed/simple;
	bh=MAFGlV0sJMIsRjSZv+smeEjz6v0yY01ymq2aIO1i7MA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HI8HcqzDQ8z1RvaWwmNwnFbAzI9fJV2xFrsUXsER4Cr61Hlno4392rxv7/MR8P9iZPIsTSTQcnTTyL0MtvhcbJlsLc2ZRwL4p9ET3PmmfDuuow8n6Z2eUrHguczva2Tx9C6PyZLK1KSZ1didrtVyFAklVviL7AixMUGllRUaLmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=MXHytvdk; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="MXHytvdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1739070773; x=1739329973;
	bh=MAFGlV0sJMIsRjSZv+smeEjz6v0yY01ymq2aIO1i7MA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MXHytvdk+tXHQQTBfhShmOScTkqFpLbenXPm0+OKpDnnkS6OWK2JEcEZJ5mq1Q2U7
	 5aV9IOLL8xZFzSvEWJ3mY5JbbrkultArpbJ9Lj7TSn/Ngo6ZhXRrlD0B5r7/v8SBxj
	 kzh7HLd14h+2RzmtFNboo8cXJaKffB1aQhozioWzYBKzF0X5sFQPLrQVUVkUBDedZr
	 JWxpOumI+xDIUZHNcqZHs7nMXnrYaXNDx4JA0TCfDxj0sIbrVFvK+BqqLUOCyrX1j4
	 pkwB99zKOH5bTKTfzQjHaRIA2y+Lw8hWRoonKtqINoTrxEDk7Q87vBJnSZXxJM4HnX
	 TIVve1R2NA2xA==
Date: Sun, 09 Feb 2025 03:12:48 +0000
To: Florian Westphal <fw@strlen.de>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <WBhjrc0cnQh1u_11--tRibauTRslpdAmnTsjeE4tfNg85IDiO5euCk3pLgdnqOZEhq5mbDD2IRo_XykzL7V0UeSisrebbDrIjGon0qifnag=@protonmail.com>
In-Reply-To: <20250209014753.GA1766@breakpoint.cc>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc> <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com> <20250128003706.GB29891@breakpoint.cc> <Z5jQgcbCXiLyPwV-@calendula> <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com> <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com> <20250209014753.GA1766@breakpoint.cc>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: d37e3631e0a470f3888f630c18c948d32d2e232a
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Still confusing, my bad. Here's what I'm looking for.

Input:
@ih,56,6 set 0

Expected output:
[ payload load 1 byte @ inner header + 6 bytes =3D> reg 1 ]
[ bitwise reg 1 =3D ( reg 1 & 0xc0 ) ]
[ payload write reg 1 =3D> 1 byte @ inner header + 6 bytes ... ]

I plan to propose a fix at some point, if possible.

sunny
