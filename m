Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3769D39
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706700444; cv=none; b=JIWalk3EUXKUwhWvJFkJngqVJZv1h9PH2h3J3a5ahtzEVIs/rnjh30gl3RYxZ7KCVuiT0Gzf96AMJEL4vHR7vI7h7vnjymDR2YI8DSkkK9xebdWzzvR5+M+3Pju54rERSOfwXH5JeUdme7qBWHi1i6eLOzfYSXLX9KczHPkiqHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706700444; c=relaxed/simple;
	bh=RB7eJ4K3ZvCyGwws+lVogu30kHW3dHvE0uyvxzpjHu4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPVH9th6fINJc/GrvYJ7Xc4Z8zMA8Fd33BTuyicJGOyXRXMWKqqiABrLbGKvjzb7YUnyBCwgiqt4kEMeojws/Y/yG4MieStMv2kGD4IbRc39geZX56ttQqJVAcGfZnO8xHsbisi8p79ahTs53VkFdJlLKxtPHY0WNvPDgniM11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rV8kQ-003oBF-34
	for netfilter@vger.kernel.org;
	Wed, 31 Jan 2024 12:27:18 +0100
Date: Wed, 31 Jan 2024 12:27:18 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZboulqH75R2cQBTG@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
 <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
 <47667AAA-1B0B-4262-AC20-2F224B2BB092@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47667AAA-1B0B-4262-AC20-2F224B2BB092@slavino.sk>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jan 30, 2024 at 07:34:30PM +0000, Slavko wrote:
> Dňa 30. januára 2024 17:57:21 UTC používateľ Kerin Millar <kfm@plushkava.net> napísal:
> 
> >It is easy to say that it is pointless if not the one to be responsible for implementing and maintaining the code and trying to take into account diverse - and occasionally conflicting - user desires. There have been various set-related bugs in nftables over the years. Complexity surely matters to someone. There are multiple open bugs now that concern both performance and memory usage. Efficiency surely matters to someone.
> 
> I mean mostly that, that IPv6 becomes reality, and soon or later (the later
> is IMO more realistic) will replace IPv4 at all, thus all L3 addresses will
> become 128 bites long. Sure, here will be always penalty in using 128b
> addresses in compare to 32b addresses, but world is (slowly) moving
> to IPv6, thus that penalty is something, which cannot be avoided.

IPv4 and IPv6 are distinct protocols that should be handled differently
from each other in the low level parts of our systems. It is the
responsibility of the high-level tools to make handling this easier for
the human user. In the nftables architecture, that would be nft,
allowing the user to freely use IPv4 and IPv6 addresses in the rule set
and translate this for the low-level parts of the architecture where
efficiency matters.

A IPv6 has longer addresses, yes. But IPv6 also doesn't need NAT and
other crutches that are efficiency killers in other parts of our
systems. And it is also easier to use for the human user ONCE we have
learned to live in a world without the kludges that we currently need to
keep IPv4 alive.

> + sets will store protocol agnostic L3 addresses and it doesn't
>   matter (for me) if IPv4 will be mapped to IPv6 or these L3 sets
>   will internally maintain two sets -- one for IPv4 and one for IPv6
> + nftables syntax will provide some sort of abstraction, as it already
>   provides eg. for UDP/TCP ports (th dport), eg. "nh saddr" (nh as
>   network header)

Agreed.

> + nftables will provide abstraction for ICMP(v6) types, something
>   as it already provides for reject, to one can build common rule
>   for both, including the one common set/verdict map -- for me
>   it doesn't matter if it will internally map namex to protocol's proper
>   values, or specific names must be prefixed eg. by ipv4 and/or ipv6

I'd rather not do this, at least not in the beginning. ICMPv4 and ICMPv6
are distinct protocols, especially when looking at neighbor discovery.
Having a pseudo-protocol ICMPv46 will probably make it easier to handle
things like echo, echo reply, host unreachable etc, but one will need
different handling of ICMPv4 and ICMPv6. It was hard enough to teach
firewall people that IPv6 will cease working if you don't alow ICMPv6 at
all.

> >On my part, and despite having been a user of nftables for many years now, I would prefer to see its QA and documentation improve ahead of - though not wholly at the expense of - new features being added.
> 
> While i played with nftables for years, i use it only on one of
> my servers yet, and even this machine uses mix of iptables
> and nftables rules (the real blocklists are still using ipset),
> the ip(6)tables is used only to drop traffic, all other logic is
> done from nftables. Nothing extra, just slightly more than
> basic firewall, it uses sets to limit (per IP/net) logging,
> connections, dynamic blocking, and every used set must be
> doubled...
> 
> My nft sets doesn't contain huge amount of addresses, as long
> time blocking is done by ipsets, with (semi) persistent and from
> fail2ban (up some tens of days).

I am using nftables also just on one machine, while my bigger
installations still use iptables(-legacy) and ferm (which precludes me
from using ipset because ferm doesn't support that).

And I find writing nftables rules not fun, maybe because the syntax is
so similiar-but-still-different from ferm (which is something that nft
should NOT change, I need to adapt here) and/or because it's so clumsy
to write dual-stack rulesets.

> I implemented it about year ago, and yes, the documentation
> is hard to read. Most of it is ip family only, some parts are
> hard to understand, and even more hard to combine together.
> But i cannot be sure, if it is not by lack of my English... But
> my feel from docs is, that they are exactly as my notes --
> perfect for me, but hard to understand for all others ;-)

The docs, manpages and the wiki are in desperate need of a technical
writer, who will provide a more educational approach. I think that the
wiki is helpful if you already know your way around nftables, but at the
moment it looks to me that having in-depth knowledge of iptables is more
a liability than an asset when trying to move to nftables.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
