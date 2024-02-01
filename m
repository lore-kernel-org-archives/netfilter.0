Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32B6AD9
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706819694; cv=none; b=MnexNa17kjsPNT0c91k8cU1PPLWY8ZgCf0tBKxx35OHnp2z0dOjHcRScMElN0ozoxxp04C1vXNHSzPaB1KganjSI8brNIKgtxOKmLno4n73lmYuUYHNnIt3oyCuDSPzqLoZbZ156wbH4CfLaXRxnbm/CsVCY3Sf2awowDdk8/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706819694; c=relaxed/simple;
	bh=FX2lPkp/yi3q8rK+3o0fjd9jL+UPO/d9IcOWDyX/A0k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oDly2hJ7IhfmsIiaH2gggbklV5K8LVLIKp4B2ijtNH96zrKcTNV7A0/w5F7MdLt0CbsJjWE4ynUHG2rpgl2IrmfyiEl76WczkyKpWiTR9f25wPBMfUXxsSRyfVpeKzEwRl29S6O5rH8+CjZel9xMaNNuFOO6alcMqlBVzo/paYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=iFP5yUS5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qCDgYSXY; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="iFP5yUS5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qCDgYSXY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BDBD05C0216;
	Thu,  1 Feb 2024 15:34:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 01 Feb 2024 15:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1706819691; x=1706906091; bh=8I7UXtQh33a3QMgMekJuzY0yf54P9U6Y
	DO5tRTgRdgM=; b=iFP5yUS5ku+AIYIlZgzUg3j2MRC5ypDch9zlyUqCBw4epnNK
	STviyzHGl0QXffM1pOZCiqnqqwLfW1iyVWeRH68fwrmb/Rr+sLzYByFYWoLcIvm2
	DhLpisZQIiIXGjnMqCyEUFnQ7dNQLy14WYC5MLn1/jWsyfjKVIIL6xblSk06RdhL
	krmCfe/ZHDWAry7h+enQTNljlflOWGB+4wzN7KOxLymcN0SEypCpoL6Us8ChlhRy
	thnXj3eMqUgg9rYAadVAblA9AX7GGScokVPAmYNUBMPPZxa44FzK0x5s/NJ4k+Kk
	Qwsngt8FKJ3kBrVqMJVsvAeg4N231Bey0VGNfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706819691; x=
	1706906091; bh=8I7UXtQh33a3QMgMekJuzY0yf54P9U6YDO5tRTgRdgM=; b=q
	CDgYSXY07jjBKp9EOtjgy0EOi6etQ8kxxhu4sBE6Ymmm/mEMt7dO9diPx5TTsNzj
	RyrqtHP7PjNxvZVycdIYva2ssr0Nc8Ujk9rLwt3uaTgIszdFjkrcl20hyTYT5cAf
	uAb0gKgxQZFG9E+Dfs6kvP6+CPW7hHKhfz9qPF7kVFnunHp/giHDQWP8Vj331N7/
	5YSbk/1TglwdRXiyIELdnPvaD2z8n5hAcSUhoku01D101BmasWOa8yJnHsmkl3l8
	aATUH7Wjgy+n6bFJ9Er7MFbhKPlOcJ1/gfy4dSzdUpQRUYVB/ftFfjcSg3lPIyTZ
	7WxSshSGyBAYyWhDJHjfQ==
X-ME-Sender: <xms:awC8ZSlJs9idKzRQ8vCgq8OYQ7GnznfEhou8JMVd-EsoVWU0BEQYlw>
    <xme:awC8ZZ0Y05_OMl8WYCykY0X38v345zXxHaMMKhfDLfoGN-FGrF9RU3cySWnUCRMb8
    S28QfeiX9s0Zduo>
X-ME-Received: <xmr:awC8ZQrhGoNeZ1mlPzKixioJaVoue4-FUVv9S8CuB31Of5mPs5iOhh50ljYxk0o0eFmBRMabKy93PsmGlwtx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduuddgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfgjfhfogggtgfesthejredtjfdtvdenucfhrhhomhepmfgv
    rhhinhcuofhilhhlrghruceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepiefhteethfegfeetgfehueegfeefheekudekfeffjeeguedtgeegjedt
    ieehhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:awC8ZWk5vF68nZcAusA4PS6tOLZU7OnnWNmn-4Fi4kyU71MKmdWH-Q>
    <xmx:awC8ZQ2MyKghc-cbjGg4Hu2A-GI7wASAwp_xz_XVFJ87mBnYg17rww>
    <xmx:awC8ZdvrGe4PR59g1PQ7xUxX5cIkvl3EdxNrIK0Hn5CaOXn7FYo97w>
    <xmx:awC8Zd-ob7xVqDPtegb7NoBz6lPtV9V4FH5BHfUhkWZS2bTFIZYbLQ>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Feb 2024 15:34:50 -0500 (EST)
Date: Thu, 1 Feb 2024 20:34:48 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Timo Lindfors <timo.lindfors@iki.fi>
Cc: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Analyzing firewall rules programmatically
Message-Id: <20240201203448.a7b1957192995e4553be546c@plushkava.net>
In-Reply-To: <alpine.DEB.2.20.2401302150460.27550@mail.home>
References: <alpine.DEB.2.20.2401302150460.27550@mail.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jan 2024 22:13:26 +0200 (EET)
Timo Lindfors <timo.lindfors@iki.fi> wrote:

> Hi,
> 
> I spent some time trying to figure out how to programmatically answer 
> questions like "Does the ruleset R allow reaching service listening on port P from 
> interface I?" or "Does the ruleset R1 allow something that ruleset R2 does 
> not allow?".
> 
> I tried to find prior work on this area and was able to find "Verified 
> iptables Firewall Analysis and Verification" [1] that uses 
> the Isabelle proof assistant for iptables rules and "Automated Analysis 
> and Debugging of Network Connectivity Policies" [2, 3] that uses Z3 for 
> some simple Azure firewall ACL rules.
> 
> I could not find anything relevant for netfilter so I began experimenting 
> a bit by writing a python function that tries to simulate nftables 
> behavior given a ruleset and a packet. I used output of "nft --json list 
> ruleset" to and soon noticed that it doesn't quite contain all the 
> necessary information for this task.
> 
> For example, the default ufw configuration uses iptables to setup
> 
> Chain ufw-not-local (1 references)
>   pkts bytes target     prot opt in     out     source               destination
>    779 46756 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL
> 
> which shows up as
> 
> $ sudo nft -a list ruleset | grep "handle 247"
>  		fib daddr type local counter packets 772 bytes 46336

Given that the rule is supposed to have been created with iptables-nft, I am surprised that it is presented in that way at all (the line you are showing doesn't match "handle 247" either).

# uname -r; nft -V | head -n1
6.7.2-arch1-2
nftables v1.0.9 (Old Doc Yak #3)
# nft flush ruleset
# iptables-nft -A INPUT -m addrtype --dst-type LOCAL
# nft list ruleset 2>/dev/null | sed -n 4p
		xt match "addrtype" counter packets 8 bytes 778

> 
> in in the "normal" output. However, in the JSON output critical 
> information (mainly "LOCAL") is entirely missing:
> 
> $ sudo nft -a --json list ruleset | jq . | grep -B5 -A19 '"handle": 247'
>      {
>        "rule": {
>          "family": "ip",
>          "table": "filter",
>          "chain": "ufw-not-local",
>          "handle": 247,
>          "expr": [
>            {
>              "xt": {
>                "type": "match",
>                "name": "addrtype"
>              }
>            },
>            {
>              "counter": {
>                "packets": 778,
>                "bytes": 46696
>              }
>            },
>            {
>              "return": null
>            }
>          ]
>        }
>      },
> 
> 
> I understand that ufw is using a compatibility interface. Nevertheless, 

Indeed, the output you are getting is symptomatic of the presence of xtables glue. The output of nft list ruleset won't be round-trip safe.

> I'm in need of a way to analyze firewall configurations of large number of 
> real-world systems programmatically. Can you suggest how I should approach 
> this? I can think of at least the following options:
> 
> 1) Fix the JSON output.

The xtables glue seems so disjoint that I wonder whether it would ever be fixed.

> 
> 2) Ignore the JSON output and try to parse the output of "nft list 
> ruleset".

This would not be reliable either.

> 
> 3) Use JSON output of most of the stuff but fill the gaps by also 
> parsing "nft list ruleset".

Nor this.

> 
> 4) Try to parse the raw netlink traffic seen in "nft --debug=netlink list 
> ruleset".

This doesn't seem very useful either.

# nft --debug=netlink list ruleset 2>/dev/null | head -n3
ip filter INPUT 2
  [ match name addrtype rev 1 ]
  [ counter pkts 287 bytes 59823 ]

> 
> 4) Create separate tools for parsing iptables and netfilter rules and 
> hope that no system mixes these two.

As things stand, this seems more realistic to me. Perhaps one of the developers would have a better idea, though.

-- 
Kerin Millar
