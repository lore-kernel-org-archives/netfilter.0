Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344701AA1DC
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732142237; cv=none; b=YMuKSF2Mxd3wZtPpG0/raBw2kUEYePKm35dWihuAi/gNfkyqrsLh73BZkNmXvyXlxsrocFDJR+dMKHT09kqoFDqYoW5tXQ4Q2lN/cxXhJkRIN+54+cbVignIxHkhVUP6WIlCUfGwOmxZ3vD8GdXVQcZ5Fux3eW/WQbjf4PZamOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732142237; c=relaxed/simple;
	bh=5VzwrQtuzHuvc4+3s6BCSyY0ENMb9E/JHTY+/5GCaDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvipD/04nlwr8hD7eqRxSxnrU0uCj7bBkG8yAuqMG1KHMrHtRaHqZiH5adZ0S86EhnTrGb0lY5FE36DHe0/iRClPa5LJNEV4mf1tHHntDqacEJ6Mcls4jCo2kCD7NPEaWH6HkTQBIxNsSDa57HBlCQOH8l1SsTZuayCssbJXKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.39.247] (port=42000 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tDtJs-006Gcm-F6; Wed, 20 Nov 2024 23:37:11 +0100
Date: Wed, 20 Nov 2024 23:37:06 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Thomas =?utf-8?Q?K=C3=B6ller?= <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: Adding set elements
Message-ID: <Zz5kktcay8xI3J0l@calendula>
References: <209ce99a-9f22-444d-bd75-8b38865aea3b@koeller.dyndns.org>
 <Zzc4D1R7pTJlCDvR@calendula>
 <0f260665-7d2c-4274-b635-f40519ed193f@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f260665-7d2c-4274-b635-f40519ed193f@koeller.dyndns.org>
X-Spam-Score: -1.9 (-)

On Sat, Nov 16, 2024 at 12:17:27PM +0100, Thomas Köller wrote:
> 
> 
> Am 15.11.24 um 13:01 schrieb Pablo Neira Ayuso:
> > Hi,
> > 
> > On Thu, Nov 14, 2024 at 02:53:04PM +0100, Thomas Köller wrote:
> > > What exactly happens if an attempt is made to add another element to a set
> > > that is already full? I ran into this condition and found that a subsequent
> > > 'nft list ruleset' would display the set with no contained elements at all.
> > 
> > I don't see this here.
> > 
> > Would you post a reproducer for a current kernel in -stable?
> > 
> > > I think that a reasonable way to handle this case would be to apply sume LRU
> > > strategy to free up a slot, but that is apparently not the case?
> > 
> > Could you develop your usecase?
> > 
> 
> I wanted to create a blacklist that the ipv4 source addresses of packets
> that matched certain criteria were added to, like so:
> 
> add set ip tbl_ipv4 blacklist { type ipv4_addr; flags dynamic,timeout;
> timeout 1h; gc-interval 6h; size 256; }

Any reason why you picked such a large gc-interval?

> and later:
> 
> add rule ip tbl_ipv4 syn add @blacklist { ip saddr timeout 1h } counter drop
> 
> I noticed that set elements were accumulating over time as expected, but
> after some time the set showed up as empty in the output of 'nft list
> ruleset'. However, I cannot state with certainty that it was the overflow
> condition that caused this to happen, that was just a guess.

What you observe is an empty listing because all elements have expired
but garbage collector did not remove them yet, so the elements are
still there taking a memory slot in the set until gc runs, ie. set is
full with expired elements, therefore, no more elements can be added.

> I since reduced the element timeout to 10m and the gc-interval to 30m, and
> haven't encountered the problem for a while now.
>
> Assuming that the storage allocated to deleted elements is reused if new
> elements are added before the set is garbage-collected, I would reason that
> the choice of gc interval is not critical and it probably makes sense to
> choose a rather large value in relation to element timeout, is this correct?

There is on-demand garbage collection in the rbtree (which stores
intervals) from (add element) control plane path, but not for the hash
type. From packet path, some sort of on-demand garbage collection
needs to be put in place to support your "storage allocated deleted
elements is reused" assumption.
