Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40DC2A1CF
	for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117023; cv=none; b=T7lsB+Y/GXFlBWmcIalKYexvYqWnH21wH/P4dcqq2LKSaShbvyHFVpGvhUdVUcjoGNwCOIu7oo+ITBL/UxAuMnGsO32312qmxiZGLb7GZYyiTxunBde7RgEa6K245TK3sw9cwipY/lNpDGMdiFQUeaWx8Hj7QwK6Q+aIvCJSK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117023; c=relaxed/simple;
	bh=F3QW3ta0GPDvwESgP30EUs3vJIxwa91cJwwjhO5R+po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCPvMk3k+bRZZeOkkP/+JoucTQFg6Bvb53UceKxdnrE2BB90c3LTlFcAhpxaIfCnBBT38eJNuY3bjxtTQIGfVVCz1HppG91MYx4+8cZ+wUSen/k0fJEJERYfgP4X4hvb2Kvi5MAzam1nhFeliuHs3IgXUaxz84SJFOAwOFllSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=ksyta8AM; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=qJovwZN8; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="ksyta8AM";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="qJovwZN8"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 41A0F6026C; Mon, 25 Aug 2025 12:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1756117010;
	bh=NOVudPz0wU9fvHb0axoQzoPZ/5Mc6MpYeZJT1br3Gmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksyta8AM7vx/RgBU+5/Ffw58DDmUxo7ShOQN8P+YfJDNDlnvEnBncEtPFXy/z2rni
	 YNE89YtGCobphQS72z5bfX24J8Rlag6gXplMv2Qng928+NBkNQ4hMHSj6XBicehyj3
	 6JaKZZUlk8mji0clqqup06+YJG/LqJxl7cbwndfwm2/VQKbJ/uV7e2wmZ10gf69w1g
	 sX2rMUsLCoGVOwx936Zf/fi0kA/iRK/cIzcfhJOjPtC/MSflsY4N1pwIKGZWf2p32G
	 cHrddAYpRclTkYp1L2U+SWVPdBjlqNs+mWPcNf9Xr25f4NUGQ7xnSlvbtuOnULXf+Y
	 64rQzTihe9QaA==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 6FFC96026C;
	Mon, 25 Aug 2025 12:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1756117009;
	bh=NOVudPz0wU9fvHb0axoQzoPZ/5Mc6MpYeZJT1br3Gmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJovwZN8PzNMP7viFSbJyQf4ClGQesfxPOX33PHviYI4oH9wakNpDwUj+UPO0Bpik
	 JgkBI/82fGLdmgNDiGKGtOkzulSjEpgp+wbvqBCWUzuKWejWieerxW2CJ/Ogk7/GF9
	 n+atDYugnSCqOzwUj/qtcWj8DiCbJvUZ0/JklQElRJwTvGWXGSwlCSYA4e1eL1Z5GR
	 EZ3JGG2iZA4v3za1tnWZQJKxEWquq24ShqyHnHzceu0sNa+R+Xa6gWSvkxLlua8oNA
	 DbIM8w5fzxqML5DTNavoTXI+NNQC4fFPgLJJWn49G4Qv6T20QwUfEJu+nWFCZi9vrd
	 hkbvBq3IUiZpw==
Date: Mon, 25 Aug 2025 12:16:46 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: lilydjwg <lilydjwg@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nft error Could not process rule: No buffer space available
Message-ID: <aKw4DikLFS8MVGVY@calendula>
References: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>

Hi,

On Sun, Aug 24, 2025 at 04:18:50PM +0800, lilydjwg wrote:
> I'm switching from iptables+ipset to nftables, and as part of it, I need to
> import a set containing ~2400 IPv6 networks. The file looks like this:

What nftables version are you using?

> define elems = {
>   2001:123::/31,
>   ...
> }
> 
> table ip6 mytable {
>   set myset {
>     type ipv6_addr
>     flags dynamic,interval
>     elements = $elems
>   }
>   chain output {
>     type route hook output priority -150;
>     ... ip6 daddr @myset reject
>   }
> }
> 
> And then "nft -f myfile.nft" fails with
> 
> netlink: Error: Could not process rule: No buffer space available
> 
> -- 
> Best regards,
> lilydjwg
> 
