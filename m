Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C82AF0E
	for <netfilter@vger.kernel.org>; Sun, 26 Jan 2025 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737914914; cv=none; b=DSxuZWXJfQHwQXK/t++d1c1kXMdIkoy+7aVvnmfDpUfbKuYk2DB1Fx1K+s2jh374f4v2ImnCFM6uaefFNdVmt9cijD2cC4z79rKONsr5Xti2rxGgRHnSukg54po8DGIv/nhALoGwEu2MZkjL7kAAf9h+z3V3OlQRGCpeiKnXlqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737914914; c=relaxed/simple;
	bh=c3KB7sV3I1S+q1SUCeLWw/MihF87uKqP6kXf0GFTjao=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6RCNQKUk74knv2h7ezQJOk0ekiE7V/RYAT3hdg4O2b+5e7HBPTFqB3/jbkZ63fwVPu2peXS72JGvjtKBPtkPx/B2IockuOYqz8x5iLwo+yJ70hfdJ6AeZvpAf0WdVhXkmZ5veeDDzjYrNVep6uhE8roXaU2zwXXOlz180+FqcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FoZ/6Hd8; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FoZ/6Hd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1737914903; x=1738174103;
	bh=c3KB7sV3I1S+q1SUCeLWw/MihF87uKqP6kXf0GFTjao=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FoZ/6Hd8O8CQl6+WPx3YIt2/j0bLnB+yP6ArMkc8hKj5obJMDDwmdqxaZ47wOIfrL
	 km371jcMlJjt3K1KF+Tn96+mTK3ilhNbQ1o6rU8xZbq4K0XpAbezXCYrvqGCShpCwB
	 A9+MM9xj+1Iafsz1VbeEcQHPh9ZYV8EqJ+3YLu9naOXRRgtljaitu8Ju/8dUlE1+c7
	 UkGadM2GsoXaE0N467rc/b/01Fwcw1L5AUf8Ls3LW4OO1GRxOucYN1TLXs8nURezks
	 jXYYYUudHyw8ao8bwNphfM+4l2nR4PNYWUr/eIB+AFJHxBTgf37iKZIwJEo2/Zp4kw
	 DK89DJWO5RuHw==
Date: Sun, 26 Jan 2025 18:08:20 +0000
To: Florian Westphal <fw@strlen.de>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
In-Reply-To: <20250126135021.GB3073@breakpoint.cc>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 297267482e5925a63e773cb7945529041e8e7726
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Please elaborate as what is wrong here in listing 3.

Within the second line of the rule (@ih,80,16 set @ih,80,16 & 0x3f0 \)

The mask 0x3f0 equates to 1,008 in decimal.
(3 * 16**2) + (15 * 16**1) + (0 * 16^0) =3D 1,008
Here '**' indicates exponent.

1,008 is far larger than the 34 bit range that I covered.
I understand that within NetFilter, there may be safeguards that which prev=
ent writing beyond array bounds; but, that section of the rule still covers=
 the bits that I did not wish to zero.

Apologies, but I have not checked the code as of yet.

sunny
