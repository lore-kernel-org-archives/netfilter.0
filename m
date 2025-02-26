Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A542755E3
	for <netfilter@vger.kernel.org>; Wed, 26 Feb 2025 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602480; cv=none; b=AL+7/Q1Va10uAJPCB0GSevGTmqLm+RFHxH2hTF/hLeWpdoaVUx0d87Pl+4Q39Cj4hs6z34wM2xkbl/rxX6Gg0IER4j+hNmiq1whNlofA87/xCnl744kJn9rgOE5SIVZSLtSh+GDsPYH1776VD3IzoyWQPrC9Ad8X9X7vLCSvb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602480; c=relaxed/simple;
	bh=P7wlInnTuli9q1+KTPmpexbIF6am5YtQg9y/Z8B76zc=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=NEwYT20/LejYe1a6RJrunX6qDIL3hug1LyIl4nj1CNHGaBKYwpYF6+NBoN/aUlxC5C4AV8Q1FfIlNNypsfI6CpU4udA4pM4Mz4YDtGu3RDZB3qIx4/+Qi+4V9I8k2ajhCQFFPZb4rnlehCa1fslKsuU/axX/cEql25grrfXy/HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arroyo.cc; spf=pass smtp.mailfrom=arroyo.cc; dkim=pass (2048-bit key) header.d=arroyo.cc header.i=@arroyo.cc header.b=RXyZKX3r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g4Cb5hJb; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arroyo.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arroyo.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arroyo.cc header.i=@arroyo.cc header.b="RXyZKX3r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g4Cb5hJb"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7BD4B25400BD
	for <netfilter@vger.kernel.org>; Wed, 26 Feb 2025 15:41:16 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-07.internal (MEProxy); Wed, 26 Feb 2025 15:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arroyo.cc; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1740602476; x=1740688876; bh=HicfR7svdd
	P2SLfHVswrTy0Mdri2yN6P0bXLQjpSelI=; b=RXyZKX3rg2BMsiKI/zfqc6OIF0
	2oND3yKwtihURQu87++wJ0KTzewpJo4w4H2lDVTD5O5Rc8C/wRZsWjeG04a5+WCz
	oyIAJRfFE1WxXHb9PmRWNecfoefXDGTdBFy9eD5uAT0JHLcLi0jDyHoMw5gJ5hyq
	H6vzJzWvOtS46AiSBa9lcuPnymk0LZUQ/QLxk0rr+FGi/nUue0Y9UfMSRsgbpT/7
	ZZiKwjCcJAdo6ASuLj80ryev+kVVaVAUVNhL/YFZt33Lx/P+ZY/B0z9+qDQuGCUS
	stsnvN+t0qGY9P2DIDw2D1PsM/u+KkqpBQ9mUFDStYSYFU8pIvqja/nuXWKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740602476; x=1740688876; bh=HicfR7svddP2SLfHVswrTy0Mdri2yN6P0bX
	LQjpSelI=; b=g4Cb5hJbrOT1ivyN47AOeEtIl8lcyvMxVo/82f7jlX0Ohnwc0F/
	vjippAEQwCSQtBxJARArfaUtk+7lG2VJKsw4RyRXQRd9j8MSzVHYGhIimRVXW4CY
	QMk20nGcKTkltyPz6YOqrXA8zq0ImP/kaC90WtE7kqd0CW3BUtRRBmAN6jBI7KWp
	mKYA9nKz3gy7EcPX6zS1MkvYwBkcG8IR+bt8DmOdw7HbbB17a/zbiweJQdQY38ZD
	p9tD1/1koN+qnbgDVE0MsvgwwjaZOi5/LuJ6b2afi3/5y1MgnFIXFpDiCwiJk/jc
	iE56KNU6ILgKeHfvusDX9KpD70OUXCVlC7A==
X-ME-Sender: <xms:bHy_ZxKu_rU6T9lJ2_JCnMrMlmLXerRTBbSFtFQ2bkCrksTgMhZZSA>
    <xme:bHy_Z9JlYqogeVCj7zvg2mB3h0RR_UAnLnQnuMnL7YneWcPyIMlb5a_q1jF5WLKIk
    oVh5e22cLwIUDMDNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekheehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    ejmdenucfjughrpefoggffhffvkffutgfgsehtjeertdertddtnecuhfhrohhmpedfffgr
    vhhiugcutehrrhhohihofdcuoegurghvihgusegrrhhrohihohdrtggtqeenucggtffrrg
    htthgvrhhnpeekgeejveeiteevudfgleeitdehgedvjeehffeguefggfeuieduhfffvdek
    jeetieenucffohhmrghinhepnhhfthgrsghlvghsrdhorhhgpdhsrhdrhhhtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugesrghr
    rhhohihordgttgdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bHy_Z5teWOTW9P0Lr1Ts9ufl5LqCistp7JV28h5wRprWebL5l6X-Hg>
    <xmx:bHy_Zyb2ZoSisUj6wm8Ob29dlcy_8Auf5X4fAztyBKcTrnGuWZ0srA>
    <xmx:bHy_Z4a2SPxlNXd80YwP--Qzj-oE5_M9WqjzSFzYNRgYz9zluF6r1g>
    <xmx:bHy_Z2C3YLehx0su14pNDwPhfH9H1hTDPh_uKWum3Z3-LV61Y0NnHw>
    <xmx:bHy_ZxCU2msckDxMrygFDm6lxq_Ij0_fBKf05YTa7LCQ2nYbhjg6tm6Q>
Feedback-ID: ia0a94750:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 107A218A006B; Wed, 26 Feb 2025 15:41:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 21:40:22 +0100
From: "David Arroyo" <david@arroyo.cc>
To: netfilter@vger.kernel.org
Message-Id: <32148fc2-3cee-42cc-84c3-d96b5b32d197@app.fastmail.com>
Subject: Using netfilter to intercept packets written to an ipvtap device
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I am experimenting with using ipvtap devices for virtual machines &
user-space VPN. I want them to be able to configure their own IP/IPv6
addresses from the network using DHCP, DHCPv6 and SLAAC. IPVlan-based
devices can only receive unicast traffic on the address(es) that are
associated with the interface in the kernel.

I figured I could enable this with a program that snooped DHCP/ICMPv6
packets and configured the addresses it observed interfaces negotiating. I
thought that netfilter queues[1] would be a good way to intercept the
packets I was interested in. However I'm having a bear of a time getting
the client packets (DHCPDISCOVER, nd-router-solicit, etc) that the
VMs write to the tap device.

Here's the the part of my ruleset for SLAAC (full set here[2]):

table inet autoconf {
  chain output {
    type filter hook output priority 0; policy accept;
    counter meta protocol ip6 icmpv6 type { nd-router-solicit } queue;
  }
  chain input {
    type filter hook input priority 0; policy accept;
    counter meta protocol ip6 icmpv6 type { nd-router-advert } queue;
  }
}

And I have a user-space program listening on queue 0 that will configure
link-local addresses on the outdev observed in solicit messages, and
mask those with any prefixes learned in router-advertisements. My program
receives the router adverts (with the physical interface as iif), but not
the solicits.

I've done a lot of tweaking and experimentation, enabling tracing and
such. I can see the packets passing through the "ingress" and "egress"
hooks of the "netdev" family[3]. Here are two example traces of packets I
could use to learn the link-local and global address(es) that the client
is likely to use:

trace id 99f29220 netdev trace egress packet: oif "ipvtap22476" @nh,0,320 0x6000000000203afffe800000000000005e5f67fffefeae20ff020000000000000000000000000001 @th,0,160 0x8800002320000000fe800000000000005e5f67ff
trace id 8a307430 netdev trace ingress packet: iif "ipvtap22476" ether saddr 88:0f:a2:2f:09:60 ether daddr 33:33:00:00:00:01 ip6 saddr fe80::8a0f:a2ff:fe2f:960 ip6 daddr ff02::1 ip6 dscp cs0 ip6 ecn not-ect ip6 hoplimit 255 ip6 flowlabel 0 ip6 nexthdr ipv6-icmp ip6 length 136 icmpv6 type nd-router-advert icmpv6 code no-route icmpv6 parameter-problem 1078460596 @th,64,96 0x30440c0

However, the netdev family does not seem to support queueing to userspace.
All devices are in the same network namespace, so the packets should all
be passing through the same netfilter stack, but I cannot see the outbound
multicast/broadcast DHCP and ICMPv6 packets in any inet family hooks.

I've been plodding through the ipvlan code in the kernel, but it's
slow going. Can anyone help me understand where these packets enter
the kernel and if they pass through any hooks in the ip/ip6 family? Or
alternatively, another way to observe packets written to a tap device
that doesn't involve opening a raw socket for each device.

David

[1]: https://wiki.nftables.org/wiki-nftables/index.php/Queueing_to_userspace
[2]: https://paste.sr.ht/~droyo/afa648300fdd84e41eb083644501d663b56e3477
[3]: https://paste.sr.ht/~droyo/f01f17481efe4f6326a642c8f97dc19662fcf69c
[4]: https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks
