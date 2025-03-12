Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80DC23E229
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783907; cv=none; b=iSzCiHYzB9MMshF182ZHCEz5O1+PbB4obUwYTnxtPqpPnklFbeB9agOjCMS0929MsICkEY3x4okX1QxkxlWgmt8tZvPcvC+MWruW0YKy9Zarny1mgkkb/juwSraI19lnHhWWwDmJwrakzcD8VnF7alNK9u3/I6vcu1qhiQN9w3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783907; c=relaxed/simple;
	bh=55wuO5KWnNCuPTLjGn6vLFD5oTt0ODS6DzLkF9IMvdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6B7L363VCQErYnXL1OHS/Ow48Mvit7JW1Y6MZ6SjBi1N8ZkbyVUX827/PQnpNfP2wmca+3RcgZF0vr6VyETAlv8N7wqr8twr0zb6r/b1pJlYmZ7/ZGJelXThB/9rBP8MKTGSwEvn1KYCpkDCMhY+5pMfQmdkMihL2E1sT2eK7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tsLYk-00060T-Kc; Wed, 12 Mar 2025 13:51:42 +0100
Date: Wed, 12 Mar 2025 13:51:42 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: netfilter expected behavior for established connections
Message-ID: <20250312125142.GA23038@breakpoint.cc>
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312071148.GA11288@breakpoint.cc>
 <CABhP=tbcvzOBbBPTMQK+Sz_yBvQ95_Jb-5cgJk6ziFk1nH+zkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tbcvzOBbBPTMQK+Sz_yBvQ95_Jb-5cgJk6ziFk1nH+zkQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> Is there some kind of optimization that just directly copies the data
> without going through netfilter hooks or am I doing something wrong?

Looks lke whatever environment you are using has bpf progs in place
that change packet flow, or some other proprietrary modules.
