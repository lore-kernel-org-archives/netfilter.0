Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFC25C81F
	for <netfilter@vger.kernel.org>; Mon, 14 Jul 2025 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505244; cv=none; b=ZOH8VRPIFJfZu4zwB4gnUG/4UUuJXmx+/RrXcW32fiIYZr2KEAETipm7k8ZPLtTSMU238oHpEQT1zi10xR+FJ0cK2K1DCuPyNyep4hLrB5opT3o1oaK1pxVFsjMg0GMAuYMv8zbWDoSITczJiS5ajRomLM6uzBWTx3w4uLT62qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505244; c=relaxed/simple;
	bh=N0r1i1AX2zLlLqCEcQLtjlrNwLPEwmhDlEAOeav+Jkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doWn9zaWn8UrOTpSitazSzxv025REbV1U/ikQkg16bDUFjJf0Ci+9BK9O4Vm+8hMd0AeYLrtxxKVj1ZzwpqV6tWegRMFtxbZrXL90S2pFZSUCCVJzxkDX/wJNlrdPjGlhTlBADrUpSoSgcAHdrmJPl+QRaFWip+bVKmpUBv46Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 81872612D8; Mon, 14 Jul 2025 17:00:39 +0200 (CEST)
Date: Mon, 14 Jul 2025 17:00:34 +0200
From: Florian Westphal <fw@strlen.de>
To: Niklas Beierl <niklasbeierl@posteo.net>
Cc: netfilter@vger.kernel.org
Subject: Re: TCPOPTSTROP can be repalced with undocumented "reset tcp option
 opt"
Message-ID: <aHUbkoEEVmK9dw-_@strlen.de>
References: <4c0c089d-cc53-4375-bb01-c34a858809bf@posteo.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c0c089d-cc53-4375-bb01-c34a858809bf@posteo.net>

Niklas Beierl <niklasbeierl@posteo.net> wrote:
> I found myself in the situation of needing the behavior from the legacy  
> TCPOPTSTRIP target. On the netfilter wiki, this target is listed under 
> "Unsupported extensions" with the very brief comment "consider native 
> interface, need to extend nft_exthdr.c".
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Supported_features_compared_to_xtables#TCPOPTSTRIP

I've removed this bit, its outdated.

> reset tcp option OPT
> 
> which seems to turn the selected option into NOPs. To my understanding 
> this is equivalent to  "-p tcp -j TCPOPTSTRIP --strip-options OPT".

It is.

> I think this should be mentioned in the wiki on the Mangling packet 
> headers page and also with regards to replacing TCPOPTRESET. How can I 
> make this happen? Can I get credentials to the wiki somehow? Should I 
> instead write it up and send it to someone?

You could send a patch for iptables, specifically
extensions/libxt_TCPOPTSTRIP.c and add ".xlate" support together with a
libxt_TCPOPTSTRIP.txlate file (with tests).

Then the wiki could link to that just like it does for other supported
extensions.

> Furthermore, I would like to understand (and document) the general 
> syntax for setting tcp options. I am especially curious whether tcp 
> options can also be set if the field is not known to the netfilter code.

Whats your use case?

You can do
tcp option @255,8,8 255

(locate option 255, offset 8 bit, fetch 8 bits), then compare to 255.
Same syntax as raw payload expressions.

> I guess there are issues with encoding the cli-passed value 
> appropriately in the header field?
> 
> Lastly I was wondering whether it is also possible to add or entirely 
> remove option fields from tcp headers - as opposed to just NOPing them?

Not at this time, its more expensive since data needs to be moved.
NOPing is much simpler.
