Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009FF149E17
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714054988; cv=none; b=OF+iuJVc8Ukj7kpMkLSK0x3kIV6Rs6ZlwyG1Pt65Aejcot6j93vV5yIAQYiORgAFvFSvubdbku6ZirwWR/IPXkblfYQ7nTTS9wqNP6gSlMB8/OwCEFFvKfA7AR20xV6zqpForPffcwSg9h4X0apG0Y38fPoY3ROWnhCUS6Zt4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714054988; c=relaxed/simple;
	bh=z9Nz5U+MunJZW2hZtp2+wpkHMuHmjccXtyDtPBGZN/Q=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=E+ISNMNO9UjOjde3FlSWQ3/KuSv/9+wLbkaORaeYn/FpZRGeZV8n7+Z6xp3P4kc5dXTwMHLbju2blZ0VznpHlLvoIrN4tvxTbss68HwYNJMxjJGXofgA4ADEaYHh31cn1ec97fRGVm2gN2OSdsnHgcLPtAjrDDRyNep+MONnqWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=r6iiNitk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lr/pUdup; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="r6iiNitk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lr/pUdup"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id E6BCB138015E
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 10:23:05 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 25 Apr 2024 10:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1714054985; x=1714141385; bh=tSVtAE4ZeK
	g4m2JG8zDVr+FT85cmrrFiZgLL0ERkjno=; b=r6iiNitk+U/HvJWd/F6MdaXqab
	GGLivCh60YYOkwThfTXwiPO6uOQI3Jl2bD0zVVynx6L5j9+JJtqMa0Vz8o11u1KG
	EL6E8hI0coO0x/G38ZuKdjr9E88sxTtQCbys+ZJyfhuTuu/Jo0+Spn5vvKK0amPW
	xrQYC2VOX7hRoLRDU8w+btBufTon2/fLj/YYvi6xKJtFEwJSjRRGLq7QM0HVIxBv
	OEXu35iVHjWK9TlWjtgzIF1kEZn2p5fG0I6D3bjxGiypAXLPIT25V3DttFt3YTPo
	V7PUYCsB0ku0BO8RKt3yv/JXw/v6cFK//MyXNMOph/HJ8ujjiC+ieSoOG6xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714054985; x=1714141385; bh=tSVtAE4ZeKg4m2JG8zDVr+FT85cm
	rrFiZgLL0ERkjno=; b=Lr/pUdup6/6PcCJQ5YrQEkwHr51r+gqMifWEl2hh8glN
	nWjUca0GPFOn9517UtIxw7tRYSt+TXs/ygSoj4AZPtvjwTZdpUWOAzfewWS1iapK
	7oYWoQfVfx89QoNcpxCx6SI3eJBkCJCBt8RFPRHwbBXpEjLgHABRAlYEAZi/VsHx
	6bViSfOuDf2puqCbJWE9lw1Lxa/2rROVUhT4SN/oWeWz7WUF9wP/M2FymLhdgCqJ
	6a2DgvqwRQaYsAu25XqOVbcr8MJHUXttRb3vT3OrQ5gkRp/wYoTRXnWFdLdbswp/
	5B8pEJHCHmaQbYv/ZE4nkrgUChweXaalzVIvjPtCcw==
X-ME-Sender: <xms:SWcqZrYCDjQyd80fJPWkuDBAjjGcAnH3lzyVu6zhdC1A5YMNDEVD3g>
    <xme:SWcqZqbHJFwaWqCtA7RxtE8XRA8dpLCXrzAuG4OzWYvsdWaAmnJAqEjlCpO-cq-wp
    wEkDStTFUjSyvSz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeljedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:SWcqZt99cD8BPcaBbpyKVtwvuCLNl_Pgn0elZnhLlonkJdX2l_4jDw>
    <xmx:SWcqZhpec8RoLNCNuLLQ354LY0PTRggwGRYDSVpZ3SzBdyGvcr8omQ>
    <xmx:SWcqZmox5tP7_Ju_fMRxyKjRmJwhvN4hrxZj37Ez8mxbLeq7GF_0Sg>
    <xmx:SWcqZnTiBgS4g75AOYVEtr9fmMcoUOeget-_MYzy-5LsWnc19aHM0Q>
    <xmx:SWcqZtTXNebd0vSJO6IE5qx4LCfegbWzVUUbkdIN8VQfIw9VyJrZDa3j>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9532B1700093; Thu, 25 Apr 2024 10:23:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <67e12cc1-47f4-41c8-a574-194a19afba34@app.fastmail.com>
In-Reply-To: <20240425141258.0f32e644@localhost>
References: <20240424180331.3dfb6fc4@localhost>
 <3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
 <20240424192033.5f05ef18@localhost>
 <eb3a3017-e09a-4484-9a48-abf3916e25c9@app.fastmail.com>
 <20240425141258.0f32e644@localhost>
Date: Thu, 25 Apr 2024 15:22:45 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a dynamic ingress device(s) list?
Content-Type: text/plain

On Thu, 25 Apr 2024, at 3:12 PM, William N. wrote:
> On Thu, 25 Apr 2024 00:25:31 +0100 Kerin Millar wrote:
>
>> I see. That has since been addressed, at least.
>
> In which version?

I do not know exactly. I'm running 1.0.9.

-- 
Kerin Millar
