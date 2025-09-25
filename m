Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395C46B5
	for <netfilter@vger.kernel.org>; Thu, 25 Sep 2025 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758838417; cv=none; b=f9EJVFia0278DzvFJlF7tFss1m5c2rCokZM90a0AJhx3iCDPW7yVAQzC2sEtkUufSwRvvCW7fA3xG1cwUbzRwEMloyKq6RhEj0UPuQWQsosCugzO65XwPahsE4yJbjbLgHx/ir80Y+TWn5mAigUFDi3INlsIFXoKIomeFb685fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758838417; c=relaxed/simple;
	bh=Qhjw8qdh2cuO70Uy/ox2zI8u4Uws++uNGlx4msbO0/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6mY5vtOU1BjAu3yqP3H3WxRwAS/KPtjIViFtaDAprVvLZrbbRmjUCzl+ZHvB1L5Z5/OVKPCscUwFZOlZTo2spKDHHkJtdezyyZQWHt90BJI9zqEzFGvjSG9Hu2nENECAlI0V0EROlOwLE441UELxp2EDJ8kbesppFTwYOHRrbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id D9CD8605E6; Fri, 26 Sep 2025 00:13:29 +0200 (CEST)
Date: Fri, 26 Sep 2025 00:13:29 +0200
From: Florian Westphal <fw@strlen.de>
To: Ian Pilcher <arequipeno@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: redirect/dnat to localhost address in prerouting chain?
Message-ID: <aNW-iSAOu3C1_e0j@strlen.de>
References: <9d95db74-ba98-4712-be2a-b90cfc0239bc@gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d95db74-ba98-4712-be2a-b90cfc0239bc@gmail.com>

Ian Pilcher <arequipeno@gmail.com> wrote:
> In order to make this work, I currently have both stunnel and Apache
> listening on the IPv4 wildcard address, which I don't like.  There's no
> reason that stunnel or Apache (on that port) should ever receive traffic
> directly from another host.

You can check if connection requests are subject to dnat (redirect) via
'ct status dnat'.  This is the recommended solution to prevent 'direct
connect'.
