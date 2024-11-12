Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3322144B5
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435541; cv=none; b=dNlJ1hWjX9o8YtYqTcMugHGA/u4OyaWlZKS7Z5gYX/X7CfkqIOGriP+LOzfQ4rOFgHGTvypD19ltBV8xIRWcMZPMe4tfDXtdhlg4WuqPxkPPCYrAJiUkLggFTe+EKXBKYeER0BxESA03Lu0j2wR4wGLiQ2A8OYu3zP4NL3Ha5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435541; c=relaxed/simple;
	bh=FC7FKErT09YyCsxNhOaOEiezQeTHZgRyWEWW7Kwd7Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAomBAY+LVJHFxKCrfMgF0Eo8qvsRb5WnXtJAY3YvrPUsJ82ETrtfr9Il4jU2Z+d92djO6T4+xQhrm/hHeiot+hTw9vW6CMyFIEQVffHSl0uh/zfJKxhJUbMaDhzjiWPffnqUojBOImNICDkfpzraWCPKvx6OGZJS6JeMbY9bao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tAvTb-0007Wi-N2; Tue, 12 Nov 2024 19:18:55 +0100
Date: Tue, 12 Nov 2024 19:18:55 +0100
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Subject: Re: ipset vs. nftables set
Message-ID: <20241112181855.GA28817@breakpoint.cc>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
 <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
 <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
 <ZzObEveL6rLYzv-b@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzObEveL6rLYzv-b@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > But one can have multiple hooks (chains) in one table, even with the
> > same priority (i not suggest that). Thus one can combine multiple
> > tables into one and share sets, eg. in raw & filter hooks.
> 
> Don't do that, please.

Why not?  Single-table approach makes sense, in my opinion,
provided that single table is controlled by single entity, be
that a program like firewalld or traditional sysadmin.

With multi-table things become awkward due to the imposed
scoping rules that prevent cross-table use of sets/maps.
