Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322BF31282F
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730371; cv=none; b=TIFrGyaEnX3/BVXrYc9LFDLeZSgfnp1hvVj/2kqn+aVQiwekLvXfcVlK7tqeJ2zabnX6bp7xmQa/wxS6UmrMpWSUMMOACckwweGB4KuqqP6FQHhrhoY2F9rNmY+i0P9XJAZjGYmJGeSuL2s6Krm0Zexa2Sdw8yz/Dd0xkcunkiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730371; c=relaxed/simple;
	bh=MRNogqd6d3y2FypYmHRtNBDFonnHalUL5Mtg/cUCr0U=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qUpriZCahy3ZiEhLxfRctH36z9bigEXfox05dR2eaTqANQ4JpOQs1xs1VJrhO0AV/xXw7VuNVxrEidSjPbguXQwgTuk1VLTJPt5atl9fvX5DG89+0nHKKimqSLrIWjQdDy2Y2Po335I1z1LFz3xSbcz/qE3Kgq/QyztnrZ1dmx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ctQ1UNbu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kxyJ6tWM; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ctQ1UNbu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kxyJ6tWM"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 98F861D0008B;
	Wed, 17 Jun 2026 17:06:09 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 17 Jun 2026 17:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781730369;
	 x=1781816769; bh=b/4+lbdy4RRCn8Pr0XkgVynzAv3rXh674JIkCGTLIsA=; b=
	ctQ1UNbuC2XrTyWiACFEUA/G33atsTSDe3eMtnWkDydHe8OMnGI+ZM3NXNtVY/vT
	Nu7zDcPSejdssf2VECatnm9f8+UFEFcNhaa/D7ZEqSBybjaX4icffYUygIz6YdKM
	oyWo3m5W2jpoZUzQm4NPxFjVmntD7Px5XZr0Zm7iQqesjM2qVgWRK5gFwGD76eOP
	HIskHvvca2KRtn67QUOphNWuBunpcjkTqAeGOkb9biZfePqqz0XiSxZXMI0LOmx4
	RY/2xVUZklKrTIG0HUC767bI0lT/qB/9pdDd58fCRNu2wdDyTf1qIysb6QyLh0Q3
	nYxqAx5lMypIM8gK/2/3gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781730369; x=1781816769; bh=b
	/4+lbdy4RRCn8Pr0XkgVynzAv3rXh674JIkCGTLIsA=; b=kxyJ6tWMMM0oTJr96
	t9TLc0sBuEzO+B9RqqxZlpJEnCactu1Qn/T1iOoV9jr68k6VfWv3sbjt0BIt+XlV
	cS3U0AhGUadjVkcybmSG7FGsj/8Tm+66BEh+h1EZXOWCzBMSJcdbVz37lUxIaJ05
	WVobcNZXOqSuuWNOX6AT0dbyYR1PspbYwxec3C63eblykKVDpkDbCZXL+S7JQWvC
	a1RXm7WXQGvJgEsel6hrcMPynz9pieK/d4cJddnOrE7zXDi39GgJy+rnfgL9qHqD
	RMyceFj3MnKXM8Jp6BVPLzxG4LswLQXtEwIb9BWdft9A7d/M53YmEi+mY2DtKsqf
	/fcXQ==
X-ME-Sender: <xms:QQwzanRlHAi2mdbmdWWB4hnk-5wr8cbuib-hEBZqfdr63_hp2T-VMQ>
    <xme:QQwzajk-vPEBQIPY0OUBONMlZ7vGdY9g_SzixlSBtMGvWugckPpNVqMkz4kjT_P5K
    7YZXCqWF7fLfaom9kCQrqEWTVS6zKAXeLtkwLkwvYJVCGebV02J>
X-ME-Proxy-Cause: dmFkZTGFMbOyEPnbwRoXZxodrlC5keKgNEwq6XRTF9sp84YDDntZueBLJvTboOYoA5O4Y9
    ZAsQXshEqq1+wL+vfr3agStl/NAU0zm1x0ZEgkS2qGWC9T341AFFyi0RlALe4yj8GFXLEg
    p50pWgXGj1xMOaYm4AHHgShu8ug/qeW5a8RZelmns/bp+IHIMVTwUUnMcPF7rWh6fnOCfv
    jqiDFif6qDuzvZTVgRNVdrW4Mp4bP1Pcg3mJfdsyg0i1GiFlPcmZEb6tEuH36RaZ3gt6Dj
    O7eeLF85/JbWFVFidwWEii1iNKwq9H4yHK1us5PZE3hEdUdk2ojRPUBLPgLNXN+8g45Kqh
    T124VJLuha8xIT9T2N6WFnhdcQGjhasq5RvbeEoaQaTiHuRomNzfv6ut+jv7cRQBeutucD
    LpiwbwXLHFAucpoqaIPRIyx4WkENZVKBFm/uY5j9KTjW+M9ICaSwVqyH8iTOh8puIq6W4o
    68uj9lVdbzhY/iYdsebptrbbGMCclUDxdYdEfddX7WZJjnKd1cKm1Z+Yp/Sc2ajLPyCd7F
    TSkjeIm5V+QcFL+41WO293cJgQPGPvGEre/WHksTcT8Li22oMrnkHQNZc7rTUJ8W25TYOC
    wfJfnWNPx4tLPvO1zkYL6VgYjcBZ1y9nu04avrJ3VzB0QY58lrA9MvEGuFtg
X-ME-Proxy: <xmx:QQwzap8R27tZbNTaPLzncZXtaF-2738BRGiDcUnTYoBtfNBx60z8lQ>
    <xmx:QQwzarqjiRbunvny8UaFe1Tgoe7BkbKY2ekyxHXzhqOicm4B3opthQ>
    <xmx:QQwzaulP8mYAtIkU4aAfRSD7n5zVZw5uZA4spQSYqif20UwLy6seDg>
    <xmx:QQwzaqJHW9-7ZOZAYoB8ESPlxxBSV2qszTm5ZeXDd-ifHCp4bRX7BA>
    <xmx:QQwzan9JhgbobIVmyq2sQjp35h8b4WgXGB0jJasyzgkys9nVd3VW-mg_>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 051492160098; Wed, 17 Jun 2026 17:06:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhuJ1KYLFSEJ
Date: Wed, 17 Jun 2026 22:05:48 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Tomas Mudrunka" <mudrunka@spoje.net>, netfilter@vger.kernel.org
Message-Id: <4b39fd25-7829-4544-a506-23386ddd1457@app.fastmail.com>
In-Reply-To: <b1e1c08ec510f963bafff40065e8f8c2@spoje.net>
References: <b1e1c08ec510f963bafff40065e8f8c2@spoje.net>
Subject: Re: Using NFT for dynamic per-packet traffic load balancing
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 14 Apr 2026, at 5:11 PM, Tomas Mudrunka wrote:
> Hello
> I was experimenting with using NFT to balance traffic between several 
> links, this is what i came up with:
>
> table bridge balancer {
>      chain egress_forward {
>          type filter hook forward priority filter; policy accept;
>          meta ibrname br0 drop;
>      }
> }
>
> table netdev balancer {
>      map dispatch_map {
>          typeof numgen random mod 100 : oif
>          flags interval
>          elements = {
>              0-9   : "eth0",
>              10-29 : "eth1",
>              30-99 : "eth2",
>          }
>      }
>
>      chain br_egress {
>          type filter hook egress device br0 priority filter; policy drop;
>          fwd to numgen random mod 100 map @dispatch_map
>      }
> }
>
>
> You create bridge br0 with eth0-eth2 interfaces in it.
> There is a map that sets weights of how much traffic should be directed 
> to individual links, so you can fully use multiple links even when the 
> bandwidth is not equal.
> For wireless links you can even get signal quality feedback from radio 
> hardware and live tune the map based on it. Tried up to 10 times a 
> second without any issues using following command:
>
> echo 'flush map netdev balancer dispatch_map; add element netdev 
> balancer dispatch_map { 0-32 : "eth0", 33-66 : "eth1", 67-99 : "eth2" }' 
> | sudo nft -f -
>
> Being able to dynamicaly fine tune this map from userspace in realtime 
> is killer-feature of this approach and cannot be achieved by regular 
> linux interface bonding (link aggregation). While it is very important 
> for me, i agree this is quite niche requirement.
>
> The nft ruleset prevents bridge from actualy forwarding between ports, 
> so each frame is sent only via single randomly selected interface. 
> Received packets are not forwarded anywhere except for local ip stack.
>
> I know this setup is still quite rough, but i wonder if there is 
> something that can be improved. It seems to be really interresting 
> topic.

It is interesting. What makes it rough is that it is an implementation of per-packet load balancing. It might work well enough for many short-lived TCP flows in aggregate, or traffic that is tolerant to reordering (various UDP-based protocols). Otherwise, it might under-perform.

Given that, I would suggest keeping an eye on your reordering/retransmit stats with ss -ti.

>
> Maybe i don't like using "fwd to" and should just drop frames on all 
> interfaces except for one. because right now i cannot see egress frames 
> on br0 using wireshark, only ingress.

Even so, the use of "fwd to" is probably for the best.

>
> Maybe i can ditch bridge completely and use dummy interface instead? I 
> am not sure what is cleanest way. i want to be able to use wireshark to 
> see all frames going through the load balancing on single interface, 
> which is not really happening right now. but i can observe individual 
> interfaces, which is not as useful, but allowed me to verify the 
> ballancing works properly and follows weight ratio defined in the map.

A dummy interface wouldn't pair with "fwd to". If you wish to dispense with the bridging aspect, a netdev ingress hook might work.

You could make use of counters in order to track the distribution.

meta mark set numgen random mod 100
meta mark 0-9   counter fwd to "eth0"
meta mark 10-29 counter fwd to "eth1"
meta mark 30-99 counter fwd to "eth2"

-- 
Kerin Millar
