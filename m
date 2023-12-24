Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69D468E
	for <netfilter@vger.kernel.org>; Sun, 24 Dec 2023 05:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="mQEqIHtK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="6vpvC0a8"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 48E36320099B;
	Sun, 24 Dec 2023 00:23:07 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sun, 24 Dec 2023 00:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1703395386; x=1703481786; bh=sb/WVBzQ+N
	vP6INRteu+HnsasgQtaKzr8f6TDQnPGUQ=; b=mQEqIHtKY9z87TzPde9n03t9VX
	4twE6OuRowKvBa9gaIdZ0y/ajvmL/XOPkc8ZVf6jNqWaWa2CCfIG9ylZc8Lpm/nU
	YHIi6l3Qj/fyPMuwdqW6AfhUEZNwiHqL/g+DkfZiWARmTjiQMyvyo4+3Nzk/0A8S
	5zmNq76w5/wycoDfISJ8idrKko+Xiq2mwqjuPEj7oA4/z2KVHicKjQQ465nUsTHv
	oyfYn6Lwm3aY5ebn5XKMH5wNvTWpMjw6m03QnAEYL8Ue25Ir73mug1No+Eh6jK6Z
	j+IRCCi9D+k2qA5uxpDn/xYYqTr5caXA/1+m3b3nP/bJEm+UgGZzuJP5fecg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703395386; x=1703481786; bh=sb/WVBzQ+NvP6INRteu+HnsasgQt
	aKzr8f6TDQnPGUQ=; b=6vpvC0a8PWtJQb0vlHMW1WKjfAR3MfqXkXIuwXnH6+F3
	f4Sp17sG6xXEs0zuvgHmN6UyS76yM6WTYOxSjTXiZpXw6GPU5jA8LGW1lLqeY5GC
	gmNDSOOTGXErgj0aCPfCoWKZsbrFnoa7fU7tOPsl3KAU/epTkfOAkFXzA0FsAhB5
	YvdTzDpDmiaBlDYjLUfgngg2Gnou1yWCmYKkMN49/5vWLu5xqqYhv2YISA+cAUKB
	8FWcZ8FoDG+EcgDCczY87vUTavvL79kXCALPomTkFF4t6LEpXk21hRTX7YviREuq
	vnWjaTlYwWr6Azs4wUMVboXglfDDlRBRaTZG2m9X6Q==
X-ME-Sender: <xms:OsCHZQ5olyIFXjusBCYN7G9mPNLNEtPG9uwamJjl1FD2ECYjHS4Wag>
    <xme:OsCHZR7-0Rq4QO7r3MN1fvQ8HHt7GVUBqmUKLfotPPAGPsPZ3qzo6-yU_SnBnlntO
    I3FZeh-zlF-NuOK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddvtddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepgedvveejfeelgfehvefhudetkeekffffteeggeejjedtffevleejfefh
    uddvgeegnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghgvnhhtohhordhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhes
    phhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:OsCHZfd-wFRIMOFD4Qzaq2EOZ5GagLVa-jajOmpLnlDR7AkZdArQbA>
    <xmx:OsCHZVJln4ondMvqIwwm0ibq4LTeIPjGTA0YWqEzs7S2qRmDm018uw>
    <xmx:OsCHZUKUwfqjP5ZrTXLI13rBeepQHcUVdRNd0RGmGdNZz18TpbDhJw>
    <xmx:OsCHZbmWAK7yNbDUtS5YUPojTG0UZpuWgknzxp6JVy-q-ovxmDB0Cw>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7FB971700093; Sun, 24 Dec 2023 00:23:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <26a7f756-d64f-450a-a290-21d01c9b3bb5@app.fastmail.com>
In-Reply-To: <NH556S.G06QA55ATDUA@fastmail.com>
References: <NH556S.G06QA55ATDUA@fastmail.com>
Date: Sun, 24 Dec 2023 05:22:08 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Aurel Wisse" <aurelwisse@fastmail.com>, netfilter@vger.kernel.org
Subject: Re: Vim Syntax Highlighting
Content-Type: text/plain

On Sat, 23 Dec 2023, at 10:36 PM, Aurel Wisse wrote:
> Hello,
>
> I wrote a new syntax highlighting package for the Vim editor at 
> https://github.com/awisse/vim-nftables,
> starting from the "official" version 
> https://github.com/nfnty/vim-nftables.
>
> All 400+ reserved words of nftables are highlighted in a (hopefully) 
> meaningful way, distinguishing
> objects, types, constants, expressions and statements whenever 
> possible. Comments and suggestions
> welcome in "Issues".
>
> Aurel

Thank you for this. Would you consider incorporating the following?

https://gitweb.gentoo.org/repo/gentoo.git/tree/app-vim/vim-nftables/files/vim-nftables-0_pre2020062901-no-expandtab.patch

-- 
Kerin Millar
