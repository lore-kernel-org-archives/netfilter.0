Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18021405F8
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732652; cv=none; b=WYhFKzepZSqfDLpWs7Pc0kOq7tuJLldJmdB7nd3ej1PCSVhVQYPGVNGwFyO1jTgHA+Nvpb3/1eRQDcKkSE1rtrvNeMwoBtAgRz+q5ty7Ef3JtqwiY3e1Bd2zohLeVgyIYNb0OkC4OSgAnq1BvSmgyzlPJ3DMxSWRTDAhSIT/SRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732652; c=relaxed/simple;
	bh=1Y/8M2Wdcd1mFb8bi7nkxBuFIAE0s1i/q2sKyNbaZYM=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=g7lcbP+7d6/IGRn/u2/7fEAD/hJ3ErUTBX7Pi6V76hsDpppn/cS8r2n95JVnWjAMRwCsviHjqnlRtZ6rt++6nTW9bN1wbs/zjiHzZ7P0mRjr2eYoPkKa5Yng38lUf2ntY60VCKX8OpM9Z8bwRzImXaWGq1EPptfWnOYwXPQO8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=wIPWF4sk; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=MbrnE6cD; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="wIPWF4sk";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="MbrnE6cD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=yFFuNIuSXoDRA0B+B46uKm9bn0BvmfKXt4418zel5FM=; t=1706732648; x=1707942248; 
	b=wIPWF4skof2ffpfDVJga3GdNUyrwS/kg0BMcfkp2TLqMCnKKiXh8QhTBk5JgFT6012ap/v+j13y
	lp1g/BooS4bc7KgoU8ljio4v3zaI/9O5k1F+py5RlzfiHOb+1S88Tvg8Q5ANov+gjlbocLb7UcXGn
	FLVU2qMOs6mxyeXdoFY=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=yFFuNIuSXoDRA0B+B46uKm9bn0BvmfKXt4418zel5FM=; t=1706732648; x=1707942248; 
	b=MbrnE6cDqWC5mh+kBIecL+1TuBL3OHECya52Qew7sja473xQWuysRXYG70HQ/cHFs4M1xcrY+4E
	PqepIONqjAg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rVH7n-0002qY-0a
	for netfilter@vger.kernel.org;
	Wed, 31 Jan 2024 21:23:59 +0100
Date: Wed, 31 Jan 2024 20:23:54 +0000
From: Slavko <linux@slavino.sk>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
In-Reply-To: <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net> <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbj04V-90zpQwEzl@torres.zugschlus.de> <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com> <Zbom4bTPnkTMbLNE@torres.zugschlus.de> <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
Message-ID: <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 31=2E janu=C3=A1ra 2024 13:02:57 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>Firstly, I mentioned both tables and the "inet" family=2E If you search f=
or inet in the man page, you should land in the ADDRESS FAMILY section, whi=
ch indicates that the purpose of an address family is to define the type of=
 packets that can be processed=2E It goes on to say that "all nftables obje=
cts exist in address family specific namespaces, therefore all identifiers =
include an address family"=2E

I check manpage now, 1=2E0=2E6 (as is in debian bookworm) and from its
ADDRESS FAMILY section is nor clean (at least for me) the order of
inet and ip/ip6 tables processing=2E It is even not clearly stated here,
that packet will be processed in both, the inet and the ip/ip6=2E

I know, that hook's priority comes into play, it is worth to mention,
if here are hooks with the same priority in both (as inet and ip/ip6)
the order is =2E=2E=2E or order is not defined=2E

>>> table inet filter {
>>>         set block4 {
>>>                 type ipv4_addr
>>>         }
>>>         set block6 {
>>>                 type ipv6_addr
>>>         }
>>>         chain INPUT {
>>>                 type filter hook input priority filter; policy accept
>>>                 ip saddr @block4 drop
>>>                 ip6 saddr @block6 drop
>>>         }
>>> }

This can be OK with two sets, as it really doesn't matter if you have
one ot two rules/sets=2E But when you start to really use them and you
need eg=2E 10 sets, you have to define every twice, things become
more complicated=2E=2E=2E

When i start to play with these sets i was too constrained by iptables's
approach by that, that every iptables's table becomed separate
nftables table, thus one cannot share common sets between eg=2E raw
and filter tables=2E It took some time to realize, that i need to switch m=
y
mind and that i can define "raw" and "filter" hooks in one table and thus
share the same set in both (eg=2E fill content in filter and drop in raw)=
=2E

Second thing which took time to understand was, why in hell i need
as many sets=2E After some time i realized, that it is price for flexibili=
ty=2E
In iptables many extensions uses some storage (recent, limit,
hashlimit, connlimit) and these storages are managed by extension
itself, and user needs only to setup its name or even nothing (for
limit)=2E In nftables world one can use sets to achieve the same result,
but have to create sets/storage by self, but can customize them in
simple way (without change kernel module options) and that is
great=2E

But if one use these features intensive, all sets and rules must
be twiced in inet table (exactly as in separated ip/ip6 tables), the
amount of sets increases significantly=2E Yes, these "sets" was twiced
in ip(6)tables too, but that was "hidden" in extension code, now the
inet table exposes that twicing=2E And as amount of sets increases,
listing them becomes more and more not user friendly, as one can
list either all table's sets or one concrete set, nothing in between=2E

BTW, i am curious, how big difference (in performance/time) is to
search IPv4 vs=2E IPv6 address in set? Is it worth to consider?

I start to more and more think, that using of inet family (as in current
state) is good only for simple/basic FWs, without any advanced
features, where are L3 addresses used only to static distingushing
of access or where rulesets are maintained by some external tool
(in separate tables)=2E

From=20my point of view, integration of sets created impressive
features in nftables, but in result they are too constrained (in L3
mean), by the same way as they was in iptables, or even worse,
as now ipset allow to use combined sets and add/update it from
the same name (thus rule too) in both, the iptables and ip6tables
(yes, as mentioned already, that is not possible from command
line -- yet?)=2E

Another thing, which is not clean for me, is memory usage of sets=2E
I read on multiple places about huge memory usage with big sets,
but nowhere i found real comparison=2E Nor in memory usage, nor in
performance of nftables's sets vs=2E ipset sets=2E Now i don't know
if these memory problems was in early stage of sets development
(and are solved now), or they was caused by suboptimal usage of
tools, or it is by design=2E Recently i noticed in docs, that there is
memory/performance switch for sets, but what that means in
real usage? Again, no benchmark is documented, to one can
properly decide which one to use=2E Or, at least, commands/way
how to measure difference by self=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
