Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32684A28
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706767594; cv=none; b=OxgKLFgoUvAzjxs62VQZiNpCB8Oq5HQOYCYWLpFpfBoE7pjmQd2+sqcjWE4T5V52v0OkEyXLeVyS2oM2C+QBMq0c3I0Gr9dGzy2sBMPMlt0ORD11VPcva+hn5kOG+k1+6/KsdwLShPSig6YkSXRs3Fcc4e1hjpSL6bZaOqOxRYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706767594; c=relaxed/simple;
	bh=MIOhWRvMuriflW/8JMC4dRBOW5xg0al580/zbGThxH4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:Cc:
	 Subject:Content-Type; b=hIUMQiVamY9MaIJ8pHjVwX3yY8FErFceemTMQlU+Qsd0dSmPg4I1rcvg9QZ3MB1rrXitOeOUsittOIUy8S8mYWqJz6YRlJNBmyi+sPv5YNvF5SOoAQiSFiqTTX8Pv9SGZAi5ZoFQHE9JfIVyt0OmfPHt3oNSoR8UeWeUHQDvEp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us; spf=pass smtp.mailfrom=kevin.km6g.us; dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b=ZbynBh+8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LZGrEEFP; arc=none smtp.client-ip=64.147.123.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="ZbynBh+8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LZGrEEFP"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 0574F3200AF6
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 01:06:29 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 01 Feb 2024 01:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc:cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to; s=fm1; t=1706767589; x=1706853989; bh=jOElYeDyhZ2mO
	M6FPda1Djd1oOQ/jpuW79Lz5DEw4QY=; b=ZbynBh+8tG0eIt7I/ZHsl6pySs3fL
	PPeTnejLQGLzZC7aGrpnm5kLrcbRw8DKNRcgcwQQYO2QHjG/pYeEEP60MBLCbMPV
	valIZ+uAjc2o9byypyhxLVOqwIOv17EPgbo6DY6Hkc79RRzkzx8iF/xUcN/2rJ+L
	g8uX8NwCajMgvw/rn7MGns09wCga9AcZ/7THmdn0EoG8nHqcvktcht+xw77Eq7Xb
	t3HQsepRoh7SHSwszBNAnb3JCIMC8SSXo/miFBRjTjPi4jWNf09/QUuiEGuxH5Bg
	h4wKsAm6n5XxkhWSpo/RU63Kp1dG3pZqZZVJSgbd3Bb0oYSOPA2DLcAjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706767589; x=1706853989; bh=jOElYeDyhZ2mOM6FPda1Djd1oOQ/
	jpuW79Lz5DEw4QY=; b=LZGrEEFPa/9hYV+rv1DKqRqlXAuW1tvmVDZIePFEP/sD
	4ix1Gi62vh6uVlI/UX4snOEOApW0ajQAlVtVD0QBa77Ga7Lr7TeFa5ssj/REB61r
	e8YvoYBxEp9ZhvxmVndhCmhnjkSSN834thKXkQdEQUeET2H3Nis3ZAQrnxFvVzZE
	Hw1eVbcPF6ewSyR4cxXu2pGydkC646ss60HcWrwU6gshEooYJUS/6py9f4LYnosa
	8xNzXY4M+qbeiInO9+aGkQYpvvm8IOoKheiCo+kATj+45hSvtBBkVSi5cqFnyDYG
	1P89407td2y6U0ReNQLyVPkK7ojjwL9+lgFzi/Hzzw==
X-ME-Sender: <xms:5TS7ZeBBkVa2dz8EJBfzFneB3PeDUL-IBsq1rZ1aWCQYiDPw6gJXug>
    <xme:5TS7ZYhofp8NL-QL1pBFFE-AVQtKF4Y3iOr-BOGIhjuFdDOtWmAVOSWXlNPeJIagG
    OHiX_TKKsR0ofx98YU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedutddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnecujfgurhepofgfggfkjghffffh
    vefutgesthdtredtreertdenucfhrhhomhepfdfmvghvihhnucfrrdcuhfhlvghmihhngh
    dfuceolhhishhtshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhusheqnecu
    ggftrfgrthhtvghrnhepjeeuleetjeehhfeiteekteeiffeivdfgfeekhedvvddutdevie
    ehieffvddukeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheplhhishhtshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhush
X-ME-Proxy: <xmx:5TS7ZRkKfb8_II1u8Ey3JS4P3wqyrgAKPZ3NNdB9DMLYuQa7ab_QgA>
    <xmx:5TS7ZcwuPyHm5IIVCfSk0omKPXXBFAfF9ae4YUmwZ6N5xKag0sVbFQ>
    <xmx:5TS7ZTT5RTQnFiP-pZG8P-DyY2Qr19sXotgsJ1DZsbRP2wo3afsC9A>
    <xmx:5TS7ZWMkpBVwsmohOLgvbfYKcSOF3OxCT_wkV5xGFEaw6G-7ivKwaQ>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1D87E1700093; Thu,  1 Feb 2024 01:06:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <630b00f5-7535-49ad-9761-96287da0a586@app.fastmail.com>
In-Reply-To: <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
Date: Thu, 01 Feb 2024 07:06:08 +0100
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Cc: "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain

On Wed, Jan 31, 2024, at 23:10, Kerin Millar wrote:
> This has also annoyed me on several occasions. Though I have been using 
> nftables for a fairly long time, I still find it more natural to 
> organise rulesets based on the conventions of iptables. Old habits die 
> hard, as the saying goes. Incidentally, there is an open bug concerning 
> this.

When I switched to nftables last year (after having used iptables since it was created), I was tempted to do the same, but forced myself to rethink my table structures.

In the end I landed on using address family 'inet' for all filtering, 'ip' for NAT, and both 'ip' and 'ip6' for netdev (because those rules are entirely about matching addresses). This does mean that my 'inet' table contains many seemingly-duplicate rules, but I don't really care since the result is so much cleaner and easier to understand than it was with iptables. Also my nftables rules are machine-generated so that's not visible at the layer where I do admin work :)
