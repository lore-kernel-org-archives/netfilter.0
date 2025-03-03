Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA220B7FB
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042355; cv=none; b=ZOYkWbgnp4ow8o8gpe+JjAUlwQ0s+sNR4Z+qd2fey7X8Aj6cogOPzlW9RUSggv2Pe3W9wCMhniklTpgKdVF0MqZrb8QvImQjisCMsZeVUer9wm4C1wG1GDDbq4xd5vyWw9ehFVGsyep+IPDeRDK5MTRxWm6tykM1JUuSx4oh+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042355; c=relaxed/simple;
	bh=BTo5tahGkmlEevjl0N6dV/JC/IfEB87PyfTMAavU7O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqIywwX+/DYAd6N+FtlTZZUTCUUlVJclZe+uOQnzh1oo/tZAhCi1GKAtSWAU8TEjQmzMMT+/z0dQHm2mB3u7CAf2cKYbDwGRuUIcOoylcpOvXBb9AcFjmufdZXKW3WMIldO3TYjvNTpGwEHhQJGchOCSxONZGUw2+m7miwzQJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=iVxGcGYk; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=iVxGcGYk; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="iVxGcGYk";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="iVxGcGYk"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 8D8A260284; Mon,  3 Mar 2025 23:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741042344;
	bh=1WaNOfC5zRYGVxCtkt2o5GKuU4Yv0Wn6Et/NUHXrHc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVxGcGYkK5dlRb/HKuDLhIWc6/P/5OIPtGwXQqbJDRFQQONbqVXJO1U7/HfZb4eoD
	 tsEHAIr2/uWWAknZq+O9JTLV2QMTYsiwPdfslU6tRw6nSTXGxrgyDi7HJZFQ6Xdd8/
	 0Q4r2AlVfpDgNhHlwhm3qZ3d98E38h7QXlrVSZfAQj8sQxM/ClBRealcz0NJpkDC6D
	 1s/JvXVF+9ebVI9urLtRSs0AYCc+HSRbnFrhtqv73DdeSBn0/ulvIaV5O9QjOAHFzs
	 URXmIeTxHvjORHvkp9RKMYr2BBhzq9l11CkBNLUl2jvDALKwvm5ig/ZJpMbPFK2v4Q
	 8mwVGe5+sVmSQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 022FE60283;
	Mon,  3 Mar 2025 23:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741042344;
	bh=1WaNOfC5zRYGVxCtkt2o5GKuU4Yv0Wn6Et/NUHXrHc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVxGcGYkK5dlRb/HKuDLhIWc6/P/5OIPtGwXQqbJDRFQQONbqVXJO1U7/HfZb4eoD
	 tsEHAIr2/uWWAknZq+O9JTLV2QMTYsiwPdfslU6tRw6nSTXGxrgyDi7HJZFQ6Xdd8/
	 0Q4r2AlVfpDgNhHlwhm3qZ3d98E38h7QXlrVSZfAQj8sQxM/ClBRealcz0NJpkDC6D
	 1s/JvXVF+9ebVI9urLtRSs0AYCc+HSRbnFrhtqv73DdeSBn0/ulvIaV5O9QjOAHFzs
	 URXmIeTxHvjORHvkp9RKMYr2BBhzq9l11CkBNLUl2jvDALKwvm5ig/ZJpMbPFK2v4Q
	 8mwVGe5+sVmSQ==
Date: Mon, 3 Mar 2025 23:52:21 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Michael Menge <michael.menge@zdv.uni-tuebingen.de>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: nft reset element crashes with error BUG: unhandled op 8
Message-ID: <Z8YypbNwLJZrarj4@calendula>
References: <20250228151158.Horde.S7bxprjzrKb3P7rZjqTDZz_@webmail.uni-tuebingen.de>
 <20250228142507.GA24116@breakpoint.cc>
 <20250303165022.Horde.zz0jv6tjsYLYlAYzTWTTTN8@webmail.uni-tuebingen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303165022.Horde.zz0jv6tjsYLYlAYzTWTTTN8@webmail.uni-tuebingen.de>

On Mon, Mar 03, 2025 at 04:50:22PM +0100, Michael Menge wrote:
> 
> Quoting Florian Westphal <fw@strlen.de>:
> 
> 
> > No, you can update existing element timeouts:
> > nft add element inet filter updatesv4 {1.2.3.4 timeout 1h expires 1h}
> 
> I did test this, but it does nor reset the "expires" counter",
> in which kernel/netfilter version was this implemented?

Linux kernel >= 6.12
