Received: from gorki.wkraft.org (gorki.wkraft.org [78.47.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ABE15B96F
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.65.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717183896; cv=none; b=FUMsMmKjzK7TlB0i9hXZZF9H/peBvsyTPdfH3pWivbAwbTcm+6Oj3C2e7JC2KtSwtUt1ddasGVZ4OU+eFRIzEmLWK17Nlhz7F7oeShlLnGlFtRt3Ezvx48imGwJIFbTWxa6YRJvEFnHna50dhC/8vKMuWg3cfEI0ZRjWprbPDr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717183896; c=relaxed/simple;
	bh=U1RRS3X6A0JL3M38lIzFAqcgl+Rs6NTjmOXtE9t+u5E=;
	h=Date:From:Message-ID:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AubXmLbN2eg6PYkhm4eKdLESxbZcn+OXK0dkoo36/hfllDo7Q7uZvs1dQ9+c2gbws9Za9K00KxRKqea1SpzISfMrupZ9GMdwyxqaJdHZYF9S3i/1XccLLcjghGrQ7OxjjanA4W+mp2Lrp5JhIW8HuKjCGdaU8MZhvLF2cNaI+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wkraft.org; spf=pass smtp.mailfrom=wkraft.org; dkim=pass (2048-bit key) header.d=wkraft.org header.i=@wkraft.org header.b=TAkPwYvF; arc=none smtp.client-ip=78.47.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wkraft.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wkraft.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkraft.org header.i=@wkraft.org header.b="TAkPwYvF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wkraft.org;
	 s=42; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:
	Message-ID:From:Date; bh=QVtjbI7QZh2A/Ni1jKiaGJB9w++Y3qIDEl0G5XUnu5c=; b=TAkP
	wYvFPDdFxq34z+ByynLFryDNKio998g9qdmzSIQhzl2MShbC6rSmwXgzdA/XNRB/MDFLxDt2jwGYL
	jKoNeduuyBDzHIyUt+TCRh8poAd5z9Iqh3cs0SKhtexcPuvDPRoHiBzaFIZ4izCko4LXZfSZtKL5/
	a8xOhHBuJ/tznuocBT0rwfYZClMxBghR1E9U+IKLq9Srm6ugeyHbAtQlJbtdeN+h0XHX5sIt+3bHz
	BuR4yYkQ+g8oYWsq8BZ+MvYl604YiSEY+psrryggbNua6FfnFCpb9V4JaPwBcuMfj5fpxae8kFFh/
	JiStMkUHjsYKK7mfwvnUmDLHG+Z6Iw==;
Received: from home.wkraft.org ([87.138.209.50] helo=wmk-workstation.wkraft.org)
	by gorki.wkraft.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.93)
	(envelope-from <netfilter-user@wkraft.org>)
	id 1sD7yE-0009WT-AL; Fri, 31 May 2024 21:31:22 +0200
Date: Fri, 31 May 2024 21:31:16 +0200
From: Wolfgang <netfilter-user@wkraft.org>
Reply-To: netfilter-user@wkraft.org
Message-ID: <1274403038.20240531213116@WKraft.org>
To: "Kerin Millar" <kfm@plushkava.net>, netfilter@vger.kernel.org
Subject: Re: Problems understanding nftables part 2
In-Reply-To: <e39e7c2c-e0ff-4b4a-99e1-833150c643c4@app.fastmail.com>
References: <14110673198.20240529174630@WKraft.org> 
  <4ac23ef0-13df-4423-b1d5-aa9d5eb5423d@app.fastmail.com>
  <305618533.20240530185617@WKraft.org>
  <79ee1677-6a97-46c5-ba3c-af6e1b61638a@app.fastmail.com>
  <1393698327.20240531171132@WKraft.org>
  <e39e7c2c-e0ff-4b4a-99e1-833150c643c4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Kerin,


>>
>>> It's not clear that you understand that the value of nftrace doesn't quietly reset itself to 0 between hooks, however.
>>
>> Can you explain this further? Which value of nftrace? What shall reset itself?

> What I mean is that, once the nftrace attribute is set to 1 for a given packet, it stays that way
> until the packet is given its final verdict. So, if you hook at a sufficiently early juncture, it
> normally takes no more than two hooks by which to set the nftrace attribute to 1 and be able to
> trace the path of a packet through a ruleset very comprehensively. Of course, you can create as
> many hooks as you wish. However, if the resulting chains are to contain nothing but a single rule
> to set nftrace to 1 (again) then there is no need; it will only serve to make the trace output more noisy.

Ok, so here we have the same understanding. I really don't care actually about noisy rules, as my
test rules are only containing constraints to single connections, i create with socat, netcat etc.
This is just a tool, to see, whats going on and getting a deeper understanding.

> The path does go through ingress/egress. That the interface isn't a physically tangible one
> doesn't matter. For that reason, I don't think that it requires any special accommodation by the
> diagram. For locally generated packets, "lo" may be selected by the routing decision. Meanwhile,
> packets arriving at "lo" are handled similarly to any other interface.

For me right now its really important, as I missed in that diagram the way, internal communication
flows. I had one problem, I researched, where this explanation helped me a lot.
And as this kind of diagrams are used by so many people, with different intention, what they search,
it is -by my opinion- a very important piece.
It was for me not clear, that local traffic between two applications listening on eth0 ip addresses,
is in reality handled over lo.

In my roadmap is now to investigate tun/tap and other stuff, I assume, that this is also flowing
through lo.

Regards

  Wolfgang

