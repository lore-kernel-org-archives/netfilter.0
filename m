Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36371C29E
	for <netfilter@vger.kernel.org>; Wed,  6 Mar 2024 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709764769; cv=none; b=NAh5LH6252D2aiqn7/nRG2HD4e6S2nQJA/kPL/TZOh8QHvGI3OlTO4VMM9sCU3TXRb3FoI1H5mmoqJ6/CFDw1qPSgANS0SPcvdnfMyqJD2cH46BEwBgs0vV520YvMlawHVclbfXHlANeJpH1ddKyZ7f/YIEVtsn/V8NUD+zim/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709764769; c=relaxed/simple;
	bh=BLB2lN3l1r4pDSTTMD306J5w8U1Cmw0iqEKSZclunu4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=K6IPOiUHuUh++ikJBrlu8sJE5csPrjAH9AtmGpSSwBtc6V/lI5gsLIxiQuIld5xWvM9dfvfa6qjvXMfPIGPYM6xEfj9JWcKnDl1G1zZNNbDZlJ2k7kP94AQQ6m/k5S2yU1sW40X/GWhMcAw5WvVocQQ6vpTsqQYXII+fjry9p6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=EtRvZq90; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FkEiIvZZ; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="EtRvZq90";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FkEiIvZZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 7F6E91C00083;
	Wed,  6 Mar 2024 17:39:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 06 Mar 2024 17:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1709764766; x=1709851166; bh=tmDCQj/pz53EVsgrsiQSA2PpwLb39iOA
	oGH7A+8VyH8=; b=EtRvZq90K0ZXKU5zvYfyIE7wMpH5WGrnUwcCWQ7JIWHCuEfW
	WK4PGwLOMmO6slIsp/l18ZGF6maxWeZ8K5C8BsZT370Rx9CP9N3YlvX1QhqAzc7b
	YEQROTGzeOV+E9QFh5I2LxSe4aj/26RxQRjsbfkFo9aTfvfoJ/b/W3UhnijFJxKi
	JO16F3wHSblcN5kxtRj1GUpmZlevoHf2Gebx8p3G+9j1KrqqM3ZvgYQUPMJNqp1l
	YC/8eZyaEHLzd6AstR3QBGdu3PpZ5GdlELP7Ho7u54SCxKIcBZ49V0mlw1tniMX2
	ttvfFcteqSHGaNUO4BqhZLJUR/uPt42LMeDxsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709764766; x=
	1709851166; bh=tmDCQj/pz53EVsgrsiQSA2PpwLb39iOAoGH7A+8VyH8=; b=F
	kEiIvZZbV5uX8cjjCJBhtoqlUrcKFMzEI1nq+5fLwiQgVV8bTGbkg0xE9TcjroYw
	hS9js5kU5diEQbGiFcXpZFKgYRcapxILSgm90vLMQDCA+NHue8HHtDTW5+yiF74L
	/K/8BWnsUaSDDd6Hjdtpdaq59LNVZ0KWIQzDbQIcy19Ej1GXoeSE0rqQdWBRoaxI
	k8/zoXNwiD44neV8//7C7STwG9oVSgMY/W/GegG1rkunwKsYyj5eVF0u2OzkMnEj
	uyhhhh7u4JGIqt8b+hib/rrgKzUsM8CK1xybSZnrNR2nMIMw/NF98u4jciwrM0R+
	Bs/5G3MMGneiqBF7+4IjQ==
X-ME-Sender: <xms:nfDoZZKa7_tWfj4N6xJzlKwxE_X2yHZnqKC8BJFt05hFmp8iVbkUTQ>
    <xme:nfDoZVIYcuzqePxYsqrj5eXwZJIf2TaMluWq1nT1yrkupgheW40Mo9NG1g-f-tdhv
    X1K1l1bzcOn4IEr>
X-ME-Received: <xmr:nfDoZRtfZq2XjkF9tZD2v4D491iSHXPsD5UZ6X4F5HCl5-_ElV81U7U-Fx6bysxZpkZGZ3tDkj6PDzerczzq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledriedvucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesthejredtjf
    dtvdenucfhrhhomhepmfgvrhhinhcuofhilhhlrghruceokhhfmhesphhluhhshhhkrghv
    rgdrnhgvtheqnecuggftrfgrthhtvghrnhepiefhteethfegfeetgfehueegfeefheekud
    ekfeffjeeguedtgeegjedtieehhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:nfDoZaYs0CmG9xpwIgaolL3glS4JhLMjcqkFb2c84T_DelXIOHj5JQ>
    <xmx:nfDoZQbrCy-J3ahJLjZa7XhuzWew_H4ZyjGyDnxr25V_bgZkqv00uw>
    <xmx:nfDoZeARqRuVFwE71PNzseGAuXFj0R8Y_mTT-4aKrixcNUU6GBkBow>
    <xmx:nvDoZfkSK-YNJPNKmX8VdkUS8yKeGHSJslzUKAzK8s64l2MbU-nlX1VPU_k>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Mar 2024 17:39:25 -0500 (EST)
Date: Wed, 6 Mar 2024 22:39:23 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Sreedhar M <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rate limiting per multiple seconds
Message-Id: <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
In-Reply-To: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Mar 2024 22:11:49 +0000
Sreedhar M <sreemtech@gmail.com> wrote:

> Hello Team
> 
> I am currently working on configuring rate limiting rules with nft and
> have encountered a challenge. ex: I would appreciate your guidance in
> achieving a rate limit of 10 ICMP echo-request packets within a
> 10-second interval.
> 
> Here is an example rule
> example : nft add rule filter input icmp type echo-request limit rate
> over 10/second drop
> 
> I understand that nft doesn't directly support specifying rates in the
> format "10/10 seconds," and I'm seeking advice on how to adjust the
> parameters to achieve the desired rate limiting behaviour.
> 
> Your assistance on this matter would be greatly appreciated.

"1/second burst 10 packets" should be close enough. The bucket will be initialised with 10 tokens and refilled at a rate of 1 per second.

-- 
Kerin Millar
