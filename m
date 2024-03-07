Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569E12B15F
	for <netfilter@vger.kernel.org>; Thu,  7 Mar 2024 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814630; cv=none; b=Kpj14Jgi20EwaG8GFoYXXpUFQFemZjsZTi9oR7uzIj3tngPYjY13/PztIqfYS6/hybPH6ANAygr8sVUCpDpZh0HZAjYSGnN0rDDdumVajc+KlEfPuy5zHyEJVkhXpF0cOW2HRAD5MSqr/pL5IN94rExekTq8Y8F4hSdrKuHFYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814630; c=relaxed/simple;
	bh=qhAUq6efk/1RWMUPpUuYAF0PWXpFRHUAchSvikby7xU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=RFN/6SsCwlqi7Diwn1BzHOWYMI3sfmTCue1zR+75UQGEFM5o30y2NRKx2plchT6BKPl7+bLEIfEp/kMd1TK43VQ+RT8ENYGHKaVKPfdcZQNQw8GPJ1KV3j0Kwxj/So9zZ19a4pDmkE8gih6QIkhqoHH3Us1pDkwSeh9zRly2Ido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ei1k8V0a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oxpjar6G; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ei1k8V0a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oxpjar6G"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 961161800078;
	Thu,  7 Mar 2024 07:30:27 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 07 Mar 2024 07:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1709814627; x=
	1709901027; bh=CPVhFI8cEXwC9AFmq89fPdOrInmI0emlCXjHsXWnVes=; b=e
	i1k8V0aumUVuIJvNRMvWfbLvKlvssiYrt4uRiRBPhZJcgyynVqhPPlidRNOyXVDG
	ZN7X+1HCIld9OdBWh94FmBtXCZ9aDGuvVhUOGAAHhtlt67K6McKCZPEvdbKl2Vxz
	tEwTu5OccR1ptLxX0Fqew9SfgSqu6L/Ui49R3RKOXO4qThLz2aog3NP91tGhBWTb
	qkEQH5CIu4rtbsiRFv2NMTh4OPj2x6uwrTCZzK7fV8eE4ShsXYAc79L82Ts4cpxI
	wS2trX2b0ADKnPrJzyNuyMDiS4136A/7eql3fDCTnOSMvFTM+xSC5nt1DuXJInK6
	Odmc0/vnXZWIPH4YkjQxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709814627; x=1709901027; bh=CPVhFI8cEXwC9AFmq89fPdOrInmI
	0emlCXjHsXWnVes=; b=oxpjar6GI5ifS9QsfksGs8HrQF8EyDW48ICdINU1l0G/
	h9qFediHIAPDT5rRq914d1rERfYCt2N5VYuJMsV3xEZ0bkIh2ip0TnxIEBp/ytZa
	wlWsnxrLYKXm+57v+nnMEFuGPtx2rxGjli3ZympKnxoa2BEdH0roK5Zawl16AfvG
	+jNv4VYqumVqckPco2Js6bWIqqrurVopR4dztrh0YhDjS+yfeh9QXIIG8z4XUqci
	PSVP1Swn+8ypZrgYjKuFJu+27NP4mpXbH4jcrOR1khSPBCBIDrSDBDgUib9i5xxu
	bifcAahs5d7vFsXKAwFUw4/wtEvoq0hjo3uxyzeslQ==
X-ME-Sender: <xms:YrPpZTP1n7L6NSJWAi4lqgujGg1SSqoLqCzBmD4Wo4WrMtdD3XJIdA>
    <xme:YrPpZd9UYVHwZKHFk827CrfqEjnrEyQ7qvkhxekA21H0WaAxCPuyB-Fs7dveTCQpa
    h-CeFq4V9eZoTgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieefgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeetvdejgeeigfellefhudelke
    ffieduveduhfelteeihfetgedttedtkeeglefgieenucffohhmrghinhepnhhfthgrsghl
    vghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:YrPpZSTVpa_AOm2lxkzW2rdvsL4r5j7kllThns5zqD7OqnrVe6daQg>
    <xmx:YrPpZXuELcHNFPIpE-xhCf7oRDaFPi1it0AE0RgZWLBQuwdRQW5FnQ>
    <xmx:YrPpZbeuDy3zRKmTmOCRyy6Y-rxL08cpfy3mx7LEWQBx63xJkWrlAg>
    <xmx:Y7PpZTGERNL-ekU_zx-vY_XrXaVXsJ-KLQGxC9-Q_2qC99nclly0lQ3z7rY>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C22631700093; Thu,  7 Mar 2024 07:30:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
In-Reply-To: 
 <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
References: 
 <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
 <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
Date: Thu, 07 Mar 2024 12:30:06 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Sreedhar M" <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rate limiting per multiple seconds
Content-Type: text/plain

On Thu, 7 Mar 2024, at 10:08 AM, Sreedhar M wrote:
> This is really inconvenient that we cant rate limit the packets for
> multiple seconds , we have only the close enough but not 100% right in
> edge cases.
> "1/second burst 10 packets" should be close enough. The bucket will be
> initialised with 10 tokens and refilled at a rate of 1 per second.

I understand that it it is not precisely what you are asking for and am definitely not opposed to the idea of supporting more flexible intervals. At the same time, I don't see what renders the suggested rule so very inconvenient. Should the bucket be drained through flooding, it will achieve the overall aim of allowing for no more than 10 packets to pass over 10 seconds.

Regardless, it is possible to implement more powerful rate limiting schemes through the use of dynamic sets, as should become clear momentarily.

>
> I really cant have an alternative for below please
> iptables-translate  -A rms0  -p tcp --dport 8000 -m state --state NEW
> -m recent --update --seconds 10 --hitcount 15 -j DROP
> nft # -A rms0 -p tcp --dport 8000 -m state --state NEW -m recent
> --update --seconds 10 --hitcount 15 -j DROP

Since this is a different problem to the one that you initially described, it would be premature to infer that you can't have an alternative. Fortunately, you can. Below is a small ruleset, demonstrating how it can be implemented.

table ip filter {
    set ratelimit {
        type ipv4_addr . inet_service
        flags timeout
    }

    chain INPUT {
        type filter hook input priority filter; policy accept;
        tcp dport 8000 ct state new update @ratelimit { ip saddr . th dport timeout 10s limit rate over 1/hour burst 15 packets } drop
    }
}

It works by creating a dynamic, named set and leveraging the ability of ntables to update sets from the packet path. Each time the rule is matched, it adds or updates the set with an element consisting of both the source address and destination port. Newly added elements bear the given rate limiting policy, along with a timeout of 10 seconds, thereby matching your --seconds parameter. The capacity of the bucket is set to 15 tokens, thereby matching your --hitcount parameter. The buckets of elements that continue to survive the timeout will be credited with a single token every hour - a deliberately long interval (you may lengthen it further if you wish).

I would suggest taking a look at the SET STATEMENT section of the nft(8) man page:

LESS+='+/SET STATEMENT' man nft

There is also some information in the wiki:

https://wiki.nftables.org/wiki-nftables/index.php/Meters

--
Kerin Millar
