Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417B1BBBE5
	for <netfilter@vger.kernel.org>; Tue, 30 Sep 2025 19:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259598; cv=none; b=DnXrcSJEf/S/Dm9VvYHiGgw1Sr4aoOwS2XCXrRMltHzDp8bYTk5eZVm+9hnBweCjLguHQAvO8qTHncnOUURFpNj1bBh7ulZrRA7THpJ3xcpUDrvn7XYdWJbX4qr6ZBCKLNe93mRrL64PsEwlDsH72SnX83Z9vqTq8Lcvf2BCaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259598; c=relaxed/simple;
	bh=sx45hpYIbo2Gb8vt7CLXKpU7bjnCT87RqLu1ulgdsIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTGkx3OORZv+sYQ4mQJHjyOoHEpY0+JehFmF0iFEixXRZgKIG/Zs0HOAkhioviNwSeFkb6wNyoty+0dr4aF6Bc1qYqlvO4Jv2rfQc/7W87QL0Bep7pe4eSUesZ0iA3GYGBbgJVe+pPYp8KN/DrVd6uUeUVN8D7VuGe16RWYHy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 4692660326; Tue, 30 Sep 2025 21:13:13 +0200 (CEST)
Date: Tue, 30 Sep 2025 21:13:12 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Confirming conntrack behavior on environments with multiple
 network namespaces
Message-ID: <aNwrwZBc6oVyFZTJ@strlen.de>
References: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>
 <aNLTtcdGNJT8FuYk@strlen.de>
 <CABhP=ta4Rxf-TUa9YU2dAM5zgpkL7sqNHaTSAiHDR_5cXh1hTA@mail.gmail.com>
 <aNadJ2EiPn6pMQ1E@strlen.de>
 <CABhP=tY2LnPsYk9uiF4xp4SthASYAaQ6mBWDjqy1OmOom4PK9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tY2LnPsYk9uiF4xp4SthASYAaQ6mBWDjqy1OmOom4PK9A@mail.gmail.com>

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> interesting, just to confirm, can I approximate the load factor using
> active_objects / buckets, with
> 
> active_objects=$(sudo awk '$1 == "nf_conntrack" {print $2}' /proc/slabinfo)
> buckets=$(cat /proc/sys/net/netfilter/nf_conntrack_buckets)

Yes, but keep in mind that each entry is hashed twice, once for original
direction and once for reply.

The active_objects count will be higher than what ends up in the table
(e.g., if first packet of connection is dropped it is never inserted).

But it should be a good estimate.
