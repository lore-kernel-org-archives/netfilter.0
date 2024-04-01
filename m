Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BD2D28D
	for <netfilter@vger.kernel.org>; Mon,  1 Apr 2024 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.188.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712012387; cv=none; b=Wu+P1OZ5waRkN5UQLOfWbtGrtco9OPoZ4xQHv9Xj9gxdGVLSVLi6XyGheHv6tEjWdkG95YaGE8Z90VOmkZ+IgYEpOqOjnXFh8RjUduAq2DU60+tML4EgLpVfy035VAnnU5iy/5U1+/LChsP7pFndfuEWZvgT5wfS5LLB8ivf0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712012387; c=relaxed/simple;
	bh=BMJnz6pbKIqPmDlPyc7ctJtoy/yVW2uNso+1aOrSgYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZonelQKUpPoOzeAPTs09qtt57Ljnj+nLgJgHBk20UqN95TrtpA8W96CxZaIteyqJFf3EHrRx6a6/hrFDPNxCp3pdA1uW/KDVHSxEc3SBV1qlBLoh/rLGd6eqcjfAKhefyCW4Jd0N0eUbT+6j8cIyZna3WE0Zfq/NtZ75bNPs5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=217.70.188.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Date: Tue, 2 Apr 2024 00:59:40 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@riseup.net, netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <Zgs8XGAVd7R_TKh9@calendula>
References: <20240330194139.561b5a24@localhost>
 <f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
 <20240331170259.068a0db3@localhost>
 <20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>

On Sun, Mar 31, 2024 at 07:34:07PM +0100, Kerin Millar wrote:
[...]
> I'll open a bug.

If you agree with this, I will save you from filing up a ticket:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20240401225726.1106334-1-pablo@netfilter.org/

otherwise, let me know, I can post a v2.

Thanks for reporting.
