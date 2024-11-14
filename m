Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888E2905
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731617247; cv=none; b=g6cNEe54NMo9ILuPDRtT7CoRxpu+JvANOKT1rLmjvRW/hx/tspwhoBGYh1BiFiEhX6RjCwvroziO8AlkdSV9xjsL+mRAPlcqlCbRrlQ+sIlggCL3zvZ+mq7Y9qIKWGgOsJkN9xfvCrtOp8DdQfcDVWQIq9umoli/1G2BdrKTTzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731617247; c=relaxed/simple;
	bh=xpWu0TFVEgjYGd0u91XhQYDnaArX/ybcFJipNh4FCeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQqP3WAAk+iGDciWZxoqlNFhXsGHuNnULMwdCSvbcBoep4/KePAr0hBhCARWEG+6KWcfKtDhsf32oGTMn0oBN7CsfcXwNaC2c7jpdt/mXcWu0PObeE26kzn/nY+4UlRjCz44K0IL5Lxtn8sT8AHBPFZXl9+SSVuZXWQ2ZKatZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=44252 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tBgkI-004Ega-Rk; Thu, 14 Nov 2024 21:47:21 +0100
Date: Thu, 14 Nov 2024 21:47:17 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Thomas Koeller <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Subject: Re: Dropping of the end of a chain
Message-ID: <ZzZh1TM96YVgTl8y@calendula>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
 <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com>
 <ebdf9189-3a2e-4501-aa07-a29fbc4d713f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebdf9189-3a2e-4501-aa07-a29fbc4d713f@app.fastmail.com>
X-Spam-Score: -1.9 (-)

On Thu, Nov 14, 2024 at 04:26:42PM +0000, Kerin Millar wrote:
> On Thu, 14 Nov 2024, at 3:51 PM, Kerin Millar wrote:
> > On Thu, 14 Nov 2024, at 2:01 PM, Thomas Köller wrote:
> >> The nft manpage states that if the end of a chain invoked via 'goto' is 
> >> reached without a verdict, 'evaluation will continue at the last chain 
> >> instead of the one containing the goto statement'. I cannot make sense 
> >> of this; what is the 'last chain'?
> >
> > To say "last chain" is highly ambiguous. I suggest that it be rewritten 
> > as "evaluation will continue as if the invoking rule had instead 
> > specified 'return' as its verdict." Such would be simple, coherent and 
> > correct.
> 
> I just re-read the relevant section of the manual, which is as follows.
> 
>        goto chain   Similar to jump, but the current position is not pushed to
>                     the call stack, meaning that after the new chain evaluation
>                     will continue at the last chain instead of the one
>                     containing the goto statement.
> 
> I think that the language is reasonably clear as it stands, though it is lacking in punctuation. However, I can see how some readers would be thrown by the use of the world "last", particularly those that do not understand the concept of a call stack.
> 
> Perhaps the following would be clearer, without unduly diminishing the technical nature of the language.
> 
>        goto chain   Similar to jump, only the current position is not pushed to
>                     the call stack. Consequently, once the evaluation of the new
>                     new chain has concluded, evaluation shall continue as if the
>                     the invoking rule had instead specified 'return' as its
>                     verdict.

This extract is very similar to what there is in the iptables manpage:

        goto chain   Similar to jump, only the current position is not pushed to
                     the call stack. This specifies that the evaluation should
                     continue in the specified chain. Unlike jump, return will
                     not continue evaluating in this chain but instead in the chain
                     that called us via jump.
