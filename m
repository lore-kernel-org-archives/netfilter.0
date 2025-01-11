Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3727184E
	for <netfilter@vger.kernel.org>; Sat, 11 Jan 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736598832; cv=none; b=Zdig6W9SXlDZR+F/2FPNL9ab+RREsq6zaeHgdVoIeJTK/FZzSFANOC01SMoGmjzBPotZvxsL5+BA72LdMdL3QnttHMBtmwe4fCpTEzwYQwsGSM/YYCQVyStGSdngWJQxdxsGzd8ItFYgc5ePvPmf6gn5UMBHeDKzy/HhBSf++2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736598832; c=relaxed/simple;
	bh=u3zqMfPBEiD0Lkq1439NtraRXTC6SLIR8dqfVbe4qqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIezFUc72D4pXB07khdQT/RHdNaB24NdO4Lax3NNvS0Gzt4dNnKUSe9gORoViXQBP8vpyzIpft5no62mEU+GNZqGOYVZeQgbpKuy5Yssve2Q9BS8D2QEEQthVXETVX+vlA7k1ZZ6RVpG0CaRxECs6CZNc+tpgU/XoevW11AVevk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tWagN-0003tj-Rz; Sat, 11 Jan 2025 13:33:39 +0100
Date: Sat, 11 Jan 2025 13:33:39 +0100
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: list sets
Message-ID: <20250111123339.GA14912@breakpoint.cc>
References: <20250111110759.6bc33181@bonifac.skk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111110759.6bc33181@bonifac.skk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> recently i start to use fail2ban with nftables and it works. It uses
> separate (configurable) table for its rules, where it puts particular
> sets.
> 
> But i noticed, that while i can list all sets in nftables, or limit
> that list to particular family, i cannot list sets of only one table:
> 
>     nft -t list sets inet f2ban
>     Error: syntax error, unexpected string, expecting end of file or \
>         newline or semicolon
>     list sets inet f2ban

Try "list sets table inet f2ban".
