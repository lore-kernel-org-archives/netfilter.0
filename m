Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B212F0C7E
	for <netfilter@vger.kernel.org>; Mon, 10 Aug 2026 01:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786326818; cv=none; b=U+iCgaAybNsUsvuNmxthTuOqCfdWES5Nj4QVKOGwMW/I7k6UgpQ46R3K1Q/FmSvzAuKylYraHCq11fqLnwoMMDXwjf3XRXRwDXUBPHh4UPxRv/Fc0vJS10thW37DA093hSSwQFZmweWF2/qQm8jZdJRc8k6na3DTIfOZin81Zog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786326818; c=relaxed/simple;
	bh=NFQEUbe+mxN/jsnY1A+p/DU9mOdYV4eSuyrUA9Ba/W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0pYOjVzWfvyW76z4o7NRsXytItb1614FWPRA4KKUun5/rxcbGXkAc2hOrOIrP02AAdk2/mbp1RWtC2k0+Th3tpF4lLPI/txo7fEl19ArQr+nw3M/87RHu5dsDwXldxoG5+V5yrJhcyFcpKK7Czf0iFxqSushJpLS2jOXzQ0Tw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 3C23E6051B; Mon, 10 Aug 2026 03:53:33 +0200 (CEST)
Date: Mon, 10 Aug 2026 03:53:31 +0200
From: Florian Westphal <fw@strlen.de>
To: Julius =?iso-8859-1?Q?R=FCberg?= <julius.rueberg@student.kit.edu>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables set/map operations failing in user namespace with Linux
 7.1.6
Message-ID: <ankvG2B0B35KbGen@strlen.de>
References: <582d218b638be68342dd80893c41746b35c1be76.camel@student.kit.edu>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <582d218b638be68342dd80893c41746b35c1be76.camel@student.kit.edu>

Julius Rüberg <julius.rueberg@student.kit.edu> wrote:
> I'm reaching out because I'm encountering an issue with nftables using set/map
> operations (e.g., ip6 daddr set ip6 daddr map @forwardmap) inside user namespaces,
> introduced somewhere between Linux 7.0.12 and 7.1.3.
> I don't encounter the issue on the LTS Kernel (6.18.43).
> 
> If this is now intentionally restricted,

Yes:

commit 968cc2c96390f06e56ed6a43f935bfebdefed28f
Author: Florian Westphal <fw@strlen.de>
Date:   Sat May 16 23:23:21 2026 +0800

    netfilter: disable payload mangling in userns

We should be able to lift that restriction in the coming weeks,
after stricter offset/length validation is in place.
