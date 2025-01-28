Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20913BADF
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738038018; cv=none; b=JudJlbYnwixR/6146Lw//ou2B/EWbZLbFSxhW1qFq4NjRuxxZXl2tIyBSQ8xrIzwvzdaTTXOjH2YYTK+MKZEsr25AWW9VxNhd8vzSAg98oWRQH98HFy9xrrmU1sx5hKsz55ntD7/ZJfod/OSiQ3/jRARHv2A+MTDrf5RKhBi6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738038018; c=relaxed/simple;
	bh=fVjq+Af99H/hyT+pVX771//TEX2NnTMC8vFG+bCrP1k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+nn1HIGhnOWb3DkUR9MQ292pa2QMVKpKFZSBJhMNLiKv9qelL+oUGBuVaIRYEzu3kRPMiJHXV2eY45fnALVzYZCIGJJBMjMMu5CBQkTf1JOR6XAoeuBLmdUmfHFZEw+iYFj/wbJ6Z6OMwI66k/S0tQLPKrB6TbugwJUsRbXa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=trTyKD/q; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="trTyKD/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738037999; x=1738297199;
	bh=fVjq+Af99H/hyT+pVX771//TEX2NnTMC8vFG+bCrP1k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=trTyKD/qjriSLte4vVUa2o8hXf6vUI6UAfD0pSl+qz8fgOmXqeZK6AnFyWe6YtkSt
	 t6AI8EqUTq5Kl69R6To8ld+pDoNRG3GBibjc25F5CGvkeKSgt82rCI24FTymD88WIC
	 yFGxfKUdphyyN2iWWobsH5fFOTHu5WtDJ2TdAUDhyZz9z5zM7P3HCj8lPvumCsO45J
	 nFD+0WrxL1/cgfPhv3MineE6T0xAQ2bb2iCiK+IIGsd41Hfq+t0Oj/swoM+LSeLyzk
	 uubvTqCj0vnrLM9jqVZt1LeMTc+ZRzbX9D4hAztmAC6A4UdzPTkO/o5TmsJ11oPVvv
	 nnGYmGHPWT6qg==
Date: Tue, 28 Jan 2025 04:19:55 +0000
To: Florian Westphal <fw@strlen.de>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <KzQMgyTEENAtLkTnyJgmjSJRjhrPRkiRZnDoPpM7P8n7Xs-yWpoBwP_SP12Tmn2ZGkEFLnzRRAOr4BNFwYUCKifrV8lgAtDEfki4KlpDaXU=@protonmail.com>
In-Reply-To: <20250128003706.GB29891@breakpoint.cc>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc> <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com> <20250128003706.GB29891@breakpoint.cc>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 370207070cd09e77c4ea6d685036f7e89b2136f3
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> ...but I had expected
> 0xfc0f...

I disagree with the proposed mask: the message is likely not 64,527 bits in=
 length (0xfc0f -> decimal: 64,527).

> Use --debug=3Dnetlink

Apologies, I am not sure what this refers to: I assume it is a compilation =
argument; and I cannot recompile NetFilter as of yet.

I am using the `nft` command via '/etc/nftables.conf'; on an installation o=
f the latest Debian 12.9 release. `/usr/sbin/nft -v` prints "nftables v1.0.=
6 (Lester Gooch #5)".

Debian CD Signing key fingerprint: DF9B9C49EAA9298432589D76DA87E80D6294BE9B
Debian 12 Bookwork release key fingerprint: 4D64FEC119C2029067D6E791F8D2585=
B8783D481

An example of the problem. Hopefully my explanation is easy to understand:

To match "Version 4" of IPv4 header, and to clear DSCP code point (DSCP isn=
't used on my network):

- At network header, bit offset 0, select the next 4 bits, and match the de=
cimal value 4.
- At network header, bit offset 8, select the next 6 bits and set the value=
 to 0.

@nh,0,4 0x4 \
@nh,8,6 set 0x0 \
accept;

Translates to:

@nh,0,8 & 0xf0 =3D=3D 0x40 @nh,8,8 set @nh,8,8 & 0x7e accept

I view this as:

"Version and Internet Header Length, mask 240 bits, match a value of 64."
My issue: I did not match IHL before translation. The rule may cause droppe=
d frames that I was not concerned with.

Then;

"DSCP, and ECN, set to the same value, covering 124 bits at some offset" (I=
 am assuming the offset is @nh,8).
My issue: It has not set the bits to zero as I intended, and what to do if =
the bits selected (0x7e / 124 bits) is larger than the destination section =
to copy to (@nh8,8 / 8 bits at 8 bits from beginning of network header.)

I cannot be certain of the correct way to translate the rule given the 8-bi=
t backing store restriction. If I am only concerned with 4 bits, then, in o=
rder for my rules to function, a mask of 4 bits must be valid.

I propose that a 'bit array' backing store may assist (though I sense that =
may reduce performance). Without a given socket buffer in memory; it is dif=
ficult to form the correct mask, where the mask must be larger than the sel=
ected bits.

I would love to assist, though, I haven't read the source code of NetFilter=
. It is possible that I suggest an incorrect change without reading the sou=
rce.

sunny
