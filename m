Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656F1D6DDA
	for <netfilter@vger.kernel.org>; Wed, 11 Dec 2024 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733933051; cv=none; b=iENfD1rcO0QL2/fqqzvMcinS9mczmGVFwTjIFQ0mr6D1XMfZxydT/z7tRQ9zBWTxvvNsdRJRbgvWf1RRLA7ubSJuKm8nx1R2l60kIwmCiBu6OKPaddTIxkFBgrry2qL7K8RMNIaXpy+jXQeFRdP52f/5TNWDoIia66xCtE2QErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733933051; c=relaxed/simple;
	bh=lyxgv4boL9m8EEfmKb9rKoOnKe3mGOtMRXpgNXB28CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSSOH/Xl8JmGoWAXB02gcHvdD0kTpHYBhgLHIYEUDK3awXbbTFoHmHXnD/KXIn3M6HRUHP2KCWRtJNcAvvq/ppp8y4diZneIv2J+MZI5fzoNSxz7e15+XerlhB9qGsOGyf4R92lxJrACVcBaemxJ1nzjYIjMAcAeuQzpM0yzbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.39.247] (port=46272 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tLPBo-00DgE3-JD; Wed, 11 Dec 2024 17:03:54 +0100
Date: Wed, 11 Dec 2024 17:03:48 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: caskd <caskd@redxen.eu>
Cc: netfilter@vger.kernel.org
Subject: Re: Regression 1.0.9..1.1.1 in glob inclusion behaviour
Message-ID: <Z1m33DSjQDjPrsRI@calendula>
References: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
X-Spam-Score: -1.9 (-)

On Wed, Dec 11, 2024 at 09:40:43AM +0000, caskd wrote:
> Hello netfilter users and devs,
> 
> Following upgrade to 1.1.1 i've noticed strange behavior in the inclusion of my netfilter rulesets. Entries included via glob were duplicated. This only occurs when both -I and -f is used, due to the follwing commits:
> 
> 6ef04f99382c074c3669de31cf0a70651662b261 libnftables: search for default include path last
> 302e9f8b3a1382cf09db32541693b5df7d80ca1e libnftables: add base directory of -f/--filename to include path
> 
> Steps to replicate:
> 
> Create a directory with one or more rule files.
> Include everything in the directory with include 'dir/*' from /etc/nft/rules
> Apply the rules with nft -I /etc/nft -f /etc/nft/rules
> 
> If the include dir is defined as a command-line parameter then entries are duplicated, while without it they are not.
> This was not the case on 1.0.9 before these commits were present.
> 
> Has someone worked on a patch for this yet? If not, i might give it a shot myself.

Please, take a look, thanks.
