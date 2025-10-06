Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793F257836
	for <netfilter@vger.kernel.org>; Mon,  6 Oct 2025 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759783971; cv=none; b=pWNOnVdMzowRcrmxSiBT3dCrxZq5/3q+FQyVzR2qOvPNrXzWPgxNMNZoNrusga945lD3AUqDVmzmAlRCnOJtoReIXK1AKhMfMPhTmd3iPma9kJ2CGsUPrATHV405QrmM2DwcU4aIxt6ocHWnykFKCeoLWaZ5UXRm9eI4vDVlv2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759783971; c=relaxed/simple;
	bh=+1JPHLMCvtzct9MVLP5Aa/JQFFMO1ECjlyKwfeiDGwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqaYXCxPREecR/K5Z3jtL77CH3SnC4KZbBdOGxtLUrNk0YJ/ZWYUUTFe/ggAsmk76UeTn2LSveNmnlatD7vqrgjtD9slEi+2k4xzhuNxTbmfJZnNGCo0AIHZHin+xObB2Y9ziYiNVlizXHpp1AtxDj0j02StnV9rjs3TExKD9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=vilvDKQ5; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=nU+egA9C; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="vilvDKQ5";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="nU+egA9C"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 2017960290; Mon,  6 Oct 2025 22:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759783965;
	bh=hEq2MOb6fAZi626q4Br5in5yY2o1jxP67BvKhe76Wxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vilvDKQ59st4tjBnnYf0+hG84h4sMDyyD4TCVJoPXQ9oQiG3dj4/0tLA95oI07KFp
	 hxrjt/sV3VqyzEWpNX8uy9AX2+ZsMnUNqn3fiAFRNHYep2cKYNp159fwtFOtxBetqK
	 TjVUYHXuqxrlwTuyWoSUvjFBrjIht2gOCmxWDeuz+GfKYRhLKFeTeUnDSpOmYTPcCC
	 /Nc9UKLJca5fosOStKz+RHpT04Vqi0ZBxRKrTa9LbmEjblkw+zjO3NH/IhxNyU+XWm
	 CvNqaeH84fPtiemkomA3f3L8pYus9p3zLzWPUWexErdzi+f9pRbi6JfW9FkAkPjdDp
	 KqZTtkcdqrYWg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 660136028D;
	Mon,  6 Oct 2025 22:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759783964;
	bh=hEq2MOb6fAZi626q4Br5in5yY2o1jxP67BvKhe76Wxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nU+egA9ClcGtweN70Npy1TYc5cw6e1JUSw9A0CIi3JXxoi+Z34rHDaPTYF0+Orh4k
	 QTo0ajv5Z9lJBlNws94IPulRKlaapk33SrGjI5JmOw8anIytJ7N4l0Qn5TSz90MF01
	 bmycBUNn/7jP50oA0FIMDdMu5hf5MmDO/fDvIdyCjc5B29pTL9VB4EOObLPEGzR1U6
	 /GhKMAfAUDK2kkf+I6Ot1NhZLj9Z2hMrRrknj2x/Pl6etvVsDLPwE4EUJQgukqKiZl
	 N97J2tgIk7F4mtF5rLqdin/CePotAw6XbehPi6aLit/Jom4+xHuahZ+meapfyIyk2W
	 gGExlLs0M+tTA==
Date: Mon, 6 Oct 2025 22:52:41 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Stephan Ferlin-Reiter <stephan.reiter@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Slow "nft list counters"
Message-ID: <aOQsGUZTYvZkDcFx@calendula>
References: <CAFctyt+UdMz_yJYg=dMojijFZXdHT8aUyb7ga7Cme-NdYRP-gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFctyt+UdMz_yJYg=dMojijFZXdHT8aUyb7ga7Cme-NdYRP-gw@mail.gmail.com>

On Mon, Oct 06, 2025 at 12:39:56PM +0200, Stephan Ferlin-Reiter wrote:
> Hi,
> 
> On a host I have many network interfaces with associated nftables
> rules and named counters. I’d like to get the state of the counters
> and thought about running “nft -j list counters”. That seems to take
> many seconds, however. As an alternative I wrote a small program that
> talks netlink and sends a dump request with NFT_MSG_GETOBJ for the
> tables I care about. That takes just milliseconds.
> 
> Now I’m wondering whether I’m missing something in my program - I do
> seem to get what I care about. I’m also curious as to why the
> operation with the nft tool takes so long. Is it maybe looking at all
> the rules, which are complex in my case?

What userspace nftables version are you using?

I remember to have speed up this recently:

commit 969ce17b66f8084626610202f11d607911e049e6
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Mon Aug 26 00:41:37 2024 +0200

    cache: add filtering support for objects
    
    Currently, full ruleset flag is set on to fetch objects.

otherwise, provide simple script to reproduce.

Thanks.
