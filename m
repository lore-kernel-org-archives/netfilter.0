Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42384136A
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 19:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808889; cv=none; b=cio/JJYauepSXHvunqbNwUvAEZJ06h21zJZcWMzZ9tQfaXiQlFfpBwxvbAmbDSoMj15Wrw5gIsuP0N1uCeZIKE5mYNzpxN9xeKY0T4YyvJxhrJt7/u13es6Q4493AW5/bWGrGyiHQfbYFgKIfn1Qjigz1gpq+D8B7DGNtCnitrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808889; c=relaxed/simple;
	bh=FYDa86fnptzSftf2boro5MhL5/ucIe9f+OIWkIt6s8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsMCWku1O2p60fmI1Mh5UaHeIlrviFCxzV48T+N0XabJ6Q4C5nndNvde9r/cU00X1h9JCJdyCbgvGBOQ1rwHiP80tfy52YKyn64UwMEkuQfX6EnAQsGJ92OzXkTk1Xt4elFD+ygONvlYUgDw+dYcwix8q/X3OKW0AOswJQIaNpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=F5MIALi4; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=F5MIALi4; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="F5MIALi4";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="F5MIALi4"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id AF19C6029E; Wed, 12 Mar 2025 20:48:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741808885;
	bh=RrHAYk4cSxtNNq0sdhv0e6WR7wJoq1NDu4B1Xub4rG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5MIALi4Ff7IeNRIsP3XePb/lnOits1EEwyuJmOJ4oGGJqKhQ7HnWsnN5XS53Paor
	 otesoB0V9pnEj5908JV65j4EVva3gJYVf/RZaUoruClw3OtrSniU+KoyqL6+O6gODG
	 bndIcnNLx9zYyNAoTs+TVomvWYJuqcWtVUPh9+eKNAGbBMAu9WzkGSVhYJD/vL4/32
	 SJZqRgY71PT+u9vY3bsIJHdy+lhdOJZfZ9ThiC05CNwH7wb61DhdxDFbskgofq4xjY
	 htx6UGQI+wPzxwcDqzIQOPJuvaJDenqx6TnU7W/Kz54FsyomJJwoE8CDp/QyZWxSH0
	 gzTqiMjzGwqJQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id E443C60298;
	Wed, 12 Mar 2025 20:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741808885;
	bh=RrHAYk4cSxtNNq0sdhv0e6WR7wJoq1NDu4B1Xub4rG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5MIALi4Ff7IeNRIsP3XePb/lnOits1EEwyuJmOJ4oGGJqKhQ7HnWsnN5XS53Paor
	 otesoB0V9pnEj5908JV65j4EVva3gJYVf/RZaUoruClw3OtrSniU+KoyqL6+O6gODG
	 bndIcnNLx9zYyNAoTs+TVomvWYJuqcWtVUPh9+eKNAGbBMAu9WzkGSVhYJD/vL4/32
	 SJZqRgY71PT+u9vY3bsIJHdy+lhdOJZfZ9ThiC05CNwH7wb61DhdxDFbskgofq4xjY
	 htx6UGQI+wPzxwcDqzIQOPJuvaJDenqx6TnU7W/Kz54FsyomJJwoE8CDp/QyZWxSH0
	 gzTqiMjzGwqJQ==
Date: Wed, 12 Mar 2025 20:48:01 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Lars =?utf-8?Q?Nood=C3=A9n?= <lars.nooden@gmx.com>,
	Linux Netfilter Users List <netfilter@vger.kernel.org>
Subject: Re: Dynamically appending addresses to a named set
Message-ID: <Z9Hk8SsJwZArWo9C@calendula>
References: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
 <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>

On Wed, Mar 12, 2025 at 07:44:25PM +0000, Kerin Millar wrote:
> On Wed, 12 Mar 2025, at 4:08 PM, Lars Noodén wrote:
> > Hello,
> >
> > In NFTables, I have created a named set called 'bar' in the chain input
> > in the table foo.  I can add elements to the set manually,
> >
> > # nft add element ip foo bar { 192.168.2.2 }
> >
> > However, I am not able to guess the syntax to have a regular NFTables
> > rule do the appending automatically.  I've tried a lot of permutations
> > of the following, but always with fatal errors,
> >
> > # nft add rule foo input tcp dport 22 counter add @bar { ip saddr }
> > Error: Could not process rule: Operation not supported
> > add rule foo input tcp dport 22 counter add @bar { ip saddr }
> 
> For the kernel to raise ENOTSUP does not indicate an error of syntax. The bytecode intended for the nftables VM will already have been compiled at this point.
> 
> I suspect that your set has been declared with the "interval" flag in effect, in which case updates from the packet path are not allowed. As far as I can tell, this constraint is undocumented.

Maybe Lars forgot to set on the flags dynamic;

Where is you set declaration?
