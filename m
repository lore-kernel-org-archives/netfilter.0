Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F92A8D7
	for <netfilter@vger.kernel.org>; Sat,  3 Feb 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706960739; cv=none; b=Hq27+GVor+kz+USYZ33jbPtOqnwBUDaXRHGbMb/kJbGdLBPREqzGOs1ii0PC7CriOQh9smgEUWs5V/jDOgVnRv0p5U6F4n+QJBY3MauMfYwePAPGZLfkRqqopr0i775kvZZJJ6RylMQsVNhgVQfuXl65Q+Y2RfBgsNzd2PFUSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706960739; c=relaxed/simple;
	bh=YHqeTMamCznrR+SdS3YbY5fkswCDMV//t30vL/Oq0K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OipPUPJUuOhXm4BMGefVQF6MMQzd+y7kqz4w1kusSaXhgsrJYQiDFaii+oXHoOYjyGtIAUU98s0fS9lgRy6Uj0dvH9w9AegjXaGmGpXo/u+cLzo2HZm1Rj8D3/DU0vB+U/gfHFKDEihO7PYCv1ANNmcJ6nkBJJCNt6KYdGr1wAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rWESd-00030s-Dw; Sat, 03 Feb 2024 12:45:27 +0100
Date: Sat, 3 Feb 2024 12:45:27 +0100
From: Florian Westphal <fw@strlen.de>
To: Timo Lindfors <timo.lindfors@iki.fi>
Cc: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Analyzing firewall rules programmatically
Message-ID: <20240203114527.GA20263@breakpoint.cc>
References: <alpine.DEB.2.20.2401302150460.27550@mail.home>
 <20240201203448.a7b1957192995e4553be546c@plushkava.net>
 <alpine.DEB.2.20.2402022057110.2274@mail.home>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.2402022057110.2274@mail.home>
User-Agent: Mutt/1.10.1 (2018-07-13)

Timo Lindfors <timo.lindfors@iki.fi> wrote:
> > # uname -r; nft -V | head -n1
> > 6.7.2-arch1-2
> > nftables v1.0.9 (Old Doc Yak #3)
> > # nft flush ruleset
> > # iptables-nft -A INPUT -m addrtype --dst-type LOCAL
> > # nft list ruleset 2>/dev/null | sed -n 4p
> > 		xt match "addrtype" counter packets 8 bytes 778
> 
> I get different output on Debian 12:
> 
> # uname -r; nft -V | head -n1
> 6.1.0-17-amd64
> nftables v1.0.6 (Lester Gooch #5)
> # nft flush ruleset
> # iptables-nft -A INPUT -m addrtype --dst-type LOCAL
> # nft list ruleset 2>/dev/null | sed -n 4p
> 		fib daddr type local counter packets 24 bytes 16144
> 
> Is this perhaps a regression?

More likely that the former nft is compiled without xtables support,
the latter nft binary asks iptables-translate for a textual
nft-equivalent repesentation of the addrtype match.

> Ok, thanks for the insights. If I built the tool for netfilter first, which
> of the three formats should I try to analyze? netlink, text or json?

Text is rather unstable, I would not rely on it.

json ought to be stable, netlink is stable (its the api after all).
