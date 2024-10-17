Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5371D8E01
	for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729169196; cv=none; b=Tg49ay9jSmLyu8fIsxPMRbeEbdTkg4OUEf4OIvTvr98QhqEKAAxhnOPAc5GxSLeFUSwc/vuSkbdR2IO0b62m45QMbld1UXsuRlsq9VRucKSPswzdtIYxRervjeIszgffLc+bUbeyGQWAJMcwZU8Ni1hOEF1Tyar9Dv2FgreqDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729169196; c=relaxed/simple;
	bh=h18ObjKR3/QhQUUA8LIEaTWBy32i/Y/RGyjLwphXzco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlbDQRce6eRpQ2F2kBsoxEmf446USy+pHhDJH5UHLnApyv0Pas6RJVHs+J88ftGR7KHKBptiFz5ShZI9086axFeP4sictoL+IEpzfCWt8yLbZBpgxrAhxIhh2QjIp9KjSVUSveutE0kqmypWBQH3icvMo9U98FQqqeEJOWGs3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1t1Ptg-0004AT-GK; Thu, 17 Oct 2024 14:46:32 +0200
Date: Thu, 17 Oct 2024 14:46:32 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241017124632.GC12005@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> In the context of Kubernetes, when DNATing entries for UDP Services,
> we need to deal with some edge cases where some UDP entries are left
> orphaned but blackhole the traffic to the new endpoints.
> 
> At high level, the scenario is:
> - Client IP_A sends UDP traffic to VirtualIP IP_B --> Kubernetes
> Translates this to Endpoint IP_C
> - Endpoint IP_C is replaced by Endpoint IP_D, but since Client IP_A
> does not stop sending traffic, the conntrack entry IP_A IP_B --> IP_C
> takes precedence and is being renewed, so traffic is not sent to the
> new Endpoint IP_D and is lost.
> 
> To solve this problem, we have some heuristics to detect those
> scenarios when the endpoints change and flush the conntrack entries,
> however, since this is event based, if we lost the event that
> triggered the problem or something happens that fails to clean up the
> entry,  the user need to manually flush the entries.
> 
> We are implementing a new approach to solve this, we list all the UDP
> conntrack entries using netlink, compare against the existing
> programmed nftables/iptables rules, and flush the ones we know are
> stale.
> 
> During the implementation review, the question [1] this raises is, how
> impactful is it to dump all the conntrack entries each time we program
> the iptables/nftables rules (this can be every 1s on nodes with a lot
> of entries)?
> Is this approach completely safe?
> Should we try to read from procfs instead?

Walking all conntrack entries in 1s intervals is going to be slow, no
matter the chosen interface.  Even doing the filtering in the kernel to
not dump all entries but only those that match udp/port/ip criteria is
not going to change it.

Also both proc and netlink dumps can miss entries (albeit its rare),
if parallel insertions/deletes happen (which is normal on busy system).

I wonder why the appropriate delete requests cannot be done when the
mapping is altered, I mean, you must have some code that issues
either iptables -t nat -D ... or nft delete element ... or similar.

If you do that, why not also fire off the conntrack -D request
afterwards?  Or are these publish/withdraw so frequent that this
doesn't matter compared to poll based approach?

Something like
   conntrack -D --protonum 17 --orig-dst $vserver --orig-port-dst 53 --reply-src $rserver --reply-port-src 5353

would zap everything to $rserver mapped to $vserver from client point of view.

Granted, this isn't great either, but you would not have to poll
all the time?  Or are updates

Is this only a problem for UDP?  I wonder if we should change UDP
conntrack to no longer refresh timestamp for original direction if
connection is subject to NAT, that would make them expire in the given
'dnat mapping went away and client tries to talk to unreachable host'
scenario.
