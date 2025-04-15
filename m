Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0628A1E0
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727969; cv=none; b=FAmCuMUuBFw7eagF1UZB7pKaTlpABo7arb/dTr0COzOhJNErcUFVoPV83w5dVu9Kj+JY/6nlnbsSqe2J3vg2DejSGaEX8G3OuCiegrY+Ajkh0tEtliraex4/d4lIfkGqI1QcdO5PH6XkT0IREfR7FXVdYsrsx3puwQgzkMp9p10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727969; c=relaxed/simple;
	bh=IY+v4P4lhK13OIyhWzgnhlS3n0rGVxP3K+oDqUB7/uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N136WGO/g2TEXbNCo0stT8NaCUlqOKj5qbr/eWUn6BaZLfFVuvosCIuw0ssatrUF7Urfs8G1UsYWhEE0oVnGz/xUw7phSEqObE4sC0twuB4K6IyYXJcy47FLN8fkg2Nf4YCMRCcJVT/kenV8o5GwkEq+HUepEPKET+ikL8ut3ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=FDcqUngF; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Zw1/b39i; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="FDcqUngF";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Zw1/b39i"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 1E2806090F; Tue, 15 Apr 2025 16:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744727963;
	bh=Q6XAwBu1AfHChVWv3ul7m4sV6Rrb2xJrH4yAocU35Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDcqUngFlTPYVxQzUxLepFAdtbEUCw3AuwRB3H+jxw2SfpBWuFNGbrxK+Br/+Q1Dx
	 xIKayGXBLuNDauMaf3MiH3MuGRajazITQ+QRl8EyMrqj3tlREVwNMNaibx0CY6rNob
	 yMUSUbqEMM3SHmowL6+VFYIb5GTNNWFXeCDAQjEMfh60IUjlgU7YxEVktcQpFiFSgt
	 V7BzoXIq+3Vc4j4zlqH726WsK96uZnehmKqffh0bGF2PdFGDV4SdceA29t3PtgYsHe
	 2a4WwjPqAYNXhqk64knGLpDoD17QgIu6L0L0yQLN2JQlItkcEtRSMcto7xlTtqDEHx
	 EHj/jszzfdmig==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 851526090F;
	Tue, 15 Apr 2025 16:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744727962;
	bh=Q6XAwBu1AfHChVWv3ul7m4sV6Rrb2xJrH4yAocU35Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zw1/b39ie3JGUz+EbtV501IWEayrZoMFBm4NspEQd+7g8wEAhkQiMvglh18256LO9
	 pleT28WTzgozn7hXXvBh7gtv8/HbSwRTbk4L4XZ3YFPSL1ALXQcKLJhZABxjL4kjzq
	 SN+BEtsF/UfPJd6hnojth8ton7tlZyWVaz5Q1tiju0A07jeMF4yTy8rrW/jK17BYaY
	 wq8tegKNSNqId18TOtAEQ+r/KlW749BH91sm0mPFDHwM8gI+l8tocllRrkvHfNPvsG
	 OEeLex9dys1NWQIpxnn4ED1HT2uqmhnwGpcn37i2ASnaCt1Yc8bMSOSY1X7/U8fyEg
	 eH/6nQCppbk4g==
Date: Tue, 15 Apr 2025 16:39:20 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
Message-ID: <Z_5vmAQdcUCOg86F@calendula>
References: <Z_1KxMUDT0D8e6wH@calendula>
 <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk>

On Tue, Apr 15, 2025 at 09:58:52AM +0200, Slavko wrote:
> Dňa 14. 4. o 19:49 Pablo Neira Ayuso napísal(a):
> 
> > - Set element auto-merge now skips elements with timeout/expiration.
> 
> please, can you write more about this?

Sure:

https://git.netfilter.org/nftables/commit/?id=da0bac050c8b2588242727f9915a1ea8bc48ceb2
