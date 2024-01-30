Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD37D3FC
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652354; cv=none; b=XnCenhLxhs6aw/+eWBovLUHz35DBLgrC6oWkg9pN82qNG7oWHYP2fFhqCX5iWfoPnN8tmcivzAwM/awA69ppV6N2UDsPOkXwmmyXjMRLZoJJgnnD7n8UnUiRU5n5Q5xpgwW07J78Z37/PIuWycZn9BJTWPjhnh5BZMghv0bJN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652354; c=relaxed/simple;
	bh=PR99aYlB/djB/UPM8UX9sYW7NaeUp2Wj/NTbH5qvqFo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GQB6lRAgpV4HI9V9ag9Zftw5aX2brkgp7LCHK7ZWtLsivtMO3IMUAjdTxUwwOXp0gcVsgNScjeHGltN5wevS76AdoIWc2RWjSMbLoiOsb8OwmpV192uicru5yVLUEZYleBPIvh/gyzf9YzgEmz23QLEwryTM1e9Qf9Tw9sXxwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=DJpx5j+A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IneS00BI; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="DJpx5j+A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IneS00BI"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id DDBF55C007C;
	Tue, 30 Jan 2024 17:05:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 30 Jan 2024 17:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1706652350; x=1706738750; bh=yJAOuXXSL/Z0Oa8yCwwyPunTgvGfQLAz
	uOyWAoMJ8P8=; b=DJpx5j+A1UHBBHFwBVQgAVLOXBVbChNLcZu65tdm0k+cYN/c
	DmZni7X3etpoX6Mu1s4oiJK1vh+u8Ni5QadtsMSLdCB4LqLOgTgE8d5Tg6UyNX9E
	JMfKdO6BZl0efF/ppngXkSIne6AA4oDysbvPZcY8QNWa0qpPnOlz2OSR/tJZz3fI
	PgMoSkWSQ3AP8vwWuWSdsn++yV+yZcK+C284S8zedQZYB/maXs0x+RKjk6EBjLlG
	j4M+B2JPipVUcMAv6hBYUd9d6AtBC90Pgo9OAxyRretrCy0dFJo7Gd1VVK9HHle9
	LXZVsl47n+QwGb7dEYwK3haIm7HiPBSoNN3bmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706652350; x=
	1706738750; bh=yJAOuXXSL/Z0Oa8yCwwyPunTgvGfQLAzuOyWAoMJ8P8=; b=I
	neS00BIcdBWzwfp80HRaIyvY8Bx/Z4LtKLX9m8R+5D0qGN4QaNtOiiCqyCX5zCqz
	AHlkZxtigyKikEyw+LghLFYUPElix+wF3FkkAOCjyz4ZQJNY5q8izWmMUlXxKEvR
	E4qXWn1YQh4w8RUUw9wsH+ChJfa6DcC5AHPmQwAqAQz34gBUG8+h6rMYRBZM8xRP
	r9D/eorOpdebHW8G7ilWbsBhafzJ+0O+pjW9WxpuiH4qpq1sJ33fthk+ZP0sZSN0
	NGxmwjyhNVENLikWTMxJYxfjZ1m86A37yxYs+E1Mjkbea/QrXJyAKJhIptblr2qp
	yYxYhvfhbByLgChBu6DRg==
X-ME-Sender: <xms:vnK5ZdH23hKzTs5v0olJdSEWo9FL3opd789HbvPEHptAPj56V50O8A>
    <xme:vnK5ZSX5UGlzJ0dVxhDG4zybo6sTugoSFT3k0dW9otC0ix--6tYsptTQzfollQHKf
    EjbGjMZkSzYrh8F>
X-ME-Received: <xmr:vnK5ZfKqzVKzUoVAbNWaeBw1kAiI9IvK1hjdmo6ooXU92UdNR-RVaxJSV10Bq10GhoVnjeleQZUP2HyF6iEO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtjedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkjghfofggtgfgsehtkeertdfjtdejnecuhfhrohhmpefmvghr
    ihhnucfoihhllhgrrhcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpeduheevfeffudeffedvfeeigffhheekueejueegvefhgedtheelieetjeel
    tdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:vnK5ZTGhIsGw5_C8-rmXcgC0I9C-cETvvnPU5v5qkElL-37wP8k7Jw>
    <xmx:vnK5ZTVsAKzFmrf_pGBaUnk8uz7wqklutCVMjsZF1zyKCuRGsTryRw>
    <xmx:vnK5ZeNMKNVR9ijsWubmVVri9CPbX4MFU9WKTPQ1_1n4MAgk703QmQ>
    <xmx:vnK5ZadBAD7T6JAJN3vyULiC_x4d_U2OgMf4P9VuFCxKCdxdMMWX5w>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jan 2024 17:05:49 -0500 (EST)
Date: Tue, 30 Jan 2024 22:05:48 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>
Cc: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-Id: <20240130220548.e8ef0afd93b2443beb347883@plushkava.net>
In-Reply-To: <47667AAA-1B0B-4262-AC20-2F224B2BB092@slavino.sk>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
	<e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
	<Zbj04V-90zpQwEzl@torres.zugschlus.de>
	<cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
	<05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
	<eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
	<47667AAA-1B0B-4262-AC20-2F224B2BB092@slavino.sk>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slavko,

On Tue, 30 Jan 2024 19:34:30 +0000
Slavko <linux@slavino.sk> wrote:

> Dňa 30. januára 2024 17:57:21 UTC používateľ Kerin Millar <kfm@plushkava.net> napísal:
> 
> >It is easy to say that it is pointless if not the one to be responsible for implementing and maintaining the code and trying to take into account diverse - and occasionally conflicting - user desires. There have been various set-related bugs in nftables over the years. Complexity surely matters to someone. There are multiple open bugs now that concern both performance and memory usage. Efficiency surely matters to someone.
> 
> Please, aproximate my English, it is far from good...
> 
> I mean mostly that, that IPv6 becomes reality, and soon or later (the later
> is IMO more realistic) will replace IPv4 at all, thus all L3 addresses will
> become 128 bites long. Sure, here will be always penalty in using 128b
> addresses in compare to 32b addresses, but world is (slowly) moving
> to IPv6, thus that penalty is something, which cannot be avoided.
> 
> Debate these penalties sounds for me exactly as debate when 64b
> OSs started. I remember "arguments" in that time -- twice of memory
> consumption, twice of binary sizes, etc... While all these arguments
> are (or can be) right, they are pointless, as IPv6 is here and is not
> avoidable in future and we all should to learn to live with that, despite
> if we want or don't want it.

I see. Fair enough.

> 
> >For it to improve, you could put forward a concrete suggestion as to how it might be improved, be it supporting logical disjunctions in rules, supporting a generic address type in sets or whatever else.
> 
> I am not able to provide real suggestions, as i don't speak C and i
> have minimal knowledge about netfilter/nftables/kernel internals,
> thus i can be totally wrong.
> 
> Anyway, i  have some ideas from user (admin) point of view, of
> course. I can imagine this:
> 
> + sets will store protocol agnostic L3 addresses and it doesn't
>   matter (for me) if IPv4 will be mapped to IPv6 or these L3 sets
>   will internally maintain two sets -- one for IPv4 and one for IPv6

Now that you mention it, I thought that I recalled someone filing a related issue at bugzilla but it seems that my memory is playing tricks on me. I can find no such issue now, although there is one that (sort of) proposed an equivalent to the list:set type of ipset. That one was rejected.

> + nftables syntax will provide some sort of abstraction, as it already
>   provides eg. for UDP/TCP ports (th dport), eg. "nh saddr" (nh as
>   network header)

It would require some new syntax and/or grammar, indeed.

> + nftables will provide abstraction for ICMP(v6) types, something
>   as it already provides for reject, to one can build common rule
>   for both, including the one common set/verdict map -- for me
>   it doesn't matter if it will internally map namex to protocol's proper
>   values, or specific names must be prefixed eg. by ipv4 and/or ipv6

I could see that working well enough for types that both protocols have in common, such as echo-request.

> 
> > That would, at least, be a step along the road to (potentially) convincing whoever is going to do the work that it is justified.
> 
> Yes, that was initial idea of my reply, we all (users, admins, devs)
> have to provide own point of view and find best possible solution.

Yes, absolutely.

> 
> >On my part, and despite having been a user of nftables for many years now, I would prefer to see its QA and documentation improve ahead of - though not wholly at the expense of - new features being added.
> 
> While i played with nftables for years, i use it only on one of
> my servers yet, and even this machine uses mix of iptables
> and nftables rules (the real blocklists are still using ipset),
> the ip(6)tables is used only to drop traffic, all other logic is
> done from nftables. Nothing extra, just slightly more than
> basic firewall, it uses sets to limit (per IP/net) logging,
> connections, dynamic blocking, and every used set must be
> doubled...
> 
> My nft sets doesn't contain huge amount of addresses, as long
> time blocking is done by ipsets, with (semi) persistent and from
> fail2ban (up some tens of days).
> 
> I implemented it about year ago, and yes, the documentation
> is hard to read. Most of it is ip family only, some parts are
> hard to understand, and even more hard to combine together.
> But i cannot be sure, if it is not by lack of my English... But
> my feel from docs is, that they are exactly as my notes --
> perfect for me, but hard to understand for all others ;-)

That seems a fair assessment to me. While iptables has the advantage of being simpler in many ways, the iptables(8) man page probably does a better job of on-boarding new users to the underlying concepts. Rusty Russell's guides and HOWTOs were also rather good in their day. Technical writing is a talent unto itself and some people are just naturally good at it (no offense intended to the current team, of course).

> 
> I found as very useful examples from announces in this ML's
> archive. IMO these announces should be copied to (or be
> linked from) the wiki.

I agree. We (this includes myself) could be making more of an effort to do this.

-- 
Kerin Millar
