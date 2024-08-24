Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED528F1
	for <netfilter@vger.kernel.org>; Sat, 24 Aug 2024 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724463022; cv=none; b=aQtZZH0AqFFu1xDXzJOtsEhwACXUHQcs+LKR7Q4hiB5kdMsaQzRo6nyWtQGAlfJTr2xj+BTj9VKXrc6rgjBULjf3i8quUthuSXBQS/jEP6Cgb0W4dEu7Dr4u/QVTNPjqaeZDR6MBioCyKdBkE5gSXFHODFuR5ZoxtV1pj4Xo5JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724463022; c=relaxed/simple;
	bh=BIcm1qc84DTdbNuv98pcDuOY0cPeGynAFahgaipjP+c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UckRtzPHDgEZGgIxAhGqV6OQoD6ABFfadK1ZrkzGoDg3I6mY1coU5C2caW5bmjB3HyVFVYke1kX4po5MFByu0bueW+FD3iiS7MVUH1HFikrCj0mHlO2fh0Mwg/w7DfKFHMh97br+5FAE8voSsFy7dPJS+K8T0KTlMC5NANdIJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Pmtu2R4/; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Pmtu2R4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724463002; x=1724722202;
	bh=6bx1zwC5Kajy9SeZz9ovt61LT1STYdodhUMIsX94nmA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Pmtu2R4/3S6zQp6CyED1Z3/To0W/RhlQSG9OPZlzzkrAZ0SEnz9JiTmUWf0fpkIqX
	 VJf8nVWNEmus4MdV0eDNI44wD3UMy+GIm3K/LSfI4N7+tWeTd3vnDpdYBdyPvtCRs0
	 qcmb4TvqjLs6+IqShXX53PYLkVtij8b6EUJ0b4TjCKgFcXUb/eG6KO9zvoiAX8v4BC
	 7Owmy7r6hyty4MrJYk8+d++87z0RomE7zGIJkiMBo57chRY6WLz99yt/8PyaQ8mLvB
	 Bxm0V+WgYuFci0MpChFU/kiYWsA+9kaoacHkYiso33XYIfY5cZsPvdIm+z3dTmwZkD
	 cqHSHJ/pQgQNA==
Date: Sat, 24 Aug 2024 01:29:59 +0000
To: Brian Sammon <bds@fourthriver.com>
From: Eric <evil.function@proton.me>
Cc: netfilter@vger.kernel.org
Subject: Re: Understanding output from "nft list"
Message-ID: <PPakm968H60z2Pp56GEGLIOLY-AQDd3zXR2UyWsdOpiT9Nhp2NiaiHFWLR32BOMaOICmRdfvkr3IZ2dqocGy8Mqloz1h25aoJrD1lv42tbM=@proton.me>
In-Reply-To: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
Feedback-ID: 48716100:user:proton
X-Pm-Message-ID: f0953e27a82b62efe6932b87826cde3f68808ddd
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, August 23rd, 2024 at 15:50, Brian Sammon <bds@fourthriver.com> w=
rote:

> Is there a document that is good for understanding the output of "nft lis=
t"? (more specifically the kind of output that comes from "nfs list ruleset=
") In particular I'm looking for a description of the syntax.

Like Kerin says, experimentation is probably the best way.

One trick I used when learning nft syntax (and still do), is to use nft lis=
t with and without the -j (json format) option, and compare the two sets of=
 output to get a better feel for what the "terse" form means.

$ nft list chain inet t1 c1
...
$ nft -j list chain inet t1 c1 | json_pp
...

(Having written compilers back in the '80s, the parse-tree form of the json=
 looks very natural to me, although I suspect it isn't all that much better=
 for many.  But, it won't hurt to try it and find out.)

Eric
