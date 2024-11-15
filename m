Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417A16BE2A
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731661174; cv=none; b=LfoRP6G2kZdNME6Y6yCQWDZSp6hcbqy3u2AfDg074dDtReuyrEUUEBmShDkSM5IY0b/pPFwV7icIwY42pIHflBSHTXOO9uvSw7uRYOSBJe7NHVsJKXK485xZPQAbU6oBkMYRjsds6kcPjjWi5tQEJYrlPQEiw7TajOc3lC8RiiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731661174; c=relaxed/simple;
	bh=tFH/jE9t8taE9++oG5eM83HnLqrgSdnNot0QbPC8U0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLIPx8ht9XgFRs0XZYNiifybuLgHHRsNHVuCu9uXzNY8ur64XpdoqEOsSTVsKY1hYOrBmh616L3QObfjwJ4icBz65cMBrqYOFPsFTYt260GHpddK5HYkTs5Aqva21GHpIrUhVFf9HF6p99Gn48+MHsDZQZ1i1uj/9OUP699D7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=49284 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tBsAi-0078zE-OB; Fri, 15 Nov 2024 09:59:22 +0100
Date: Fri, 15 Nov 2024 09:59:19 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Thomas Koeller <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Subject: Re: Dropping of the end of a chain
Message-ID: <ZzcNZ4rUZSAanR6i@calendula>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
 <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com>
 <ebdf9189-3a2e-4501-aa07-a29fbc4d713f@app.fastmail.com>
 <ZzZh1TM96YVgTl8y@calendula>
 <3eb90ede-c19c-409e-a882-e068efeda7e7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3eb90ede-c19c-409e-a882-e068efeda7e7@app.fastmail.com>
X-Spam-Score: -1.9 (-)

On Thu, Nov 14, 2024 at 10:06:32PM +0000, Kerin Millar wrote:
[...]
> To my mind, there are some issues with the above.

It is hard to explain this feature in Simple English, which does not
look like a technical specification or RFC, in just a few sentences.
Even iptables manpage description is not good enough.
