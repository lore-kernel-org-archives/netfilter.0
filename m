Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FBE157478
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717171633; cv=none; b=dGeGpLY/oYF+L2ZUVxV0gYQ8A+n2s6N/TkwylvnlBVXM8n5lkzK5uZCSCkoNC/f/TcKuGSBSvDsY4GKVvPfFvXD/IR22eT2/ACeNSLCB35MO8UO27BrqWurBYA/pNVKM2TG3WCyjptCMJvzoW+AxHfe9COjTd2G+d8Ya3mxB028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717171633; c=relaxed/simple;
	bh=0X2EAap2zgXRfc3eEcsdyswth3pdWC8ByTpgUlRMPXI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=pVv0u0xop/NNixl0Dhae5O7LnpohYyZ1897rt+eC3LVc0xiac1NZv8wrEgJISzU9/od9XJwdu5GnYwfkOEcLZC2B71y+OFD2jxPggkKk7SM2HFgYunJsunK8p36FQuovOqhclu1pAiuoLltaltoO7HFZtGIntEdi+sSANF+Kx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=SaIXPkhF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fhON+Tea; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="SaIXPkhF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fhON+Tea"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3AA9411400DD;
	Fri, 31 May 2024 12:07:10 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 31 May 2024 12:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1717171630; x=1717258030; bh=4OffPZlIao
	ZNwPvsxNJRby/HkpgJy9nERYW4taN7yo4=; b=SaIXPkhFqJKg1Qpf+ZrFGi1LQ0
	lC/X9AL7RAp0b+ljsI/VDnqUrFCIXi3RKZUsY3u+fVkMKV4RrmU1xYEWM7OOSASj
	lnGu8nQJax1wQvSwLm6t1+l/gO5ZBbcziarOYjzPpQbP6J5DelwzwJxEj52WcAXZ
	Zyi/yOhdtsVJOaKWsVpWiKVTOVIyE7JhvMtYOAK1/rXwhWYtStBO8BIyf/XkypBO
	O7IVVAsWa0Xj0+0fHpGmAv/wUsazqCJKfJCpJbabnToIkg/TXtU2P66suJq5n1Uz
	Z5wlQYrSZ2KZlkcJMXFTfWoBW68Effjin0/qFg47Wn+1N1WmGrXDWPjABeug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717171630; x=1717258030; bh=4OffPZlIaoZNwPvsxNJRby/HkpgJ
	y9nERYW4taN7yo4=; b=fhON+TeaLPCRZGcX5USqYo872KN4zXtKgkHAQcn7S4I4
	2CmLJG9UtkBYm6FBGo6K/2ECB8a/CpAJyfq2FU7ekNN1y8YsJAr+5MjRfZ7gJLyM
	YwEw0qmNWHcjT+FJksOj6czD/O5kvERpAVouiFn77xGab7Y5TkwWZGGovfpwlvpF
	FCyeIDN8xW6YiGD1AZuprn8pqG1hOGlO01AURAACavmhEZjfPSmBTKObxUzcMuVy
	97i6UbGMtYhpaUQK/EhCOdRIOFvCM7bX8R3MYZ8+CzqbTwJRL25is12D+ZrGnWzz
	18w5wQdNGFrEydJ33fvmvGvfeiRKuPDAFiS4cw81xA==
X-ME-Sender: <xms:rfVZZjJ71fXYwOW8_sPRf8ccAkFncEUdOZ8OsdT2PTl8G7pQzXHcAg>
    <xme:rfVZZnJ8oq5ht-3G_sjZKKtznoI3V0F-8msesei3tr885JUaIF5EM2d9HLXONlhW2
    -JhGdsWBIajC_gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekiedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeejteffvefftedujeeigeethe
    fggffhkeekheelvdevkedvjefhhedvgedvfeffkeenucffohhmrghinhepnhhfthgrsghl
    vghsrdhorhhgpdhnvghtfhhilhhtvghrrdhnfhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:rfVZZrvAdeOujvtzCgzYFF_p4N2ycBZDIpPMAT2GCRAEAxx67ocO_Q>
    <xmx:rfVZZsZ9kr9i6gQ744uBJBB6hPAD9Yjhv6LPtTTmf9nBblOFG5nw6g>
    <xmx:rfVZZqY1KxEAJzEU48Lta_GQaDU84tfLfAJSNpOifrVtszhaVMAw_A>
    <xmx:rfVZZgCYhwvJsSNf2rcwZ5_EOkMhKjroK28jx7UFmKi92sZ6frkdZA>
    <xmx:rvVZZtw79fC006Op7gum3CV4xzMi5jebEJypDQDQfEpMyLlRsUCqHBwW>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B6D3C1700096; Fri, 31 May 2024 12:07:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e39e7c2c-e0ff-4b4a-99e1-833150c643c4@app.fastmail.com>
In-Reply-To: <1393698327.20240531171132@WKraft.org>
References: <14110673198.20240529174630@WKraft.org>
 <4ac23ef0-13df-4423-b1d5-aa9d5eb5423d@app.fastmail.com>
 <305618533.20240530185617@WKraft.org>
 <79ee1677-6a97-46c5-ba3c-af6e1b61638a@app.fastmail.com>
 <1393698327.20240531171132@WKraft.org>
Date: Fri, 31 May 2024 17:06:37 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Wolfgang <netfilter-user@wkraft.org>, netfilter@vger.kernel.org
Subject: Re: Problems understanding nftables part 2
Content-Type: text/plain

Hi Wolfgang,

On Fri, 31 May 2024, at 4:11 PM, Wolfgang wrote:
> Hello Kerin,
>
> thanks for your reply, I will try to answer your questions
>
>> You are describing (not altogether persuasively) why you want for so many hooks but not why you
>> want to set nftrace to 1 for each of them. With the exception of ingress/egress, enabling nftrace
>> for the two previously suggested hooks would have been quite sufficient.
>
>> # Pointless if solely for enabling nftrace for a 'big picture' perspective.
>> # Please use raw (-300) as was suggested.
>> type filter hook prerouting priority filter - 1; policy accept;
>
> I just wan't the hooks for my understanding, and have a template, I 
> later can take, modifying for
> tracing down issues in real live.
> Right now its just for understanding the system, and seeing, that those 
> hooks are beeing called for
> certain packets.
> About raw priority:
> When I understand 
> https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook
> right, priorities have no influence that a hook is called or not. 
> Priorities only assign the order,
> in which the chains are called at this hook.
> So I can have for example two chains in the same hook, one with 
> priority -450 and one with priority
> 301.  So I would see e.g. in prerouting in the first hook two 
> fragmentated packets and in the
> latter hook only one defragmented packet. Or I could see in a 
> postrouting chain a packet before and
> after snat.
> But my hook should see the packet in each case, please correct me, if I 
> am wrong.
>
> So from my understanding, priorities are getting important, as soon, as 
> I wish to investigate in a
> certain kind of problem, than the priority is very important, to 
> understand, what I am seeing.
>
>
>
>> It's not clear that you understand that the value of nftrace doesn't quietly reset itself to 0 between hooks, however.
>
> Can you explain this further? Which value of nftrace? What shall reset itself?

What I mean is that, once the nftrace attribute is set to 1 for a given packet, it stays that way until the packet is given its final verdict. So, if you hook at a sufficiently early juncture, it normally takes no more than two hooks by which to set the nftrace attribute to 1 and be able to trace the path of a packet through a ruleset very comprehensively. Of course, you can create as many hooks as you wish. However, if the resulting chains are to contain nothing but a single rule to set nftrace to 1 (again) then there is no need; it will only serve to make the trace output more noisy.

>
>>> 1) How is inet traffic flowing from application to application? Where
>>> is the hidden way from
>>> postrouting to prerouting? It must somehow leave netfilter, as packets 
>>> are reappearing with a new
>>> trace id?
>> A packet is transmitted over the loopback interface then a packet is received at the loopback
>> interface. Locally generated packets are routed over the loopback interface for all locally owned
>> destination addresses, not only 127.0.0.0/8 and ::1. Otherwise, the fact that the loopback
>> interface is involved isn't of any particular significance.
>
> Thanks for that very important answer! That helps me a lot and that 
> should be part of the diagram,
> as this path is not going to ingress/egress. I try to investigate that 
> further, as I am interested
> in the whole picture. Can it be, that the "Bridge device?" decision is 
> a tri-state decision, for
> checking bridge, physical interface or loopback?
> I enclose an updated diagram, where I have included
> this path as an temporary one and some other findings. Please have a 
> look at it and give me feedback.

The path does go through ingress/egress. That the interface isn't a physically tangible one doesn't matter. For that reason, I don't think that it requires any special accommodation by the diagram. For locally generated packets, "lo" may be selected by the routing decision. Meanwhile, packets arriving at "lo" are handled similarly to any other interface.

>
>
>>>
>>> 2) Why nat traces need a trigger through a succesful nat connection, to 
>>> start working? Is my
>>> observation right, that tcp-wise only SYN-packets pass the nat-hooks?
>
>> The previously offered wiki link attempts to explain this, though the wording could be improved.
>> The following two bullet points have been lifted from the article in question.
>
>> - The first packet of a flow is used to look up for a matching rule which sets up the NAT binding
>> for this flow. This also manipulates this first packet accordingly.
>
>> - No rule lookup happens for follow up packets in the flow: the NAT engine uses the NAT binding
>> information already set up by the first packet to perform the packet manipulation.
>
>> The "information" in question is stored by the conntrack table, whose contents can be inspected
>> with - and monitored by - the conntrack(8) utility from conntrack-tools. The overwhelming majority
>> of Linux distributions activate the conntrack subsystem at the point that any ruleset is loaded
>> containing at least one rule pertaining to conntrack state, thereby causing for the applicable
>> kernel modules to be dynamically loaded. Typically, that would be a NAT rule or a rule that tries
>> to match on ctstate. One activated, the conntrack state machine continues to perform its duties
>> until such time as the kernel modules are unloaded, even in the case of an empty ruleset.
>
>> A TCP packet with the SYN flag set is something that might create a new entry in the conntrack
>> table. As such, it is to be expected that it may be intercepted by a nat hook, whereas subsequent
>> packets that the conntrack state machine can match against an existing flow won't be. In fact,
>> even an ACK packet can create a new TCP flow, unless the value of the
>> "net.netfilter.nf_conntrack_tcp_loose" sysctl is set to 0.
>
>
> Thanks for that hint as well, looks like, that I have overseen that.  
> The picture gets more clear
> every day!

-- 
Kerin Millar
