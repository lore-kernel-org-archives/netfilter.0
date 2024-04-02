Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546BE17C8D
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.188.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052389; cv=none; b=FW3KxWI0Ki3F6tF/xUPjZqWGHmDmzBQtwVugreXIBLbIavMHQdIKTPCBGUhgQq/iHvLz9JdFDIhA+nsm907sKjPSDLHlHEpU0cs58fsTk5U1+oPiDqsmzr0T9kdhkMMUycPeAA6gl7Yb8v8YHhmYU4OqXcXlQWNDPhNWI3b8U4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052389; c=relaxed/simple;
	bh=XbjiPOHw4b4sWeFpSCCHnB6OH558/ujB+s66yTa+VIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbenHNkm0k/UB/+Eitol/QzHS/LuwcKgVsBdPvlDGGeUDiY5eLNUTCf9nnndByU7rtygm9LVmxyKvaTSE2vDCwBP04+f46Ri6Clxz/EieQclumXG2MAsIftyp+Xh50cFSEMj6CgY/9Wt6LSqJG8/evr8AgiVcvGDsp8shz6taP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=217.70.188.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Date: Tue, 2 Apr 2024 12:06:21 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: "William N." <netfilter@riseup.net>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-ID: <ZgvYnXicTY7FQi7E@calendula>
References: <20240330194139.561b5a24@localhost>
 <f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
 <20240331170259.068a0db3@localhost>
 <20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
 <Zgs8XGAVd7R_TKh9@calendula>
 <20240402072948.2193d20c@localhost>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402072948.2193d20c@localhost>

On Tue, Apr 02, 2024 at 07:29:48AM -0000, William N. wrote:
> Is it possible to have proper symbolic naming ('describe') of codes
> depending on type too? (as per RFC 4443)

This is not yet done. Add it to bugzilla as a feature request I'd suggest.

> I also notice there are some types that don't even have a corresponding
> name (e.g. 139, 140).

I believe the existing ICMP types are based on iptables, and it seems
iptables does not include those.

There is icmp6_type_tbl in src/proto.c that can be extended, better to
use definitions available in icmp.h if available.

> ip6tables-translate does not translate codes either.

What iptables version are you using?

$ ip6tables-translate -I INPUT -m icmpv6 --icmpv6-type destination-unreachable
nft 'insert rule ip6 filter INPUT icmpv6 type destination-unreachable counter'

> Has that been reported/considered?
>
> Speaking of all that:
> 
> I have managed to "translate" the whole Appendix B of RFC 4890. However,
> I am not quite sure how complete the appendix itself is, because:
> 
> - it does not address the recommendations given regarding hop limits
> - I have found one bug (so far) in that same appendix

What bug?

> I wonder if it would be appropriate to contact the email addresses
> given at the end of the RFC itself. What do you think?
> 
> Considering the importance of correct secure handling of ICMPv6, it
> would be great to have an example on wiki.nftables.org showing a proper
> implementation of RFC 4890.
