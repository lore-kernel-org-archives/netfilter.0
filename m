Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843F135A65
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647546; cv=none; b=RPuNS4SsuPEqpOxhK8FR5XQT3S5hmtSbbJUo8shzyoqix4s/9bEiJBqt/7nxQpzIDj3JwgEXDtXsn30tLc3768IBEyJ+vwmVACM2H3FDL55f38aP/wbFfEtXqEEXPCmVwYokQOWxGjD3IU27q13ztXm5CIDqUO7L02zNkbFfaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647546; c=relaxed/simple;
	bh=1ZLcKt3YvYw3shA+Z+zH+KEtgJBoWz9iAZWA58HrtWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmGLYxb2z+GVtD5e0fawbCfVWym1iDfadY0Gy6rBiDPSFRlLScbOaMEPi733F1WZ/TO4LfesGbGyXKdm4apX3+r7aPRK8iFzdc3pDvAFQh1DTkIMl9KfdDeUtVEwQ7mQqS76MnEZ96m5X+3hNTNKAg8S9Xyd/E5MhrHLK6YCuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sRf1h-0000jk-8h; Wed, 10 Jul 2024 23:39:01 +0200
Date: Wed, 10 Jul 2024 23:39:01 +0200
From: Florian Westphal <fw@strlen.de>
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rule optimization - evaluating efficiency
Message-ID: <20240710213901.GB550@breakpoint.cc>
References: <20240702190318.618a3933@localhost>
 <20240710183451.0f193976@localhost>
 <1c12afa3-40fd-48df-9076-92277570ef3b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c12afa3-40fd-48df-9076-92277570ef3b@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Kerin Millar <kfm@plushkava.net> wrote:
> On Wed, 10 Jul 2024, at 7:34 PM, William N. wrote:
> > On Tue, 2 Jul 2024 19:03:18 -0000 William N. wrote:
> >
> >> [...]
> >> Also, it is not clear what is the actual "load" of different
> >> instructions in terms of CPU cycles and memory, i.e. one instruction
> >> may look as "one" but may actually cost more than another 2, right?
> 
> Indeed. It cannot be presumed that all instructions are equal in expense.

Yes, but then again nft will try to make reasonable choices.

tcp dport { 22, 80 } will not allocate a huge hash table for two values.
Is it faster than
tcp dport 22
tcp dport 80
?

No idea.  And given the volume of bugs I don't really care too much.

> >> What is the proper way to evaluate and optimize rule efficiency?
> >
> > Are those difficult or somehow inappropriate questions?
> > Or is there a better place to ask?
> 
> You are enquiring as to how to assess the relative efficiency of the bytecode instructions through the direct understanding of how they are processed by the nftables VM. Said VM is unique and - as far as I know - wholly undocumented. As regards difficulty, the intersection of people who follow the list and possess the necessary expertise can probably be conveyed quite comfortably by a single digit. It is a pity; I would also have been interested to see an informed reply but the absence of one wasn't altogether surprising to me.

The additional issue that its hard to give a useful answer.

Use 'perf record -a ... and pktgen' is likely a rather useless reply.
And might even incorrect depending on what one wants to measure.

In general, its best to compact the ruleset as much as possible
and use sets/maps/vmaps wherever possible.
