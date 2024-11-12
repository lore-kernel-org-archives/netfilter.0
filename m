Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940D1FF5F2
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731436090; cv=none; b=VUn7JO876qgX0N9YXrsXZutwSrgs6RDTsMGewNQknP0nVpa58ndJKho/wfyIAepFFItMwVhJvmy8pzb3OPopBxRwWkuZYgQLE4pnrQrtAXUPcbLJRFvMaJsLVvXe5fN3HaHL3C3r3DGi3iCAxfwdb9Ahfu9h2U4iFQSs1D6fzas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731436090; c=relaxed/simple;
	bh=rVIOE4io/+mDhw4+pB77JtmTa2jBLSW4lAO/Z8RuY4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7qE3VArMlEVKvJ+2ZSTp5mnULqOwr0Ry7Vj+/btAqucmVCbvg/xJfZR9evfKHf7413q64FhaPbj9fS+LoB5gijH1ZLEWwCGlYxYi64zvSJDSiD9T7CZNQZC6gtbHEyRulsukOfchLl0uh7mztSxPnNwvKoqxajhjjp9PpXDPhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=40814 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAvcR-009Lsr-Ay; Tue, 12 Nov 2024 19:28:05 +0100
Date: Tue, 12 Nov 2024 19:28:02 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Subject: Re: ipset vs. nftables set
Message-ID: <ZzOeMjXumDU7e7WL@calendula>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
 <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
 <2BDA8DF3-425E-44B6-A477-F088C404BFDD@slavino.sk>
 <ZzObEveL6rLYzv-b@calendula>
 <20241112181855.GA28817@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112181855.GA28817@breakpoint.cc>
X-Spam-Score: -1.9 (-)

On Tue, Nov 12, 2024 at 07:18:55PM +0100, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > > But one can have multiple hooks (chains) in one table, even with the
> > > same priority (i not suggest that). Thus one can combine multiple
> > > tables into one and share sets, eg. in raw & filter hooks.
> > 
> > Don't do that, please.
> 
> Why not?  Single-table approach makes sense, in my opinion,
> provided that single table is controlled by single entity, be
> that a program like firewalld or traditional sysadmin.
>
> With multi-table things become awkward due to the imposed
> scoping rules that prevent cross-table use of sets/maps.

Sorry, I misread this email.

Single table is indeed the way to go.
