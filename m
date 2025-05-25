Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E3972605
	for <netfilter@vger.kernel.org>; Sun, 25 May 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748169244; cv=none; b=QIRo7Zm1EjdHu8VfNnAo7s6mGntGEEG0MXkgJXH3Hv7TO8mWl2fz3EacQA/edLgQtGlXSYnUC2PyGZn3J4NQ4osXzO+glerpp15igGofmsoohnF6HgT9oTsJwDBNy2cTJ1+UC6eQpEkKgEI6BePhhQcSSfbptfJsVr9FN3SubsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748169244; c=relaxed/simple;
	bh=up8Lxzfj0dpFtGrXOdPbdQsbZ3Gp1kvgJ6OM65VZzpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLZVqJQVyWbhnNvV2WLmDc679du4iGVBw1DhvHv2w3KktgG93U6vzi4E4wK9iQbT/jGBk47IRSfxmVtnDu3tnFVFqaG26TPryxQUzoO5nPKQB3JM3iLgpvXUcgQRhO7+QnDCzQwhK+3lxX/GupkMcrbeQz2uQ9d8N70oJ6GGkFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 0FDEB6032B; Sun, 25 May 2025 12:33:52 +0200 (CEST)
Date: Sun, 25 May 2025 12:33:51 +0200
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: Netfilter <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <aDLyD-JCbdEz60X4@strlen.de>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
 <20250303193533.GA16225@breakpoint.cc>
 <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
 <20250303220055.GA4034310@celephais.dreamlands>
 <20250525095130.69477537@bonifac.skk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525095130.69477537@bonifac.skk>

Slavko <linux@slavino.sk> wrote:
> Please, is ARP logging working in 2.0.9?

No.

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20250420172025.1994494-7-jeremy@azazel.net/

I'm waiting for Jeremy to rebase and send v2.
