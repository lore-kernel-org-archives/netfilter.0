Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC5069978
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696477; cv=none; b=QNSmqP8tcn3qnoJK3gIkVdU7fI44ixHATtPlUKY1EdUJbjWs5Vg3JR/hRuMoiB3l1mpx45K2mIRKTUo/7JD9R/tRq579s9sQ6xlUuXf//yaE/lFrqBoGZvaaFmOKTMlfM1y4ADU2PkVXHURgK8KDidQKhEVdI6VYJkrLiUys+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696477; c=relaxed/simple;
	bh=zH207KuAZTDnhdP8bnhjsiCwQP+NcpsLwBkbO3p8aXA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvHbhw1TAwUl+Tuth5pyv5YQe7rbtgSw89Q8XlJPrIZco+EgkR6IQmYcXoaNMxBSWcR8itzOcGk6dUAhEbwfdcCv4eCxnJlc8e8hMzZE/Iti9kfjn5mGALaMUOHK3pNgV9bV6bdLNHIJ8csr1j85a5b1DWmXrAHW0UaXimZuzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rV7iS-003mXZ-0c
	for netfilter@vger.kernel.org;
	Wed, 31 Jan 2024 11:21:12 +0100
Date: Wed, 31 Jan 2024 11:21:12 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZbofGH6H_mhSfAg0@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <20240130152247.0303cee7@cobra.bbbs.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240130152247.0303cee7@cobra.bbbs.net>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jan 30, 2024 at 03:22:47PM +0200, Kim B. Heino wrote:
> > This is one of my pet peeves with nft, actually. For iptables, there
> > was tooling like ferm which made it possible to write dual-stack rule
> > sets very easily. This kind of tooling seems to be completely missing
> > in the nftables world. Am I missing something here?
> 
> Foomuuri [https://github.com/FoobarOy/foomuuri] makes it easy to write
> dual-stack firewall rule set in text format. Not really ferm-like, but
> might be what you are looking for?

That looks interesting, but it is an entirely different language that
needs to be learned and understood. I will look into it. Where do the
rules created by Foomuuri end up? Can they be inspected by using nft
show tables?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
