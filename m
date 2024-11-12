Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE413213EE8
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435698; cv=none; b=r6xpiFQpXx7uvyKBjewAMJGtXidX1IjgLZaSGV16m+KTpHrB98DBcuskcZ/daTuR9tUdB1+1HUM8dXZW8NiFPgIjD7mKmRU53az+pPrtrkILh+tWGftgFzx5IAZEEpgTwK2AG2e2OqVQZc5aQnFiIUO4zbZOoEz6LUsovIw/rRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435698; c=relaxed/simple;
	bh=k07wiU3AfGQmajXQwkyr7jS601wbcvNktH4pfmeI3zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fto+yaO4JXGgjJgclNMpezHGcDMXuoiPmtE5ef3P4xQZyRlVKwVEhEX+CUMwO7TlImj1LpToqotf39ukIiSlWPN4XqezHmySFTkr3maTdEg4KGSOAzhJHO2WBU9H1HZF7EaFiYtc9u5w6lRZW+osQveVUEYXSfTjg0yqK9io8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tAvW9-0007YC-Mf; Tue, 12 Nov 2024 19:21:33 +0100
Date: Tue, 12 Nov 2024 19:21:33 +0100
From: Florian Westphal <fw@strlen.de>
To: Thomas =?iso-8859-15?Q?K=F6ller?= <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: connection tracking state in rules
Message-ID: <20241112182133.GB28817@breakpoint.cc>
References: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Thomas Köller <thomas@koeller.dyndns.org> wrote:
> tried to create a rule using the conntrack state of a packet:
> 
> [root@sarkovy nftables]# cat ruleset-own.txt
> create table netdev world
> add set netdev world blacklist { type ipv4_addr; flags dynamic,timeout;
> timeout 1h; gc-interval 6h; size 256; }
> create chain netdev world ingress { type filter hook ingress device
> "eth_cable" priority filter; policy drop; }
> add rule netdev world ingress ip protocol tcp ip saddr @blacklist counter
> drop
> add rule netdev world ingress ct state established,related counter accept
> [root@sarkovy nftables]# nft -cf ruleset-own.txt
> ruleset-own.txt:5:31-38: Error: Could not process rule: Protocol error
> add rule netdev world ingress ct state established,related counter accept
>                               ^^^^^^^^
> This is rejected, but why?

Conntrack state isn't available in ingress hook.

> And, btw., which one is correct, 'ct state established,related' or 'ct state
> { established,related }'?

Both work: related and established state are mutually exclusive.

established,related is a bit more compact and doesn't need the anonymous
set.
