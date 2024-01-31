Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA96A320
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699612; cv=none; b=dPnMpzd9IKK8lNV4JjbOskoH6iQi1+ZL/qXTYP+tjpfIe78x7RvdKcAZTMtWBKpR0NhceheN7g0s6P01ZqW6J76MOPGeX7oySwTL8Yhtsq64VIEkFfoxjKMNCVBrtYJlQ+Su4Z2tTitxImbvkdVfebEkTeZbCF+82+ZbgITEWJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699612; c=relaxed/simple;
	bh=zC+shFWgnM+EV6o0K9mi+96YdKxrPOjY/pcSQbxfOMg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNziuMz1B9LT4bxYMh6MbnVquTyVHcvUWEsJlgsXZG9lMcaTgnixfUSl7SI9iRVPgI0o0ltvBiih+LBmAjt9/FF/0s8A4Z+zEhnU9ztCLB/kFbfd4ZvunvZ9Q7k4NV+FKmdp+stiuWBI0Q13pfqJi4h2D6i0AfuMOuzjRWDDyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rV8X2-003nw6-0h
	for netfilter@vger.kernel.org;
	Wed, 31 Jan 2024 12:13:28 +0100
Date: Wed, 31 Jan 2024 12:13:28 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZborWMEh-sU-wNu_@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
 <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,

On Tue, Jan 30, 2024 at 05:57:21PM +0000, Kerin Millar wrote:
> It is easy to say that it is pointless if not the one to be responsible for implementing and maintaining the code and trying to take into account diverse - and occasionally conflicting - user desires. There have been various set-related bugs in nftables over the years. Complexity surely matters to someone. There are multiple open bugs now that concern both performance and memory usage. Efficiency surely matters to someone.

That responsibility should have been considered before taking the
decision to dump iptables. iptables is used everywhere and elsewhere,
while nftables is the new kid on the block. Currently, changing over
from iptables to nftables needs not only dropping all your know-how, but
also dropping nearly all of your available tooling.

This is a considerable step backwards regarding ease of use, and not
having an easy way to write dual-stack rules hits the early adopters who
have been using IPv6 for decades. Those would also be the early adopters
for nftables, but making their lives harder in writing firewall rules
will prevent nftables migrations.

> > Nftables now has inet family, that is great step from iptables. But still
> > requires to maintain separate rules in it for anything with network layer
> > address, eg. mentioned sets (and for icmp/icmp6 too). I hope, that it
> > is temporary state only and will be improved soon.
> 
> For it to improve, you could put forward a concrete suggestion as to how it might be improved, be it supporting logical disjunctions in rules, supporting a generic address type in sets or whatever else. That would, at least, be a step along the road to (potentially) convincing whoever is going to do the work that it is justified.

My suggestion would be to allow IPv4 and IPv6 addresses mixed in
definition and sets, and disregard invalid combinations in rule
generation. At least that's what existing iptables tools do, and
emulating this behavior would probably ease the transition.

I am open to other discussions, but I doubt that I would be helpful
because I don't know enough about nftables at the moment.

> On my part, and despite having been a user of nftables for many years
> now, I would prefer to see its QA and documentation improve ahead of -
> though not wholly at the expense of - new features being added.

QA and documentation is important, of course.

Greetings
Marc


-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
