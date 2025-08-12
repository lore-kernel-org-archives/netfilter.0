Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A50248F6A
	for <netfilter@vger.kernel.org>; Tue, 12 Aug 2025 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754997467; cv=none; b=jArWXgTpvVtrh911WIHMoqxXodRVaanXdeB3Xd/HPYkyPjCU7DAgIYE94hCBW/JxTZSJVzh+UxB0Y45pYKtD39BoqbFeFTxlDGEv/ISslv/hZ0zxhCqLavsOBFFfkhWIxl3Af+J75IzxVe4rrdkPQ08ayRO01uagvan73tMAcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754997467; c=relaxed/simple;
	bh=2slsPddYuwo4mC60sqPnmwuG+3q8f95FXDZGWfNqHnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvRZScd7GdYo0ORI38N7QYhUmo5cSyulopBOBptGM+CopvtubXYk9Mi4yqRc2peDIqvJJrlH5I5XSdzVdrt+lWRSKogiBRxpg3ScT0FPebR6wy2JImFPboQQAxzroK7fIk2slRoCNdYYskWfPPRoK44Tn44RdM2mdW9BvXfKrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 89255600FB; Tue, 12 Aug 2025 13:17:43 +0200 (CEST)
Date: Tue, 12 Aug 2025 13:17:43 +0200
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Query on nftables DNAT for localhost-to-localhost traffic in
 IPv6 or without route_localnet
Message-ID: <aJsi1_zrVmQyHyw0@strlen.de>
References: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>
 <aJBugbUKvPaiZ_PD@strlen.de>
 <aJpNme8xRUbhNs4P@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJpNme8xRUbhNs4P@calendula>

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >This seems to do the trick:
> 
> To simplify this example below, would it be possible to extend nft_fib
> to attach DST_METADATA in prerouting to modify the ip6_route_input_lookup()
> behaviour? This is similar to the conntrack template, but for routing.

skb_valid_dst() doesn't consider DST_METADATA as a valid dst, afaics the
dst is then discarded and we end up in the same code paths.

But I think we could extend nft_fib to attach a route/dst.

But at this time I don't want to spend time on enabling such hacks
(lo-to-remote-dst-nat) unless there is a good use case for it.
