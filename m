Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062B24C668
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741789529; cv=none; b=Y8Bdmvv6lQjvB0F+ll+e7LPAaOg7+iKm9Y4wc3I4zawzr/YTJYOzX8lD+mT9O7gV6VkKYRoqQddOJUqgBFbM4lFV5EqjrJ+l3JNIJ01+hN8Qmj66Oa3Ij7WaVt6TidrF+qwcqWuTQWm8YzTzAmppNaWoa4zXrl+Viz4eCKKI5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741789529; c=relaxed/simple;
	bh=f2IUsVm2NwxmEQi+JtGQJBuI3AHVxAQFH2M3LMMHOTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlzbLPjbPb5bLPWgc2dsg4sdishAseNKhqVecvbx6ZOp7PJ8XOCFRD/ZAw/1pGe3UeXZtXRIxfV8XbZYYZTsW7HXCXutcZ6MfwQfOJZ/DJwlogHhg7XbfKPgeZznGPd8yCjvvcK7al+lOotm3VEmB5ihh2VkPCMCfrCI2R7AYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tsN1R-0006uX-Mu; Wed, 12 Mar 2025 15:25:25 +0100
Date: Wed, 12 Mar 2025 15:25:25 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: netfilter expected behavior for established connections
Message-ID: <20250312142525.GA26496@breakpoint.cc>
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312071148.GA11288@breakpoint.cc>
 <CABhP=tbcvzOBbBPTMQK+Sz_yBvQ95_Jb-5cgJk6ziFk1nH+zkQ@mail.gmail.com>
 <20250312125142.GA23038@breakpoint.cc>
 <CABhP=tYr-QOwsxiKnJwNP_7JsybxhK-2_y1c6CEfP8nGMhgD6Q@mail.gmail.com>
 <CABhP=tbpTM70dWVxxaoJWCJ+QEjcnasD-sC0tCtFtOFrcf1rKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tbpTM70dWVxxaoJWCJ+QEjcnasD-sC0tCtFtOFrcf1rKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> Florian, do you mind if I submit the selftest patch?
> I really want to get confidence this behavior does not regress, since
> we are probably building a feature based on it

The more tests the better, go right ahead.

There is a stray "nft list counters" in there that you
could remove.
