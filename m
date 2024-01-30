Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BCF381DA
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706620140; cv=none; b=nHH2gOTS0vGZ9mtgVH/xeis1o/rpiGf0O+hg2sQ4USWeXoa7aYIPFWSFlM7zzyC7pIreiSlWUN2wVz18QrjNpiYaPRRvSUVKcCJdFmM8NxPp9X+4lTwyEaiXua141On9Ws4wIoNIAhPTYI/zzsPwnH2ejo8bEd9IHcSI9OS6168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706620140; c=relaxed/simple;
	bh=VKeyG5HebHRmM8QdG1BPtg5XeBsD0vfNMBROK06qDhw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz7Eig6RFaXeeXoSVUJeJ0SQP42J12lSJTT/NasVgap92b6f6B5hX4TbEZJvqKYVGDR+c0XAff0CQbAwpZiq+vgv4TxOYJXvlwUstaAgRFFSY8VRNqq23lQcpJ39alNRUEyn2bnbR6ipUNnm3PoMIFj7oXZnFj5ZvnykR+gmAsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rUnr7-003Ew5-0a
	for netfilter@vger.kernel.org;
	Tue, 30 Jan 2024 14:08:49 +0100
Date: Tue, 30 Jan 2024 14:08:49 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <Zbj04V-90zpQwEzl@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jan 30, 2024 at 10:39:57AM +0000, Kerin Millar wrote:
> On Tue, 30 Jan 2024, at 10:17 AM, Daniel wrote:
> > Hi,
> >
> > nft 1.06 Debian12. Is it possible in a set to combine ipv4 and ipv6 ? If 
> > not, does it exist another method to do this ?
> 
> Combining is impossible.

This is one of my pet peeves with nft, actually. For iptables, there was
tooling like ferm which made it possible to write dual-stack rule sets
very easily. This kind of tooling seems to be completely missing in the
nftables world. Am I missing something here?

> However, the value of an ipv6_addr element is permitted to be an IPv4-mapped IPv6 address.

Does nft have a function to convert an IPv4 address to an IPv4-mapped
address? Will the rule set do the intended thing? Is an ipv6 rule with
an IPv4 mapped address fully equivalent with a proper IPv4 rule?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
