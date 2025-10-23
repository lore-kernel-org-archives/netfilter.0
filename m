Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1B930AAD4
	for <netfilter@vger.kernel.org>; Thu, 23 Oct 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219738; cv=none; b=uQkwUJdanocbFm4LnD3asQHnzwPoVIsidr1cQLULj82n0uzxZnJb+vW8PGxH7yaMHD0i7HtPxH1/ClSw7nOmDzoWIeCUj8ho4JYDrzqrBl1bTDcgvH6oQBsRg6z1ZLfunhf0MOnINALyMkYtwLnKsg6l8hDk6sLU2fXyarisXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219738; c=relaxed/simple;
	bh=bvsdGbajE4nNcFmItlifGzXUeWL4/gtwWEDzz9okwHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ433BqojDvR4qFDz9c4R85CThxJ5rQibhk0446uOPEpNOqpfqT6i7/JWVPB0gFSYG5TeBWRUVpEA+6xIUpcr/rpBIjkxZhxFpFhT1dWaBuipA5LUU9/dZdRLU94cs0m2lKqQnOKwW5AVFswFCnn+0140Y0Jlyg8geqqF6com1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Bd1FCDuj; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Bd1FCDuj"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 4CF3C6028E;
	Thu, 23 Oct 2025 13:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1761219726;
	bh=UqwWKIiEPTmdYk0MEco4+01Ttr8ohrYqS9/w2Oyk7Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bd1FCDujILSq+XyprxJoPqWAqA9+03OhA+vN++pNlKjnpGmKSbyZfqk/Fqlvgd0BK
	 xQiSt24smAaSn+EpNFeC83e05xKxgeRUJttF6syG+FkY+JGE2ewFvF5h4Fp9rik9T0
	 3Wz8Y/HQ2J7z01Rox9VSUfs8bLr3NFOx2m3O894XttmuDAahvVLUCwtfo5zieHjknq
	 /rxoCEGehWwaIBEiDtPNoyaKjSo8vCJ084xseDosz6feQq3k1b8h/7H0bU2qGBNszL
	 qn0im3XIx1K+c7Tcr7352SMvZNV+B57tNahsBvC7hoVpFho8NdEByMn/TIQYA8yonL
	 XGUy+ssP8j9jA==
Date: Thu, 23 Oct 2025 13:42:03 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: louis.t42@caramail.com
Cc: netfilter@vger.kernel.org
Subject: Re: Nftables ct count over 2 counter continues to trigger with only
 1 connection
Message-ID: <aPoUi7Uqienwt-Vq@calendula>
References: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>

Hi,

On Thu, Oct 23, 2025 at 12:54:53AM +0200, louis.t42@caramail.com wrote:
> Hello,
> 
> I have read the documentation and asked on Stack Exchange but am unable to find an answer to the following behavior.
> 
> Given this table and chain where 123.123.123.123 is my own address:
> 
> table ip mytable {
>         chain mychain {
>                 type filter hook input priority filter; policy accept;
>                 ip saddr != 123.123.123.123 drop
>                 ip saddr 123.123.123.123 ct count over 2 counter
>         }
> }
> 
> I am establishing a varying number of TCP connections from my own address by connecting via SSH. These show up in "ss -at" and "conntrack -L" as well as disappear once disconnected - all as expected.
> 
> With 2 connections open I see "packets 0 bytes 0" on the counter. With 3 connections open I see "packets 6599 bytes 475441".
> 
> The question: when disconnecting 2 of the connections (from 3 total back to 1 total) the counter continues to increment. It triggers even when "ss -at" and "conntrack -L" show just one connection with no TIME_WAIT or other entries.
> 
> It even continues incrementing after a "conntrack -F" and often feels as though it is a one-way switch once the counter has triggered. Sometimes closing all connections (to 0 total) stops the counter from incrementing.
> 
> Is there an explanation as to this "ct count" behavior in more detail?

This behaviour looks buggy, I am trying to narrow down the issue.
