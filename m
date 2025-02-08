Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5A243968
	for <netfilter@vger.kernel.org>; Sat,  8 Feb 2025 20:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046379; cv=none; b=rmuvRERccBruo3ZckqVDF6EYJPqwKNgE2jy0n5L6bjKqD27ugL7xM2diAEwXhTmGBO+Gk89pfhB4owEOaQZu/a6AXrqiAgDwZ+nb+CBEAahK1vYC8Jpn0yRdoDG788oQ4XoznVMD62xAnd6lmHda0EoCxK3o22MEzPAGY5oNRUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046379; c=relaxed/simple;
	bh=XIHU6zKa9+baZCOF4YIpLF6XnBG4OuhFPZvu7cwEP3I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7UDnv+4PXK1GjTjPKC/xrsvsA56TRDUpo8f9fy9BzOb6ZCtSzWEzMA1WDmIvxS1Un+H3IhxQUs0BtZB7J8OvmNjk/QUzDOCtIR1o02EL+prBMr8jC2VMbAM26eDoye5zzA3R3bWBK0KrxkcWZpT1tf7YvFccSHI1A0rPne2Sl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=yFG7hBn+; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="yFG7hBn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1739046372; x=1739305572;
	bh=XIHU6zKa9+baZCOF4YIpLF6XnBG4OuhFPZvu7cwEP3I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=yFG7hBn+/d1RfbIxjPtj1kSZC4PWdoaBj9raWy6j9CcBA1ShlqUCJU7yc7FB3xXO1
	 9uNaaeOD4hyH2xXUIJqircN1rwQgWJlSF1UbdZeguWVKTVC8TMgZIbgpfKHbE1JCoL
	 qJml7lSSDK89qA/fNzbEHgsxiq9MA1CQmX0ITa18bupJFmnoxaRV8ne0fVpCeCXOFa
	 Q8TWHnZCWOWKPGl9tL5PENq0gPkUYKSXvlcvRY/XlcfXAarNTAKxB8DwIthW9yXV/4
	 niYbqESR/jhmcgDl2qkzh6aGv0Akhnhr1Fsr2Cj/yBAe422QHBrcje+RhQ+dVs1G9e
	 jDPnPuQGcYJYw==
Date: Sat, 08 Feb 2025 20:26:09 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com>
In-Reply-To: <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc> <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com> <20250128003706.GB29891@breakpoint.cc> <Z5jQgcbCXiLyPwV-@calendula> <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 45692a112d3661b8a3bceb9b3ddd107d694e7506
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies for my mistake in these threads. I think the title should read 'o=
ut of bounds read'.

I noticed there may be a floating point error or another miscellaneous appr=
oximation error when calculating the mask for raw payload expressions. It i=
s somewhat related to this thread.

using nft -d all (debug all); I found:

inet filter output 5 4
[ payload load 2b @ inner header + 6 =3D> reg 1 ]
[ bitwise reg 1 =3D ( reg 1 & 0x0000c0ff ) ^ 0x00000000 ]

After careful consideration, I realised that here; '2b' indicates two bytes=
, not two bits. I suggest it should read '2 Bytes'. Additionally, the "+ 6"=
 section should really read as "+ 6 Bytes". "2B" or "6B" may get misread as=
 28, or 68; if the user makes a poor choice in font. Poor choice in font is=
 not my concern, particularly; but fault-tolerant design is always nice.

Anyhow, with the alterations to expression; I can then match it (2 bytes, o=
ffset of 6 bytes) to the 'mangled' input of @ih,48,16

> [ bitwise reg 1 =3D ( reg 1 & 0x0000c0ff ) ^ 0x00000000 ]

Assuming that the mask is stored in a 32-bit integer field, the length of t=
he string is fine. Otherwise, the mask of "0x0000c0ff" equates to 49,407 bi=
ts.
Since raw payload expression includes the starting position in payload expr=
essions; it is really 49,408 bits to match.
Via empirical calculation, the closest base 2 logarithm I can find for 49,4=
07 (bits) is approximately ~15.5924570373.
If the mask is intended to cover 16 bits; should it not equate to 65,535 bi=
ts; or "0x0000ffff".

Though, the intent was not to read and set the same value; rather, it was t=
o redact 6 bits of data. Considering the intent of my input statement (@ih,=
58,6); I think the mask should be ((2^16) - (2^6)); or 65,472 in decimal; o=
r 0xfff9 in hexadecimal.

This leaves us with an output statement of (little endian mask, as it seems=
 is the case):

@ih,48,16 set @ih,48,16 & 0xfff9

The statement:

> [ bitwise reg 1 =3D ( reg 1 & 0x0000c0ff ) ^ 0x00000000 ]

Should then read:

> [ bitwise reg 1 =3D ( reg 1 & 0x0000fff9 ) ^ 0x00000000 ]

sunny
