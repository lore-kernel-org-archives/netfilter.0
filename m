Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4091D63D3
	for <netfilter@vger.kernel.org>; Sat,  4 Jan 2025 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024136; cv=none; b=RpuJ+0GXiN8chAQt/RnKo/YvymEnzRhLJjVG2R6380gOfXrz5GXPFp+nrBZ/drOmjPSc9/XRqCZSkBpqWXBqf9/fINJD3YgLJijxIjgnP/qJhmv8L9NTJ/Pp9vTXSUyr2/bqxR9FfR9Ki6bTABYW5gblMQ23KxpS9lnDgwV7zUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024136; c=relaxed/simple;
	bh=eG27HPketttfZ+3fctLuZYsRs82jsFUidCEOVDArF+0=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YrW5ZZgmYVuY1FSDZ086qoI0WHetMpo4sNm+rgkpnCRMkH+gaYzfWySHbXuI42nXoqp4F+sSp7ltWqU91umVBseur38pOQO9s55qcV5afRyMeUmFjq3vR7uaz0LR+09wKc1zc6yJWAEMCjd7/KbvIutK0IoLjRee3ob1vjC5MGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=HjBAC/PX; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=XC/6UToO; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="HjBAC/PX";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="XC/6UToO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=eG27HPketttfZ+3fctLuZYsRs82jsFUidCEOVDArF+0=; t=1736024131; x=1737233731; 
	b=HjBAC/PXiy8L4zDmbrft5Ca8AFHz14Vt0xdp+kEQVd0foB5cKWoW5kMULJte61jw8w1MsIPp7mo
	89PUGEPHXZcWoE25U57qODhOshBn/oXM+J/5EP906WRTXpoPuRELR/HXmyOUtNYYuRD9/0/CWDPu8
	3GJxGBVT3UJrJaUxlJ8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=eG27HPketttfZ+3fctLuZYsRs82jsFUidCEOVDArF+0=; t=1736024131; x=1737233731; 
	b=XC/6UToOrsCB8seSrog9t8fYvG2Y2rKL57yAPlV01UtmgjtLcj75vCTLzjFcCpTRawdrg3MWSgM
	2M+jN8ScIBg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tUB5y-001cX3-2m
	for netfilter@vger.kernel.org;
	Sat, 04 Jan 2025 21:50:06 +0100
Date: Sat, 04 Jan 2025 20:50:04 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: General questions about priorities - Clarification appreciated
In-Reply-To: <23875ea1-9194-4353-ae54-8811e53984ad@binarus.de>
References: <23875ea1-9194-4353-ae54-8811e53984ad@binarus.de>
Message-ID: <C7BB8E06-CD54-4613-86E1-6AE71C9606B3@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 4=2E janu=C3=A1ra 2025 18:16:52 UTC, Binarus <lists@binarus=2Ede> wrote:

>This table is worrying=2E

I tried to reply in simple manner, but i fail=2E The nft provides
far more flexibility to setup than iptables, and that flexibility
is hard to describe in simple words ;-)

> For example, we obviously should use priority 0 for our own filter chain=
s=2E We can guess this from the fact that hopefully nftables does not apply=
 any filtering unless explicitly told so (i=2Ee=2E, priority 0 should not b=
e assigned to a chain or to an internal process by default) and from the fa=
ct that every tutorial we saw so far uses priority 0 for filter chains=2E

Consider priority as ordering, it is number from min to max,
and as it is signed number, zero is just in middle of range=2E

>From the NF_IP_PRI_CONNTRACK description in the table: "Connection tracki=
ng processes run early in prerouting and output hooks to associate packets =
with tracked connections=2E" I am understanding this in the sense that an i=
nternal process is assigned priority -200=2E

Keep things simple=2E At start just use symbolic names for
priority, or (if you really need) use simple math with these
names, eg=2E "filter - 5"=2E These symbolic names more or less
follows iptables's table names, that simplifies migration=2E

If you already use iptables-nft, you can list your iptables
rules from nft (list ruleset)=2E Not all rules can/will be translatec
to nftables syntax, but you can see all your chains, including
its type, hook and priority=2E

Note, i don't suggest to build your firewal by that way,
but it can help with chains priorities=2E

>On the other hand, the table mentions prerouting and output being "typica=
l hooks" for priority -200=2E This makes the impression that we should use =
priority -200 for custom prerouting and output chains, and contradicts the =
statements in the previous paragraph=2E

That is because hooks are called at certain states of
packet processing, eg in prerouting hook happens conntrack
and (D)NAT, and you can add your own chain into it=2E The
priority then defines, in what stage the packet in this
(your) chain is, or in other words, if conntrack entry was
already created for it or if its dest address was already
changed, etc=2E That doesn't matter in input chain (as it was
done already), but you can use these priorities too, but
they are without special purpose, just ordering

>I have read the nft man page on my debian system (bookworm, up-to-date at=
 the time of writing, nftables 1=2E0=2E6, kernel 6=2E1=2E0) and found that =
it indeed contains a similar table=2E But that table is much smaller than t=
he one in the wiki=2E=20

Really, at least on start, use only symbolic names for
priorities, unless you are willing go into sources (i am
not, as i don't speak C)=2E

>I am unable to understand this=2E Why are there priorities with the nft k=
eyword / names "dstnat" and "srcnat" although chains of type nat are not su=
pported in the bridge family?

It is about bridging (L2 firewall), it was separate from
iptables (i never used/need it, thus i don't remember its
name), now it is part of nft=2E If you not used it before, you
can skip it=2E

And if unsure, use nft's buil-in trace & monitor=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
