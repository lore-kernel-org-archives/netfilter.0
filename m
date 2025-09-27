Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D81FBEB6
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758965992; cv=none; b=LEuY4LCTSpehQ79xHkKltl6NOERBLvyIZ/N2UEwivA3wScv3xz+/Ir3dU0UY6tuBZ6NeFK9TQiwLO45G9Dvpao4nBSRfOVPhg0MCMx/4V5t51vrOqQeJkiv0XHi8nXx0/HLSEiTBA54YstcoVGZEVj9n2uNTxvJlEIiJGUFtIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758965992; c=relaxed/simple;
	bh=x2P752vA+qDBtO5J0cAq80VJc/OhRsitx9J+8OwV2eY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qbmF3qyAnaGvXhtrB5tAgAYzPnMFHOM0QY8u159GdoLnDxpXwHoyQmeuqiEWO3eqxYTaKbbmyrLu+2MjhT5x0LrdJZx05a5PB9uDOu0ObvmNumTicQLjY9OuquUh3p1V7ZiUe5il1cKD2/6kuju2RPpV+YqautoZlQh9SQjJSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=pp6bwpaK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nnnVKXnz; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="pp6bwpaK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nnnVKXnz"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F0D97A00A4;
	Sat, 27 Sep 2025 05:39:49 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-10.internal (MEProxy); Sat, 27 Sep 2025 05:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758965989;
	 x=1759052389; bh=m/jMLJuQjBGvxv54bx55jPEcsnHmBPxdOmJulJZHUcQ=; b=
	pp6bwpaKB2VvRKu12HNTJaRO08rhQc9PrK3t5Jx2vI/b7wG3j+XnJRNLjcVPL+J5
	6RrIeFvlXJsIFNmTt2fFtwOgxVkuiucA7QDCmiXjMdVHOUjgzusDkM6ZmvyWf0ZH
	ZS3i12f/Pr9AHzXR002PkNq3AnSkinaYdQ7zhsCYQ1uN3ljaL00c8nB/1WoWAMjy
	5IY+DImeunsS8amITH0ldEplbzVYDypqbDoBDpPESLu6dMJcSKR/3rt7JtbAtbqP
	qn1d+h/g/z2nKruEkKrIX34IA0h3BzIkJtGP9A/C0a8r8hppTHu2MzDgrQOrYDum
	GM53el9nQGz0TFmWwgNnfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1758965989; x=1759052389; bh=m
	/jMLJuQjBGvxv54bx55jPEcsnHmBPxdOmJulJZHUcQ=; b=nnnVKXnzIAKW0My7g
	mzJNkpXhvtWsE5jxdw0mD6sv38PyRK7PDErzHqWUTGV8z7tdXIs4htw1+NerN5n+
	zmoCZmSawztqfaVsO8h2AwxByKJs9ZG0h7DznJYLWrwfuLWHXrsB/7S0/jKHFSsX
	b4t2fiL4UCWKG7xUF1FC/zL+/A5r2FxakI4d6BYA5LFA0zuKZisX+H8ZrfsFvjKJ
	5EClgLizUQGLBCUtRsHtFu933LAijtm9kgE1uY6cYOIogu3Ctsv6u8kIiKhk7vK+
	p56GAlHTHeVzz9RK37zozhOzO6tZeM9/yFWPvcKI2QOn9QnvGTvvj3TrSo1vvJba
	KIkSw==
X-ME-Sender: <xms:5LDXaPCiJq9xJ0IuwJPN98eYL3VcZOiVLQcX7D-n0pL0DkE4Q4Id5w>
    <xme:5LDXaAXUpXq8CgVcbfXbFKQadYbsWJAUm4ylJ_o21fNSYlBxb2W5lVTmXu5NhS6xg
    8gs81j_lEGZw1xyccbMVCyUjsYtFnFEyzoiCY51W2C00vHrV1Jo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejudeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthejredtre
    dttdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhk
    rghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepvdehhedvfeegleeuhfdvkeeitdelfe
    eludefgfehjefhvdfggedtveeutdffgfejnecuffhomhgrihhnpehnfhhtrggslhgvshdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopeguvhiggehjfigvvdhkvgiflhgusedtgidurdguih
    hgihhtrghlpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:5LDXaBumH5Y5Q4m_P0D6arBSK69Uz6OkIX-vuSpd7Zvxey2XhWGOFw>
    <xmx:5LDXaIZEdA2JVi_kOsajygWEv3zxtKhk6AU4eFDHgAcfYjJqhGZxzw>
    <xmx:5LDXaMUOYHl4ivjWYC7H-BZ2kesMbboTHNCyl0kjlA6fTPKfKdaDUA>
    <xmx:5LDXaE4zXwzAPfVVWqaVk9JAdb3kpVEmaQkuye7czEZNhYhmEQgdig>
    <xmx:5bDXaGyxG80P8qGmRcn6wI8rEucWf8pcY4t_QWA5ercliHWuqX0wWLM0>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A079F2CE0072; Sat, 27 Sep 2025 05:39:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmmvrmHs2kGs
Date: Sat, 27 Sep 2025 10:39:28 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "0x1 | nftables" <dvx4jwe2kewld@0x1.digital>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com>
In-Reply-To: <C3DCDF0F-27E3-4325-968F-3061D768B800@getmailspring.com>
References: <C3DCDF0F-27E3-4325-968F-3061D768B800@getmailspring.com>
Subject: Re: list elements of set
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 27 Sep 2025, at 9:06 AM, 0x1 | nftables wrote:
> Hello everyone,
>
> I would like to list all ipv4 elements of a named set. 
>
> the set is named
>
> mx_bans_cidr

This does not show the table in which the set resides, nor the address family associated with the table (which can be "ip", "ip6" or "inet"). It is the combination of these two things that qualifies any given table.

>
> the command i used:
>
> sudo nft list set ip filter mx_bans_cidr
>
> Error: No such file or directory
> list set ip filter mx_bans_cidr

The command is valid. It's simply stating that there is no set named "mx_bans_cidr" in the "ip filter" table. You might even not have a table named "ip filter" at all.

>
>
> I followed the description from this page
>
> https://wiki.nftables.org/wiki-nftables/index.php/Sets#Listing_named_sets
>
>
> The query for element in a set is also not working.
>
> I tried all kind of versions of the command, one that surprised me was:
>
>
> sudo nft get element ip basetable filter mx_bans_cidr { *.*.*.* }

Here, you specify a family of "ip" and a name of "basetable". But you also follow it with "filter", which doesn't make any sense. A table cannot have two names. Presumably, "ip basetable" would be correct in your case.

# nft 'list set ip basetable mx_bans_cidr'

If you have any doubt as to the naming of your tables, you could try listing all sets without their contents initially.

# nft -t 'list sets'

>
> Error: syntax error, unexpected string, expecting '{' or '$'
> get element ip basetable filter mx_bans_cidr { somefile-x.x.x.tar.gz
> someotherfile-y.y.y.tar.gz }
>
> Those are 2 files, that contain 4 dots in the filename, in the working
> directory ?!

Indeed. That's your shell performing pathname expansion in accordance with the Shell Command Language specification. This is why I always recommend that nft(8) commands be conveyed as a single word through the use of quoting, if issuing them from a shell. For example:

# nft 'list set ip basetable mx_bans_cidr'

Everything between the single quotes will be taken literally and passed along to nft(8) as a single argument. No pathname expansion is possible then.

I wrote some material for the wiki that also touches upon the use of the shell. See https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Syntactic_conventions.

-- 
Kerin Millar
