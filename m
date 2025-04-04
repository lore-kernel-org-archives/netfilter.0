Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF2DF59
	for <netfilter@vger.kernel.org>; Fri,  4 Apr 2025 03:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743736973; cv=none; b=EEHxFyKiZ2LbdF9+aAjrKXveGKKXIOC7UUR8y5XuLonbUJfg+w6WoRqXwJ1nAHxpkurgX+hwHgq8j/mUMejnwdTIe9jwjB8IAoFMrHtbUIRghUq0+Pe+NtXl945eUHU6aifACifbuOpMfeTxJIW+s0vrJXCjahkjZZrZE7/izUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743736973; c=relaxed/simple;
	bh=lPDYJJi5M2d2xeQXT4H6ZsB0sXfnjs2nKmFzql576Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8zk4+LrIT6NHFO/cxIe+mQBiRAqCqzeD/0gTfvwSun5Fm9L6h9vcE5kzSH2pOtbEbej8EIO3qqUwU7Dy60V4L9EJ+RxSIfPfobrfRb8MB+RPjE3ZaXDUP1aOkFtKOJFi0kYB7U7nD9Z5zZyiOpZCSVdZ7+Dc2hf4dLPUGVWpao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u0Xdn-0004cr-81; Fri, 04 Apr 2025 05:22:47 +0200
Date: Fri, 4 Apr 2025 05:22:47 +0200
From: Florian Westphal <fw@strlen.de>
To: Florian Westphal <fw@strlen.de>
Cc: sontu mazumdar <sontu21@gmail.com>, Bradley Hook <bhook@kansasdeaf.gov>,
	netfilter@vger.kernel.org
Subject: Re: Nftables v6 address not matched properly in nftable set
Message-ID: <20250404032247.GA15620@breakpoint.cc>
References: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
 <CAPrh4R6V=4W6VnCowJevFgJTMoT2fWVV1X2eKASKmhD38n_5tA@mail.gmail.com>
 <CANgxkqwR0V3LvEECApmg-d=xZKN35j663VqsUoCZj9JgQ=UKbQ@mail.gmail.com>
 <20250403182511.GA24688@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403182511.GA24688@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)

Florian Westphal <fw@strlen.de> wrote:
> sontu mazumdar <sontu21@gmail.com> wrote:
> > Hence I feel somewhere the logic in nftable/netfilter is incorrect and
> > it looks like a bug.
> 
> This set type had many bugs, you need to tell us the kernel version you
> are testing with.

Looks like its a bug in the avx2 implementation, I'll send a patch
shortly and will place you on CC.  Thanks for reporting.
