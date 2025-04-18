Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668F28836
	for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 00:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744937700; cv=none; b=l/nSQi8ZwYb6PrXlbv+wOR3Hm3Hf79aOvB2ad9smn6JHP9uVS/ZX2GOFcUqvnzmi2jAm6Q4p10vW3M2kkVFEliBRhugseiOyXsn9/9zB+fJxBY5YUi1RW4lhyRJ4h1UNAqGgPenwYpfMuNtQ/h007hWxO53qyuSBXPrUo9XsdNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744937700; c=relaxed/simple;
	bh=fy9LQZ13nDi4yF2KXWcU5IVZrM4L4V8MJjUIjptFlGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o88LLpQ2mbslQhtVAg03JvXycojaodtQV96NkQzwhdJBAzHe0nSfUkq140a1QzWpSxGZw1T8pNfi/k/+t1cCoiLCRSGF+3gAKN18K+cmK9iQk2PqobL0UgGtwfHTm5zQIr+eYm6XtqL/gXoBunp3T0k6+BCbBeEUm86PjHN7taM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=GRsJ/R8o; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=qRp5Pskt; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="GRsJ/R8o";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="qRp5Pskt"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 3077B60884; Fri, 18 Apr 2025 02:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744937695;
	bh=DznhhMOKNbyh6UHT713VFQB8I+m95JAhiPL34f7Ad/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRsJ/R8oSH6MPq0bEhbCcQdjrkgtX+Ws6qgyKfkt3me+mWEAQljZW/wYpcMXviXhB
	 zgwQBcESHtsdZMNVU7MmbEUQsSDT5l86BhAs7pufGAcbu+EgIz/97pjf/kglEGNbwt
	 qraKVW15Op1Ye4CECrVju+oWzoXMI7+FlrVXCUsj/8h2THMS1M2czPKc3GpEL69cY5
	 Z7JM8pY56jWNg4AilFMNVq3V7ibZjiOrlRu/TQrHo2UdyQ5yTcjrGaZYwAJlbX20LT
	 WgB6HJ6M1/n0WKAB6i0T1bNwPhrmMS86l+T+EJuosuz5xByQQEL9VxrhHL/Q3z+7bX
	 AZUF/bQ8eYAHA==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 8E8DC6085E;
	Fri, 18 Apr 2025 02:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744937694;
	bh=DznhhMOKNbyh6UHT713VFQB8I+m95JAhiPL34f7Ad/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRp5PsktURk4+uwo3xtsuBkVr4kJCbwwK0cidFVuqRmwcsrv8uXB/Dgx/OSWNOLQf
	 PK0EPyRl1iujViAxUrR5BJAwv5t+rS6yWLRMDrAECPhsAYg8+xgu3waMeXej3xPVlV
	 eqm5b4yYWpHlAW2M+BtfQmcMMurXVXrgcuDoaqnKh+59M0RRvPBR9zWzks5JuQixbo
	 FH4lHbXoeSaTmLcW9KoeSrmI3Ty/NRmjvbkkrKjy/BCxLn4zFSvdMBCcM0QrSSujLF
	 /JuG9bydTlW3MfOKEyGzb17+/j39SVSDyvpdvP+0WJAyoIWaPO+pBJ00vploJfUVzT
	 ZywQbQGEiPbeg==
Date: Fri, 18 Apr 2025 02:54:52 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Anthony Ruhier <aruhier@mailbox.org>
Cc: netfilter@vger.kernel.org
Subject: Re: Replace flow offload by flow add in wiki
Message-ID: <aAGi3BJ_tZudukGi@calendula>
References: <yw2rcklool64bepdn3kue7yj7xryymdmhjoe72hqujj4xaads4@yzo7qkb452oc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yw2rcklool64bepdn3kue7yj7xryymdmhjoe72hqujj4xaads4@yzo7qkb452oc>

On Fri, Apr 04, 2025 at 05:12:03PM +0200, Anthony Ruhier wrote:
> Hi,
> I was setting up flowtables offloading in my nftables rules, and I got confused
> by the wiki page.
> 
> In https://wiki.nftables.org/wiki-nftables/index.php/Flowtables, the example
> given to offload a flow is using the `flow offload` rule.
> 
> If I understood correctly, `flow offload` has been deprecated in favor of `flow
> add`. Is it possible to replace any occurrence of `offload` with `add` please?
> 
> Also in this example, I got confused with the presence of the conntrack state
> rule:
> 
> > tcp dport { 80, 443 } ct state established flow offload @f counter
> 
> From
> https://thermalcircle.de/doku.php?id=blog:linux:flowtables_1_a_netfilter_nftables_fastpath,
> checking that the state is established seems unnecessary, as `flow add` will
> match only if the conntrack state is "confirmed". If it's correct, could it be
> removed for clarity? And even better, add an explanation over when the rule
> would be matched.

For the record, I have updated this.

Thanks.
