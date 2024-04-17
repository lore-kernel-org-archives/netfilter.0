Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79843524D4
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713345437; cv=none; b=UVB8DgNmzvngga1mMcXas1Mj7pfX48YovU/iSeKa3YOEWXFJCwvjPi77/H1Y2QSAX+OJdDGE44Qbu5TqOFn6gfTbtctrRNRvu5TG3reg4lTJUB/RpR48i1lTwd3YMdRdYd49PuuZbn1TDMV4PznKZ1EIfMyMrwgRZFxWD1dBm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713345437; c=relaxed/simple;
	bh=5w7J/o5PXWutdCfpk7rOZuH+j7RZieleWVBCW1bsGBY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=EvoEtsvxLFplxGp4omq4irkLE8fU467vZRvq8iu8U9Iaip1WMwzKphv6FPEdohnU7GIL0jKSNOdTCPJfSkQTKqvPdJG/4kHKCYBXFGgAnlwFRuNeT1Pa6KrWCOZ/3nVN7YXStzm8RNKsdC6yckgDBclwGD16XW1XIApfIX9XZ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ZF7BbqwO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K0GzwKEO; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ZF7BbqwO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K0GzwKEO"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 681A91140175;
	Wed, 17 Apr 2024 05:17:14 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 17 Apr 2024 05:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1713345434;
	 x=1713431834; bh=5w7J/o5PXWutdCfpk7rOZuH+j7RZieleWVBCW1bsGBY=; b=
	ZF7BbqwO3DQTBwJ17yPrO0rsKVu/Fz5zdgiijAKrPllT9/k3fhRMyFDvkfG0aFPK
	BW08zxgwMAlvb8XYbtjDSl/hJ1G8rc6Y3EV69f1UDn1PO5/xuy7BzIv/blgOl4AC
	EklREMJHjpNxwYdBv0zGvNXdJFsTVOjzTgZnVRZkwCRDSoGND05QCD2ifzB3HVWj
	Vb5DWdRsMMYl1t5lV8S9eHN3I1pGC1ulec3ixI8epZnv1xwEJ9Oaybt6L4bGTwcZ
	lhx7RopHTGs7nQvOKWCR2ZTdvXWxPoSBwvSnL74jX9c0MPhMl0CJw60IDayjYr+f
	OORhXW/FgCYgTAqCO5Wrfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713345434; x=
	1713431834; bh=5w7J/o5PXWutdCfpk7rOZuH+j7RZieleWVBCW1bsGBY=; b=K
	0GzwKEOyBngBDOPCg+dyWKyjUAhtZNwMCXHvPWqiqFq9c1eQUJetJb7PKV4cCTKQ
	B0SA9A9S9Rbz9vLgFmJc7XSLCc1xkhHEHVNE7K0g7MxKMBO1kBrhOGQSRl+WsA5J
	czGj+Zls/jjUWsl2OKvO3Ep+RX1O7vvMM1PdgySWkcifd44C8MVssTQS8NAuD7VH
	uYYezVwQT+nkJf3LUppdfhtv6G66j4TdGkX3HTl1ZToAoqIWKn3lYs7hW+rgPLu7
	jm+hraPodsedl0tgKT93K8UF+ZW9CsZ9yKjGz+Kpk8kau48cGxvVok+CgTILf/e7
	8ofOlOz83HWenoe5utRyg==
X-ME-Sender: <xms:mpMfZnIEgXC7xxphLNHMQii7GMzQrCY6oWmUDM-aciy9JENVyyBx6Q>
    <xme:mpMfZrJs-w2JUsaJbsEpR3TfiMDNfI81_dhyIXkCoojkr4WDtqK7bHJOgIp1Sjmr1
    DFSSyxU_kcCYE3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejkedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
    hqredtreerjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnheptdfgudefhfffveevffefgf
    duhfelvdetueethfekjeevleefieffudelleegteetnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:mpMfZvuLLV89xzMfvNibRqzQyeYpcdE4Xfsi5KCahylm5tKChr9aQA>
    <xmx:mpMfZgaIb2yo1-MJrlXjgm4tDcXb-Xr4duVhePTmxcQuWlmXAIVWSg>
    <xmx:mpMfZuYSfjXqAEcIdG1CiqtGjGEX46vs63Hbmqp2GRY_Vx1_BG4MyQ>
    <xmx:mpMfZkBMl2yyc3Mo1d1oBtRJh9nFyJhF8EYFRQPcAAB4lHuXCBBlEg>
    <xmx:mpMfZhxOEb40S7TRaKd7BXIbiWe-AsFzw5sHOCn6IDwkuSqcbVHrztU2>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1BA061700093; Wed, 17 Apr 2024 05:17:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d7419059-cfb1-40df-9280-c673775cb04a@app.fastmail.com>
In-Reply-To: <890e6c2d-ed3a-4a0d-84ae-5cd1a2425316@slavino.sk>
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240416191250.04884e9b@localhost>
 <20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
 <20240417082917.5cbb38ae@localhost>
 <890e6c2d-ed3a-4a0d-84ae-5cd1a2425316@slavino.sk>
Date: Wed, 17 Apr 2024 10:16:53 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Apr 2024, at 9:54 AM, Slavko wrote:
> D=C5=88a 17. 4. o 10:29 William N. nap=C3=ADsal(a):
>> Thank you!
>>=20
>> Your tool works great for IPv4. I couldn't get it to work with IPv6
>> addresses, as it says:
>
> try hping3

It doesn't seem to have any way to directly control the value of the opt=
ions field.

--=20
Kerin Millar
