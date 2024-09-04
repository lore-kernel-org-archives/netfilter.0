Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDC1CF5CB
	for <netfilter@vger.kernel.org>; Wed,  4 Sep 2024 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447191; cv=none; b=Qj9mpgjIXUQaFCNy/tsg1jn2paxkF2G+2BsWD6ROvQc9hfK6tWqDsGWEjVmQCtsSOC0cdDZXFuPU5aukpJhRb80Se7D7CgTQxrC1XcC+VOw5xx1pdQcuW+THCHhVuWA64zaHE04OAJ9S8Ri/E/pzrEzAKw9kge7/CQYBkKH35uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447191; c=relaxed/simple;
	bh=zimnwCH1k59mAk9lAMgVjRnMkVIYQp+XQgWBnQT6StA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGzZ3Ahzf23qv+Ch/H3cpGF6L8sZfnP46culh0eTDCdGurEU23kj89whzRh2nzwU4kD1d2j5BiXpmXBih5TZzEtnhrJB1N4+5q5gBACMpWCqbwaY6yRli+6I7Z5/mDJ2fJiYYO/9kUZf0rrRPnRBY0cTjwIAAKpJ6hlpu2un5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=35350 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1slndI-00ByTx-0x; Wed, 04 Sep 2024 12:53:06 +0200
Date: Wed, 4 Sep 2024 12:53:03 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables are non-deterministic
Message-ID: <Ztg8Dy05CDxShwzq@calendula>
References: <ce0df381-389f-44ce-93ab-c1f8db5faea6@gmx.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce0df381-389f-44ce-93ab-c1f8db5faea6@gmx.com>
X-Spam-Score: -1.9 (-)

On Wed, Sep 04, 2024 at 09:02:29AM +0000, Artem S. Tashkinov wrote:
> Hello,
> 
> Connections to a certain port are _randomly_ delayed by up to three seconds.
> 
> This is not down to the service, it works perfectly.
> 
> This has been happening for the past couple of years. This has never
> happened with iptables.
> 
> I wouldn't want to share my nftables config, so if someone's willing to
> take a look, please give me your email so that I could send you the
> config privately, off-mailing-list.

I received it, it certainly looks to me like an issue in your ruleset,
unless you prove otherwise. You cannot drop a ruleset on us a expect
to debug it for you.
