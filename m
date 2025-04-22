Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBF1E9B12
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322236; cv=none; b=ix4p/gMrDLvf0ebZizM/fra5oqqPCpLMLoiw+m/nws8+twcdCEUURnSJiK2ameOuK0lHrx4vng391maOp/N+tKYs64Q98cdVdVrrIxx20yMihGFSe0JiXiSaSlk3jqvcJXdTszo/VMwA6Fl/meK+LAAyiNWQgkc0nL5OGLNm8LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322236; c=relaxed/simple;
	bh=bp62taa4Y4mQ3knHNA/WYCvYP0Kj6FkLUuWaX9nte/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm9mP9r4EDrpLhK0UsVmokOBkeN0Bwa/h3oBfnBeFhGfZrZv+p1vl8VkYOl05G72uEdaaY7+B/8Gfe34UvC/dMkU+nI5L0ESuAqwVvXLEm8DIm7fifAPAooB2v8BKNoeMxQTyVAIGDgsBpkJS6Fqqp9sxTvKC5w/E5yfP5k2Fo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u7C2a-00010Y-5g; Tue, 22 Apr 2025 13:43:52 +0200
Date: Tue, 22 Apr 2025 13:43:52 +0200
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250422114352.GA2092@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> Hi all,
> 
> i encounter strange problem with reverse path filter in nftables,
> which i don't understand, thus i ask for help.
> 
> Some background -- for long time i have on my desktop (with
> some bridges/veths for LXC, VirtualBox ifaces, and one dummy
> iface) this prerouting chain (to shorten it i removed counter and
> log parts):
> 
>     chain r_prerouting {
>         type filter hook input priority raw; policy accept;
                           ~~~~~

This is an input chain.  The loopback bypass is restricted
to PRE_ROUTING before v6.15-rc1.

(This is an oversight, originally fib was rejected in input chain, and
when that restriction got lifted the lo bypass check wasn't adjusted).
