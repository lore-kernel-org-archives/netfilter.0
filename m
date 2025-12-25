Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909D3A1E60
	for <netfilter@vger.kernel.org>; Thu, 25 Dec 2025 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766701200; cv=none; b=ihxkbSmuNrcsh0C5XN8Wm7+cTW+8ADvEMLPx0r/udZ3Ke/krWay88072YdOV/4Q9b5tdEhD8S4a7wtipoddggXJ2rwbY3bKgelDoSjYSL4E+AtU2sAcSN2fLN4vmCXZhfNMjxXE0x6C811lSWXhwrQfUbD1EPTnkTX3++b7TiR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766701200; c=relaxed/simple;
	bh=2JWlbUZ7dBJ653od6XHAi2p/kJr6J+EBDVWyNCu8azA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V84ndmRXbiiIBSdUtROCUTtH91Pwkp1xgnWMfgOYsZCp0MTsKzckZWd1LU9IuU7QsFFKGZKob/SFAyDUgz1KYxIwpeC8aQiBQSN2kc4Cwev/tppiwqreAFxG2qn2zoCSgWVyYiwZ7kh/L8NlPNgKM/6MSRipCbqd8oJnFrw5I/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=ASqRiWg5; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="ASqRiWg5"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 260F2600B9;
	Thu, 25 Dec 2025 23:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1766701189;
	bh=tnTHC+kLt/KhiwBuzdW5HS1E5rkFu6n7R5lyP1vQTTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASqRiWg5/p1MW6vnYBC68OrVdc7GTETGOJ+fnvIjncErQvi6juCPR45yAbCseKO5g
	 pLgo3mgwOmiVxE7+CejnLIuXBQLTjHMkgDBMx+Md0helNDDG9TvyvVwR0RD8nraPB/
	 8Ja/FnX6XMper6dLVrpFzeQr/LH2FCjunigHNL6Q+4/s9Xg1gLayiB4enpUoRnjamx
	 rA2eakY248/CJc3HNWHMyKXgKe3dZK1nuVh7ro+E0jwD/IRKPxS9HcTsSMUX2R/V/z
	 S5kHOQj+Jaz3L/8mnlO280WTj6fSv4nS2FUFNihyFT16wpdB4eNyiHoIxGHAX5VsKn
	 qpLcyu2nc941A==
Date: Thu, 25 Dec 2025 23:19:46 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Maiquel Paiva <maiquelpaiva@gmail.com>
Cc: security@kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [SECURITY] nf_tables: incorrect sscanf return check leads to use
 of uninitialized variable
Message-ID: <aU24grYBKEoWErwE@chamomile>
References: <CALGDAeBqaTDJhZr0AuFz5M2fmgXsyxLz73Rkqj5ZwwRFoFHoGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALGDAeBqaTDJhZr0AuFz5M2fmgXsyxLz73Rkqj5ZwwRFoFHoGg@mail.gmail.com>

Hi,

On Thu, Dec 25, 2025 at 06:06:29PM -0300, Maiquel Paiva wrote:
> Summary
> -------
> nf_tables_set_alloc_name() uses an incorrect return-value check for
> sscanf(),
> which may lead to the use of an uninitialized stack variable.
> 
> Affected code
> -------------
> File: net/netfilter/nf_tables_api.c
> Function: nf_tables_set_alloc_name()
> 
> Relevant snippet:
> 
>     list_for_each_entry(i, &ctx->table->sets, list) {
>         int tmp;
> 
>         if (!nft_is_active_next(ctx->net, i))
>             continue;
>         if (!sscanf(i->name, name, &tmp))
>             continue;
>         if (tmp < min || tmp >= min + BITS_PER_BYTE * PAGE_SIZE)
>             continue;
> 
>         set_bit(tmp - min, inuse);
>     }
> 
> Problem description
> -------------------
> sscanf() returns the number of successfully assigned input items, or EOF
> (-1)
> if an input failure occurs before any conversion.
> 
> The current check:
> 
>     if (!sscanf(...))
> 
> only rejects the case where sscanf() returns 0. If sscanf() returns -1
> (EOF),
> the condition evaluates to false, and the code continues execution with
> `tmp`
> left uninitialized.

Looking at lib/vsprintf.c, I don't see how this can return -1.

And you will have to fix more code in the kernel if your statement
would be true:

net/core/dev.c:                 if (!sscanf(name_node->name, name, &i))

> This may lead to undefined behavior when `tmp` is later used in arithmetic
> and as an index for set_bit().

Even if that would true, tmp is checked to be on the boundaries right
after this.

                        if (!sscanf(i->name, name, &tmp))
                                continue;
                        if (tmp < min || tmp >= min + BITS_PER_BYTE * PAGE_SIZE) <--- here
                                continue;

> Proof of incorrect check
> ------------------------
> A simple user-space test demonstrates that sscanf() returns -1 for empty
> or whitespace-only strings:
> 
>     input: ""      -> sscanf return = -1
>     input: "   "   -> sscanf return = -1
>     input: "abc"   -> sscanf return = 0
>     input: "123"   -> sscanf return = 1
> 
> In the -1 case, the current kernel code does not execute the `continue`
> statement and uses an uninitialized `tmp`.
> 
> Impact
> ------
> Depending on stack contents, this may result in out-of-bounds bit
> operations,
> memory corruption, or kernel crashes (DoS). While this is a logic bug, it
> has
> security implications.

No. This report is bullshit.

Happy holidays!
