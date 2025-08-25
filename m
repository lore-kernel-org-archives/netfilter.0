Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95628C035
	for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756118884; cv=none; b=XPTXAz+u6o+s51Mq3lQ4/VYQtPD5iE9ZcBNwDjodZ2MTNtw404g9ZAR3yboRalUpFZDukTdkvwFbp90aEjCgMeo+ptWLdMnlTSGya1ld9gmnnYrAPMe7IzUtVRo/lomBTtzhIMLKvDFf3zUTN73UG8JgpZ9OHA1jA94i4hoBxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756118884; c=relaxed/simple;
	bh=nnXvo7yQIkVUeN0/E7cpTJ87L8BTdc8/5h5I5siSbto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pinJhx6qzx/e38Wo1R0edoYGIBQyENkaNSrKm9guE6GsTCL7AZnGW57Z7WXsGjDCUnLzMQERmqpC2HL0/+JpDp7xtHUuocRxfmzYcoLktIVUgos3+tjqpr4JcLyyk5rVCv+GHDY2kGKGLNypHCt8iT4nBk7Xpz0qgnItoesKGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=P1rBfxBF; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=P1rBfxBF; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="P1rBfxBF";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="P1rBfxBF"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id D652560263; Mon, 25 Aug 2025 12:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1756118880;
	bh=og7L6qUYvAJg2U1tPi/1RCIC4AZmOMnXWe863LIZ4a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1rBfxBF0v8xcSaYsi4hinpq6k/2puANUl6V6UYCLsrjQn1vcze1OkP5SUZEgi3mP
	 hZaybzbubn6KW85BbVP44F3Q1DbFYEN+6me+GDFIUTEhNaJt4a8Z5nE2rV2o4MGL7a
	 Dpk3+Ouh1Old5RQDxrIThB5AD0lFQfQw2v6B1lwOBIQQDOKsEU4URVsb9mln1SdLUA
	 hr10FT6FEjefRVJxmUAIJKvprpBpaVI/B0lWb0X74Yecv79+ZOMP0rW9obYdAQtnk6
	 Bb2K1cG8DVqubHs/dNq20wtGrY2xKkWsjyD0EZKoqLOOMPfALpn8rEHKBFWiMsweuZ
	 iMyKEfVzCTnzw==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 4E7A960253;
	Mon, 25 Aug 2025 12:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1756118880;
	bh=og7L6qUYvAJg2U1tPi/1RCIC4AZmOMnXWe863LIZ4a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1rBfxBF0v8xcSaYsi4hinpq6k/2puANUl6V6UYCLsrjQn1vcze1OkP5SUZEgi3mP
	 hZaybzbubn6KW85BbVP44F3Q1DbFYEN+6me+GDFIUTEhNaJt4a8Z5nE2rV2o4MGL7a
	 Dpk3+Ouh1Old5RQDxrIThB5AD0lFQfQw2v6B1lwOBIQQDOKsEU4URVsb9mln1SdLUA
	 hr10FT6FEjefRVJxmUAIJKvprpBpaVI/B0lWb0X74Yecv79+ZOMP0rW9obYdAQtnk6
	 Bb2K1cG8DVqubHs/dNq20wtGrY2xKkWsjyD0EZKoqLOOMPfALpn8rEHKBFWiMsweuZ
	 iMyKEfVzCTnzw==
Date: Mon, 25 Aug 2025 12:47:57 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: lilydjwg <lilydjwg@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nft error Could not process rule: No buffer space available
Message-ID: <aKw_XTxe24gOAreu@calendula>
References: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>
 <aKw4DikLFS8MVGVY@calendula>
 <aKw_GLWO53mX2ELx@lilyforest.localdomain>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKw_GLWO53mX2ELx@lilyforest.localdomain>

On Mon, Aug 25, 2025 at 06:46:48PM +0800, lilydjwg wrote:
> On Mon, Aug 25, 2025 at 12:16:46PM +0200, Pablo Neira Ayuso wrote:
> > Hi,
> > 
> > On Sun, Aug 24, 2025 at 04:18:50PM +0800, lilydjwg wrote:
> >> I'm switching from iptables+ipset to nftables, and as part of it, I need to
> >> import a set containing ~2400 IPv6 networks. The file looks like this:
> > 
> > What nftables version are you using?
> 
> Sorry I forgot to mention that I'm using nftables 1:1.1.4-1 on Arch Linux
> and the linux kernel version is 6.15.8.

Provide your example listing to reproduce this issue.
