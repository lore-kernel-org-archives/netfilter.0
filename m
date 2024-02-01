Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F6779EA
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706807356; cv=none; b=LXfVm1Y9ujjd5OQcRcIIhYNpoKRor0yMuLfc+RAS4FKYKDE4u7+iypypyjJXG7HsXEwP9czLB/28VmBePKwSQKUAR5u1Yiq2M8hoA69Ici1WRbvG6EM2AMB8Uedt71q7gIhqGJB8dIztrMQavBKI3sAqBpi9v+XXsF9SvGXI3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706807356; c=relaxed/simple;
	bh=lDHiETPybBrHJxnx1m5Y4UyIMY+/7cV7UxZaxj0TlGk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jvkEVyBVwtL61mudYOGeD3Y6IwrHnVLCGkCX99ASUo0040WEQDwaeAtg3HsiefB5xSjtdgqbSjVQrnyZQMyPJecrY7y6CiHBAr0/7lkAI+DyI4hPb1nPx0xXafQ5eNFqJ++x6738pb41jh7xtfAeNnC5BL/nPOrVVng7WGp26Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ec27fJaA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VQiFd/+S; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ec27fJaA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VQiFd/+S"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 853EB1380097;
	Thu,  1 Feb 2024 12:09:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 01 Feb 2024 12:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1706807352; x=1706893752; bh=pIWuP2Tvi697B79bPXTAKvcqXu/JTS6n
	UbdoDW7Wy5M=; b=ec27fJaACKd8vxbLfwQM0iiTkisHhzOhutMuM9h0kXllL1s1
	28Vst1xIn9hX1odk/8LQ3u9pxbHtsBZsmtTSQym+Rivd+T6VRaOd5mU7DXm3keZ3
	zl1ci1upix43zv9fGfIp47fSSuEvdBhAcZii9DDLkdJH9od3LHRKsGGzUW4gPtN3
	TxY4RyR8TsFUulaWnRKK4g8uwg6uwBWh4E6TJ/cbRhv8CzG2TlB+S79JIpJbhAxm
	y1+3uGrB5kabMoCLzmiQGDJIcGzBQEPG+AOwC2Bzj+7/AhNNdlj+AwGmEBsCmlRE
	VcU4WzbJFBSxqQVWPExJv8zLOaYosFhz3tajEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706807352; x=
	1706893752; bh=pIWuP2Tvi697B79bPXTAKvcqXu/JTS6nUbdoDW7Wy5M=; b=V
	QiFd/+SAt0C4HjvDGxxI8BnVCi+RI+YNXcLnRCTh7/bpox1EyvsnvzFEb5UIUcm0
	10tgx8D5h/UWG66UJLWrlIltkSh7OGlqxMlR8f4yNIq0Z1tfZTJQdB3hAHrbzRJL
	rkgf8seeQspKpZAXBysYp1pXSB0E1bqix4xqKOjTHFd2Vy08fBAYTsmUKPX3j3ch
	FVCi/x8cw3WR2F+1HWC6MYGMANLUinoKVwyePUkOahsaBg/brijWvnpk7ZksgoSP
	qGJN3jN4gdZBsHUPnsyZNIpkdYdoTxRt+tVE19QDA6gZERDogQBuwkHwzPyXZTK7
	yulMxb3YONE0qEP76JHBQ==
X-ME-Sender: <xms:ONC7ZaAFjvuouYxvvTJzljcospy97qtDfOoIpnSKUz77FTqFXg7a-Q>
    <xme:ONC7ZUhB_Osgq33-xkaY7ju9HakqpGihSXrVt5zJoQLptOyrX2tXudi4OT34AZG7i
    vvmKaSccCWDEUS7>
X-ME-Received: <xmr:ONC7ZdnTzrKWcmcYzI5yvzeBXcCEB5RR3mDaOfkPedT0ZF6lyNHdS-OUCPryYZ85O59QFcLdKWhY_6vGiwkC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduuddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkjghfofggtgfgsehtjeertdfjtddvnecuhfhrohhmpefmvghr
    ihhnucfoihhllhgrrhcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeihfettefhgeeftefgheeugeeffeehkedukeefffejgeeutdeggeejtdei
    hefhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:ONC7ZYyVVLPekoCzPvsHsLELBBzqOwb9sR-gi4uPU2hzPzYkJAuVHQ>
    <xmx:ONC7ZfQ4s9rdpF_0aP-Mpknil00ol8_lMzZQdvRsoxWjsOo4Z8F2sg>
    <xmx:ONC7ZTYUUb0qeGT2gGO4swB8gq9kA-DfCC6gFu8a9RMQvwbYlSpQSg>
    <xmx:ONC7ZafwiAXh3TIC0lKJWOjwEZGKGOQxrX8z13t25hLxxLUxDZ-55w>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Feb 2024 12:09:11 -0500 (EST)
Date: Thu, 1 Feb 2024 17:09:08 +0000
From: Kerin Millar <kfm@plushkava.net>
To: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Cc: "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-Id: <20240201170908.5ebde576bd4f21e007b96a00@plushkava.net>
In-Reply-To: <630b00f5-7535-49ad-9761-96287da0a586@app.fastmail.com>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
	<e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
	<Zbj04V-90zpQwEzl@torres.zugschlus.de>
	<cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
	<Zbom4bTPnkTMbLNE@torres.zugschlus.de>
	<5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
	<83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
	<20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
	<630b00f5-7535-49ad-9761-96287da0a586@app.fastmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 01 Feb 2024 07:06:08 +0100
"Kevin P. Fleming" <lists.netfilter@kevin.km6g.us> wrote:

> On Wed, Jan 31, 2024, at 23:10, Kerin Millar wrote:
> > This has also annoyed me on several occasions. Though I have been using 
> > nftables for a fairly long time, I still find it more natural to 
> > organise rulesets based on the conventions of iptables. Old habits die 
> > hard, as the saying goes. Incidentally, there is an open bug concerning 
> > this.
> 
> When I switched to nftables last year (after having used iptables since it was created), I was tempted to do the same, but forced myself to rethink my table structures.
> 
> In the end I landed on using address family 'inet' for all filtering, 'ip' for NAT, and both 'ip' and 'ip6' for netdev (because those rules are entirely about matching addresses). This does mean that my 'inet' table contains many seemingly-duplicate rules, but I don't really care since the result is so much cleaner and easier to understand than it was with iptables. Also my nftables rules are machine-generated so that's not visible at the layer where I do admin work :)

I ended up using fewer tables, while naming several chains so as to incorporate a faux namespace e.g. "nat/PREROUTING". It works well enough but I cannot say that I have come to like it.

-- 
Kerin Millar
