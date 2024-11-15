Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461C1DA23
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678930; cv=none; b=q4Ph0F/i+w5ylfZy/pHdiqsWUBc6RJw2Kq7/rj0r02fig5I0s3p9x8slyALd9I+DkgNmGPG1vENK/Y2281RH0zqHhZxnjEh0s5eaHeMwE2v0mkTkJelWOPawUXoXLi+cAIqHGjYah3T4bY75vIK5T2kTC2ZKfM0zdOjk2NeYP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678930; c=relaxed/simple;
	bh=sgnhwATGDWUFtlKSAlTg3x70AC6ZmWWl9wEwP0TGviE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V86yl2AWzwJWS0Nog/msW+EcHoPXkfk8LqVdG0X1YQ59wo5D1b2XRUc7MQebsp05pEFTkjmzTDrPNMiMequn3zsTL0XVoOh+31Zl8CJtZa9rTyZMrjowDfNxDmPb4CVUJKUmGaRmtdJm6xBwoLs90Xeynt/3+CFvubDqleZlO5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tBwn9-000836-22; Fri, 15 Nov 2024 14:55:19 +0100
Date: Fri, 15 Nov 2024 14:55:19 +0100
From: Florian Westphal <fw@strlen.de>
To: Thomas =?iso-8859-15?Q?K=F6ller?= <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: rule insertion
Message-ID: <20241115135519.GA29648@breakpoint.cc>
References: <74938b68-c482-4e54-a158-e3f379ba20c6@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74938b68-c482-4e54-a158-e3f379ba20c6@koeller.dyndns.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Thomas Köller <thomas@koeller.dyndns.org> wrote:
> When adding a rule to a chain, I can specify the handle of an existing rule.
> The new rule is then inserted after that one. So how do I insert a new rule
> at the very top of a chain, right before the first rule? I tried using the
> handle of the chain itself, but that didn't work.

nft insert rule ip filter FOO meta iifname bar
