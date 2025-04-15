Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F326D1F4622
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732462; cv=none; b=EdvubebvPcFW/2xs3HygLqvIA4Q5keSYp7etuhKbr4UJ+pOB1UN4SN7mx8YwgcSUe6UNC/2hDZR3DB5TQyGeHwWWwIMSReszxpbXffySr7CqN+GRTZr43u3RR//XqLZdDjqpUvwrc3sbGxq5YQpWIXS8OjMJOfAH0XfrRqfMb3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732462; c=relaxed/simple;
	bh=PjoayTVmMMi/L5urwDnfT4qf/IM+VB221MI+Q9R5Y7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGSkQRFOI5XFLWOKyERkGlp7GjZfcaw9736v5au2NVFBmLx2qOl6s7EVLt6W8tEXIpnht9Xpi6cCgH1UpMsemPudV7F9xzZlRBglhOoofn1U0K2dvjtffQwdcRAXzSmWdJbxEjFt+cFRJ9jDIm0TzUmQkXehTT/QJpzUcQYfNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=LwHR3pRV; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=gXsaJbc5; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="LwHR3pRV";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="gXsaJbc5"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 6B11C60C70; Tue, 15 Apr 2025 17:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744732458;
	bh=fita3wow7wui8+iQkyAVS6kv97p+K+MzzrhpIo6hP8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LwHR3pRV0AQlAc7XlaVFlvmxDWb5a6gAuVUWCtuKLb5qqx9AGn2eN+DObHiza/IgV
	 KJHjjhGwqPUZ1oEGz+9+wyvroQdP5p627mCNLcaR0X3Ay04xLVf9oLZ65pdSu+5TXU
	 CO2OHEbmnFc2cbCsbM7oVFqQJyQ1zX9Zr2GAVZiTkNK9zSH0YdfHm1qCPNLWwIXRGt
	 glSq1oB0Ujsyy3eYeETrvx3YL/tVstFIBfKa2QL1hdo9+RF1+0HSZcBSc8mYhmmzsi
	 jFqedewnEcSxE4GSVfsuOoxJDSdZ1kM61Duybh6aQjve3yadn4VS9qKH0ObmQqqjbF
	 t8JCXR401W9AQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id D039A60C70;
	Tue, 15 Apr 2025 17:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744732457;
	bh=fita3wow7wui8+iQkyAVS6kv97p+K+MzzrhpIo6hP8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXsaJbc57YKjG924TJcz2711Saot8QitaGiU/9RwoN6+V3K5sEFl1o+uIyl7efMcl
	 KAwsYHbQzkzD2GlrWJmW4svBTxx90LNvO/8Lmvl6hXY+DlcKjLdDMSfwv6pBEOkdf+
	 l85fvqGhjSohjz/PKM6/EMYjCdvyFkJ6lpx/2nw3joO44L96dTPbnk4eG1MEpDtcOA
	 96PqNzIJ1enN3ulpA1n1BqjF2Okf4fhMqab0ynSbuNeCxzXvv0LOOBkQXOVettE3zH
	 HLGvp+gSxLGUQQdr5L1ghZzRVjwM3/xsyiaydxRoGhmW7AhwoJWBMkNcmgZ1+xs7MS
	 8uPgP8Tzs2sew==
Date: Tue, 15 Apr 2025 17:54:15 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
Message-ID: <Z_6BJ81Iw1uS7zuY@calendula>
References: <Z_1KxMUDT0D8e6wH@calendula>
 <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk>
 <Z_5vmAQdcUCOg86F@calendula>
 <01529A93-9DCA-4F48-8F80-C4CB32A11B43@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01529A93-9DCA-4F48-8F80-C4CB32A11B43@slavino.sk>

On Tue, Apr 15, 2025 at 03:22:52PM +0000, Slavko wrote:
> On 15. apríla 2025 14:39:20 UTC, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> >https://git.netfilter.org/nftables/commit/?id=da0bac050c8b2588242727f9915a1ea8bc48ceb2
> 
> Thanks, but i still do not understand, consider this set:
> 
>     table inet filter {
>         set testset {
>                 type ipv4_addr
>                 flags interval,timeout
>                 auto-merge
>                 timeout 1m
>         }
>     }
> 
> Now i add one network, and one or two seconds later second
> network::
> 
>     nft add element inet filter testset "{ 192.168.1.0/24 }"
>     sleep 1
>     nft add element inet filter testset "{ 192.168.2.0/24 }"
> 
> Currently (1.0.6), they are merged with timeout reset::
> 
>     table inet filter {
>         set testset {
>                 ...
>                 elements = { 192.168.1.0-192.168.2.255 expires XY }
>         }
>     }
> 
> What will be result with new behavior? Will be both (not merged)
> in set, each with different timeout/expires?

After this update, two different intervals with different timeouts are
added.

> Another example is to add subnet of existing element, currently
> the new subnet is not added (or is merged into existing without
> timeout change). How it will work with this new behavior? Will be
> both in set? Or error happens? Or something other?

After this update, with subset, an error will be reported if the
interval overlaps.
