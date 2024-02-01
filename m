Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3224D9E2
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706780497; cv=none; b=h9261YyUBgw9N7n9EnsC4QTpnYRH4My971qLJqpoQNgK4s0c4gnxvC54tZrsAL8r8XbBYeXcJr/2ggUF/AQ7bWqiD2m9+6+0Oh3y3D+C/MWk90GDfr5qaSOZIvqeDaBWwgBeO3lyW153btjPWAJQiWU7CIdJ5c4AhMB9Wr9hN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706780497; c=relaxed/simple;
	bh=PdTr+FzVEvfQsXRHcemwgxo/UuIA81nFeQCbiaLilEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbmVfbxxL0hUc8QaqKgkT1fiHT85Dy73m+AHSZdQqjQI+Y43zKTpGxWNLcLEnpB0zDHOAH2MEAK7Afr7LZK2sbZodcUfCV4+i5rd8mwhcdUtqhpWeAmbSz3QYkqqFVhi2hmAdGqahIo2KS0Psr1lG3KrqEem7vwWQnyZLaAX9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.41.52] (port=44990 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1rVTZT-000Jn0-40; Thu, 01 Feb 2024 10:41:26 +0100
Date: Thu, 1 Feb 2024 10:41:21 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Anton <anton.khazan@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Is there an efficient way to delete multiple elements from a set?
Message-ID: <ZbtnQXFtUTkVRZ0C@calendula>
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
X-Spam-Score: -1.9 (-)

On Wed, Jan 31, 2024 at 10:14:41AM +0200, Anton wrote:
> Hello, I've been experimenting with nftables sets for the purpose of
> geoip blocking. Let's say I'd like to add ip blocks for multiple
> countries to a blacklist or to a whitelist. Perhaps the most efficient
> way to do that would be by combining all required ip blocks in one set
> (for each family). However since country ip blocks are a moving
> target, I would need to regularly refresh parts of that set. My idea
> was to delete all ip addresses corresponding to an ip block from the
> set and then add the updated ip block. The problem is, this is very
> slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> ip's from that same block takes 14.5s.
> 
> This is how I'm doing the deletion and the time measurement:
> printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> | /usr/bin/time -f %es nft -f -
> 
> (the test.set file stores a comma-separated list of subnets)
> 
> Is there a more efficient way to do this? I could of course flush the
> set and rebuild it every time I need to update some part of it, but I
> thought I'd ask before deciding to implement that.

It is possible to flush the set and fill up with content again:

flush set inet test testset
add element inet test testset { ...  }
