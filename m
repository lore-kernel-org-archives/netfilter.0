Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B6173351
	for <netfilter@vger.kernel.org>; Wed,  3 Jul 2024 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003486; cv=none; b=rxqQa/AHWde9kdTtXgwStvooWh3JGSwx/I720zyBw1pI8n5+few7eaI4VVPVwxNXvmuy+7VGXQU2ZY6hO7en/2ethOKKePOAA8pvfZW0Wykt0FT6tKok2gRb3vxOrRPRm9Gt7QScWanYUKzLgijhhAyDicr2dyeoW9+rnsbYk/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003486; c=relaxed/simple;
	bh=zjGKh3eqg1CJMwbvkGBjGy1YHR1CurB3zSWGEpOxnLM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPh+oXzgNXc2/YI7GbmB7vPU5sYKNdem9m0o4+DXELWAWO3WLJsSViwRm5H5mPxkdLAiYGbIrQ1Qv1e4vE6N+3hX2HcTmMc0tAvr6hGnCT3TCxhEwj3IeWg6IwMnkcOnZ/1JzyvVaEe432ZbN6AfcV0FpgzzvNix4E9nyEfao98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=m9qrUCqk; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="m9qrUCqk"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WDbxy3hw2zDqBC
	for <netfilter@vger.kernel.org>; Wed,  3 Jul 2024 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1720003478; bh=zjGKh3eqg1CJMwbvkGBjGy1YHR1CurB3zSWGEpOxnLM=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=m9qrUCqkCGdVGtSvbd5ytUUN5jcKZN2vNAvO8vxbX/eXCa/lBFDtBGBpYD+6S8Hno
	 kRi3CmY6S6Um2JCDRD07uq+puBbqvng+NmfyO+QbQpOSTJ6m6FDse+AnSEm+gHNe7h
	 vWjSPoDRhJS6XfnArkmFp1img81fzeNy7ASRtzxc=
X-Riseup-User-ID: 1340628756D7BDAC1F7EF25919FCFF3323D1A20ADD6622117DF1EC0C27BB3F40
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WDbxx2rRSzFtBp
	for <netfilter@vger.kernel.org>; Wed,  3 Jul 2024 10:44:36 +0000 (UTC)
Date: Wed, 3 Jul 2024 10:44:27 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables rule optimization - evaluating efficiency
Message-ID: <20240703104427.1718eb5e@localhost>
In-Reply-To: <3d2ba9fe-0265-46ee-a98b-9d6a1c84cca4@thelounge.net>
References: <20240702190318.618a3933@localhost>
	<3d2ba9fe-0265-46ee-a98b-9d6a1c84cca4@thelounge.net>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Jul 2024 11:37:10 +0200 Reindl Harald wrote:

> understanding what is your primary load and make final decisions as
> soon as possible
> 
> "ctstate RELATED,ESTABLISHED" hits 99% of all packages and after that 
> you only handle new connections

That particular problem was discussed in another thread:

https://marc.info/?t=171360284600001&r=1&w=2

A little side note: The capitalized words imply iptables syntax. In
case I may somehow been misunderstood, please let me note just for the
sake of clarity that the actual question is about nftables.

> when you have 99% of your load on port 443 and before the ACCEPT rule 
> are 50 others rules for whatever services they are all evaluated
> 
> the same for drop/reject rules - on top the ones which hit most of
> teh time

Sure. That is clear. The question is not how to order rules but how to
write a rule in the most optimal way and to evaluate its performance,
i.e. I would like to go beyond ordering and into the rule itself.

> you have rule counters how much packets every rule triggered

Counters don't tell how much system resources a rule consumes.
