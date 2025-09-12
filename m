Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85ED2749E0
	for <netfilter@vger.kernel.org>; Fri, 12 Sep 2025 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679831; cv=none; b=m1xmbF3Sw8N8076NbCS1vye3kuysc3JubwjA3VuJdq8qMpt2wqKex//Zc6qGXZD0bjToUyZwCnAWPW7PITS1/ZxZG2dhwN6tqZ++hVfKD6m9SeQd77C9+EhO+igvmiEd1pGiMM9G57hlJwTgrx2XZJaSo33MAAb1zFA+1KUipiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679831; c=relaxed/simple;
	bh=zJYOvHvCNnjeH2kPd8GGpjnH2JZciPVmmWRfToxwYaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKKQJyOui919NSBEe9633qGcUWV/qkt8WMGku8bsgRV+hIROnWwI2eEYlXdyaJaBQ2ne9W2k2KNOtnPMVVE4637yVQvq1BXneVPTWM2hrjHuOy/r5fhRI6aW6KtCZ79Q0zUZVM/S6ppMmORy/INOqzDkQAcI63qb2SBshUyP568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 7A96560186; Fri, 12 Sep 2025 14:23:46 +0200 (CEST)
Date: Fri, 12 Sep 2025 14:23:46 +0200
From: Florian Westphal <fw@strlen.de>
To: Juan Carlos Lazcano <juan@placidnetworks.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Stateless NAT in nftables with maps for performance
Message-ID: <aMQQ0vB83DCfeboy@strlen.de>
References: <1643443761.529082.1757676483522@email.ionos.com>
 <aMQMg33uIM63vKAC@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMQMg33uIM63vKAC@strlen.de>

Florian Westphal <fw@strlen.de> wrote:
> ip daddr set ip daddr map @dnat_map

Forgot the usual disclaimer: this breaks icmp(v6).

There is a reason for existence of stateful nat after all.
