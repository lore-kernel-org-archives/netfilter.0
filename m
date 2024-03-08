Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A714EB47
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709885289; cv=none; b=kJ/stX0TSPTfEX+LMdpZ/7MZ70s8yQU3C0BIz4V8liWgEnmpg8nhZq8yCcLoHmOcNDrwyhw9AHOVFW96xF7AtIGwtmZNkTv+zBcwip+RrOyPzZnevBzYdVft9sMIEZp/O/UYz2LFODytR5jsglJseHW5vCP5FL84sqjWWH90uDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709885289; c=relaxed/simple;
	bh=DTBsaFRpmkUnh3F5+bbA+zyjhg0eaosmprtCVLpdnko=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=mWHRh7Mid7spsCOALYWPAcZ2xamMZ2ZA+gmoFAFTBhVXr1U4L5BOW/HEWrV5aMtGN2freOnU/lA2HGwGbq482uTErF2Fv5odCQGmWzq2h2AEXSb+e3M5bxAXPBVLxl7hxFx9UA854xbzDpdblRe1M4ASKVVhhSjrpLpEBJ0YHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=kdeONS9n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h11sM4sd; arc=none smtp.client-ip=64.147.123.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="kdeONS9n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h11sM4sd"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 756AA3200312;
	Fri,  8 Mar 2024 03:08:05 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 08 Mar 2024 03:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1709885284; x=
	1709971684; bh=0ETxKI7aMweVtIGtoGnljQQfxktDbcYmCuiR941Rcy4=; b=k
	deONS9nPH1xeRpoD2g6ptrcTdPSHkQlAuTfZPHfh5r8Bc9i+RwGHIfouLljJcHiR
	JWSgvJRKE+GHPfAQqJ0PTGfrUkMISj1HQGWaHCqV1MNXuw1lUnDZ4m6K2oD/7c15
	Wz8pAM2XWOToIZpmKYuW8iAU/az2w/sgLnlQQfXNwhFQ8iqXEaMYVl1rW0LDeeaE
	HCdVdWwf1ne/DDRlVUVV0oeYBakRB6njJg+x8jpMAVtdMSPkzxh3f50Z55kxlZE9
	iQvlFqltU+FLhM3dfZ5MMK47+jiHkEjBeJKZsEU2kQoyE4w9bM4BIi0TIOdRMJ+u
	gUTeHM7dbpwxWYxSQYSCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709885284; x=1709971684; bh=0ETxKI7aMweVtIGtoGnljQQfxktD
	bcYmCuiR941Rcy4=; b=h11sM4sd6XCnmrU/nzNiKgB89cCg9Zi1mCe33iuQEqvz
	z2lx/ztB95T1dAgR+MGJx2ptHaDrz2ogqUWofSAtVYpBQvyHfgQhd8TVJobUwZ8Y
	P4qzLt2y5uc5ORq8SMSnDzx7G5g13LHUzsgWbjG1tJoxPeOLx+B6DQweSQDnk+fJ
	oAIXFBWu1teLXUIks25DIlJv/5YWKuj2LATepEQwVcZEGlY3emhv8jc8N3LdbZY6
	BQQvE+rbmqE5qygP2EX8OaZFfpjOOI3ZvbZOHpvDySY0G6RlkZJPnjqrkU7UnfWo
	TZK/YzXJjWkJc5ptY5UcbBFMhi1x6PxTUGnU5G6P6g==
X-ME-Sender: <xms:ZMfqZXKc_Yt14biyKqd2KNzf1x2PXN6XZyQwh4qGbX1MS84G_2uItQ>
    <xme:ZMfqZbIkmNIXmMgyDtlaCKabEgSC-3NGFlPlZQKBch0BilHuWNntswYR6MOb7K9q0
    XlR6Lq1HhKhVnSm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieeggdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepvdeljeehfeekkeehudekue
    fhffehudekhffgvdetgedvfeehieetudffgeehleejnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:ZMfqZfvjN4PsrxMU3MIyvrMhPvSFFDVM-4NFssdnETZ9GnUZcx7Pcw>
    <xmx:ZMfqZQYA5y8vQm94KWnBIYVInniRxKSn6IcinR8AImDC9wyEksx5tg>
    <xmx:ZMfqZeYqLGUxb1RrJZrl8J4BAbcDGVrFXF8jXoydq1YJntZR35j28Q>
    <xmx:ZMfqZXBlYaFgVGAR0F7eVUIlzihKDIZ0foGbmqXqfxVJkx81io3nKA>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B7F671700093; Fri,  8 Mar 2024 03:08:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com>
In-Reply-To: 
 <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
References: 
 <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
 <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
 <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
 <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com>
 <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
Date: Fri, 08 Mar 2024 08:07:43 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Sreedhar M" <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rate limiting per multiple seconds
Content-Type: text/plain

On Fri, 8 Mar 2024, at 7:26 AM, Sreedhar M wrote:
> Hi Kerin,
> Thanks again .
>
> I have changed it for two reasons , because of the errors
> nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
> timeout ; }"
> nft add rule ip filter INPUT tcp dport 8000 ct state new update
> @myrate { ip saddr . th dport timeout 10s  limit rate over 1/day burst
> 15 packets } counter drop
> Error: Could not process rule: Invalid argument

Hmm. I would have to go over the release notes to be sure, but it may be that that it has not always been possible to incorporate a timeout as part of the rule. Should that be the case, defining the timeout as part of the set declaration - as you did - is acceptable.

> add rule ip filter INPUT tcp dport 8000 ct state new update @myrate {
> ip saddr . th dport timeout 10s limit rate over 1/day burst 15 packets
> } counter drop
>
> After the above error I have changed it to below , In one use case -
> the below never resets , Say If I send only one message per second all
> the time , the below rule will stop at 10th second and the next
> message will be accepted only after 10 seconds. This is not correct
> when we are sending one 1 message per second it has to accept it ,
> because we are not sending all the 15 messages in one second.

This should definitely not be the case. The bucket will have a capacity of 15 tokens and they must all be consumed before the drop verdict can be reached (the 16th attempt will be denied). Please review your testing methodology carefully and be sure to flush the set before you begin your testing procedure:

nft flush set ip filter ratelimit

Incidentally, it is worth worth noting that the "new" ctstate can be satisfied under conditions pertaining to all three of the following things:

- the content of the packet being considered
- the entries that already exist in the kernel's conntrack table
- the state of the kernel's "nf_conntrack_tcp_loose" sysctl

I consider it highly unlikely that those considerations would have affected your testing. Nevertheless, in the interest of certainty, you may find it useful to include "tcp flags syn" as a condition of your rule while you are testing.

--
Kerin Millar
