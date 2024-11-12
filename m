Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDE209F2C
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731441454; cv=none; b=eWUG4GuyETx0vSPhdOEtiuHdIk/Yu5Z/PpsFGXEk/U/1o7PnKgVMEvZ0giBnyyrPgPrg1+X5eZCZn/m7xYQkeepFPywcbTNugnDbLmkv9AGzseHX5ekNtYxQAeyoFTpUCrWeH3Bk9YsIwmdqePCHahYfMa4nOXZrQHmyGiz1sgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731441454; c=relaxed/simple;
	bh=ULuvj734i8AkGSF/v+GYi6NY1C2iOhmdnNduwZ1z+TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM97ZkIuBE7wgzuFPGkfQa1q9z0mmsJ/zIc+9lo4pDq7iOvubHbhee7KQQRoWZQIOFfnbp0jDXhqcGC6ixKz78JZBaUQNjT0a7jTvOfAQG44JDLL6gY+M6Fv8PMQH8U1wQFhgJDuMY4/AwvYzf83aHsJO0LNQAfD58PDd3jSmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=40266 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAx0w-009jV6-Rt; Tue, 12 Nov 2024 20:57:29 +0100
Date: Tue, 12 Nov 2024 20:57:25 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Florian Westphal <fw@strlen.de>, Slavko <linux@slavino.sk>,
	netfilter@vger.kernel.org
Subject: Re: ipset vs. nftables set
Message-ID: <ZzOzJcTdsryZ-GxZ@calendula>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
 <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
 <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
 <ZzObEveL6rLYzv-b@calendula>
 <20241112181855.GA28817@breakpoint.cc>
 <85dff1ec-b8f0-4ba0-a893-d942d12fed81@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85dff1ec-b8f0-4ba0-a893-d942d12fed81@app.fastmail.com>
X-Spam-Score: -1.9 (-)

On Tue, Nov 12, 2024 at 07:44:17PM +0000, Kerin Millar wrote:
> On Tue, 12 Nov 2024, at 6:18 PM, Florian Westphal wrote:
> > Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >> > But one can have multiple hooks (chains) in one table, even with the
> >> > same priority (i not suggest that). Thus one can combine multiple
> >> > tables into one and share sets, eg. in raw & filter hooks.
> >> 
> >> Don't do that, please.
> >
> > Why not?  Single-table approach makes sense, in my opinion,
> > provided that single table is controlled by single entity, be
> > that a program like firewalld or traditional sysadmin.
> >
> > With multi-table things become awkward due to the imposed
> > scoping rules that prevent cross-table use of sets/maps.
> 
> I read it as being an objection to (potentially) using hooks that
> duplicate one another exactly. Mind you, if it be considered so
> objectionable, why doesn't nft refuse to compile rulesets that do
> this? Or, at least, raise a warning.

A warning to what? example?
