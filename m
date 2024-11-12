Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E71217442
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435290; cv=none; b=smYZMGlFjuy1IEbA+8oJjmje56yOm56wiYQNXQzvvb/HwX6AFakVlmZXrw51hhgxHOOKUDNJzgE685jZStJrZOCABhzGxKJDM7G2uC9ya1zlamJLHD3JcQwGWKg5GtfjCt5bis69/W5OsatJs8JzI6VrspjV0gTKCjSMMRS7134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435290; c=relaxed/simple;
	bh=M01+asPKFVXMQeBA06y0bNCR+KJb6JI7RumDWmypLyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsPD6PhoRaCBTjqCrEL/HSx3Wck5RCyexbq+PKWk6K4nIsMpNjt5QX/Y7jvq7FPDPtmV+0wFK9lm3/9PIXb19seDBeN1UdxjnzpRQO+bX6gIEiKwEbgXu1qhprWxgZHMopY931nKZvkpJQ/kHaXexbPgdT7jdLXbvRSN25sP2gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=60796 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAvPX-009HGU-ND; Tue, 12 Nov 2024 19:14:45 +0100
Date: Tue, 12 Nov 2024 19:14:42 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: ipset vs. nftables set
Message-ID: <ZzObEveL6rLYzv-b@calendula>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
 <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
 <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
X-Spam-Score: -1.9 (-)

On Tue, Nov 12, 2024 at 05:46:50PM +0000, Slavko wrote:
> On 12. novembra 2024 17:31:11 UTC, Kerin Millar <kfm@plushkava.net> wrote:
> >On Tue, 12 Nov 2024, at 2:55 PM, Thomas Koeller wrote:
> 
> >Yes. Rules may only reference a named set from the enclosing table,
> 
> But one can have multiple hooks (chains) in one table, even with the
> same priority (i not suggest that). Thus one can combine multiple
> tables into one and share sets, eg. in raw & filter hooks.

Don't do that, please.

> Or one can mix iptables-nft with nftables, it requites more carefull
> settings (hardcoded iptables hook's priorities, flush, etc) but it
> works.

No, that is not a good idea.
