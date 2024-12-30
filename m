Received: from mail.netfilter.org (xvm-190-124.dc0.ghst.net [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971A1991D2
	for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735556799; cv=none; b=r5aNfTqBvhUqjHbjrdfqgZZagEheUBGBtXzeQrY2cmZ2qWDJ/oTshuZqXhXz4FqeHHp6wS5tWs+A+ns8hUq/qKTbgv+hmJAuuIRRhs99ge0bnfJZ0UOiOlTednrY6ZSm0p3x4HXekMkWBNXrXilVKQfyqVbEWnK1SlDzZtgyUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735556799; c=relaxed/simple;
	bh=Zu6ugzRUS9aU1Gsi0ZyBeSawWBTqsDwMlR94RBk5Kfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFVBDtt8X88Glck95s3citwWir+M80WuzFx0VXrZDta5rUeui2t8nu9WEIbdfgTQBwO6gWIEM3XY09rEZVfJyEW5rO3GhSOsgdDT8taGN0oyR3nw+X5CbY3kKJNbZXs6Ev403KBrC6mRr+L3xL8o1sdh9aWqTzqV0ljbP1s/8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=fail smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=LPyskIEA; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=W3xJ0qDU; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="LPyskIEA";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="W3xJ0qDU"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 6EF6660243; Mon, 30 Dec 2024 11:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1735556225;
	bh=891MqkxZrRdJEQJwBkT7YvQQHdE+Qr8O4DsmJG4gSrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPyskIEAphtyMOf4eljdVX4J99wgrpXnEihmbFaZ6nQmvs+iWHnHeZRpzG9N7gGxc
	 JmSN5Y0bG8Qnyz+G/jvJ6E6MDRj6qP0AjM49H4WautVGXPsWVpHCgWiaUpHbW0tzVn
	 e7K5fJc318W8kgoPehRTbg4L8yvMJ2zgmlfxRyjDWoniFoDrLn3gKFEipvY2kysKkv
	 WhaeC+qOUpS23ev2gIPEeM+ReN4xhbKr6gJnau1lOwX7X5S3/ewiCLbI6s1EYUxakD
	 zN8AAYzANDWMGwbuwWj2MraZaIEOGGaOEim/qTr+7u9Ss76stkjZkfkbSrIqaF4bos
	 cZDPzg85LoScw==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id CA59260243;
	Mon, 30 Dec 2024 11:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1735556224;
	bh=891MqkxZrRdJEQJwBkT7YvQQHdE+Qr8O4DsmJG4gSrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3xJ0qDUITt7fJIrSuTVM0aYN6rzNRbRvipzSZkX4p80ZURr78WUTwfWQ4lOlmrjf
	 RmPAAMHkI+SQb41RBPrKmOSN/OiP4HN7vdJSr1Ucq9UzSMACek54Js/KYTOihhCCtH
	 p/Mn86NNHC3jCWZ5gIY22iSxTgXGK+femMX/6lCVe9fRV8kUHM870jIzGf+aGtldks
	 LLhM0MnBtTtjSRpRYFw5f6cbr7DtK/dU4Cs+zMK5GxuleSPMgiaahhecTY45d+nl3s
	 nCdndKPNUV5ScFfQ4txRG+Ls8YxmeA0uJhXS++JS1V3YYDztVTNhrC4zZxS0cT8zqK
	 mzf/CvpgN2yyA==
Date: Mon, 30 Dec 2024 11:57:02 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: lilydjwg <lilydjwg@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: expires larger than timeout causes error
Message-ID: <Z3J8fo-l0iMglG5v@calendula>
References: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>

On Sun, Dec 29, 2024 at 06:00:36PM +0800, lilydjwg wrote:
> I have an IPv4 set with timeout 2d, but update its elements to 4d when
> a rule matches. It was fine until kernel is updated to 6.12.6 or 6.12.7.
> E.g. the following snippet gives an error when importing:
> 
> table inet blocker {
>         set spam_ips {
>                 type ipv4_addr
>                 size 65535
>                 flags dynamic,timeout
>                 timeout 2d
>                 elements = { 1.2.3.4 expires 3d }
>         }
> }
> 
> a.nft:7:16-22: Error: Could not process rule: Numerical result out of range
>                 elements = { 1.2.3.4 expires 3d }
>                              ^^^^^^^
> 
> kernel 6.10.6 worked just fine. nftables cli v1.1.1.
> 
> Despite I can't import the set, existing elements can still be updated
> to timeout more that 2d.
> 
> A new bug? Or a new limitation?

You have to use _timeout_ to override the default set timeout policy
for your elements.

Thanks
