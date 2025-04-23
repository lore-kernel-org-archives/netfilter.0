Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD65275111
	for <netfilter@vger.kernel.org>; Wed, 23 Apr 2025 20:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441807; cv=none; b=i9XO2yn6bwgeJefKkr5J0OwIsgK+VgC9ooFDP43SCk5FgcWhcqc/yKuPbMIlSwtD0YPmnRx118UaW9GCTfH7QNg1i3N+tFEvsvF6xRVvXfL2MZ0krRge6BkEDu3Prb06Cr7ATlZO8XqMz9mLukV9BHgkC+PX//mWmCazgxpQkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441807; c=relaxed/simple;
	bh=Obwqw1tRlj0+npbEGpU1B3WEVljZpsZdUwo1+gl2g/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3POLQTTFuX1Y7lHzLn7rbpxjtq1KDcUKPSnWYnAOY1OTMdhBB+Ud8ENnUUsKH5tzDpBb+MNH+cdAGMqzstfrn2H08Fd9PlLWu0AU9X6NUddtm2v5xFBlx9l++IsODs0VUY4d4zceW2+8Lzunct5JNO55aVmXf1Lt6Sg54x30n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=OAbx6RtN; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=OAbx6RtN; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="OAbx6RtN";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="OAbx6RtN"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id F162760902; Wed, 23 Apr 2025 22:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745441801;
	bh=145pqXqFe7UW84xWYZVS/IyiP9lQBBL451dD4Kxv7TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAbx6RtNZkQiWr8RGvJdTISCe8p/9lAzTez2Azx/qnVjneIj3KmzDVuW/KIf/bduf
	 RWKwB1LWXCmfBcMmEAA3pwCklCMCMGt/mAKE25qVhWEfBJPKvcB8vhjSCzlceBSA6G
	 ET7xorRR7EcqM80UzJUWKhcAnNVGdr1obVcD0TlIn7vq8O2VpLXUYGnn2BK4PVsmjZ
	 8vugBq/sQ63+1zBz8Mc9LThbR15R/KmXogm/LmqhRpOpUSOLPHREiRzXkVOI8GIg9O
	 hdMW+sFvX4l911Q2KUbYu/famyX5FiHJ1PZgmh3QjU3Uy+AP0yTAwp8FYBMHClNmMQ
	 oWg+Vg1ZE5Ebw==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 39552608D2;
	Wed, 23 Apr 2025 22:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745441801;
	bh=145pqXqFe7UW84xWYZVS/IyiP9lQBBL451dD4Kxv7TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAbx6RtNZkQiWr8RGvJdTISCe8p/9lAzTez2Azx/qnVjneIj3KmzDVuW/KIf/bduf
	 RWKwB1LWXCmfBcMmEAA3pwCklCMCMGt/mAKE25qVhWEfBJPKvcB8vhjSCzlceBSA6G
	 ET7xorRR7EcqM80UzJUWKhcAnNVGdr1obVcD0TlIn7vq8O2VpLXUYGnn2BK4PVsmjZ
	 8vugBq/sQ63+1zBz8Mc9LThbR15R/KmXogm/LmqhRpOpUSOLPHREiRzXkVOI8GIg9O
	 hdMW+sFvX4l911Q2KUbYu/famyX5FiHJ1PZgmh3QjU3Uy+AP0yTAwp8FYBMHClNmMQ
	 oWg+Vg1ZE5Ebw==
Date: Wed, 23 Apr 2025 22:56:38 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <aAlUBmTljaz3bD-L@calendula>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
 <20250422125351.GC2092@breakpoint.cc>
 <aAeknJtZBVycJKCm@calendula>
 <20250423091020.GA4038@breakpoint.cc>
 <aAjUNAdHpiIi1Pw9@calendula>
 <20250423120605.GB7371@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423120605.GB7371@breakpoint.cc>

On Wed, Apr 23, 2025 at 02:06:05PM +0200, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > Yes, I didn't notice either. Anyway, unless you can forecast any
> > issue, I'd suggest to backport the entire patch? IIRC patch is
> > relatively small and keeping it in sync with main could possibly help
> > with cherrypicking fixes.
> 
> Right, it would keep -stable "bug compatible" too.
> 
> Maybe its ok to ask to cherry-pick it as is for
> 6.14 and 6.12.

OK, let's request this cherry-pick for 6.12. Thanks

> 6.13 is EOL already, 6.12 is longterm.
> 
> This would leave 6.6 and 6.1 longterm out but from lack
> of bug reports so far I would not say its a prominent bug.
> 
> The upstream patch cherry-picks for all except 6.1.y, but
> AFAICS its just a simple context conflict.
> 
> Earlier longterm kernels aren't affected.
