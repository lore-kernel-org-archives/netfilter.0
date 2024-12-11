Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7AD2288D7
	for <netfilter@vger.kernel.org>; Wed, 11 Dec 2024 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733950757; cv=none; b=Hw2hre3g4HT2Wkl8BX42YN7fFzDvzNTtLmReT70WvSkRffX/Q5NCYQjTjAWTyIjIm6E/zDoYLIp37UnjAZtunBm3UnhxIW5c2IHWDsL+/zTBZikkRCMDjBQayZtEANdA2LMDZ2FUoIhtyRLcn2Tfvy69qz/jRD7oASxuz60WVvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733950757; c=relaxed/simple;
	bh=JnMoQ87C7s3RvchzychHcakSIsQXKjOc24+mTZbJjac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsBknUYSuetF2b7mMpfGB8+HlSjKtIzYdc3gX5DdcilAnUFZ/d7QVKVjb4lWEFep9jrdtMiKYVGsk85ki95H81s3oC6YPPNneakJSMGHh3fSbw6Z0Ppo0E+/T5iENTQHk/KZX165taKjR6tF/lzjsSMg/YyoOa3arBvVUhM3zt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.39.247] (port=60680 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tLTnX-00FQzw-TQ; Wed, 11 Dec 2024 21:59:10 +0100
Date: Wed, 11 Dec 2024 21:59:06 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: caskd <caskd@redxen.eu>
Cc: netfilter@vger.kernel.org
Subject: Re: Regression 1.0.9..1.1.1 in glob inclusion behaviour
Message-ID: <Z1n9Gj6UaA5CfQIj@calendula>
References: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
X-Spam-Score: -1.9 (-)

Hi,

On Wed, Dec 11, 2024 at 09:40:43AM +0000, caskd wrote:
> Hello netfilter users and devs,
> 
> Following upgrade to 1.1.1 i've noticed strange behavior in the inclusion of my netfilter rulesets. Entries included via glob were duplicated. This only occurs when both -I and -f is used, due to the follwing commits:
> 
> 6ef04f99382c074c3669de31cf0a70651662b261 libnftables: search for default include path last
> 302e9f8b3a1382cf09db32541693b5df7d80ca1e libnftables: add base directory of -f/--filename to include path
> 
> Steps to replicate:
> 
> Create a directory with one or more rule files.
> Include everything in the directory with include 'dir/*' from /etc/nft/rules
> Apply the rules with nft -I /etc/nft -f /etc/nft/rules
> 
> If the include dir is defined as a command-line parameter then entries are duplicated, while without it they are not.
> This was not the case on 1.0.9 before these commits were present.
> 
> Has someone worked on a patch for this yet? If not, i might give it a shot myself.

I don't manage to reproduce such duplication with 1.1.1.

Would you make a simpler reproducer? What default directory you have
for nftables? You can guess via:

# nft -h | grep "\-I"

Thanks.
