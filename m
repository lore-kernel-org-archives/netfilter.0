Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AB15D5B8
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789590; cv=none; b=pxeToD23z0OyQbvFmqwE+ymCNoEk1yo33+IfP860tAAxWdW/VAfJKcchDwWRKlqBXcLFtAhYQc38ysIGCe5+tUEv8tTWQV/alWNh4vSe1dSHx3cujFs8UERJI9cr9LcLPyuJqd6f5JRkT9GzmQx7PudBUiIMAJjBTV4NS4oYJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789590; c=relaxed/simple;
	bh=yLwByVjRvgE4ZQngiQwsMXHEUyqAxtqxrLiA+qBzfHI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnR9f4YaNSa5sv7ZP4BBjCfHNM/IAaWgEznCXFYxVZB2xtoVrPeWfwnzsCnvalCSn87wnKz+nM09LMRFq0/x+NuUbMHlpYZKyFVWMKlbtZTjtkVTMoBPIuslAvvmwHtVKO32DpHgfI+M4ZexuDoSTdyYoPyOku4sT6piFgj8+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rVVwI-004OLX-1L
	for netfilter@vger.kernel.org;
	Thu, 01 Feb 2024 13:13:06 +0100
Date: Thu, 1 Feb 2024 13:13:06 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZbuK0sfG_-IbnbpJ@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
 <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
 <47667AAA-1B0B-4262-AC20-2F224B2BB092@slavino.sk>
 <20240130220548.e8ef0afd93b2443beb347883@plushkava.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240130220548.e8ef0afd93b2443beb347883@plushkava.net>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jan 30, 2024 at 10:05:48PM +0000, Kerin Millar wrote:
> On Tue, 30 Jan 2024 19:34:30 +0000
> Slavko <linux@slavino.sk> wrote:
> > + sets will store protocol agnostic L3 addresses and it doesn't
> >   matter (for me) if IPv4 will be mapped to IPv6 or these L3 sets
> >   will internally maintain two sets -- one for IPv4 and one for IPv6
> 
> Now that you mention it, I thought that I recalled someone filing a related issue at bugzilla but it seems that my memory is playing tricks on me. I can find no such issue now, although there is one that (sort of) proposed an equivalent to the list:set type of ipset. That one was rejected.

For what it's worth, I had a look in bugzilla regarding easy rule
writing two years or so ago, found a number of related bugs, none of
them with a visible reaction, and decided to spend my time with more
productive tasks. Sadly, I didn't take bookmarks, and looking again
earlier this week didn't show any results. I might have looked
differently back then

> That seems a fair assessment to me. While iptables has the advantage of being simpler in many ways, the iptables(8) man page probably does a better job of on-boarding new users to the underlying concepts. Rusty Russell's guides and HOWTOs were also rather good in their day. Technical writing is a talent unto itself and some people are just naturally good at it (no offense intended to the current team, of course).

Docs in Linux netfilter have been a problem in the last ten or so years.
I remember myself suddenly in a situation of SIP no longer going through
my (unchanged) iptables firewall after a kernel update to find a blog
entry saying that you now need to have a rule sending a packet to the
conntrack/nat helper explicitly for the helpers to work. I didn't find
any place in the official docs where this major change was mentioned.

I am sure that many of the new, nifty features of iptables, netfilter,
nft remain grossly unused because they're not mentioned in rusty's
documents which are still the gold standard of Linux firewall
documentation.

Isn't that sad?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
