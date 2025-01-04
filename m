Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2CB257D
	for <netfilter@vger.kernel.org>; Sat,  4 Jan 2025 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736014829; cv=none; b=Oenk51ZcQ+5V5zQZuRSw/4eP6IPKljKcq+QqbIZooFmIPVyjPXOEV2t3ZDkx7i43dukLUJHI5i2jnOWo9j1y1E8EtkGCGe37wa/Z0VZA1yabUgWuh63uvgxzE0p9vCNWyMq4oT2X6xHXugbbWMlyRH16OUAmKaCqpaBkahu+l2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736014829; c=relaxed/simple;
	bh=hFAPWZSjkl6ilT7VWHa8P6TcE8X5/Dqxwxnhogh0k34=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=r7yn/BlIHkKYKEfFy4L/170ISgM9hQOvWjORP3P09fhRi7AmwGoSBtpDQJ+0QRUnrXdBWTZsw97Z/GOsyLpcElvDU2apKfuH76JW9awaueDwmTfw7tUhLGKS/VLulPeHCx2UaZudmS/56k436g9AdWDzpQ/sgHaCyEIa0hvF/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=BRy4tGCx; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="BRy4tGCx"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1736014613;
	bh=hFAPWZSjkl6ilT7VWHa8P6TcE8X5/Dqxwxnhogh0k34=;
	h=Date:To:From:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
	 Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
	 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	 List-Archive;
	b=BRy4tGCxgeoq2/7vydcd+Ej9s91lHK/ZsP2KNfofgRfy/0kHZb4mFV6c5kTJvto30
	 FqIT1NxpDiaLX49TJy6td2n96phoK9BzNuyhXFwp/j9j9RrVJMkqPYQe+sW305Q2va
	 VWAnprGmYvPx5EVFitDEw8VjQhMNwdT0pDPvcX4j14hk1A7EXSH4hF53/nbzBV3ERw
	 pPv6eEIO+esMZHkHIswdPh88Acxqmfw+qZJAjn/HlmA4N0Phd7ZkR2M9xzVhi1lt5O
	 b2iyThf8AX01/OsQLDKIxQArtBH61/ctbhd8WGcgC1rCa8YcrUjQcqDVWJjVoaRdZ8
	 vpcOUTmwhBkJooo7NLA5N7qsMVuMd84ann2T5kl3axmh5Hwo8npcgAkIwMLm/zQXH7
	 eTPK1Bme689mXZrxnqqv2e1c2nMrLWYaHujphtqX25aMUwig4yO0aczLqu/rf7Yvs5
	 Iu9b9LpEcl5qQbtTfbAOPlltvO3Lj6k+cq5vYfH7iP+VDWi3E+8nXtx1esbH4PUX5z
	 wnVKMaxxEnKkg/dXqDA0CDoZcy6Ea64ACl0h+C9WGG4pXPrwiD5towiTXvlJiZD7PV
	 v77zLc4VlLAzeO1QlYbP8QaIql0pul0wuZK+coLrxpUAJ/ScxrgmCliOYhnGrWEDfJ
	 vxw/y75Ck2njlXOS+tJXPyLE=
Received: from [192.168.20.100] (pd9531926.dip0.t-ipconnect.de [217.83.25.38])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 504IGrQl2521287
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 4 Jan 2025 19:16:53 +0100
Message-ID: <23875ea1-9194-4353-ae54-8811e53984ad@binarus.de>
Date: Sat, 4 Jan 2025 19:16:52 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Content-Language: en-US, de-DE
To: netfilter@vger.kernel.org
From: Binarus <lists@binarus.de>
Subject: General questions about priorities - Clarification appreciated
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear all,

at first a big thanks to the developers for providing the netfilter infrastructure and userland tools.

We're in the process of migrating from iptables to nft, and we would like to do it right. That is, we don't want to use helper scripts or other means that automatically translate our iptables rules to nft syntax. Instead, we would like to create the nft rules from scratch.

Having said this, I guess I've understood the most important concepts. However, I find it very hard to understand how to correctly assign priorities, due to unclear documentation. Therefore I'd very much appreciate if somebody could answer the following questions.

1.

It is not clear to me which priorities are assigned to internal netfilter actions and which priorities we should use for custom chains. Well-known priorities are listed in the wiki here: https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook

This table is worrying. For example, we obviously should use priority 0 for our own filter chains. We can guess this from the fact that hopefully nftables does not apply any filtering unless explicitly told so (i.e., priority 0 should not be assigned to a chain or to an internal process by default) and from the fact that every tutorial we saw so far uses priority 0 for filter chains.

But things are unclear for other priorities. Let's take NF_IP_PRI_CONNTRACK as an example.

 From the NF_IP_PRI_CONNTRACK description in the table: "Connection tracking processes run early in prerouting and output hooks to associate packets with tracked connections." I am understanding this in the sense that an internal process is assigned priority -200. If this understanding is correct, using priority -200 for a custom chain would be a bad idea, because then the custom chain would be at the same priority as that internal processes, and (according to the docs) we cannot predict if a packet first would hit the custom chain or if it first would hit the internal processing. At least, this is true as long as the internal processes use the same hooks as the custom chains (in this case prerouting or output); unfortunately, the documentation does not tell whether or not this is the case.

On the other hand, the table mentions prerouting and output being "typical hooks" for priority -200. This makes the impression that we should use priority -200 for custom prerouting and output chains, and contradicts the statements in the previous paragraph.

Could somebody please explain in detail why typical hooks (and thus, custom chains) should be placed at priorities that are used by (read: reserved for) internal processes, or explain my misunderstanding? Do internal processes use the same hooks as custom chains?

[ Side note: I have noticed the remark below the table which instructs us to use priorities above -200 for nat type chains, but (1) that still leaves the question open for filter and route type chains, and (2) NF_IP_PRI_CONNTRACK was just an example; there are other priorities without such remarks. ]

2.

There seems to be no authoritative reference regarding priorities. Just above the aforementioned table, there is the following sentence: "The following table shows Netfilter priority values, check the nft manpage for reference."

I have read the nft man page on my debian system (bookworm, up-to-date at the time of writing, nftables 1.0.6, kernel 6.1.0) and found that it indeed contains a similar table. But that table is much smaller than the one in the wiki. It contains only six entries (leaving away those for the bridge family) and no "description" column, while the wiki version contains 13 entries and has a "description" column. I have also checked the man page at the project's homepage (https://www.netfilter.org/projects/nftables/manpage.html), but it currently does not provide more information than my local man page.

This again leaves me totally clueless. Which version is true? Have priorities been removed, and the man page is right, or have priorities been added, and the wiki is right? Or are both incomplete?

Is there an authoritative and complete reference about all priorities where custom chains can or should be setup, so that these custom chains do not conflict with any internal processing, i.e., so that these custom chains are never at the same hook with the same priority as internal processes?

[ Side note: As a normal administrator / user, I would like to avoid to read the source code just to be able to setup chains correctly :-) ]

3.

According to the documentation, the bridge family supports only chains of type filter, and supports the prerouting, postrouting, input, output and forward hooks. But the aforementioned table lists "dstnat" as name for priority -300 in the bridge family, and lists prerouting as typical hook for that priority; similar for "srcnat" at priority 300 and hook "postrouting".

I am unable to understand this. Why are there priorities with the nft keyword / names "dstnat" and "srcnat" although chains of type nat are not supported in the bridge family?

This leads to another question: If we want to filter in a bridge prerouting chain (again, the filter type is the only supported chain type here), should we use priority -200 for that chain (because -200 is the value of the "filter" keyword, and filtering is what we can do), or should we use priority -300 (because the "typical prerouting" hook is placed at -300, according to the table)? The same question applies for filter type chains in the output and postrouting hooks.


Best regards, and thanks in advance for any explanations,

Binarus


