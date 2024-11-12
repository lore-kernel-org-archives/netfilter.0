Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F51A263F
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403220; cv=none; b=I1sFCmCyzOzKLDKkJwRqAEt2uvce4YHGlf0wLnRgXQH2cOda7WtQdQmT/Gq8Vg13z4t0LR39vdb29CiK5cOL35nLmiwtvSr0KyvmribjBK+Ee/npI9k7YR5vtUouVIqsB9Tvu32xWb6V78bZS7WB6QEI1Y8QcLhddSHHEjbkydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403220; c=relaxed/simple;
	bh=CttpKaTD+BHTNjzAFvKLz376WtGCHc+3/O64cuunoM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+PX6URCqVYHoIqwsUNEfiL7HS/EY2RfPp7OXmiokhQJUaG1jxDiJpdQ/DORfk8REYb5M5b5eiga2OT4Dx++arXFiDUEk4Yyp1sG7JM3PqQpjrFEfLmvnGelcpG79D+NRFnynvCdhN+LpMVQL90eevDWG9KQ/ykF2sZZGsFYWAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=44888 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAn4H-0073Ou-5h; Tue, 12 Nov 2024 10:20:15 +0100
Date: Tue, 12 Nov 2024 10:20:12 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <ZzMdzP6KP-kVAhd5@calendula>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula>
 <20241111120946.GA13430@breakpoint.cc>
 <ZzH4mhspJvY6zTRA@calendula>
 <20241111125456.GA14363@breakpoint.cc>
 <ZzMc-e7NdC9-SL5W@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZzMc-e7NdC9-SL5W@calendula>
X-Spam-Score: -1.9 (-)

On Tue, Nov 12, 2024 at 10:16:45AM +0100, Pablo Neira Ayuso wrote:
> I guess the concern is that assured flows cannot be expelled from the
> conntrack table via early_drop, that is why an expedite cleanup is
> important?

Actually, the issue is that packets could end up in a backend which
does not exist after re-configuration, therefore, removing the entry
need to happen so ongoing flow have a chance to talk to another
(different) backend.
