Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9A55C29
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731326993; cv=none; b=KyATnI+77o60jHegXhjPo8WparCrE4uOZJ5mKPRYMbbSEF8iMm+JlUGH4wo1jT0HvH271e/13YAJHcbl6lyjYYtmYB6YEwiG/y+EAZTAaqIqpCKCCxW6I2SLvoOxO89R+SZjUWzetpkYmxNtjci85tjud4QVk8FgnXjwoyuFwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731326993; c=relaxed/simple;
	bh=noV/crTzkpRfNyMXc59FKA6TeEeN0FkaBspAv6Y+rRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQ/AK3O2ow6T4gZWKu+YV9n8SGIROw6goOOg2rM0jqJLXKYB8Xzcw6NEmTWCobw4xWGEnml5wsq+zFNYuWF5JjmMz5dKv5e4mkFjWrqMx+SMFKYHtt/stAJ8wSANtO/uqCBskWG30hJ8w3IR+3vFpVtDYRIZ9zM4leNgNCU2e0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tATEo-0003Xj-VB; Mon, 11 Nov 2024 13:09:46 +0100
Date: Mon, 11 Nov 2024 13:09:46 +0100
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>,
	Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241111120946.GA13430@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzHzTvYFOPcfWvRs@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > This is how it is implemented today and it works, but it does not
> > handle process restarts per example, or is not resilient to errors.
> > The implementation is also much more complex because we need to
> > implement all the possible edge cases that can leave stale entries
> 
> It should also be possible to shrink timeouts on restart via conntrack -U
> which would be similar to the approach that Florian is proposing, but from
> control plane rather than updating existing UDP timeout policy.

The time and effort needed to make something as basic as NAT
work properly is jus silly.

Lets fix conntrack so this "just works".
