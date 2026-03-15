Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3709537A485
	for <netfilter@vger.kernel.org>; Sun, 15 Mar 2026 18:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773597842; cv=none; b=eDhxOJbnh+MZ/IJwdwHjDRRSmgCGJLFgmpTipla2nsm2sdpbODrQawIiQf7vZoKuCjY3Nb20dFoLSCdJOjZeMmjvrSC5l2gTiOMqufdUDVnVFhG2D4Jj2E4Zn3jdT+Qww8ulamDM687PYOWkG9RXbJoc+i24/pgVq0nTWgo7eyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773597842; c=relaxed/simple;
	bh=B0ssCV4arkMHgXCy0rx5YfcM8j4OM/Co5NIXFIGXfZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhHRwX9wndV99zZsIQzSJ6DzkBcIzr2wZaCocheD++rihKSwqRStWLPHuaR3BthbHqM2ZOZjQ8IWLZIn48F9cIJzA34/Rm563HYf8NdXZJK1O2V6u8NtirL9Ad50YN0+zQA8958X1JL9HqbcA2+pscMGZ/AgXt423fTv+BwSrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=GpQH+OZG; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="GpQH+OZG"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 39B7D600B9;
	Sun, 15 Mar 2026 19:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1773597831;
	bh=JfU0ogS4qlnot88RsfVYjpHAxLdn328kviAypQjGs/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpQH+OZGfadAlcE6cOzr2uCsNMohmp96G5I6E50WNTdKGJS5AGdrt7W+p9yjLQPFm
	 7qNAzcAYgc0OKGUn88du6Bwe0lsAkXTW/lebbOBaTcGqfkOYxE4qFsD4O8UXc1+dqZ
	 4wa8k+6MHe1fnr7ppIflu4MNQk1viR9vFck9S7Ym9Z50M/4yznRkNTVx6m/WN/hRu8
	 iOw5ZLuBlvA+izR3242P2ckVZV5nLyA9jCPCZvkLsTW0TZMEqlezZqwRR7uakCvKCQ
	 xeonwTuboAWlxW3lhH0O9hgDfCHf1rDmGkQuh81w9CWTwhf2fnWwo8abfy2kb1sKHn
	 64EavaW31eEmw==
Date: Sun, 15 Mar 2026 19:03:48 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Mathias Dufresne <mathias.dufresne@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: [nftables] table netdev, chain ingress, too much interfaces?
Message-ID: <abb0hBaCsEFDW8Wv@chamomile>
References: <CABwLUps_jV54QpqN6PPQiqBUGpyAVbWT-Ht+FgxM21-UxjJ-Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABwLUps_jV54QpqN6PPQiqBUGpyAVbWT-Ht+FgxM21-UxjJ-Wg@mail.gmail.com>

On Fri, Mar 13, 2026 at 11:51:25AM +0100, Mathias Dufresne wrote:
[...]
> and the error is:
> nftables.conf:7:5-42: Error: Missing `device' in this chain definition
>     type filter hook ingress priority -499 ;
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It sounds like you are using old userspace version.
