Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852128E11
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698818; cv=none; b=i72LRFocxEyytl9LM4m4EjoL43GIPZdGeJCDLoXAX9IMTf2g0nCq2EA7a0ymH3QAGy9KpaSuIvjIj7cPN87NhFvXwzmuFpMDhwc6iRkeGSSrKJ7UGya20roxWHkkN3avV0Qen3Jg4qxEvwHBdkRO1xeHbvDJVIAnVyIlaQ+09xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698818; c=relaxed/simple;
	bh=foAPe0IHDM7Bj4c0ZFLH0mbHcP58nWKuAWfTI7TpKfo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB6Pf97j8gCJWKmLJjMDkxJyE/5JKEcgxikMR2ioi+uds+UnCKCgYCibWfEJb05uS2oTL62f4waROfVJyaR8LCdOfNvQmmA9zpISeY88cTc3WsY3Co1COYf7ksg0HMqUXxBOJGDGBerIpEUj7vNhHc4/B5hBEFh+lIZLYMQ7KoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rV8KE-003ngJ-1w
	for netfilter@vger.kernel.org;
	Wed, 31 Jan 2024 12:00:14 +0100
Date: Wed, 31 Jan 2024 12:00:14 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZbooPjQPT-G0PI19@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jan 30, 2024 at 05:00:50PM +0000, Slavko wrote:
> Dňa 30. januára 2024 15:17:32 UTC používateľ Kerin Millar <kfm@plushkava.net> napísal:
> 
> >Granted, one cannot create a set that is typed in such a way that an element can be either an IPv4 or IPv6 address/interval. 
> 
> Nowadays IPv6 becomes more and more common. While allmost all
> can stay on IP(v4) only host, not all can use IPv6 only host (yet, as many
> services are still IPv4 only). In other words, many will have dual stack,
> to can access (or be accessible for) all and they will need dual stack FW,
> and IMO will need it for many years.

The correct way to do it would be to develop/install for IPv6 only TODAY
and use a transition technology (NAT64/DNS64 for example for client
access, and reverse proxies for services) to support IPv4 as a legacy
protocol.

> Having separate support for IPv4 and IPv6 was acceptable at time, when
> ip6tables was born, but nowadays IMO firewall cannot be named modern,
> if any of its part separates that. And any argument (memory, complexity,
> etc) against it is pointles, as dual stacks are (and will be) here.

I find it ok to have separated rule set for IPv4 and IPv6. They are
different protocols in the first place. But it should be possible to
hide this separation from the person writing the rules, making it
possible to have a definition for a dual-stack host, creating dual-stack
rules without even noticing that.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
