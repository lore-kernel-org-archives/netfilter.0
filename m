Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1915B979
	for <netfilter@vger.kernel.org>; Wed, 29 May 2024 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717021944; cv=none; b=ZNnjLsZ9fR59G3Wb6aTlZI51AuHY1eWOsgu/HB/cY21ziNoMF9DaMnLMzF9oJSPVxmKvrKMvet34dZZoT25ZoMWdWMZCXuL+2101UOd4sY18wQ09R2hUMExVJ7imeuZ2FqikDhf35g6Wce2+s0sUfQpkFPPhpBGgmG/Etz8imLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717021944; c=relaxed/simple;
	bh=nfioGEKgb6Ssh3HTOAHzB+/MxtSMvuRApcFIyDMOYxs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=b0xZNGfq1AmKiFrbMRHxDFIJG2mof2UAKaSDaVclwKeQVzWKH5m4SGUpc/bbtFOez5TTT3sLgi/jfDHoznOCTi0n3b8X3DhsNmI5bK3IkU+ZYbQXcpYuenVhI1PFydYvs8yTtyCdItzg6yljCDYzxBzoFWoZM92dDe8fKR7Yoyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=GUduGlKa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IBP6V+eo; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="GUduGlKa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IBP6V+eo"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id AEF7313800A0;
	Wed, 29 May 2024 18:32:21 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 29 May 2024 18:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1717021941; x=1717108341; bh=sdX3rnJ3Rs
	2cFClJdBeQkHN72WnHTo6jvRV0+dNXkDw=; b=GUduGlKaadYUoeplwTpqN9fhE6
	B6Yj0yo1z4bcMgZDmdTobUwCJRb4cd6aziPXgdwK1tC2U9a4mllP9y18ZaPupJHm
	wJNmNBnkrLPA8+vHU2NSPIClWymbSJjK1i+1t3QycUswpsk6XXFFj6zdacI7Qn1O
	8u4VX06rWHrx754KKGHz4MBlwnWZI2ePkK4fAJzDAzvXj1Tm0Q8xkCvivmYsAv8K
	kae5GlaFJonuIfEnYkQngmDZAGGXW4u31ojman0B6tiUqfBlRAr5l7m2oY9Hj4TG
	va6SdnWf//frgbyOGLjxSTNoV1Xni3CVI6eUvvnAa1HxMKyyxUSdqnGkIaDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717021941; x=1717108341; bh=sdX3rnJ3Rs2cFClJdBeQkHN72WnH
	To6jvRV0+dNXkDw=; b=IBP6V+eohD+9NY10T39tMzVP02KP2Egb8yVDfia1cHwf
	Y6KnlO/JOX2GLDtOplQlV/ZfX5XGbDXHkvQiSzeJXnOdBt0zZYWJ1nLpFFx6WCoo
	TXSniN32paeMXiGHUlMcuAGOto9eeoYA7JMb00eY1Ki64RC8Z+5bzffRhi0xaIWk
	JB1e+QyMy1IKBqCqaXwsDFpt4q5eoT4WMK7H41G+cOW4ZbvPp+/q43VqntMjihy/
	K7r+y99tPIY7nXY8bwqhWfvEg9ZaJNPurlExFdj/gcKS+2LUgbMP+CgRXjqMiMFq
	UIC8vYKCwPE94/z0O0wjilFqecbWPywRWa5TFOUeoQ==
X-ME-Sender: <xms:9axXZnb3-BATBnc5jMk3dp8heyL7FY4O1m7TJhkWHGHJego2RgC5HA>
    <xme:9axXZmZ9E6W-WS6ivwTYsuuWT5fTmrwNN0XwakU3Qe5I8VBo7Pi-XPNHnBILm94Cd
    Sjax3Rp_bSu2R8p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekvddgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedtledtieekheejkeevvedvfe
    dtveeuuddtkeetvedtueeiffetkeelvdefueffleenucffohhmrghinhepnhhfthgrsghl
    vghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:9axXZp9gXtHsJHYkD963rFQoWZHV8SIndfDs9ERWr3yu5yVvpMScHw>
    <xmx:9axXZtppdSlMaS-Wpll43TyqXTVg2jTdbv4yEyR4ESx_E2tnnl1Lsg>
    <xmx:9axXZiqyUwF_C3f3F6Did19Dcp7L1qkSo1Mh_5Df74BstZvh8Ft1MQ>
    <xmx:9axXZjQ0U-6-RnzMwk0iWZD6ISB9OH0wUK9WR0cNkNSg1yAyJ-9_3w>
    <xmx:9axXZnAWuhJWxD2KiYeBJjQgINyeLZottWeym-DQ5DYJS165Iossgwy->
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0DAE21700093; Wed, 29 May 2024 18:32:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <4ac23ef0-13df-4423-b1d5-aa9d5eb5423d@app.fastmail.com>
In-Reply-To: <14110673198.20240529174630@WKraft.org>
References: <14110673198.20240529174630@WKraft.org>
Date: Wed, 29 May 2024 23:31:06 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Wolfgang <netfilter-user@wkraft.org>, netfilter@vger.kernel.org
Subject: Re: Problems understanding nftables part 2
Content-Type: text/plain

On Wed, 29 May 2024, at 4:46 PM, Wolfgang wrote:
> Hello all,
>
> I have asked already some questions about nftables.  While diving 
> deeper into it, there
> are arising more questions.
>
>
> In my last test I have hooked rules into the 5 inet hook filter 
> destinations
> ( prerouting, input, output,postrouting, forward), to watch how packets 
> are flowing to
> my rules. Now I extended that, to see packets also flowing through nat 
> destinations,
> but I have seen no packets.
>
> 1)  It looks like, that it needs at least one configured nat-rule, 
> which gets triggered
>     to see packets flowing through the kernel. It looks like, that 
> without such an initial
>     trigger, trace is either
>     a) not showing packets
>     b) packet flow through nat is enabled only, after a first nat rule 
> matched
>        When I have a matching rule like in example 1, I see packets not 
> only in prerouting,
>        but also in input, output and postrouting, even when the chain 
> contains no nat
>        specific rule. But: For tcp this seems to be valid only for 
> packets with SYN-Flag set,
>        others are not showing up.
>     c) As soon, as I had such a trigger-packet I see however all 
> udp-traffic from the system,
>        I have not seen, before the tcp rule triggered.
>     So I have the question, if there are other options to get trace 
> through nat-hooks enabled
>     without having an initial trigger?
>     Unfortunately the "dnat" option, does not allow to add a "meta 
> nftrace set 1" behind this
>     specific line, so i must trace in a more general way.

I wouldn't consider the nat hook to be an especially useful context in which to enable tracing, partly owing to its semantics.

https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)

Instead, I would recommend using the following hook for tracing packets that arrive.

type filter hook prerouting priority raw; policy accept;

And the following hook for tracing packets that are generated by your host.

type filter hook output priority raw; policy accept;

Going about it in this way should afford you the greatest degree of insight, as regards the traversal of any given packet through your ruleset.

> 2) Prerouting, postrouting and route allow for for symbolic priorities, 
> that seems to be broken
>    for
>    a) input  and
>    b) output
>    where I need to know the corresponding value. What is the reason 
> behind this inconsistent
>    behaviour?

Unlike iptables, the design of nftables is such that all Netfilter hooks must be explicitly defined by the ruleset. Consequently, it exposes some of the rougher edges of Netfilter to the user. In particular, not all hook type and priority combinations necessarily make sense in practice. This is compounded by the matter of the nft(8) man page having tended towards under-documenting such nuances, though it has gotten a little better as of the most recent release.

During the time in which I was learning nftables, I found it useful to consider iptables as a point of reference. For instance, iptables has a built-in raw table and a built-in PREROUTING chain. One may use iptables-nft to infer how its hook is set up, in a manner whereby it is rendered explicit.

# nft flush ruleset
# iptables-nft -t raw -A PREROUTING
# nft list ruleset
table ip raw {
        chain PREROUTING {
                type filter hook prerouting priority raw; policy accept;
                counter
        }
}

The wording of the TABLES section of the iptables(8) man page can thus also be useful as a point of reference. Such a chain is suitable for acting on packets that arrive before any routing decision is made, and before the conntrack table is consulted i.e. even before a nat hook is potentially attended to. These characteristics render it particularly useful for tracing.

-- 
Kerin Millar
