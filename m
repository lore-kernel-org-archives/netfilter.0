Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0DD537FB
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891819; cv=none; b=nuZPK/LPhwQH9AkFverhnHoO3joypDCMwCasCiu0bZjRkgeiKxSfPXrlv1AGV9N4nm2GNrA70icvqe+8xsyXRAJNlDQ7qeeAXuG1AkRWh6ChsvNOwf1TqZrrfJd6iPh3LeOK4KVKin37GKWZ8TOnEtBSoypUQUPSKveG4vkT3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891819; c=relaxed/simple;
	bh=R8FnYlipG5R8qM8AvWcUieOxR9Fpl9lLf/NKxihbKcg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tXXKyKSgxXvvpDCr4iXD3glWQ/RElnawvYmGl34Fx/I71uP39o1irBpeU2mN1NWaRRFPfUBuc5YYlVMtrAHub9XyUXmJo87TH5SCL33DLeTzSlSRSOjGGwbFcuekEbPvujLsh3h67xzbvamhlPUhA8jNIQGe/rM6xGIsu5sG+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=hR1Gtdxv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f2U1gmTZ; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="hR1Gtdxv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f2U1gmTZ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 92D8918000B9;
	Fri,  8 Mar 2024 04:56:56 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 08 Mar 2024 04:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1709891816; x=
	1709978216; bh=bKXmATkz7QxlC7UNTh6hszLcS5LLHpmQ70cgehbvKWM=; b=h
	R1GtdxvEcb9PQrVbzZ6SmvVHp0PpZ7T2lW4P8bkfCTgvL3C7wJbGA1Vqanw3JTwr
	4yD7FzBWAbreINDKhkmAtUZ8QRrCEyWyZgghQLuOi2vkJdN4zJ/916zsAAGIlZgv
	x/pMsVR4Pbss1GmuWUMOfWfQaWHTcKaUWfVARrujVXOmflyXxgpNDdQYdgkFdRX9
	nNhoRrKcxDCCJh7tSJYmzj4bJtf+6oK/hMJLDuIhR0gClF/OrMHnyTso47CuI0tT
	YmAEpJtLKgdQ5kjv4vJY8tsCgnXHx/v/fDVUwzVXHm2oDZLm6Cx023CplrbFfLjm
	wvdtByVPOA7CCgcAu9spw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709891816; x=1709978216; bh=bKXmATkz7QxlC7UNTh6hszLcS5LL
	HpmQ70cgehbvKWM=; b=f2U1gmTZugBsrtVR9Hl3GkbxEXidY88iRB8YFs4R5xPB
	FS+MWbPEJWrxts/3zDaBXRkP938qHXG9VU9aHmchXoG6mLc6G1Bd9K6lSUW9iqrc
	7MDsXcrLSyfOaoK74/k74fVk2Unf7FC7juvk/PDckSDyt/vwe7ZPyIxZKzLItcqP
	RHn4ldM8lfnUllBMnQeXG8FBbc64CVBoo7zAFNKcUQNoqouu+3+1BnTkKIIkZySD
	S4PiQBNt89EnCP+RFR5eNbrVtewruVPOt6Mz1r0ZDWmnFpN2w29gHgBOTSIeQrJG
	R7S/8kXoKjhUPpi/pKgmKQ8h5pCiDgUue2LfElcJZg==
X-ME-Sender: <xms:5-DqZXTOAYQk7oC0tL9LnRO6gEzQTDIe4SOMRr-04V3bLouc3k6M1A>
    <xme:5-DqZYw7JwcGCikzRAS_ypnbS56iM6cq8QhNTAUVxvzovHosC4PA7k-qlbcMHN-aH
    uSUZ1PtPGc8Vb7v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieehgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedvleejheefkeekhedukeeuhf
    ffhedukefhgfdvteegvdefheeiteduffegheeljeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:5-DqZc16pI8s3Nijrl4vijbIRSQ5Rw2Tl3Tj0FOfKk8TRuMMZdSb8Q>
    <xmx:5-DqZXDjOy9IL7MqqYS2bG1e9c5AFESJD7iDQozWCY3jifq6RxMyuw>
    <xmx:5-DqZQg7WvJpFrpLLr2sYOo-PcjhsozUj7qz-5O4RLd0j8OJOjHQhw>
    <xmx:6ODqZcbsgdMycDGD6eb_ASHwDUJXHe0DoNaVgvgRHBZBe3ToLmgrwrTfjy8>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D637B1700093; Fri,  8 Mar 2024 04:56:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <cd20799d-91fa-4f5d-ad04-04eba4c9f28b@app.fastmail.com>
In-Reply-To: 
 <CANvpR2BxFSxecbA5LsRis6WsC+4Cxru6M4vX0fxKYwZt-Xb0zw@mail.gmail.com>
References: 
 <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
 <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
 <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
 <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com>
 <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
 <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com>
 <CANvpR2BxFSxecbA5LsRis6WsC+4Cxru6M4vX0fxKYwZt-Xb0zw@mail.gmail.com>
Date: Fri, 08 Mar 2024 09:55:33 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Sreedhar M" <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rate limiting per multiple seconds
Content-Type: text/plain

On Fri, 8 Mar 2024, at 9:12 AM, Sreedhar M wrote:
> Hi Kerin,
> Thanks for the mail.
>
> I did the flush and clean-up in all my tests.
>
> The main problem is with one of the below use case only other use cases works:
> problem Use case : Say clients sends new connection request every 1
> second , in this case the new connections must continue to be accepted
>  even after 15 new connections in 15 seconds because in this use case
> we are sending only one per second. this what expected, this use case
> is not working when we use "update" rule. This use case works only
> when we use "add" in the rule.

Indeed. That is because "add" does not cause the value of the timer to be reset to 10 seconds each time the rule is matched, potentially allowing for elements to persist for a long time after begin added (along with their token bucket states).

Consider the rule that you originally wanted translated:

iptables-translate  -A rms0  -p tcp --dport 8000 -m state --state NEW
-m recent --update --seconds 10 --hitcount 15 -j DROP

There you specifed --update, which does have the effect of resetting the value of the timer. So it was that I proposed to use "update" in nftables, to precisely match its behaviour.

>
> Add: The above use case works , when we use "add" in the rule
>  nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
> timeout ; flags dynamic; timeout 10s; }"
>  nft add rule ip filter INPUT tcp dport 7880 ct state new add @myrate
> { ip saddr . th dport  limit rate over 1/day burst 15 packets }
> counter drop
>
> Update : The above use case won't work , when we use "update" in the rule.
>  nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
> timeout ; flags dynamic; timeout 10s; }"
>  nft add rule ip filter INPUT tcp dport 7880 ct state new update
> @myrate { ip saddr . th dport  limit rate over 1/day burst 15 packets
> } counter drop
>
> Use cases that works :
> when we send 15 packets in 1 second, we wait for 10 seconds and the
> next will be accepted at 11th second, this perfectly works with
> update.

Yes.

>
> Use cases that do not work :
> Assume we are going to 1 packet every 1 second for an hour , we should
> continuously accept all the new connections as we are sending only one
> per second this is not working when use "update" in the rule , but
> works when use "add" in the rule.

I see. You never wanted the behaviour of --update to begin with, despite implying otherwise.

>
> Fyi, I have tested by adding this also - "tcp flags syn";
>
> Please advise me shall I use "add" in all the cases , so it satisfy
> all the above uses cases.?

Yes. The effect will be that any element added to the set will be evicted after 10 seconds has elapsed, no matter how many more times the rule is matched during the intervening period.

--
Kerin Millar
