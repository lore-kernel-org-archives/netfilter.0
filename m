Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25083093D8
	for <netfilter@vger.kernel.org>; Mon, 27 Oct 2025 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603951; cv=none; b=ZcQSh3S0Cj/dwcDSB7D0sld0m5SJHLv/iOy8fXdIzclKFPXO+v/R4kZwelTgCjjZAzbCVUleSzLypS2bwJ6KX+AN6BGdRI6NgwJqs8QMx01fXjWpZkcfG9xY/EPr5ncZkodeZpLB3AKqy9THwnn9x2F/yX9iP7CYC9ydRq1DItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603951; c=relaxed/simple;
	bh=fFhCQAd712eE4vOENzl9+r8PA4Bigpkbs7iAR/ok0h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyPROTWRbaAeTNPY+nKVGhpz+Oe4X226s9/iKm6BtzMLrBrDECTHE8kqCTAY9RWD2Cfvpo9mjHk6v6y/Ev0ePkbZUXDipXvCQrxxf5VBZ1GtTgR2Cx3MA70yCiHxRTVQPnvSa67kZPW59FolkIWRKcXF3nuj9iT8zc8sPSVwtZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=pa2GTvHn; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="pa2GTvHn"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id DC6A76026E;
	Mon, 27 Oct 2025 23:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1761603948;
	bh=XcfsxhBj7ZTc64/YsZSmu9JtRkUviavr71mgkoZfXTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa2GTvHnzTLIEmXodkqaU+rTOpEJ2i9CuDhcVlw3cWR5Rw6Xf7NqTSlJ5A4seiMaW
	 m2kG7++kuD5IDfR4nni9I9d0chWSuF9hNG57rZokYl674KtRgtmmqlOs5gisJIREgr
	 INGKYBjuve2H/H8MJ+Wq+8V0tRcQt83iCfyGwls641UVqG8KRgTNC15uzHFVwNsdDp
	 G1foiMUbr0zKWfn6069yoaveFTRrFx3Nc4LHJeIMyuTj5EMxhVk/xXHZjJsW4Px5f9
	 gxbmCaLxxR5ai4ngp/e4EmbFbPyUzsmhS9zNEqmDSGus7DDBnBRL/go1fGXZuKqcMF
	 yFi2YusDbTWeg==
Date: Mon, 27 Oct 2025 23:25:45 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: louis.t42@caramail.com
Cc: netfilter@vger.kernel.org
Subject: Re: Nftables ct count over 2 counter continues to trigger with only
 1 connection
Message-ID: <aP_xafHvkRsAZAep@calendula>
References: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
 <aPtmw-suGrj2iLC9@strlen.de>
 <trinity-93433a71-f31b-49d8-abd8-a8bf718472e1-1761573299550@3c-app-mailcom-bs13>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <trinity-93433a71-f31b-49d8-abd8-a8bf718472e1-1761573299550@3c-app-mailcom-bs13>

On Mon, Oct 27, 2025 at 02:54:59PM +0100, louis.t42@caramail.com wrote:
> > After looking at Fernandos analysis, does this work when you restrict
> > this to new packets, i.e.:
> 
> Thanks for spending time on this. I can confirm that adding the restriction with the inline jump works great! Of course, it would still be great if the original rules behaved predictably as well.
> 
> As an end-user trying to learn, the man documentation surrounding conntrack and especially packet path dynamic set add/update with `ct count over` and similar could be improved. The dynamic set flag also lists "delete" as a valid option with no other references to it which felt odd.

Please send us patches that can be reviewed, it will take a bit of
time on you but it could possibly kick off some discussions, thanks.
