Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC0F9EC
	for <netfilter@vger.kernel.org>; Thu,  6 Nov 2025 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762470937; cv=none; b=Km+sGvUaPLeSKk+KC3b0psP6KGzThCPwPwqqbmkDfNYJljOM5f+2D0cHBlv10BXCq7l5EPvF/v1J/RU09SiL/15bKQ5OdxU3eqevdrOmQYdpKVjvReedpxbMp6RLH3lFCt0pTKW2kNTBAZOooZeqNm2voq1pjC4AK1MpL1LmTpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762470937; c=relaxed/simple;
	bh=bte1bFue9Y+z84XwjEvXiRfvXUyonQzadEEZfdxsWTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVfbQxrphnEFWRSFaFCY4+rQzBpsUCNCOs+JSRIY3HncrBs8Y7qyIbOcH0tqWuhkmO6zztD1n+r+U20JcL5YRpiXszTaOWP8ArOcrtQ7IecpibE92RNLG6xMu89ARsUkbLF6Tvekc71rSZRgculeng9Ld9jsRiSeJZL91/UYp0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 972046021B; Fri,  7 Nov 2025 00:15:26 +0100 (CET)
Date: Fri, 7 Nov 2025 00:15:26 +0100
From: Florian Westphal <fw@strlen.de>
To: Alexandre Knecht <knecht.alexandre@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: [PROPOSAL] New wiki page: Simple rule management with JSON
Message-ID: <aQ0sDpDfpm5L7I0i@strlen.de>
References: <CAHAB8WxH4rVdr6ngRb+N064aChuO74fgZy=i4=hprufnbRxYRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHAB8WxH4rVdr6ngRb+N064aChuO74fgZy=i4=hprufnbRxYRw@mail.gmail.com>

> 
> I would like to propose a new wiki page that provides user-friendly
> documentation
> for nftables JSON rule management. This complements the technical reference in
> libnftables-json(5) with practical examples and beginner-friendly explanations.

Thanks for writing this!

I will make an account for you so you can add it yourself.
