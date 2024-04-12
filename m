Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E11487F4
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936965; cv=none; b=WH+Juj5Hae4ha+bxM0F5ifVCiQTjBI31z76H35btOqhWBj4o6ARCX7R627II1zM4WT39pmtnFb8YSNRPYY+9hYaOj9siVHtEjQX7IZOKbtCFu3w4qAh4vVkSbAzXzkf9c1Rri1R3oFEUz+LMVnjZrVlaCPdJilxrHGUCLhOho4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936965; c=relaxed/simple;
	bh=SDKwm4IerHCEci73q7wIgIR9riiNg082bAjHUw/2Oqc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=sKfknBsZsEMJB0f6NBDeyUSHaIGIreiCnfkXVov99QQ+1PcIwVEJykGdf4wVXjmLnYuY3mMOM4uqJXWsLgDRXxEbr4N5KaxbPRuMmA9z0XFa0oz6GI8BRgvr8YH1lmFsJ5xg2yXn32FG1SM4XcY6Ahl73P11HFUe+jD2jg+tQTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ffjrQY6m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t9rwB4PF; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ffjrQY6m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t9rwB4PF"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CF5C8114014A;
	Fri, 12 Apr 2024 11:49:21 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 12 Apr 2024 11:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1712936961; x=1713023361; bh=A0aijkgPC9
	H5vsUc23mPgMMBcDU9Ss+G8zrdV7l82Zc=; b=ffjrQY6mPECj07nP9nsT4cGafa
	/2P4Hx/jSdWwdCeGP1TPFoOhGmELtj4161lU0nsAvIgYvqCnBJIbyaLbt/fx02oi
	pX3bV07nG0uzPk38QAjQ2N2R32scQgJF8PCybK93xNIrMONcstIoGD737Mo25qrO
	Ld1cs+Xh1vLFunhifnrwYJbAe5cJIWQNUmqORWfpMB1tKziuGB7S+aqzRH9lW8K8
	oLPPccOqmiWtbXAFp4usdl1etpD8fvPGOWwQqXFd5QN5gldWe2Po5slg/6/R8F7k
	BDHos++Ug8lEfHHUrQVg82wpFTNklQEhXfg+YIAVmuUGQFHQxICn/9+DFdqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712936961; x=1713023361; bh=A0aijkgPC9H5vsUc23mPgMMBcDU9
	Ss+G8zrdV7l82Zc=; b=t9rwB4PFJacd/lT0FzUsSmAJGyXcQ5ahDPwH53fLLUGT
	9JyMo/EC6RysbXI2c6V5ydh11LoGwLVtmrKXYOSp8agxGBxjJK/3+jFcFrgCTENH
	GMwwHD3h5lfKiglz+UL3S/72amkziZryTTlKj8SQLBCgK4bZ0bVt5R5fEa6+oTPp
	oeeaBuOAgnnzIw5brjctvOAoPdRhjAfPFuD05Zwz06bLu/8hnDBP8mpesML971Zk
	152qWJOaH4IRmP8KYxqM9Dpl7jdAZsTtNzRsjtIXylItukvB00glVvZd8mRkwOR6
	rvYyaS/F/ub/2FYnRjjqbWjPB8hopVF/J7foXIN8gQ==
X-ME-Sender: <xms:AVgZZoO4Eq5I_qKsOH-ES6feEA2NkeqDd_rQTFRT7mVT4_mDJvhiQg>
    <xme:AVgZZu9deOpAFDwoUpX-0sQKX7kJ1rqBGYLDDAGvr9Nycc-_bDoDx1OKrMUMNU_c2
    k7sZ88LCES9v7U3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeevueehjeduveeugfeggffgfe
    evhedutdevieehgfeigedvueeukeetveffvdduhfenucffohhmrghinhepnhgttghgrhho
    uhhprdgtohhmpdhnfhhtrggslhgvshdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:AVgZZvQQWctntJLtATXFrOfngWlZeulLZQxg5W5i2xLillFp7swWFw>
    <xmx:AVgZZgvc-hdFY1i7f5VLw1QreyB4flDkmQSzioBv7TXR7fCVtQiSgw>
    <xmx:AVgZZgdX6TcLm3y8I09VhULXGQwp9XqIu08sJQ1ibnyEqnMiQfCadA>
    <xmx:AVgZZk305D-n1nFlcy2korQIsofD6vLORJQS0RkUS_GBLTkSY-nQFA>
    <xmx:AVgZZsE976M5Cu2U4c4uFwS-u3B_aFU3zqmWCWFoZ_AxU7EhEbll06NI>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5CEF61700097; Fri, 12 Apr 2024 11:49:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <b4f12fcf-0dc4-40d9-8874-0ebe442dea3f@app.fastmail.com>
In-Reply-To: <20240412113848.0fd84173@localhost>
References: <20240410172343.1f7f5ee2@localhost>
 <f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
 <20240411165412.0f0c65ce@localhost>
 <34397891-d5b8-45ca-8bbc-190a71b34cc6@app.fastmail.com>
 <20240412113848.0fd84173@localhost>
Date: Fri, 12 Apr 2024 16:48:49 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "William N." <netfilter@riseup.net>, netfilter@vger.kernel.org
Subject: Re: connlimit from wiki.nftables.org not working
Content-Type: text/plain

On Fri, 12 Apr 2024, at 12:38 PM, William N. wrote:
> On Thu, 11 Apr 2024 21:04:53 +0100 Kerin Millar wrote:
>
>> # zgrep NFT_CONNLIMIT /proc/config.gz
>> # CONFIG_NFT_CONNLIMIT is not set
>
> Same here.

It is the same because I compiled a kernel with the feature disabled in the course of evaluating my theory.

>
>> With that in mind, are you able to "modprobe nft_connlimit" at all?
>
> It returns a fatal error that the module is not found.

Consequently, you will not be able to use this feature of nftables.

>
> All I find when searching is that the module is missing in different
> distros and some references to CVE-2022-32250 which doesn't clarify
> much:
>
> https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/#rip-control-by-triggering-garbage-collection
>
> I wonder if distros have deliberately removed the module because of the
> CVE or if there is something else.

It would be highly irresponsible of them. For one thing, the removal of a Netfilter feature would result in dependent rulesets outright failing to load upon upgrading the kernel and rebooting. For another, that vulnerability is almost two years old and has long since been addressed.

>
> What would you advise?

I'll assume that all of the following holds true.

- the affected distro releases have not yet reached end-of-life
- you are running a standard, vendor-provided kernel package
- all of your packages are up to date

In that case, I would advise you to file bugs against the affected distros and demand that those responsible for their kernel packages rectify this. For any of the CONFIG_NFT_ prefixed options to be disabled in a mainstream distribution is appalling. Rather, they should all be set to "m" so that the functionality of each is made available in the form of a loadable kernel module.

-- 
Kerin Millar
