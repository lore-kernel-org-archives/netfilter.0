Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.245.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677436;
	b=a9xI14rkBgKXKewtUouAwree6PmIRswDlMcBXVpRjSkpWqtW8rlGJMJ4FAmYEtiWvI38
	 /oNyt1U5HqJlNeczuqkCcyyVBQ3JF6dQnmWkvUH0liHYiqOrmQo9wezHZ54bDVFXpT7C/
	 lp+MtksPA55HYMzF/dICqwSqBHFY1zKu7Cq2nALoqXJ2D4cNYAZPOjQlJvdTHRr1l1yKX
	 hP6CXMyGMyTfGCgW8dkn/aa8th8yhgz+4aw5nXwdGLYJDRLbeWgO9pSRwEJZLqv+YnUhn
	 LKpdBPgmenNPJR3dWOFqk4L2t4AaIkZNIwL38X9JbUMkIbmlX6WOI4wfqcW6uspEWcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677436;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=990LuiKzJrJ0lOjZszyrrSfnTL30B8yoXmFjR+lU7ds=;
	b=kklxtvXNKi+Xe8Du1Jwe6Hh8r2/M+SDZfhr9XKEKUtZb4ryt+JAgCh6Fuhqtk/YZ5N/h
	 3f/dCaXJnvtnq6Ar6g7SLNEpg5EPjUJmzEbOumd2uob43A01CGb90V5LUrImNGeox6fS0
	 hKygm8BFWhMc26zi2ouGsEkmjwVwYg7faBcYS+frzHzOLyaAihCCwaYaYEix71GhFiKJ2
	 pS2NiNQLcSFMjnDSIkLRCG/vqi0gNDNMOf3xoZ5/9+wM7VpF1WKil4rNCIIHMyemlF1Q7
	 jTSTSqApT2tb+WZ8yUONqkhqn3P38Z8R6mXb4Ohst+tOzNhLeHTPDjwlyy9Q1OkBiwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=strlen.de;
	spf=pass smtp.mailfrom=strlen.de;
	arc=none smtp.remote-ip=91.216.245.30
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C77606A31A
	for <netfilter@vger.kernel.org>; Thu, 22 Oct 2026 13:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 3A77961066; Thu, 22 Oct 2026 15:57:13 +0200 (CEST)
Date: Thu, 22 Oct 2026 15:57:07 +0200
From: Florian Westphal <fw@strlen.de>
To: Julius =?iso-8859-1?Q?R=FCberg?= <julius.rueberg@student.kit.edu>
Cc: Richard Van Tassel <richard.van.tassel.work@gmail.com>,
	netfilter@vger.kernel.org
Subject: Re: userns packet mangling
Message-ID: <atoWM6U90DGiy8Pu@strlen.de>
References: <CAGLc8_RABvE42M_1icBskniznt5-e2QLNd7g3Fku3bcw+2aE2Q@mail.gmail.com>
 <atKqWQwqM3AW7pil@strlen.de>
 <8b03ef541269cff566c220ebc1ea34c77b303dad.camel@student.kit.edu>
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b03ef541269cff566c220ebc1ea34c77b303dad.camel@student.kit.edu>

Julius Rüberg <julius.rueberg@student.kit.edu> wrote:
> > Florian Westphal <fw@strlen.de>
> > wrote:https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260905050150.30273-1-fw@strlen.de/
> > 
> > is still pending, and its closing known security hole.
> > So no, for now we can't re-enable this feature.
> 
> Just out of curiosity, if disabling packet mangling for userns closes a
> security hole, wouldn't this leave LTS kernels, which to my
> understanding have neither your fix nor the disablement backported,
> vulnerable?

Sure, but there is no local security with unpriv userns anyway.

I'd say at the moment there is no local security at all,
even in latest kernels.
