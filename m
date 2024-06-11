Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5F172791
	for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091622; cv=none; b=nH+LBwZGvv8sqnBjrKWlaVPaLLw8n1B1q3OOteiexCwA5bASBoo49CUpIyKalDgWXcWJCbjBilbRnnJFHc96Fqq8xgaAVlk4aZ7vwqEPH9W7C9+P9gjbbf3M9VOyjaQsdWfcCnQeEoj7N1gDRoC5GQK1lJ/LuIkFeZIzc8coNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091622; c=relaxed/simple;
	bh=0GV3FRbWqpdoIDdvGhJjl2DMuUgaaKJQynCvHtejVes=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=YGkEt+nS7yl5nwkFkLXGMwhcc+NeCiP77nIkIk+s4T6fSyTbXnQszKZFwxpffws2tOmqZ9gzDNep9knvADBAvuWOQrxPVIAla+7KuPt1CzrxGIMoOhtK9klbmKREdqG4nl8T0mRUPo4I4lSJcSlM1VRsMymUAhgTjlap/Wd2KN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=NaDbzofV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZyTpVjXH; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="NaDbzofV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZyTpVjXH"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 03C07138020E;
	Tue, 11 Jun 2024 03:40:20 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 11 Jun 2024 03:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1718091619; x=1718178019; bh=O8U6SbAQnu
	diKHCYIJW2cCUzF5np/suoMpJyb011D1Y=; b=NaDbzofVFAu8ZtqEPqQV5E7VKY
	DjknyaZjRtLzIkgc8uFzZ9XX+jjiKErh3pE8D4cEm7z2bpDU+UXIiJAukJ2GpK9h
	u++H9CO8Lu/k95EUoGOgJXC6OTUQMfcAr6cuVFI/kDXGJzqW8X3uDwz34sn2KwFj
	GEPLK62a8eg16aE+YcZ0OXK9mkOGYp6TeLzzWQtbdBFfo5LsimyzEnyxjlY6Y2il
	emwf21u4uwKxuV64D/MJ+MKKXbdi0P66ZPP/XgVXmXaOcmJYBte5fFc8gij6eb5y
	eOIMosZwcL9W4HANnHBAKBZsHsoT9RLrshQBFo8mEsDxUlgAUa7ZStG0MRDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718091619; x=1718178019; bh=O8U6SbAQnudiKHCYIJW2cCUzF5np
	/suoMpJyb011D1Y=; b=ZyTpVjXHFOraKD9NqGPQz0SFY4BmhZime5ApWGfwVVFV
	VswhPcEZf4U53AwFDZtoyI6ix4TTO79WXuv3wNVTWp1nwiBdUyG85LkTbUmaMA6v
	WdG9fGREZVBKDEHYVtqq/E/qQE7RTVwt6JJgbpLgiGdHPmUv8tUtGBHsHexMYZOB
	Zs6pqguRgtPtbnXhS8nhruqV7JBF9bZH93ZPt1dZLSOowu68vrwvMB0Jbv7kcs8A
	vix2jUw4c1itTLh8CjKu0tWiaIDrx4QjtITqx8EIdELDSp784oP42QqAfRGThT+j
	WJj9qpzQjJMlPaD6USwK20w9ij96wr6N6GHjfCI7lg==
X-ME-Sender: <xms:Y_9nZpX_88JMVANj1qSXKYRUwjWnWtqb6tf_Bgx82bMeOdqD9soHnw>
    <xme:Y_9nZpnM1VR2X6Gaf3RuOjI3P5LvbTBs5fSAx_2JP0vJyg-i2suodsPhKA_vGNd_2
    Tc01LGbc7rYVU_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduuddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepkeehfffftefgudeigfekvd
    efudfhhfefhfekffdvvdefkedutdfhffeigeegvdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:Y_9nZlbrRXcIENaydvrER8W2K6v7XhnpGPRazXwuaCGYIepqpA6ugA>
    <xmx:Y_9nZsXjX2Zu5H_uxALGD096rJ2jhtH2QW-eEHlMa93sLZIh3LAEEA>
    <xmx:Y_9nZjm9Vsm7E1VK0Mo7OOtvjN2d3rFLZMPkytcpRtPpVUGvgM_uYw>
    <xmx:Y_9nZpdjYgcKxNxoEabisEkLIeYXDy4ndwXkmcCO6SCTQ95AcbXRwA>
    <xmx:Y_9nZrvCoyJIG7JlWEXc6xn8WLrjez7TfaqVZxJPQpchJJfB86MSa3Ak>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9B6D41700093; Tue, 11 Jun 2024 03:40:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <01f9665e-6962-4903-a185-9de939d826ae@app.fastmail.com>
In-Reply-To: 
 <CACvpvYW6ybpkCcod5uTGXEODG2nByt4FWUK11rf=mGVLuhy9Aw@mail.gmail.com>
References: 
 <CACvpvYW6ybpkCcod5uTGXEODG2nByt4FWUK11rf=mGVLuhy9Aw@mail.gmail.com>
Date: Tue, 11 Jun 2024 08:39:59 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Aleksey Nikapli" <excusemysmile@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Problem with migration from iptables+ipset to nftables
Content-Type: text/plain

On Tue, 11 Jun 2024, at 8:30 AM, Aleksey Nikapli wrote:
> Hi!
>
> I have a question regarding migration from ipset to nftables. I have
> plenty of sets of this kind, containing tcp/udp/icmp:
>
>
> ipset create MYSET hash:ip,port family inet hashsize 1024 maxelem 65536
> ipset add MYSET 172.18.1.11,udp:137
> ipset add MYSET 172.18.1.11,udp:138
> ipset add MYSET 172.18.1.11,tcp:139
> ipset add MYSET 172.18.1.11,tcp:445
> ipset add MYSET 172.18.1.11,icmp:echo-request
>
> and a firewall rule for it:
>
>
> iptables -A FORWARD -s 10.1.20.150/32 -m set --match-set MYSET dst,dst -j ACCEPT
>
> When I translate my set to nftables i get a set like this:
>
>
> add set inet global MYSET { type ipv4_addr . inet_proto .
> inet_service; size 65536; }
> add element inet global MYSET { 172.18.1.11 . udp . 137 }
> add element inet global MYSET { 172.18.1.11 . udp . 138 }
> add element inet global MYSET { 172.18.1.11 . tcp . 139 }
> add element inet global MYSET { 172.18.1.11 . tcp . 445 }
> add element inet global MYSET { 172.18.1.11 . icmp . 2048 }
>
>
> However, I can't use it in nft rule because it requires to select
> protocol (tcp/udp) when selecting dport:
>
> ip saddr . meta l4proto . tcp dport @MYSET accept
>
> Is there a way to translate and use this kind of sets to nftables or
> do i need to create three separate rules (for tcp, udp and icmp
> respectively)?

Write "th dport", which is equivalent to "@th,16,16". Doing so makes sense for TCP and UDP; you will need to define a different set to contain the elements pertaining to the ICMP protocol.

>
>
> Also another question is, is there some kind of list:set set type in
> nftables? So i could make a set of sets and use it in the ruleset as I
> could with iptables+ipset?

There is not.

-- 
Kerin Millar
