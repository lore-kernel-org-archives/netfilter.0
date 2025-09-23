Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67632340F
	for <netfilter@vger.kernel.org>; Tue, 23 Sep 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645008; cv=none; b=nvuL/HpvZtxcuOSz3xcw2n/L+ZLcmMuGrNZlXq0+YX3kxalK3gvrrsnBzyQ4rO8J5pLq/boG2nAgXNaclUx0nt3K9HN4J7RMXzEJiRGY1b9Epf7lwoP5LHKezfy4EdPihYkYY2gh5CSU0m81yBPft9Wfd8rJ8mShdw68xhpAWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645008; c=relaxed/simple;
	bh=0vDKcK4qTeRb+cgQO8pvvBAyL+aAwBFvjOsuvjTTCHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTke/5rcFfgwd1AJB+7sMoC5lA2oQ991A9FYBXnSA/S3lCG5scVzpmG+nIb13z6yg8DdHQedlCJxa8aEQ2/+ZPyKeTF21om+s7YM7dPWBCGg/S17GQHT1eK/Z6s5GsI/B/T4wtDdQMZ4PiW0K7/V/2a52COTPBrWwLqlSJO4QOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id B878D5F8CE;
	Tue, 23 Sep 2025 18:21:05 +0200 (CEST)
Message-ID: <6ab4cb4a-5e85-4178-bfa9-cb5f801a0f04@emlix.com>
Date: Tue, 23 Sep 2025 18:21:05 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "nft reset counters" bug on 32-bit systems
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
References: <c64ff2d8-5ca6-4031-bcc8-9ecfee833665@emlix.com>
 <aMG-m6RSgi2y4cet@strlen.de>
Content-Language: en-US
From: Andreas Fried <afried@emlix.com>
In-Reply-To: <aMG-m6RSgi2y4cet@strlen.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/25 20:08, Florian Westphal wrote:
> I'd suggest to turn nft_counter_reset() into a variant of nft_counter_fetch()
> that uses local_xchg() instead of reads.
> 
> Expensive but reset requests should be rare and its much clearer as to
> what is happening vs. this
> fetch-and-then-add-negative-total-to-one-pcpu-counter.

I'm afraid I'm missing something here. Wouldn't this be too expensive?
nft_counter_fetch() can read the stats from other CPUs without issues,
but that won't work for writing, i.e. local_xchg(), right? local64_t is
only atomic with respect to one CPU, so would we need to schedule work
on each CPU to read and reset the counters?

In d84701ecbcd6ad63faa7a9c18ad670d1c4d561c0, Pablo Neira points out that
cmpxchg will not work unless all other functions also use it, and that's
too slow.

What am I missing?

-- 
Andreas Fried
 
emlix GmbH
Headquarters: Berliner Str. 12, 37073 Goettingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of Goettingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner

