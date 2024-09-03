Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D61A0BCB
	for <netfilter@vger.kernel.org>; Tue,  3 Sep 2024 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356637; cv=none; b=RUoN8M7Qp2KQ/amLv/4VTEzEUUzdNvmeDaijKWvhzWUzdAgq5AimyuIBMRKqiwOmj3unDOcEhrlJCFPewPeVFJOv/cztZY1WGoHIXleI8FGCmAZ78Be0bU133IcWy5Y9CIE7UsworK1fmGfbfV9joob62khRK1cTon7Hr3RyC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356637; c=relaxed/simple;
	bh=7wQEKsCMYBqc1GCidd+UlSqRHq3qA+0txtweMxAo1QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+6iYNBuZ2woV811z9gJzKbQwoUqVHb7ignBhwW9p6d9WR2TMM+NG8cdSgS6zX71nPngIfYCpvVCzUwlVxbIK1guBXTlTF4Hi1jMQI/5J3BceHqE5fKRHtD81T6CfvRHQAOdK49Hgiyt5tJb52PdDVlfeAw8JFqijH9BDciJ2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=59244 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1slQ4l-00AJBu-11; Tue, 03 Sep 2024 11:43:53 +0200
Date: Tue, 3 Sep 2024 11:43:50 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw payload expressions are mangled
Message-ID: <ZtbaVgOFLwFIr4ve@calendula>
References: <DZC45RRhLNfzeCW9I6ahm9glqdw7JeVCHAtNRmJKEGsvLMzUaU1kI-yv-5rVp2mJq3dJPyHN2yWVbSiwc7JWWvZOf4GXBmtiPpYZS9zVKEo=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DZC45RRhLNfzeCW9I6ahm9glqdw7JeVCHAtNRmJKEGsvLMzUaU1kI-yv-5rVp2mJq3dJPyHN2yWVbSiwc7JWWvZOf4GXBmtiPpYZS9zVKEo=@protonmail.com>
X-Spam-Score: -1.8 (-)

On Tue, Sep 03, 2024 at 07:58:56AM +0000, Sunny73Cr wrote:
> Hi, I am attempting to match ntpv4 replies inbound to my machine; like so:
> 
> udp sport 123 dport 123 @ih,2,3 0x4 @ih,5,3 0x4 @ih,8,8 0x1
> 
> In english, this is: "ntpv4 mode server stratum 1" (there are additional checks for poll, precision and reference, though they're not neccesary here)
> 
> After loading the rule (among others) with /usr/sbin/nft -f (in a config file) on Debian 12 Bookworm (not yet updated); the rule shows as:
> 
> ip daddr 10.0.0.5 udp sport 123 udp dport 123 ct state established meta skuid 996 @ih,0,8 & 0x38 == 0x20 @ih,0,8 & 0x7 == 0x4 @ih,8,8 0x1
> 
> It seems bit-level checks were aligned to '8 bit boundaries'. The resulting expression is technically correct, though it is (as far as I'm aware), only minimally faster.

raw expressions only support operations at byte boundary, you have to
use bitwise (&) expression to narrow down the scope of your matching.

> I would prefer the output to remain as I had typed; as I did not ask for NFT to optimise the ruleset as of yet, and I need to spend much more time validating the configuration.
>
> Is this optimisation able to be toggled off?

No.

You can file a bugzilla ticket to request an enhancement, maybe
someone will pick it up at some point.
