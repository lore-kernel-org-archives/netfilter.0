Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC112CDA5
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259389; cv=none; b=aZycEc7IcBflUkIlyMQgOgLH2lonLqSNYdHkV6651UYihOVLKcBBb4Wcu1QOhj+WPcdSGSRFkYfY877rD7eL/CbuQB35Vqr1Mj/ZEtFo2Ju+SP6929+KSRzvXUqjZvXqbufauT4gghKmcmevFBVvSRRUbZRbfbFLT8WCTpIWz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259389; c=relaxed/simple;
	bh=jfU9WgNQcm06ieMeZ8YFGkSxLdYPutbWxvRFcn1mB4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSoDa4ILVBThS/hLxccq0tx10OC/jzROy8t+HRnCwNE8MiuWPWJzjRfssVqaqU3xGNu3ZqEL9EFWzT/fBSfWmy6KwfrH1ADUDtAfx5Sj9du700WogrI092GX7AZfFlxQtZRGNKawjvULoZ/tmYBTu23EysnZzlGyvUOjuauEP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=RPZexZBa; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=RPZexZBa; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="RPZexZBa";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="RPZexZBa"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id CC97F602C6; Thu, 30 Jan 2025 18:49:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738259381;
	bh=h2mM1/OwaIL9Al2N9GrdYNvUIP1z2L2wjAy+ygUPUhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPZexZBaBlsxovs/BSbZyAkvxRqSrSIli9AwgMjriLv45gTTo2APsh7BihvCWoxDA
	 BGQw7+mo25MyAmNcpEWKi3Xm6DdBuuC4rnog5j6l/+9cD8c41BndjJANWvG0p/NYcH
	 m6S4fhu6azZwF8VERJcTFshFGAUxcuP+QUIAgfRZi1I2i+FTi2kcDLnSf6fnRGbVGb
	 BuPWiHwQQkMyKEIuiebYxeaFLmB71I226pchxim1o0BOS9ksebIxx93pr0gCvQ/thv
	 jkPpIKVrnLuaAw/gwvsC2lDs8t4WVhwS5170OW7Ig994i8zp6wkeZ9VauBiA4e/Dd2
	 NZJcggTDZSXeA==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 2F70B6029C;
	Thu, 30 Jan 2025 18:49:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738259381;
	bh=h2mM1/OwaIL9Al2N9GrdYNvUIP1z2L2wjAy+ygUPUhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPZexZBaBlsxovs/BSbZyAkvxRqSrSIli9AwgMjriLv45gTTo2APsh7BihvCWoxDA
	 BGQw7+mo25MyAmNcpEWKi3Xm6DdBuuC4rnog5j6l/+9cD8c41BndjJANWvG0p/NYcH
	 m6S4fhu6azZwF8VERJcTFshFGAUxcuP+QUIAgfRZi1I2i+FTi2kcDLnSf6fnRGbVGb
	 BuPWiHwQQkMyKEIuiebYxeaFLmB71I226pchxim1o0BOS9ksebIxx93pr0gCvQ/thv
	 jkPpIKVrnLuaAw/gwvsC2lDs8t4WVhwS5170OW7Ig994i8zp6wkeZ9VauBiA4e/Dd2
	 NZJcggTDZSXeA==
Date: Thu, 30 Jan 2025 18:49:38 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Alexey Kashavkin <akashavkin@gmail.com>
Cc: netfilter@vger.kernel.org, ssuryaextr@gmail.com
Subject: Re: Clarification of the procedure for filtering IP option fields
Message-ID: <Z5u7sji0GX4Hfjci@calendula>
References: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
 <123C96BD-BF4E-4EE5-8330-35B35E5A37CE@gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <123C96BD-BF4E-4EE5-8330-35B35E5A37CE@gmail.com>

Hi,

On Thu, Jan 30, 2025 at 04:52:29PM +0300, Alexey Kashavkin wrote:
> Hello, 
> 
> I am still figuring out the syntax for adding rules to filter IP
> options. Please, if anyone has an understanding of how this works
> give at least a short reply.

This 'type' field is redundant.

> I understand how the exthdr expression works in the kernel code. But
> so far there is still a question about specifying the type field,
> what is the purpose of this field here? There is also a question
> about other fields, let's take for example the IP option LSRR, it
> has an addr field. I assume, knowing this option from RFC791 it
> specifies IP addresses, but in the case of nft it is not so, this
> field has datatype intereger.

Yes, this should be at least 32-bits.

> With length and ptr fields it is clear, but with addr it is not.
> Please write how it works, what value is substituted in the addr
> field.

I remember to have mentioned the limitations of this with Stephen
(only a few ip options can be matched), Stephen told me this was good
enough for his use case at the time.

I regret I did not push back harder on this.

This extension really needs more work.
