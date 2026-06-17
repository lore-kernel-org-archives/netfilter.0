Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658CD43DA53
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692798; cv=none; b=G4hxJGuyKLS6RJIH9gCRxjUgMsTsOuxxYN55PGrKASs7vzJ8nKAQW5vcJaG01JDD7uQ20yH/n5QVBb42FkOnQSTbqOFoDmSXdM3dNhJYDxwLFRF4QI1RpaVyf4MsQvirxjDZprtfGvji18PXaYR05ZZVKv9J69aYE8OOkGuyusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692798; c=relaxed/simple;
	bh=ACVt7+6gXKBo1qLZczb5LUZP7K4p+KJ8AOoO9JcdoIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbr4ptdveIrJ+bP2/WlHdoW9BiyQIy+TM2rIRE8QriV8jukkK6ExKhqU73hH37J7l1UY9dgbA3cVgld6l0lhOaM3DS1kHbdVCAB/2btIyeuR6SDhu4A8uvSxcW0vmRIIizk0gH79cK2KndWHMOxFCTZtXVidYXIfRklL7vF8qwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 84E676047A; Wed, 17 Jun 2026 12:39:53 +0200 (CEST)
Date: Wed, 17 Jun 2026 12:39:48 +0200
From: Florian Westphal <fw@strlen.de>
To: Binarus <lists@binarus.de>
Cc: netfilter@vger.kernel.org
Subject: Re: Is the article "Secure use of iptables and connection tracking
 helpers" (by Pablo et al.) still relevant?
Message-ID: <ajJ5dDYrMrbkv3Ie@strlen.de>
References: <bb1f251d-fb7e-443f-8e04-8d3ee00bf7ab@binarus.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb1f251d-fb7e-443f-8e04-8d3ee00bf7ab@binarus.de>

Binarus <lists@binarus.de> wrote:
> I've come across the following article (which has been co-authored by Pablo):
> 
> https://github.com/regit/secure-conntrack-helpers/blob/master/secure-conntrack-helpers.rst
> 
> All statements of this article make sense in my eyes. I have understood that it relates to iptables, not nftables, but it seems that the underlying reasoning and explanations are valid for nftables as well.
> 
> However, since the article is 14 years old (at least), I'd like to know whether it is still up to date and whether we should follow its recommendations.
> 
> For example, the nf_conntrack module in modern kernels (e.g., 6.12.90 on my Debian trixie system) obviously does not have the "nf_conntrack_helper" parameter the article mentions. Hence, setting it to 0 does not effect anything. Setting the "port" parameter to 0 seems to do the trick, though.

You don't have to set it to 0, the feature was removed, i.e. the
'Disable helper by default' section no longer applies.  All helpers are
off unless there are rules that explicitly activate them ('-j CT
--helper ftp' etc).

> In other words, I' like to know whether we should still prevent the automatic loading of the nf_conntrack_sip module, and how we can achieve that.

No.  There is no automatic helper assignement in the kernel anymore and
therefore no helper ever automatically snoops traffic even if the module
is loaded.

The port module arguments are dead-weight and will be removed soon.
They don't do anything these days.
