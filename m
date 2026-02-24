Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD339B4A0
	for <netfilter@vger.kernel.org>; Tue, 24 Feb 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937874; cv=none; b=lebOZeVZnEZ7ov9KihcH6gmSgerOkDuX84Fg5E39bE7BcJvHp4RfR5ki8N3OebZ7BjuGAT+uCD3IiP5tm9JbXsnVYpPsfB3XY+R8pkx8rNDOvwRZR0aU2PRkr4UjfnULhdg/6NWvXnlNTfucrhn0oFG5GrC8566D95503VO6D+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937874; c=relaxed/simple;
	bh=SDyGrUndaPAqPIVD5M0cXGhrQhKj12TzAkGnsjlgRmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7pXXID3Tefwvz+JTQyNOfHDbgQ5C3rkvtEGwBs10I7VMS7ku8MpU8tYpnCMCpFr/j1TgmiHTkiyYu5xipyGvqPjopoCvrHcXosibRFOd16blJH2SBvA5gd33AvRUBgEwuQDCywGQhgkWUuLJosC/2CfOjvSnPK55MHQHK0OpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id BC873604AA; Tue, 24 Feb 2026 13:57:51 +0100 (CET)
Date: Tue, 24 Feb 2026 13:57:51 +0100
From: Florian Westphal <fw@strlen.de>
To: Subham Pal <subhampal789@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Atomic ruleset update through libnftables
Message-ID: <aZ2gT3iiXfxZT2en@strlen.de>
References: <CAHeizqEqDQYVs6mBOC4GPhBT6h9ikfkhYD455jUDXvjfQQ-ZRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHeizqEqDQYVs6mBOC4GPhBT6h9ikfkhYD455jUDXvjfQQ-ZRA@mail.gmail.com>

Subham Pal <subhampal789@gmail.com> wrote:
> I am writing a firewall program and intending to configure nftables
> using libnftables userspace library. The plan is to use
> nft_run_cmd_from_buffer function call, passing JSOn input to its
> buffer.
> 
> If I provide a set of rule updates to this function, will they be
> applied atomically? The manpage does not seem to elaborate on this.

Yes, its applied atomically.  You can validate by running 'nft monitor'
on another terminal, this will show you when a new generation/config
arrives, and what was added/removed as part of the update.
