Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5F2F290E
	for <netfilter@vger.kernel.org>; Thu, 11 Dec 2025 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457743; cv=none; b=leLmLciyyemCsEx43nnEO6/dgOTHYLUktcGbMhryVC4D3WR4GMvqynIyCWwtfeOwAAtuQd+ZUV1fIZFWxMi9jDClvoIWxAGhgykfSuENYrpKIEo9cOz8Dtzzp+9jFALssb7i8VjtdaTQ3nvoliVNF4oPAvDlVWOA9FPk/DSfgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457743; c=relaxed/simple;
	bh=7KcMeibHo17HPfgFs+a6ul99GhJTX8m5SASJLW2N9qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0OsnUkGRUSFAX7MJHDarJN254z1nyf6iaj4r1NyI3lm2mUxNNW3Yf+yoNzd8Ume5l/6/PZ9ludxqWZLjHikyEKE4kLjOG5Z5HdWkWPhYoQjXu/EBfLFlG/wPDxBoMw8PfXrMRykIwS5mQvCECGL0TYFzSrRJPTMJdeAjN/+10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id E679260332; Thu, 11 Dec 2025 13:55:38 +0100 (CET)
Date: Thu, 11 Dec 2025 13:55:38 +0100
From: Florian Westphal <fw@strlen.de>
To: Ian Pilcher <arequipeno@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: How to determine type of nftables set
Message-ID: <aTq_St2wfYVycgmX@strlen.de>
References: <067a7b31-699f-4642-af16-9062c69e9fe2@gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <067a7b31-699f-4642-af16-9062c69e9fe2@gmail.com>

Ian Pilcher <arequipeno@gmail.com> wrote:
> I am working on an application that will be working with pre-existing
> (created by the system administrator) netfilter sets.  These sets should
> contain either IPv4 of IPv6 addresses.
> 
> How can my application determine what type of address a particular set
> holds?  I can query the set and get a NFT_MSG_GETSET message back, but
> it's murky after that.
> 
> The message contains a NFTA_SET_KEY_TYPE attribute, which looks
> promising, but I can't find anything telling me how to interpret it.

See 'enum datatypes' in include/datatype.h in nftables for existing
types.

> ChatGPT says that I should just look at the NFTA_SET_KEY_LEN attribute,
> but that doesn't seem reliable; how would I distinguish a 32-bit IPv4
> address from 2 16-bit ports?

2 16 bit ports in a concatenation need 8 bytes; each subkey is padded to
next register boundary.

> Short of digging through the source code of nft, how am I supposed to do
> this?

Its complicated, for simple keys ('type ipv4_addr') is easy, see answer
above.  For concatenations NFTA_SET_KEY_TYPE holds a bitmask of types,
for more complicated cases ('typeof meta iifname . ip6 daddr . meta mark')
and the like) you need to dissect the udata /
NFTNL_UDATA_SET_KEY_TYPEOF.  But as long as you only need to handle ipv4
vs ipv6 the simple answer should do.
