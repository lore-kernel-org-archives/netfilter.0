Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376E222565
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133322; cv=none; b=t9/bjZGCq4NNEPnlQEuZgIXjbml7gUEq1yV490cvZ7GdsHfjByARIwDF11DrbUUHZiFDfOyUnJtHBjvXtkj8ArBHaJ3dHjWHtfGIsY0EnGRdqdVigH+wg/kxy1khvxd2V/LIcUcxTDf+O/8YU24qWPm3FUGiqWQUCfLYCEeVaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133322; c=relaxed/simple;
	bh=K8maGtPgw+Kud7SwYFJAnnofP16p+iOdkV8ipuThVuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XccA0KaBAmSzYpQ3gxVfLCJ7ehxC0Zgw5RAmCWWqAYT5uPtxmAyf17IWDJVLw3/QHBSWe/7YSYzAcLUYgHAtwNhNokrY60kVt9zHhkweiX1/f3m8iGDB982OmkatKgW7lbGzyq28CUkRknAP6NGVnqICtyvkXYZ4RqH8h3X9uGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=O6YT20Lg; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="O6YT20Lg"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 1D9C6600B5;
	Thu, 11 Jun 2026 01:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1781133318;
	bh=VQs+dMmEWQGXhqe1gc85Nj8VVwh/ayKXWOdkxHfQElY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6YT20LgasvwWFHozHXdmx9XFk2k89wt6dturmgIOfBypm4mQMIRimPn81iaS+XPQ
	 4WdrGiDpSnMROP+AC1+5DauPQWri7NrX+rGUOaq3hj/iKJB5k4dEwLjb2R3zU6z6OZ
	 KdoHwlfLTD+CS7dXUyeDFlY1Q2ZUf5q8IhaiEl4rKqHi1K4gBPPzKUbgFSdePIOn9b
	 GSi83vGd1ABa8CGSum36zVsZinVGbOiZTHHWTTeAePjWFaRqnAahd8imuxvkXuNMF9
	 u2yTpYg5Usl/rfURkIjMnq66/dwIxH46oHlDkAleoJjywAf6za1tBuONH75/EA2nVM
	 iy+OV2EnBeVrQ==
Date: Thu, 11 Jun 2026 01:15:15 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Binarus <lists@binarus.de>
Cc: netfilter@vger.kernel.org
Subject: Re: "nft list hooks" not working (empty output)
Message-ID: <ainwA_Lkyr85C6dB@chamomile>
References: <06c74ee3-64eb-47db-8575-bfe42eb47c4b@binarus.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <06c74ee3-64eb-47db-8575-bfe42eb47c4b@binarus.de>

On Thu, Jun 11, 2026 at 12:24:28AM +0200, Binarus wrote:
> Dear all,
> 
> according to the man page for nft, "nft list hooks" should list all functions registered at each hook, along with their priorities, and including the internal nftables functions. I am understanding this in the sense that "nft list hooks" should output something at least when there actually is a ruleset.
> 
> But on my test system, that output is always empty. Please consider the following excerpt from a terminal session:
> 
> root@charon /etc/network # nft list ruleset
> table ip t_IP {
>         chain input-filter {
>                 type filter hook input priority filter; policy accept;
>                 ip protocol icmp drop
>         }
> }
> root@charon /etc/network # nft list hooks
> root@charon /etc/network #
> 
> Of course, that ruleset does not make any sense, but it serves its purpose for testing. "nft list hooks" should output something in that situation, shouldn't it?
> 
> This happens on Debian trixie, kernel 6.12.90, nftables 1.1.3.
> 
> I also have tried "nft list hooks inet" with the same result.
> 
> Furthermore, I have created another ruleset with an ingress filter and have tried "nft list hooks netdev", which also gave no output.
> 
> Any advice or explanation? Where is my misunderstanding or mistake?

It seems debian kernels do not compile support for this command?

grep CONFIG_NETFILTER_NETLINK_HOOK /boot/config-6.12.74+deb13+1-amd64 
# CONFIG_NETFILTER_NETLINK_HOOK is not set
