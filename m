Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13A21FF35
	for <netfilter@vger.kernel.org>; Sat, 26 Apr 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745659495; cv=none; b=R2ET3pqj83/OrzAIi7XKhC6BFIMtAaXMqY3yz82BfBRdA6NLZAW3Vof92JAEMzjSTpaBtMN8+LmjoMAZqj9Er3UNN3QmHST5XIg4QkkGSMJ6ZRgqs8OfJMG82boY+oeupyprkoYr7QoA/U3geEN6U85RVBLngZCXJiARRpwmh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745659495; c=relaxed/simple;
	bh=sZqkjtzVTQ7lRexu6rMR09VtcK7GLm5g6bwzZ9odsRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2bZIMy52qgKVNausVCY+iGA7+b/R2698Y9Mn6TCYFdKbiJo8yNPmxMU0dt0EpK6mj2uq738DA96KsEuTqOEFhpkYf4cxsamoTxacvSRqKdfGqM2pcsLTkyjiNlmR8He6BQF7ydbyRkbJ0/P/llI6IA+WoLkjQwLIMfrbg3qnDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u8bmC-0003eZ-0B; Sat, 26 Apr 2025 11:24:48 +0200
Date: Sat, 26 Apr 2025 11:24:47 +0200
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250426092447.GA13989@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <20250426103921.48f3255e@bonifac.skk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426103921.48f3255e@bonifac.skk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> > This is an input chain.  The loopback bypass is restricted
> > to PRE_ROUTING before v6.15-rc1.
> 
> That opens another question, as i have in that chain:
> 
>     chain r_prerouting { # handle 1
>         type filter hook input priority raw; policy accept;
>         iif "lo" notrack accept comment "no lo conntrack" # handle 15
>         ...
>     }
> 
> Why this notrack works?

It doesn't work.

You either have no conntrack active at all or you have another notrack rule in
output ("lo" is picked up in output, not prerouting).
