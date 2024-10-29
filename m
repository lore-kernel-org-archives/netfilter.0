Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D036D197543
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218346; cv=none; b=s39WvyUg7q2Ui1NOkTxs6EtVzurtba7YBd0CzAJYChD5Llu7u84/Ac+Y57jn0ARVOYzS+aJ62MHCYjkY9rFJ7KsKyssiJJ4cJQSdRRe9v/M4xExyPadeCfk7b9W+pUcm4V6JARnD8isDFsTONhKBkWZ9eJbojNnu+aq4NE+B+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218346; c=relaxed/simple;
	bh=2RHTOO3WndCyHOwOwVGve7Twc9F6ayHj+8KcNcYSqSM=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UOZJ7GVjfZE1Z8nPp29TdY79fIFt30VWhVUY4qyB+j121Wk9WTga53N54vOjXmVi0loVB5+/4s1pTUGn8eXgnvjwWXUvB3vzeSf7ra925dmLyr0vfj4zZVKeg/BXU4dHwQvf5h4wbTnDp7AgTRO+eTaQbEGJmrkwqTResZGvYuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=TvAOU3lb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JCHIco52; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="TvAOU3lb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JCHIco52"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D89F41140103;
	Tue, 29 Oct 2024 12:12:22 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 29 Oct 2024 12:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730218342;
	 x=1730304742; bh=/vCztc32NPep60jJ87uTWCm9uza4z5U0xfZZYvCqrqc=; b=
	TvAOU3lbmJq8XHKiYWtaAIBUvLJPSLE+5ydSAUNzFN1RJ144C+zllVGPAEVpmDvw
	eIjUq+KTtKUW0e0JurRevvGMQSc8TxGLhckWTYz3nDXm5EiMimcfRrWvCX4reWwO
	4QJzCNNM5VaNRXuynHA7ioViZ8MjYemaRsDl5xzEypvUU2Y5vaZvQMeWtiWYQf3U
	SNuwkpM2tGhaXZzqWxUwwH4DzysM0X+HdtNk3bcfRkEt52wyRjSisKnAasABjbNz
	TneexWEStng2/6rpgTeucSInf6hTXwZpZHA/ger/Vu2oVh2gaRBjlIeGTtxYkzri
	saLcj04oN03PnkxInonciw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730218342; x=1730304742; bh=/
	vCztc32NPep60jJ87uTWCm9uza4z5U0xfZZYvCqrqc=; b=JCHIco52CRcZBFBvc
	cug/c6IBPcVoKypujzS4YtLIibeKXM+IGfPoqxdOo4+yTAJZY9O24oe1LCyr/SxO
	36YjDgQTGm3e7cxM6ozWWaX+Y9BfXmWgWFLqXNgi8g5CfsgavK+9zMGkcaGzANMH
	0zWwzN4Eg6sVCa76Ggc5NuzRoYKVCvush0F12UZL2AGZkJsekcshCKZotNlxAdFz
	lCuWh1Ds6I56ZMXQhTWSSPyujDrbacKhp5VfKvFoVCKYzRxvnNvg2gV+fEd/Cobk
	KdhbIZSbVT5PjLDsdoIQZTSxSwaIEcLWPJp0VIvNCRaOqPTSULqVHlcpkY+zKqNg
	uI6YA==
X-ME-Sender: <xms:ZgkhZz9-pCWF5yqEVzkFE0d_ElNRHBCu6WJSvRsh3d8mUnnvPxE4JQ>
    <xme:ZgkhZ_t2gBz3gFte0EX1Kv_2sYd1kGZ8ht8ZIJjHC--fWW-UmfdlRO4_CKKr7f7Rs
    eBLvulR4adN8Z06>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekuddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepteekvdektdfhgfejgfdtueelfeefkeevueff
    veffleffhffhjeelhffggfdtveeunecuffhomhgrihhnpehishgtrdhorhhgpdhnvghtfh
    hilhhtvghrrdhnfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehmiigrghhrrggsvgesugdruhhmnhdr
    vgguuhdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:ZgkhZxCDXN6EJuRsEB4YHkZ7oDDXtIo0mkt9V5KBpk9Om7i_ESN55g>
    <xmx:ZgkhZ_eZx8JZ0HAAj7maRiiDNSIJsncxAove8njdHqWYZs9FLcoABA>
    <xmx:ZgkhZ4M8SKFqcZgtiVNR6hyCyP9LRaeMX6oHRvi9zbLe850v4TCUlg>
    <xmx:ZgkhZxkSynXfdg-RDx6oyuzGwP5bkm_xGDrpIkVOODdhz36qo6Aqlw>
    <xmx:ZgkhZy1NZdle01W8dmehY_I9s6DoqmUsU_I0jMD2IYGlS0hKnKwfQ94->
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 710E13C0066; Tue, 29 Oct 2024 12:12:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Oct 2024 16:11:54 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Matt Zagrabelny" <mzagrabe@d.umn.edu>,
 netfilter <netfilter@vger.kernel.org>
Message-Id: <5d5a6c5d-155f-4fc0-a0de-1216d94897c9@app.fastmail.com>
In-Reply-To: 
 <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
References: 
 <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
Subject: Re: connection tracking and kernel dropping packets
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 29 Oct 2024, at 3:11 PM, Matt Zagrabelny wrote:
> Hello,
>
> The kernel of my DNS server is dropping packets:
>
> kernel: [48074703.302657] nf_conntrack: table full, dropping packet.
>
> I've followed this knowledge base article:
>
> https://kb.isc.org/docs/aa-01183
>
> for configuring iptables to not track the connections of DNS packets.
>
> ...but it is still dropping packets due to the CT.
>
> I know I could bump the conntrack memory, but I'd still like to know
> why my iptables rules aren't sufficient for not dropping DNS packets.
>
> I'm running Linux 3.2.0-4-amd64
>
> Here are my iptables rules:
>
> # iptables -vnL -t raw
> Chain PREROUTING (policy ACCEPT 24M packets, 2112M bytes)
>  pkts bytes target     prot opt in     out     source               destination
>   16M 1153M CT         udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            udp dpt:53 CT notrack
> 3723K  701M CT         udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            udp spt:53 CT notrack
>
> Chain OUTPUT (policy ACCEPT 24M packets, 5436M bytes)
>  pkts bytes target     prot opt in     out     source               destination
> 3760K  327M CT         udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            udp dpt:53 CT notrack
>   16M 4680M CT         udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            udp spt:53 CT notrack
>
> # iptables -vnL
> Chain INPUT (policy DROP 45173 packets, 2842K bytes)
>  pkts bytes target     prot opt in     out     source               destination
>   23M 2065M ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0            ctstate RELATED,ESTABLISHED,UNTRACKED
>    11   804 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
>     4   284 ACCEPT     udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            udp dpt:53
>  709K   37M ACCEPT     tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            tcp dpt:53
>
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               destination
>
> Chain OUTPUT (policy ACCEPT 24M packets, 5439M bytes)
>  pkts bytes target     prot opt in     out     source               destination
>
> Any ideas what I'm missing?

Please use iptables-save -c for dumping rulesets.

You can inspect the contents of the conntrack table by using the conntrack(8) utility from conntrack-tools and, in so doing, better understand the manner in which it comes to be full.

By default, TCP sessions that aren't formally ended can occupy a conntrack table entry for up to a week, per the value of the "net.netfilter.nf_conntrack_tcp_timeout_established" sysctl. Also, "net.nf_conntrack_max" can be used to increase the maximum number of entries. There is nothing wrong with tuning these controls in accordance with your workload, if needs be.

Incidentally, your ruleset allows for packets classified as INVALID to traverse the INPUT chain in full, which isn't advisable. As was discussed recently, either contend with INVALID packets up front or additionally match on the NEW state for subsequent rules, where appropriate.

Finally, you might consider whether you need bother using iptables at all, since this ruleset doesn't appear to be doing a great deal. Are you trying to limit the exposure of other network services that this host is running? If so, binding them to a particular address may be an option. Further, there are various scenarios in which connection tracking isn't necessarily useful, in which case one is certainly not obliged to use it. That your host isn't tasked with forwarding packets indicates that you should at least ponder upon this.

-- 
Kerin Millar
