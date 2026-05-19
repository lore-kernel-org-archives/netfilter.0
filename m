Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322231A9FBD
	for <netfilter@vger.kernel.org>; Tue, 19 May 2026 00:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779150952; cv=none; b=FPKIY7gvSUitJDFxOnAtdTCPkBf1rZhwhHg+XMFylgSwQwI+ZoZ44qodv2IdUUlavQwu/2cvECnck4+Nhuz1z1NvuF6I0HklpobVawp4Rg2kCzCcC2IJ2aWp0tNpVW337zTKCt5xCigiyumohJonDySmL4/d1Ejk9+I6OtpgC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779150952; c=relaxed/simple;
	bh=9wCaP4MLONZMYw9aWSm/44d94MDhb+SUf3CqoxaL+Zw=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j+rswqm+0MQIfoujnQ9YCIOx50TBITNe5cmRlBZ+TKEW1Bnn/wdVRm80roGgBGhxY19b3y/LBurPx01e3b4i+91YIgBzVnn1GMhkVzRVUwzvj3/km5FdAUOMZ/rDgEzXv4FbZunnKzE3Mv4QEPV9xVtcNnYuxYunHO9LP+Aeum0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=O/3bPoSK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c//Et1FG; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="O/3bPoSK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c//Et1FG"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0131514000BF;
	Mon, 18 May 2026 20:35:49 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 18 May 2026 20:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1779150948;
	 x=1779237348; bh=dQYRPutISV7IN5IEqszghCY1V9vKOvkrSKIf3ZGBzw0=; b=
	O/3bPoSKAw36bnsrRZXpGbFnBJoTwqnBA61PkFO/My5hZBwb52tZnv4s1+v3jGiQ
	KPOxt4JvAZTMPxEG8llTphhjzNvmLjR87kHaJtTpC0RkcO6wjOXWYTcGAR0OK1G/
	WxKN0k9t6rCeo9nr9eUCLGSUX9UuWMwb7kOjvLRk18ZY+wIWzd8Lb7M6ooBwwKXL
	q1ICqneg8rEIgMdn70S4ShCaZ6xgR60pXJfF32LNofujKf34RMxtJbCyrpOouBOb
	V12ie6/9TWPZAY5fN7z3Yg7syxiIdc1HMcFpTtzCKMO2WDalsWMh6EI1Lm8zsNQx
	q/CpnejwYI+FZAmV5AILDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1779150948; x=1779237348; bh=d
	QYRPutISV7IN5IEqszghCY1V9vKOvkrSKIf3ZGBzw0=; b=c//Et1FGDEd60gvUf
	OQ/2w8svE6d9RnNv/aBZods6JIT11CTz+4KCQxtxntjvCs7GmDQ4Hh//n/X7DK5u
	0gUsjBiUzPtBJbsQYiWkn22RU1NgSOl+xzBdxLRS2tGDnuyPC+PA0aRGPTXTR7nP
	yEl0TEviN/RMkiA4aI86WNHeJ6Fpbu0a0hH9sxndcPHdyytC1vZIMrQljlcwgxOu
	nMs4e7Pj5d+XPLI7yJB5ydHT8HUCrfTo48+bN95KQJWRklGC/NmO8euvfOnR/NN3
	SulTQkJDozfp2g3F/OCQZvy8XTJex/wtj7TZyaXLXthvm+36zPLjSxy3nFHoSrxw
	wCkyQ==
X-ME-Sender: <xms:ZLALasUkmAtpV4i9HfdQhUNYSCrhhgug41YSkv6NVCZ8FggM2lPfrg>
    <xme:ZLALarZ5-zf7POp0BZnHnuOeUS3WbmnV44WftpIGkPIV7Ly7NIuuhYdRp_5ItTY9D
    weJ-7ceYr-EKK0HO3WOPOIgjT_lb5Qtg9ZwqiHKJe1-Mi3oKvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedtfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvffkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfmvghrihhn
    ucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrfgrth
    htvghrnhepveevkeefvdfgtdegkeekueejvdeitdejledtffehtdeigeejffeihefftdej
    ueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptghouggvsggvrhhgrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhes
    phhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepshdrvghgsggvrhhtsehssggtghhlohgsrghlrdhnvghtpdhr
    tghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZLALajBHeaaaA8sNp5gE6dIr8lpzVi5-ElX_eua9PSU-25AP3mhpJw>
    <xmx:ZLALane4sj_zkso8grPelCkoJh2OnO_8maZeEliXtgrOfzA6KRYbkA>
    <xmx:ZLALamLyTdr5OdWN7YRzoAJcppbWHoBmsLgFIHqmc2NhK3mqoxZwxg>
    <xmx:ZLALaicr5AYQEfeGN8G2aTtgb6Nx8bsLdXmC--0pdVaLu_V3LfIiKA>
    <xmx:ZLALaqBmmqe085qBi_1TjP0_u9918BblM5HbSAtEoYZJqXPe9fdXJmoP>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CABCE216008B; Mon, 18 May 2026 20:35:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ab6b0mJTl6P7
Date: Tue, 19 May 2026 01:34:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "S Egbert" <s.egbert@sbcglobal.net>, netfilter@vger.kernel.org
Message-Id: <9d84961b-ec96-4a4d-9eb8-3c40e0191ee0@app.fastmail.com>
In-Reply-To: <7b150c69-75e4-4771-8853-d12731648fa2@sbcglobal.net>
References: <7b150c69-75e4-4771-8853-d12731648fa2.ref@sbcglobal.net>
 <7b150c69-75e4-4771-8853-d12731648fa2@sbcglobal.net>
Subject: Re: Updated netfilter syntax to Vim 10
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026, at 1:59 PM, S Egbert wrote:
> Not related to netfilter itself, but display of its syntaxes.
>
> I've updated the syntax highlighters for latest Vim 10.
>
>
> It is arguably the largest Vim syntax file that I could find in various 
> repositories (29K lines), next to my vim-syntax-bind-named.
>
>
> https://github.com/egberts/vim-syntax-nftables

Thank you for this. I created a Gentoo ebuild for it in my personal repo.

https://codeberg.org/kerframil/portage-overlay/commit/c4050675df8dd22e664d839a2f65cfd432bd7ca1

-- 
Kerin Millar
