Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3575315D5BA
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706787582; cv=none; b=c4L+U0uKC+DUibSteFz4q57GfCnfVkp6pNPvoNLVQNqECE6k7jeOTdY+xVWq+AeFIN/b8Y4iN7GJz8VpyS6DVDQqU9RxWvWKDPnolkX6kLzKDRt0t6XFTKeZ/RbkK/IzX735XzlxIUkys5sAAjjhWkcprCChhmuh5EvkmiCul8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706787582; c=relaxed/simple;
	bh=GKq4ZUFg8YgLR1JlrM40sXkwn8/zNde4plrp6guvn8c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkzaT0aDARruqAH6kYOrfgRfirXCC7QKeiY/ixq9VvuiPiGo3JczYj3CjBGVag3crjse6w/CZNm/GCmPbskvZ+SqECsmI/ZNzGDtezfRcvmOfsMNmUdiVs30fNWLXUOfHtmhe6ySV3rLnRErdd980Ft5Yynwa5ASUjW12ETkUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rVVPp-004NMb-1v
	for netfilter@vger.kernel.org;
	Thu, 01 Feb 2024 12:39:33 +0100
Date: Thu, 1 Feb 2024 12:39:33 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZbuC9U6GIqp-WDsQ@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <83297f85-8799-49e1-9196-98cfba87ea3c@tootai.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83297f85-8799-49e1-9196-98cfba87ea3c@tootai.net>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Wed, Jan 31, 2024 at 12:55:12PM +0100, Daniel wrote:
> table inet filter {
>         set block6 {
>                 type ipv6_addr
>         }
> 
> chain INPUT {
>                 type filter hook input priority filter; policy accept
>                 ip4to6 saddr @block6 drop
>                 ip6 saddr @block6 drop
>         }

Still, duplicated rule. That should be optionally invisible to the user.

> With ip4to6 -type/cmd not existing at this time in nftables- transforming an
> ipv4 in ipv4-ipv6 mapped eg 127.0.0.1 => ::ffff:127.0.0.1 At this time we
> are already able to map ipv4 addresses in ipv6 tables like
> 
> nft add element inet filter ip-banned-ip6 { ::ffff:1:2:3:4 }

That immediately wakes my wish to have the address converted
automatically, and the natural place to do this would be in nft
proper. It is already reading in human readable code and generates
kernel configuration.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
