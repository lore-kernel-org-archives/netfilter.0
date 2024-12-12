Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F11DE3BF
	for <netfilter@vger.kernel.org>; Thu, 12 Dec 2024 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734042390; cv=none; b=GOXBmeU1sNKymTFMcFf9G/WMk16SB7hARlBc83mSTKHNPzD+i8xnEV+JABh5yYJ+rEZdPgvTH/U1EImO8NPd4G9XQw4aXudUTJkpEIpV+19udBwmUMcCDk2pG7xs3igc8AOv7pXBMsOim9BCjEPJvp/oMnimzeREtGf23f4q2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734042390; c=relaxed/simple;
	bh=EKq+3T9lmdAOzhGeXp278nMsOA4HSH4e+f2ynO5o52A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STnZ9rr8rpr8Mh4oCxv+IzsJuOpjYt1qZhhVWbrZEmbNB7msEt8EgNBnVFLlVK2a8F0CATG0NmvVJ8DWe8hg1FzBpsgr8zzxFp+zlSFs+MulPOXNcww0hRHjlwiNmRsgI5H9/d0HoPnoP7bP7ZTooM3MjiVrYyXcu1Xk8ZjTeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.39.247] (port=53552 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tLrdR-006p9U-7n; Thu, 12 Dec 2024 23:26:19 +0100
Date: Thu, 12 Dec 2024 23:26:15 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: caskd <caskd@redxen.eu>
Cc: netfilter@vger.kernel.org
Subject: Re: Regression 1.0.9..1.1.1 in glob inclusion behaviour
Message-ID: <Z1tjB1M0L5d2mja6@calendula>
References: <2HWYO8DBOM98M.3CP5UDE19R679@unix.is.love.unix.is.life>
 <Z1n9Gj6UaA5CfQIj@calendula>
 <1YCABX5KN97Z8.2KUN1QSJDL07P@unix.is.love.unix.is.life>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1YCABX5KN97Z8.2KUN1QSJDL07P@unix.is.love.unix.is.life>
X-Spam-Score: -1.9 (-)

Hi,

On Thu, Dec 12, 2024 at 10:33:14AM +0000, caskd wrote:
> > I don't manage to reproduce such duplication with 1.1.1.
> > 
> > Would you make a simpler reproducer?
> Yes, surely. I've tested the following in a priviledged debian unstable container and i have the same behavior.
> 
> mkdir -p /tmp/test/include
> echo > /tmp/test/main <<-EOF
> table inet test {
> 	chain test {
> 		include "include/*";
> 	}
> }
> EOF
> echo "tcp dport 22 accept;" > /tmp/test/include/one
> echo "tcp dport 25 accept;" > /tmp/test/include/two
> nft -e -I /tmp/test/ -f /tmp/test/main
> 
> Executing this on 1.1.1 results in the following being executed/outputted:
> root@nnd-navi:/tmp/test# nft -e -I /tmp/test/ -f /tmp/test/main
> add table inet test
> add chain inet test test
> add rule inet test test tcp dport 22 accept
> add rule inet test test handle 2 tcp dport 25 accept
> add rule inet test test handle 3 tcp dport 22 accept
> add rule inet test test tcp dport 25 accept

Thanks for your reproducer.

I am proposing the following fix for this issue:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20241212222436.179133-1-pablo@netfilter.org/
