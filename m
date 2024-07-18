Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277F144D3B
	for <netfilter@vger.kernel.org>; Thu, 18 Jul 2024 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721331890; cv=none; b=V/FixmuXwWyU1ooGB08A6BWnXZ5LToGb8gITBHSfv+Kp8TSt36fKFVpCmA7rEsQjui0vKj7p/7mA3MW91eYIsGXPrXEhk6728YrMnI6Jmn5NaYO/rWCoROkc1qHHYhf1VY2MVOOId4F4sPDnUsfOQPJ8IMH9U9JoJnA9d2Mdltg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721331890; c=relaxed/simple;
	bh=TTiHLqBqKZilxFvs5USFC/lCowGnZMB8NNMXC2TZdto=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=H0oPU4oWe9daogt/tExDnyVuespsRuLbpO9YE90zUmszXO5C+iv61n1BMHi1ww5l9CFTKyaKb0ppkWCe44X6cuo79Gp0PliBUCn2c19gsehQeoYUn0tDKgCm/ugHNsd/jhEA0OOr/C1r4kzm40U9Yo1P1WxHYRtFuFa2rizknqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev-mail.net; spf=pass smtp.mailfrom=dev-mail.net; dkim=pass (2048-bit key) header.d=dev-mail.net header.i=@dev-mail.net header.b=qrnkn+f6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vZT9hCii; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev-mail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev-mail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dev-mail.net header.i=@dev-mail.net header.b="qrnkn+f6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vZT9hCii"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4A57A1140176
	for <netfilter@vger.kernel.org>; Thu, 18 Jul 2024 15:44:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 18 Jul 2024 15:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev-mail.net; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
	:subject:subject:to:to; s=fm2; t=1721331887; x=1721418287; bh=hN
	x55jIHuoVtglJPQf9NfBeRWs7nIVslnwk9rp3EGWg=; b=qrnkn+f6IRVSbF2EZb
	Prql1g2bwVsgUinYTHjzU7eqHdQksXEc3tr+5hvQBjmGFMxSRn3DmwKjx7OmO7So
	pL+1prX2lO3O2gFDowBxS2znlP7aTAgvPRzuk7FUTZLTeTJofPbIQRKvsEw5JYZ8
	U1BEhhEgdTetD5aKl1JBTy9zZLl+8emYc++KZz68MRQd24Vq8TgBcvTVW51s/5+w
	UYUJomwqkJmdStBHLa+YE8+J8bbJReikfy/TLvzD1anACkgS+5FA8K306qU4IY9b
	gKlgpemmBT3yYvbyhCiw8ktviVzHKx2s5M7GAUs1ayUEhU3YRPIqqizX8Jdo7fQA
	tPAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1721331887; x=1721418287; bh=hNx55jIHuoVtg
	lJPQf9NfBeRWs7nIVslnwk9rp3EGWg=; b=vZT9hCiiAbcdno/qXygfkdEFa0XUO
	gAZcre8vofDtt9dH6/0CCnsBk+f874Nuo27vYoSpxUTaueCE5WYz3COMdGHbHVNC
	lUC3toFdW0f7BEeKesgnkYyFIMWrkEtPStDkDQrKEJEJHIx1HLn8kglLnTp+B5RO
	XxAaZtd9CQeI+G4L0L8TJ36ltuNQA6FSPWH+68mgKwWj/swr/C55WjKVLcivOPD/
	LU5vLVHh9sI+CqrQ70coR0WJ+aBsOTDkKcJvGi3CaaQ+v16ENNkrBrp+yM23YAtL
	NMyfplh1VF+gNlt+KzTkcGynplfNcSTGEevuzeUq7/wxhNyBRGzG6h8uw==
X-ME-Sender: <xms:rnCZZidmV3hvVInW778Ps5mfTzDrvtPIDELoP688wuJOGkNsZjD4kA>
    <xme:rnCZZsOk5wi_Bf1MOw0pI4-j-GJ9LsW1umrUqjGv4tKJPu_756oQu42Af8zxKLacs
    _OrD75Y8gutKIHE>
X-ME-Received: <xmr:rnCZZjixzN0xS5Lxfi69342Raej1bfdrDP-q4j6X9lJ1LcPn57X04XDVr1myVEGdgW5N-0nP-2np63XzjIPOeIPuCEv7-wonfBDgww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeelgddufeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfghrhffvufgtgfesthejre
    dttddvjeenucfhrhhomhepphhgnhguuceophhgnhguseguvghvqdhmrghilhdrnhgvtheq
    necuggftrfgrthhtvghrnhephfdtjeelveevudegieejhfejleehhfeltdeuhefhieekje
    ekieffteejgfdvueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepphhgnhguseguvghvqdhmrghilhdrnhgvth
X-ME-Proxy: <xmx:rnCZZv8w44tKZqq2QjlVrtlB_8faN5IQSxk67iXZVfoFLc60Ij04Ww>
    <xmx:rnCZZuu6GDea8VzqOVQjfXV9PST-LMXMv-kjId5lMAo5IpXjxvUtag>
    <xmx:rnCZZmFUAUkGz_XzkMfqGZ_4Pn9ER44z33uCcnN37r4w33wExiPvxQ>
    <xmx:rnCZZtOkaaEpZ9wsRSLLkcx3hUq7gs9IKzvV2cdJxHFVVLe0RtaGYQ>
    <xmx:r3CZZgLbbaAGWRI6q3Sa9n2Dc3hGSUiDO8y2xe6323nZCfIrP2VQmVxR>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <netfilter@vger.kernel.org>; Thu, 18 Jul 2024 15:44:45 -0400 (EDT)
Message-ID: <374dc2fb-f3e1-4599-a46f-524fd894ee32@dev-mail.net>
Date: Thu, 18 Jul 2024 15:44:45 -0400
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: pgnd@dev-mail.net
From: pgnd <pgnd@dev-mail.net>
Content-Language: en-US, fr, de-DE, pl, es-ES
To: netfilter@vger.kernel.org
Subject: syntax issues when reducing rules through grouping ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

i've migrated some fw code to nftables, and am cleaning up my sources -- at this point, for my own readability.

i've managed to so far miss any clear writeups on such housekeeping, so using some trial-n-error :-/


when involving marks in nat/mangle chains, what's valid, or not, is a bit fuzzy.

in this sample script

	cat tmp.nft
		#!/usr/sbin/nft -f

		define VPN = "A"
		define LAN = "B"
		define SVR1 = "1.1.1.1"
		define SVR2 = "2.2.2.2"

		table nat {
			chain prerouting {
				type nat hook prerouting priority -150; policy accept;

				# SET1
				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 udp dport 53
				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 tcp dport 53
				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 udp dport 25
				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 tcp dport 465

				# SET2 (This seem a bit tortured, but it's fewer lines ...)
				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 meta l4proto {tcp, udp} th dport 53
				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 tcp dport { 25, 465 }

				# SET3
				meta mark set 0x02 {
24					meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 meta l4proto {tcp, udp} th dport 53
25					meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 tcp dport { 25, 465 }
26				}
27
28			}
29		}


rule group "SETs" 1, 2 & 3 are _intended_ to be functionally equivalent, but simply increasingly "grouped" for convenience/readability (yes, arguable!)


testing, SET1 & SET2 seem OK, but SET3 is clearly unhappy,

	nft -c -f tmp.nft
		tmp.nft:24:4-7: Error: syntax error, unexpected meta
		                        meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 meta l4proto {tcp, udp} th dport 53
		                        ^^^^
		tmp.nft:29:1-1: Error: syntax error, unexpected '}'
		}
		^


what's specifically DISallowed in my SET3 syntax usage?

what'd be the 'most grouped' that SET can validly be?

