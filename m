Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7C18C93C
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 12:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731672091; cv=none; b=WSsxi8ZpirrQ3KnzNUGW4sDfrD8tkfXPTlD2sALrQC2BqAyQg+NyBva3mZ3jimfAEnAmE+Oz6itTGGjwczgUKOuQJspcsVTMGD6cNesEYXOuH6RtJlyHZJaVC3Ik8EzgU+7cmK/02uzetL2YDSbj4wuROkJWhFruFQpqNHv8V4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731672091; c=relaxed/simple;
	bh=BFlBTrEAuvnfPtX8e2XMVhbqmR9BTGmvBOw8SXg2fks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1N2idnYhsiEH6xxdhhV4sQC4rMa54EAwVuPQ5LJyZwBz1vclLS+NKnXQUwh9REsZOm/rfnvMtPtP1643z7KpL1JjgxJXe/C8YmQuWzrRHZLEkBWzWi3wvydcSzTYNrp3ykstr204XmgTJVjwki0vAgcOY6/9OaMO8Byle2Tayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=47468 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tBv0p-007t8J-SS; Fri, 15 Nov 2024 13:01:25 +0100
Date: Fri, 15 Nov 2024 13:01:19 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Thomas =?utf-8?Q?K=C3=B6ller?= <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: Adding set elements
Message-ID: <Zzc4D1R7pTJlCDvR@calendula>
References: <209ce99a-9f22-444d-bd75-8b38865aea3b@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <209ce99a-9f22-444d-bd75-8b38865aea3b@koeller.dyndns.org>
X-Spam-Score: -1.9 (-)

Hi,

On Thu, Nov 14, 2024 at 02:53:04PM +0100, Thomas Köller wrote:
> What exactly happens if an attempt is made to add another element to a set
> that is already full? I ran into this condition and found that a subsequent
> 'nft list ruleset' would display the set with no contained elements at all.

I don't see this here.

Would you post a reproducer for a current kernel in -stable?

> I think that a reasonable way to handle this case would be to apply sume LRU
> strategy to free up a slot, but that is apparently not the case?

Could you develop your usecase?
