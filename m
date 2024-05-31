Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3AEEBB
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717120040; cv=none; b=NciDsIWBTqC6fMmK1izv8lfvlWYHnMxkou7vK5uilcNdwOzMeXpcxn6KwLbnr8JXd9lhGv3ZWrhf7ChekaWs315mxyTqhE2cXbz946071yKg8OE4pfqETGP1ZL6rvwSNKAkM4iKOO8pFqQQoy+XLZ2ywxIrRo0G1RWMBYq1Wy7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717120040; c=relaxed/simple;
	bh=hrOsDoFGIzvr2F1/I1cZquZKSLS5dZ1suwt5kTn43Ew=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=j0BSNmNvK9moR+NqenBnzaVv1AYJVAEtxoj37wuB6m/z8iAuDAqrJOFHgxqa+uUndNi4tV+rrPkSMFL5nO7y7ZTjUxFRBdmukNjFiw1aNhg1XqEKF5SuxnKCiUP5mE/YZ/CvBkGteXvOr/upwKscqp1d5ofWVBPWr6tE+0QcCWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=F72hmkGH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TVxcQaCQ; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="F72hmkGH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TVxcQaCQ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 1838D1800124;
	Thu, 30 May 2024 21:47:17 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 30 May 2024 21:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1717120036; x=
	1717206436; bh=MYzWvuFgvmPQOclm5TOeZ5Ce1tcRabT+3CYhfzLOeqs=; b=F
	72hmkGH409pxiBbl/BEiI5K1wZThc/JrAEApUk5m2fR4uPH63DRfE1JohrTNwHy+
	83/I2Gs8L7YG7qJgoCqoRD26vAMRtz+bLXe8ivNOm5ok6V7xE+s2woEkoAfKXiR/
	QwM0O7IyYVRJ6wMnawhQVLPVMGWeK6bLIBs0RuTqe5w0z1o4zp82eb5eWET1bC9E
	bGik2uBJX09e7qzBA153PibEfAiS1rA3Nq7Zh3k4bP5KazoiIfEhQo2+qhlwIH/5
	tfENl7OyE8YkmPFLxTn9lfWBGr2k92ny69sK7/DOkjlaq/pwaq3VF60YgCtE7siO
	EOLs9MsRb+LCUByO3IWgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717120036; x=1717206436; bh=MYzWvuFgvmPQOclm5TOeZ5Ce1tcR
	abT+3CYhfzLOeqs=; b=TVxcQaCQb389fHDnlZxDIlr2t0PwRLmWyqWVmKwTiIIC
	ji7DbazisH6q2kebcsMjLqWfMTNvmJVw4oKfU5nvncrof7GwgUc8ZoAIPBe2CsoS
	l9pr9SYbRrt7O0nqHQdumb2Q2w/VcP3n9Ef7zeUabVy9wcTJs/+3xhjrAgi9du0D
	JeNteFV2/Gz5cSf0pSu2BD9hnzzk5tXeXHfLoqbvAmf9S+K9ZRmCnj2GdVrw1kkL
	4JPBLLmKgiywNw5tJiOgvFlQp0437Z6zeCf5FgbWptHMVjgj/qbFr0xUpccRqA3H
	sNRV0mrhyg3S8PvHIpW0sSauS1eJEatuhvzSP7hlPg==
X-ME-Sender: <xms:JCxZZqViL9V00aM-HemSzoK3S0ahhUbJiLBSAuQoX6xpe05rsI6YEA>
    <xme:JCxZZmla36V59NX1FVxHNbF8BOGX-8syA2UdPDjUlZFQdm1JQxfKv2PL0tmOExw-_
    ap92n1ioLM2FSzt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekhedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhephfejlefhheetfeffkeduhe
    fhleeiieffueffuddtfeekhfejheelkefgteetgfevnecuffhomhgrihhnpehnfhhtrggs
    lhgvshdrohhrghdpthhhvghrmhgrlhgtihhrtghlvgdruggvpdhnvghtfhhilhhtvghrrd
    hnfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehk
    fhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:JCxZZuYsgKkwEkfUX-ZA0NFAz2RxSHYK5DA6oaFtRRfxdfhe5pYk4A>
    <xmx:JCxZZhUu1XBKSL0CgoyQMDhj9qj5LGUnU-WGHo1Fzn63SmdzkeJ6DQ>
    <xmx:JCxZZklBy3-aGwB8duSnVROMuWj_7xuwqD9v6RNeHd6cuX798ZMSTw>
    <xmx:JCxZZmf-ZAQh0FHk0aG70MG5sho20KrZtksjFFsa98u_7TiC2e9J8w>
    <xmx:JCxZZgsHesJhfvNZ2uwDIAuWcZm0D7q2c22akSioBPTPN2d_eKsZYqNz>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3136D1700093; Thu, 30 May 2024 21:47:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <79ee1677-6a97-46c5-ba3c-af6e1b61638a@app.fastmail.com>
In-Reply-To: <305618533.20240530185617@WKraft.org>
References: <14110673198.20240529174630@WKraft.org>
 <4ac23ef0-13df-4423-b1d5-aa9d5eb5423d@app.fastmail.com>
 <305618533.20240530185617@WKraft.org>
Date: Fri, 31 May 2024 02:46:42 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Wolfgang <netfilter-user@wkraft.org>
Cc: netfilter@vger.kernel.org
Subject: Re: Problems understanding nftables part 2
Content-Type: text/plain

(Copying the netfilter list back in ...)

On Thu, 30 May 2024, at 5:56 PM, Wolfgang wrote:
> Hello Kerin,
>
> thanks for your answer. you wrote:
>
>> I wouldn't consider the nat hook to be an especially useful context in which to enable tracing, partly owing to its semantics.
>> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)
>> Instead, I would recommend using the following hook for tracing packets that arrive.
>> ...
>
> my current goal is to get a feeling for the whole picture, therefore I 
> have hooks in almost every
> possible location. Those are:
>       type filter hook prerouting priority filter - 1; policy accept;
>       type filter hook postrouting priority filter - 1; policy accept;
>       type filter hook input priority filter - 1; policy accept;
>       type filter hook output priority filter - 1; policy accept;
>       type filter hook forward priority filter - 1; policy accept;
>       type nat hook prerouting priority dstnat -1 ; policy accept;
>       type nat hook postrouting priority srcnat-1 ; policy accept;
>       type nat hook input priority  99 ; policy accept;
>       type nat hook output priority -101; policy accept;
>       type filter hook ingress device "eth0" priority -301; policy 
> accept;
>       type filter hook egress device "eth0" priority filter -301; 
> policy accept;
>       type filter hook ingress device "eth1" priority filter -301; 
> policy accept;
>       type filter hook egress device "eth1" priority filter -301; 
> policy accept;
>

You are describing (not altogether persuasively) why you want for so many hooks but not why you want to set nftrace to 1 for each of them. With the exception of ingress/egress, enabling nftrace for the two previously suggested hooks would have been quite sufficient.

# Pointless if solely for enabling nftrace for a 'big picture' perspective.
# Please use raw (-300) as was suggested.
type filter hook prerouting priority filter - 1; policy accept;

# Ditto. Enable it for "hook prerouting priority raw".
type filter hook input priority filter - 1; policy accept;

# Ditto. Use "hook prerouting raw" and/or "hook output priority raw".
type filter hook forward priority filter - 1; policy accept;

# Ditto.
type nat hook prerouting priority dstnat -1 ; policy accept;

... and so on.

> I can see incoming packets in ingress/egress and I can see, that 
> packets from local processes
> talking via tcp, are leaving postrouting and reentering the system via 
> prerouting, here with a new
> trace id. I currently can't explain their way, as neither the diagram on
> https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks nor 
> the otherwise excellent
> article here: 
> https://thermalcircle.de/doku.php?id=blog:linux:nftables_packet_flow_netfilter_hooks_detail
> is speaking about internal communication.
>
> Another lesson I learned, that four hooks don't allow symbolic priority 
> names: nat input,
> nat output, ingress and egress.
>
> And what makes me still wonder, is the fact, that nat hooks start 
> reporting packets, after one
> packet matched a nat rule. After that I see e.g. all udp-traffic from 
> my host (only a tcp nat
> matched), which I have not seen before.  From the matching connection I 
> have however seen only those
> packets, having the SYN-flag set.
>
>
>> Unlike iptables, the design of nftables is such that all Netfilter hooks must be explicitly
>> defined by the ruleset. Consequently, it exposes some of the rougher edges of Netfilter to the
>> user. In particular, not all hook type and priority combinations necessarily make sense in
>> practice. This is compounded by the matter of the nft(8) man page having tended towards
>> under-documenting such nuances, though it has gotten a little better as of the most recent release.
>
> I think, that I have fully understood this fact. That is the reason, 
> why I wish to setup a tracing
> template, which covers explicitly all possible hooks, so I can adapt 
> that later, to diagnose
> whatever needs to be checked.

It's not clear that you understand that the value of nftrace doesn't quietly reset itself to 0 between hooks, however.

>
>> During the time in which I was learning nftables, I found it useful to consider iptables as a
>> point of reference. For instance, iptables has a built-in raw table and a built-in PREROUTING
>> chain. One may use iptables-nft to infer how its hook is set up, in a manner whereby it is rendered explicit.
>
> That is one thing, I strictly try to avoid.  I have seen, that I can do 
> a lot of stuff with
> iptables-translate, but I will explicitly not migrate old 
> iptables-stuff, which comes in my case
> already from migrations from old ipchains and ipfwadm times. So my test 
> system has no iptables stuff
> installed.
> So I like very much the feature, that I can just delete a complete 
> table with all chains and rules
> included in just one line.  Iptables-translate generates still a whole 
> bunch of delete statements.
> I see here a big advantage, as I can put all stuff for a single service 
> in one table, as long, as
> they belong to the same family (inet, netdev, bridge, arp).  So I can 
> manage things really
> separated, not messing up the whole concatenating monster.

You are free to do as you please. The point is that it's the same old Netfilter hooking system underneath. The hook types and priority levels associated with the built-in iptables tables and chains were chosen by its developers with good reason. Whether you choose to believe it or not, there is much that can be learned from this. For example, a prerouting hook with a priority level of -300 is useful in nftables for precisely the same reason that it is useful in iptables, the difference being that the iptables man page does a better job of explaining why it is useful, albeit at a more abstract level. Indeed, the nftables man page didn't even try to explain why that particular choice of priority level has the effect that it does until recently.

>
> So I just can summarize my currently most important open questions:
>
> 1) How is inet traffic flowing from application to application? Where 
> is the hidden way from
> postrouting to prerouting? It must somehow leave netfilter, as packets 
> are reappearing with a new
> trace id?

A packet is transmitted over the loopback interface then a packet is received at the loopback interface. Locally generated packets are routed over the loopback interface for all locally owned destination addresses, not only 127.0.0.0/8 and ::1. Otherwise, the fact that the loopback interface is involved isn't of any particular significance.

>
> 2) Why nat traces need a trigger through a succesful nat connection, to 
> start working? Is my
> observation right, that tcp-wise only SYN-packets pass the nat-hooks?

The previously offered wiki link attempts to explain this, though the wording could be improved. The following two bullet points have been lifted from the article in question.

- The first packet of a flow is used to look up for a matching rule which sets up the NAT binding for this flow. This also manipulates this first packet accordingly.

- No rule lookup happens for follow up packets in the flow: the NAT engine uses the NAT binding information already set up by the first packet to perform the packet manipulation.

The "information" in question is stored by the conntrack table, whose contents can be inspected with - and monitored by - the conntrack(8) utility from conntrack-tools. The overwhelming majority of Linux distributions activate the conntrack subsystem at the point that any ruleset is loaded containing at least one rule pertaining to conntrack state, thereby causing for the applicable kernel modules to be dynamically loaded. Typically, that would be a NAT rule or a rule that tries to match on ctstate. One activated, the conntrack state machine continues to perform its duties until such time as the kernel modules are unloaded, even in the case of an empty ruleset.

A TCP packet with the SYN flag set is something that might create a new entry in the conntrack table. As such, it is to be expected that it may be intercepted by a nat hook, whereas subsequent packets that the conntrack state machine can match against an existing flow won't be. In fact, even an ACK packet can create a new TCP flow, unless the value of the "net.netfilter.nf_conntrack_tcp_loose" sysctl is set to 0.

-- 
Kerin Millar
