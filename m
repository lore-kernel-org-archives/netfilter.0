Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D4038DFE
	for <netfilter@vger.kernel.org>; Wed, 27 Mar 2024 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.188.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711531006; cv=none; b=TFGEnBik4Gqt2GfDHyGI2YpYQl2AKORWInrlFx2bcl333P4nEmpAW2S79Fedg7HCa7VItkUjwF/VWOijMN6vJaWx5LvgJCL1PJsdGN8svU+Eg7/PKcYS1VLwFY+Q87vw2qEC/yJbt5sZUNgyKUpdJkwvfwmP1pQXGkci8oKK36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711531006; c=relaxed/simple;
	bh=yo5uvraJbb+EYRE6sX4KlnfNtLj1BG6CWcoO0/bTbG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzBc86kHHMpiHkS8OzjnS/GLOnrWw28HNuwPr8W8ctLWF8wZdsMqXEK7YnVNKVtyLuj1XC9qqVrDv9C7K7i8RCbLjH6sPWOIoAqzXz84/gkk1Ps4n+qQArz+4nWy4ARuyHX1nrkMVUXsld6gmohQkVMzuo7HA+NVnMxu5eYzNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=217.70.188.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Date: Wed, 27 Mar 2024 10:16:32 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Vlad Tsisyk <vlad@tsisyk.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Mask as part of element in set
Message-ID: <ZgPj8I0MmgAX0O0a@calendula>
References: <CAOzR2PfY6hY8dqkfWzN2RGG2yU7RR1t-G4d=dqa+7iUy9mjFyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOzR2PfY6hY8dqkfWzN2RGG2yU7RR1t-G4d=dqa+7iUy9mjFyw@mail.gmail.com>

On Wed, Mar 27, 2024 at 03:36:19PM +0700, Vlad Tsisyk wrote:
> Hello,
> 
> I have a set of pairs of MAC address and mask:
> 
> aa:bb:cc:dd:ee:ff 00:ff:ff:ff:ff:ff

You would like to match this?

  xx:bb:cc:dd:ee:ff

or mark is reversed?

> aa:bb:cc:dd:ee:ff 00:ff:ff:ff:ff:00
>
> ...
> 
> I want to apply a mask to source MAC from the packet, and then compare
> the result with the MAC from the pair. I can do it like so:
> 
> nft add table t
> nft add chain t c
> nft --debug=netlink add rule ip t c ether saddr and aa:bb:cc:dd:ee:ff 00:ff:ff:ff:ff:00

because rule syntax is not correct, mask is reversed:

nft --debug=netlink add rule ip t c ether saddr and 00:ff:ff:ff:ff:00 == aa:bb:cc:dd:ee:ff

that is:

nft --debug=netlink add rule ip t c ether saddr and MASK == VALUE

> ip t c
>   [ meta load iiftype => reg 1 ]
>   [ cmp eq reg 1 0x00000001 ]
>   [ payload load 6b @ link header + 6 => reg 1 ]
>   [ bitwise reg 1 = (reg=1 & 0xddccbbaa 0x0000ffee ) ^ 0x00000000
> 0x00000000 ]
>   [ cmp eq reg 1 0xffffff00 0x000000ff ]
> ...
> 
> But I have to create a new rule for each pair. Is there any
> workarounds to use sets?

You can use ranges in sets.
