Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8CE31354B
	for <netfilter@vger.kernel.org>; Fri, 12 Sep 2025 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678742; cv=none; b=Tg0MYtO2Dp5sOAWfxrH5dJO9T0iK1oeWbb8Wfsn9qqYyA05+Qg4Cbk6JiptcWz8+11PCiiKXjbzxA+4CiwIS/dyaJTgEVKnejvFwsAxSDv+4RqgdqXpcZ7FExXvgH0kJ0v/gWUWZUHeZffvTlMshJn74EPPd0YhqndA+scXhN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678742; c=relaxed/simple;
	bh=oq/zgAininRBaa93xGmxJt82IF2Ap2mmsrM8qWiJrtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN1/59RBqPi5tx9qQkVBp8T8MoA5VW3s8PG218tAW2/FAz1hgVLOcZxrtgzlmtAsxpUNdzNp4qKoms/gSAfUFmQYCsFH/iTvpKqsVTBSpBz6OBmFyRKnGX17bTTvbq5weerFRZpbsBw2XWLaTYh+mS5RUeSKxpqki8qvornZdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id C3B5D60186; Fri, 12 Sep 2025 14:05:30 +0200 (CEST)
Date: Fri, 12 Sep 2025 14:05:30 +0200
From: Florian Westphal <fw@strlen.de>
To: Juan Carlos Lazcano <juan@placidnetworks.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Stateless NAT in nftables with maps for performance
Message-ID: <aMQMg33uIM63vKAC@strlen.de>
References: <1643443761.529082.1757676483522@email.ionos.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643443761.529082.1757676483522@email.ionos.com>

Juan Carlos Lazcano <juan@placidnetworks.com> wrote:
> Hi netfilter community!
> I'm trying to orchestrate the generation and maintenance of thousands of dnat & snat rules in a stateless configuration within the prerouting and forward hooks with chain types of filter, and unfortunately am hitting a big performance barrier as a result.  Its fine with a few thousand, but once we get into the tens of thousands of rules, things start slowing down linearly, which is why we would like to switch to maps.  However, I cannot figure out 1) if maps are supported in filter chains within prerouting/forward hooks and 2) if it supports the syntax for stateless nat?
> 
> For example:
> 
> table ip mytable {
> 	map dnat_map {
> 		type ipv4_addr : ipv4_addr
> 	}
> 	chain dnat {
> 		type filter hook prerouting priority raw; policy accept;
> 	}
> }
> 
> I normally generate stateless dnat's via:
> 
> $ nft add rule ip mytable dnat ip daddr 100.101.84.137 counter ip daddr set 10.11.1.32 notrack comment "comment 1"
> 
> But, lets say I want to try to replace this rule with a map.  If i populate my map with a a key pair like:
> 
> $ nft add element ip mytable dnat_map { 100.101.84.137 : 10.11.33.32 }
> 
> How can I represent my original rule using a map?

ip daddr set ip daddr map @dnat_map
~~~~~~~~     #######
   |           \ The key to query the map for
   |
   \ What you want replaced

This rule is:
  [ payload load 4b @ network header + 16 => reg 1 ] # loads the key (second ip daddr).
  [ lookup reg 1 set dnat_map dreg 1 0x0 ]           # queries map
  [ payload write reg 1 => 4b @ network header + 16 csum_type 1 csum_off 10 csum_flags 0x1 ]
  # Then places the result of the map at the location (first ip daddr).
