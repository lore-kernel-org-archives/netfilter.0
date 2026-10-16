Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD943D524E
	for <netfilter@vger.kernel.org>; Fri, 16 Oct 2026 22:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191076; cv=none; b=YdPa3Dvhct0vo8VcnJuGsymmM6flbV24J+RVvFuLFoin8XRcm0lvAO1DQuQ8BbX/P/SR4vCJcHrdD3ZFLlqbbt0L4GpETndmvnFMgjxH8NbCh43N61w8ypcDkrPuFiPRMUDaAH/Dv2AVEo3Pefd7aDATnmAqMmk16ntu0NBM3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191076; c=relaxed/simple;
	bh=pmjUWNlFL9UV5fF3LzoPQvn4r9OasBGzOtZ+z6NSHzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTC70NKGBfj7ZrXUFrmNRneohaKMPzIfDCM5ePPV0Y1Cc4zMfkB4Gp+OwlfwGEPZT3uwOmg3DOqwolJqN/ozh6VXhFnvXKdbk1ERGqqU1iTC5D0eSr/QTdwGtyp4Li6PN2iN3RG842pOw2g7o0QfTz1xOHGChaxtt3qMMjIu0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id D1FA660327; Sat, 17 Oct 2026 00:51:11 +0200 (CEST)
Date: Sat, 17 Oct 2026 00:51:05 +0200
From: Florian Westphal <fw@strlen.de>
To: Richard Van Tassel <richard.van.tassel.work@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: userns packet mangling
Message-ID: <atKqWQwqM3AW7pil@strlen.de>
References: <CAGLc8_RABvE42M_1icBskniznt5-e2QLNd7g3Fku3bcw+2aE2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGLc8_RABvE42M_1icBskniznt5-e2QLNd7g3Fku3bcw+2aE2Q@mail.gmail.com>

Richard Van Tassel <richard.van.tassel.work@gmail.com> wrote:
> Hello, netfilter world.
> 
> I am very curious about the status of re-enabling packet mangling in
> user namespaces.
> 
> I understand that it takes time to find and address security concerns,
> and I hope the netfilter community takes all the time they need. That
> being said, I just wanted to echo the appetite for that functionality
> to return, similar to
> 582d218b638be68342dd80893c41746b35c1be76.camel@student.kit.edu (sorry
> if I'm linking this incorrectly, I haven't used this sort of mailing
> list before)
 
> I am currently working around the disabling in a somewhat controlled
> fashion using a custom kernel patch and module to allow a process in
> init ns with CAP_NET_ADMIN to grant permission to mangle on a per-ns
> basis. As I understand the situation currently, I don't think there's
> much appetite for accepting this workaround as a kernel contribution,
> since the disabling is meant to be temporary. But I feel like I should
> mention it nevertheless.

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260905050150.30273-1-fw@strlen.de/

is still pending, and its closing known security hole.
So no, for now we can't re-enable this feature.
