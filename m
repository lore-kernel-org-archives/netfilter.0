Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B739AF6
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 22:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706739020; cv=none; b=qj8hWK3bcFEc3D/EOBCDm2U3cSn1XDO/DmLCcDqluHLVx/rTYoGFmRi9cORsA4wnouMTkLqP1K1lnRRgPY/AoWCcWFi+kwqK3xeV6FO7EHw5yc0e38MwYodikRxfki6SZEShNKL+fEehp66EOOfEXReoTASDJ4+i6QGa3veMCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706739020; c=relaxed/simple;
	bh=lS6G9x/Ajw99C2Fpz7TbEKnRnwtElY61pY6sw+Gfkwk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lxl2suRuZJJ3nm0K8qbuwSphQDvZinx3j0l0DvvgvD0Xv1lBrxYYf/E8rFEV1lBmEyZYRH7D11L9Da79fRwlHDACI6R2y4lijP4xVFgF7WC9QH9Wtx+POmxvgrLlGKC8c6z4O3OmfN3ZhQi1mbTg9KxqrEmVkVgMHSaqAiBxtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=WD5DX4fC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YvPlpxe0; arc=none smtp.client-ip=64.147.123.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="WD5DX4fC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YvPlpxe0"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 620C93200B50;
	Wed, 31 Jan 2024 17:10:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 31 Jan 2024 17:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1706739015; x=1706825415; bh=5FWH3J/bd+H4xwFhGWey3MteIvGzDFKW
	0WhfVunZHmg=; b=WD5DX4fCUdeU9IBwcXz9FZbSbOruO9iT79IGF4Txd36fpe1l
	etL/+o97ZykJhfQTXuHZ1U16lTv1HiZpBC9B8PvvbTNMIOjZqhAMy0okrYEt4OXr
	CyNCBVQBxodFJEOJFvZlKa4hDez6/ie2lPfZvNeP0Eev6KaRUfP1zSvTEwC/+x/O
	sNaWbjSXzK8ws/aOssz62wylsnf2fe9EY5qcD54tGgZMLwnv/ygrCfNvY2r8rMF3
	4/lZVj0t8b27uXaDLi5GhBtklPPC28nNTrgXEVvQ4X8d2eCxNL9d8n0avCZYagtE
	SIxgWgmvdYRpCUHXpExYE/9eeMwP7dCzTyNoGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706739015; x=
	1706825415; bh=5FWH3J/bd+H4xwFhGWey3MteIvGzDFKW0WhfVunZHmg=; b=Y
	vPlpxe0s9FNAntFtd/n8Sf023UxyddAzw8mKc5I595XNe8ucOnfb9TtsqhXl6F7n
	tlzWIab22dpitsIA+9z95oocZx9bDeegxPSim2yg2o3L7z7bM0mlGtGmWWRb7iAD
	ffOLlUVC9u1J5ltZ25JiY4zwVwEPqp6cCxvYDKv4nhuOxxoSCE9kTK05Jfk3X0du
	vHSyywS9ERT1Q5NUGnHkch6R+ygef+8v4gzGxqqHqCngBPOE6U3GYSNODAJy82av
	mgSHq79cRcWYMpqGzQvDX5+ASBv8cAaf+SoHTy28PWyUw1GyklzAQ/FZVDqvi0TV
	k7zrVy72Zl5H1gyZaZ91A==
X-ME-Sender: <xms:R8W6ZRz_tFf-9sGpf05Jj_nL6zIZ_ZEaLNPAZ4C3IS063GIQ0vYQIQ>
    <xme:R8W6ZRTjCbMRX2vTBm2j5zvPlIJB_T17ANYy-naF2RD-KOyRCtiHx_tTMjQEsTzQp
    VSRfbhUMn7rW96I>
X-ME-Received: <xmr:R8W6ZbX_CcMz0ngzFJ_9TthMMfD9zcJI-tju3WVB_4XjiU1cGEdF-oFaHFn83vHdY1eeYgPoPS_2SAhpK5YT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtledgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfgjfhfogggtgfesthekredtjfdtjeenucfhrhhomhepmfgv
    rhhinhcuofhilhhlrghruceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepudeukeehfffhveeitdeiteeugedvfeeivefhleefjeelteelteevhfel
    udefleelnecuffhomhgrihhnpehnvghtfhhilhhtvghrrdhorhhgpdhvrghlghhrihhnug
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:R8W6ZTjqvfxmuM7QwHNkE4-AGYBd7X7GczEn-sy6QTS4pjId5OizOw>
    <xmx:R8W6ZTDOLvW6ur3p4q4nmhKDAqZPRpxlt7fhT5288MEDGJw1OfB2pw>
    <xmx:R8W6ZcKGU6cmO0ZeWSm18H4_aaW2aqGSv5x8e9AoHmAc4VfELL8klA>
    <xmx:R8W6ZY4EY0aSpZ2Hk3oFdJDlGZY-YuDqJs34u8wbtHkOCXejMQMVCQ>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Jan 2024 17:10:14 -0500 (EST)
Date: Wed, 31 Jan 2024 22:10:12 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>
Cc: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-Id: <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
In-Reply-To: <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
	<e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
	<Zbj04V-90zpQwEzl@torres.zugschlus.de>
	<cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
	<Zbom4bTPnkTMbLNE@torres.zugschlus.de>
	<5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
	<83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slavko,

On Wed, 31 Jan 2024 20:23:54 +0000
Slavko <linux@slavino.sk> wrote:

> Dňa 31. januára 2024 13:02:57 UTC používateľ Kerin Millar <kfm@plushkava.net> napísal:
> 
> >Firstly, I mentioned both tables and the "inet" family. If you search for inet in the man page, you should land in the ADDRESS FAMILY section, which indicates that the purpose of an address family is to define the type of packets that can be processed. It goes on to say that "all nftables objects exist in address family specific namespaces, therefore all identifiers include an address family".
> 
> I check manpage now, 1.0.6 (as is in debian bookworm) and from its
> ADDRESS FAMILY section is nor clean (at least for me) the order of
> inet and ip/ip6 tables processing. It is even not clearly stated here,
> that packet will be processed in both, the inet and the ip/ip6.

I think that the effect of "inet" family is to register hooks - if any - for both the ip and ip6 families. Yet, even knowing that doesn't help to address the question.

> 
> I know, that hook's priority comes into play, it is worth to mention,
> if here are hooks with the same priority in both (as inet and ip/ip6)
> the order is ... or order is not defined.

Yes, it should be made clear - even if only to explicitly say that the behaviour is undefined (it would be better than nothing).

> 
> >>> table inet filter {
> >>>         set block4 {
> >>>                 type ipv4_addr
> >>>         }
> >>>         set block6 {
> >>>                 type ipv6_addr
> >>>         }
> >>>         chain INPUT {
> >>>                 type filter hook input priority filter; policy accept
> >>>                 ip saddr @block4 drop
> >>>                 ip6 saddr @block6 drop
> >>>         }
> >>> }
> 
> This can be OK with two sets, as it really doesn't matter if you have
> one ot two rules/sets. But when you start to really use them and you
> need eg. 10 sets, you have to define every twice, things become
> more complicated...
> 
> When i start to play with these sets i was too constrained by iptables's
> approach by that, that every iptables's table becomed separate
> nftables table, thus one cannot share common sets between eg. raw
> and filter tables. It took some time to realize, that i need to switch my
> mind and that i can define "raw" and "filter" hooks in one table and thus
> share the same set in both (eg. fill content in filter and drop in raw).

This has also annoyed me on several occasions. Though I have been using nftables for a fairly long time, I still find it more natural to organise rulesets based on the conventions of iptables. Old habits die hard, as the saying goes. Incidentally, there is an open bug concerning this.

https://bugzilla.netfilter.org/show_bug.cgi?id=1472

> 
> Second thing which took time to understand was, why in hell i need
> as many sets. After some time i realized, that it is price for flexibility.
> In iptables many extensions uses some storage (recent, limit,
> hashlimit, connlimit) and these storages are managed by extension
> itself, and user needs only to setup its name or even nothing (for
> limit). In nftables world one can use sets to achieve the same result,
> but have to create sets/storage by self, but can customize them in
> simple way (without change kernel module options) and that is
> great.
> 
> But if one use these features intensive, all sets and rules must
> be twiced in inet table (exactly as in separated ip/ip6 tables), the
> amount of sets increases significantly. Yes, these "sets" was twiced
> in ip(6)tables too, but that was "hidden" in extension code, now the
> inet table exposes that twicing. And as amount of sets increases,
> listing them becomes more and more not user friendly, as one can
> list either all table's sets or one concrete set, nothing in between.

All of this is true.

> 
> BTW, i am curious, how big difference (in performance/time) is to
> search IPv4 vs. IPv6 address in set? Is it worth to consider?

I do not know but I would expect a lookup to be very efficient in both cases.

> 
> I start to more and more think, that using of inet family (as in current
> state) is good only for simple/basic FWs, without any advanced
> features, where are L3 addresses used only to static distingushing
> of access or where rulesets are maintained by some external tool
> (in separate tables).
> 
> From my point of view, integration of sets created impressive
> features in nftables, but in result they are too constrained (in L3
> mean), by the same way as they was in iptables, or even worse,
> as now ipset allow to use combined sets and add/update it from
> the same name (thus rule too) in both, the iptables and ip6tables
> (yes, as mentioned already, that is not possible from command
> line -- yet?).
> 
> Another thing, which is not clean for me, is memory usage of sets.
> I read on multiple places about huge memory usage with big sets,
> but nowhere i found real comparison. Nor in memory usage, nor in
> performance of nftables's sets vs. ipset sets. Now i don't know
> if these memory problems was in early stage of sets development
> (and are solved now), or they was caused by suboptimal usage of
> tools, or it is by design. Recently i noticed in docs, that there is
> memory/performance switch for sets, but what that means in
> real usage? Again, no benchmark is documented, to one can
> properly decide which one to use. Or, at least, commands/way
> how to measure difference by self...

I haven't paid much attention to memory usage. Benchmarking performance is fairly straightforward with the use of the shell, especially bash because it offers some useful features such as:

- a time builtin that can measure arbitrarily complex commands (not only "SIMPLE COMMANDS" as defined by the manual)
- C-style for loops: for ((i = 0; i < 1000; i++)); do ...; done
- a printf builtin that can print timestamps without the need for an external utility

As concerns timestamps, bash >=5.0 can even produce timestamps with microsecond resolution.

$ printf '%(%F %T)T.%s\n' -1 "${EPOCHREALTIME: -6}"
2024-01-31 22:01:42.286354

You might find it interesting to look at existing issues concerning the use of sets by visiting the following link.

https://bugzilla.netfilter.org/showdependencytree.cgi?id=1461&hide_resolved=0

Of those, #1584 concerns "high memory requirements", where Pablo appears to be using https://valgrind.org/docs/manual/ms-manual.html to profile memory usage.

-- 
Kerin Millar
