Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822611E7C05
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808725; cv=none; b=iKQ1wD8uEzc0p01hw7y+eC5dU3Ma1xFbcHTklgM7yE7i3LzlwK1jDPSQgDuWn+J3V0p5wnRdGg3PiEn69ezkYL4c00jL9q4zOm70RmNpEC5RQyfLfpluf8AUo/Or0Kbg7TaOV7w9e003pPBxqOX3ESLCEq8R/ZiQGrpQUE7BuII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808725; c=relaxed/simple;
	bh=ICMQbVii7L2nAd3iYnkWKfd7zUucIpQ/ss6kUC9EL6I=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=huizH/+064B2RZ6n4GHZDa5bh6ApJj/ghE58l1719VW9Q8OphZ7qDNuAjW4uaHk21w/FWvxbpYbStQzK2sPDhYFzGQ+Sse9kfbYOfi2wfrAXttZlJyhzMjZByauciclpduxZ1vmsETk79jR7ygIGyphXFewGD5k9VcqCBOljA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=XbBFTu4L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XXRNOlxc; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="XbBFTu4L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XXRNOlxc"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 82178254017A;
	Wed, 12 Mar 2025 15:45:22 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-11.internal (MEProxy); Wed, 12 Mar 2025 15:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741808722;
	 x=1741895122; bh=/CSUhs3tU7wkN0JnGv7fShFcFfjQ9nHb8AtL8u2PjVY=; b=
	XbBFTu4LC4kKzFmWRATUP7QNqVpKFn3nSAGaNo5Z3pfWj6cCXSYQAGE4h7Z3R6Ni
	p00ea0wkN+HBOKH0YLKT2XHK9sRv+6qb/3MrspAHSanzjQ0pUhST3aVsBuRwt3Ey
	9hUj1cb8Y76EtlX4W6rywwjBW0GG/5tksHnLxF3Iq7cMYzvCIkAPQu6SN2XGw56J
	xNgaja5hYxBbbxSNDpxm+yA3Taj4kEhqssa1pOO3aDDOCJ5Nq6/7bWSygRJgYtRf
	peW+4IZpBqUTJESl99mt0Os/5Nvgi0QNdfuMh4RXaK6qIPtYayWApGb7P0o7NsQy
	R77RnUL9B/Amc7Pfu1kLig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741808722; x=1741895122; bh=/
	CSUhs3tU7wkN0JnGv7fShFcFfjQ9nHb8AtL8u2PjVY=; b=XXRNOlxcykOFtIAJ6
	64ByUeJoc84daasOg1O2LsgQ5/GRdsn3aBbIjA16cCYD+SFUnuLVfb7vt8pTsSVd
	2ds4BCQ8N2GFmEk8W6760bbHDiURl58sYRtDigFjose+3s5dmEb9nvRT5rnyefyb
	yX7Q78Nf6PRxiegyoaCRnKsdebDuPbx5Ue6Cww9AOSXBjxpFUmmmd0gl9R/ZyBrc
	tJgWqNJ0Fs6gDmupom57d5RyLKnnpd8BUHiJuPbpv+z+V5wmcYpA6PxSWOo/DhTV
	gA2JUsBuPHQ1wQLFV0cS22edNrDTvrYXp7POw0a2a/ytzUy6tahNDu+jQepB8RlN
	Bfrsg==
X-ME-Sender: <xms:UuTRZ5FDn2YnXlvtX_kD414b4UYcOKA9ZQ6sWADpq7l32UaUaRfFfA>
    <xme:UuTRZ-UmJhhOResYxoO5lf5vUmr4SAGDRvikiyylVF_9YuXpPYoMVmqsRWphjK4S-
    FO8jOaYdvk3quTN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrg
    hvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefjeeuvddvudffffdtffffudef
    vdeuueelgedugfekgeekveejteehvdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghr
    tghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgrrhhsrdhnoh
    houggvnhesghhmgidrtghomhdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UuTRZ7KlrPeb17Jjk8UoUOmwPSIx02P4KXQDyyANE77t1XfM0H956w>
    <xmx:UuTRZ_HkW_Jl1wAQbViNVAqeDLJFsAz4h-kNYNCvLz9ABoBYeBjhxw>
    <xmx:UuTRZ_XEQAlYGCwhGm0BvOYRnzvZcV6DGSeVBZ9yge2eFo6UE3s09Q>
    <xmx:UuTRZ6OWSqo1Sm1KZ5q18ittl4A8xJTcX3zKb_3ZIhe01Tu4q15l7g>
    <xmx:UuTRZ2c9NjJLQjCzRHcRwzxc-9XCnWir-clS0iOV6_kBy4CGC089SSSC>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 224E63C0066; Wed, 12 Mar 2025 15:45:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 12 Mar 2025 19:44:25 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 "Linux Netfilter Users List" <netfilter@vger.kernel.org>
Message-Id: <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>
In-Reply-To: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
References: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
Subject: Re: Dynamically appending addresses to a named set
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Mar 2025, at 4:08 PM, Lars Nood=C3=A9n wrote:
> Hello,
>
> In NFTables, I have created a named set called 'bar' in the chain input
> in the table foo.  I can add elements to the set manually,
>
> # nft add element ip foo bar { 192.168.2.2 }
>
> However, I am not able to guess the syntax to have a regular NFTables
> rule do the appending automatically.  I've tried a lot of permutations
> of the following, but always with fatal errors,
>
> # nft add rule foo input tcp dport 22 counter add @bar { ip saddr }
> Error: Could not process rule: Operation not supported
> add rule foo input tcp dport 22 counter add @bar { ip saddr }

For the kernel to raise ENOTSUP does not indicate an error of syntax. Th=
e bytecode intended for the nftables VM will already have been compiled =
at this point.

I suspect that your set has been declared with the "interval" flag in ef=
fect, in which case updates from the packet path are not allowed. As far=
 as I can tell, this constraint is undocumented.

--=20
Kerin Millar
