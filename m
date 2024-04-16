Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273BD137753
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713293691; cv=none; b=SFCKK0ovvqxy5YBd8cho3xPDMp7LRnBrswgqRTNoXJbV2MvPjJg4Hm6GC3YIIZhFrE0nernNPJeJgx7EE0GqV6HW2PpDs+9w0Tsq7AyvO1enAIgwdmoS8qk7uy5yMopsbj8d+D/4e2Ckk3qxZ+Eue0Wwm7yxSLbubHZzVHGbFJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713293691; c=relaxed/simple;
	bh=lFjyK6CO6vGvMdh6dG3BiVWAa33+q68HMF9bJXLpfFI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=onLYKbyv03AR+MU3zMY0zIUmXfqr4UffLhtQA/59BucIfSJMl8hn/1PbqR2N2jE0yyXNrTOfMtRod7rLmmOi6DK7sEVTR/d9TC64hse/ij/neUlBOGrixkd+K5dp00c8IP4ub2aGgNKGz0fPJQQ3NkfWy4t8Oy51w8O2rJyRJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=K9JbdMRZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kcEwlEbP; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="K9JbdMRZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kcEwlEbP"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 144121380266;
	Tue, 16 Apr 2024 14:54:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 16 Apr 2024 14:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1713293688; x=1713380088; bh=iSUejdYhGfwM8Ml6vtdrnailn7Zl+LdS
	Q1/TpQupjQw=; b=K9JbdMRZVlDVh1i9Pru3gS2tmhkTLDDU6O5ru8E8amHPpB7e
	v/hKzv2+AdTLAAYQGPWQum6RVzfklxgaxrWaqHWR0+xPpma8TCJMCHCUojt+Efa6
	9ckt3Uzp9dcScvOp50jZjp6PUk59JduNDJwy/sCK//poN4hm21gpuUZWzAGHLmLY
	jWO+CFvKFSqfeTTE09BQraceQQPnqp6/8YmX+u/S+LAdpdWrkAWUQW6Fg7gjZ0uK
	DTskn9A/vrJVMw5+l6NBfRxhrEylh4o3DfuHNVJe7zpVIjKG3JpB+sU77d/oSdNC
	DDamioTOcGhbv8wS4OmBlnpkoVhLax2VnvIJCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713293688; x=
	1713380088; bh=iSUejdYhGfwM8Ml6vtdrnailn7Zl+LdSQ1/TpQupjQw=; b=k
	cEwlEbP1sKcPCq0MlsQ1z80pSE/eCS0Z8SqdC4VNUdp8BAZRlirXgajgXcYUxGOY
	+a8CAoMvNubSjAJRBRQj2YAT8TzHK6K3IHJlW+rb6/k4/ZRxakXpcnRfZXIBv8wG
	LeCmH2KVFwbfv6Fvrru9LiWzkWVZHlHdfKd/SW/XUSkxn/uoh9mRIp6ezOKBVEeK
	n4F2dPzvs5dKZB3gxmQshl6XzHw40LdQ50c/IRDYH+2SmudJkQc4ghq039Y7WBJH
	f54ZpKf1i0ToiLAC5U/c5kb4TPwlGxtQavq27zjADorCFPX5TXWYGayD4dcCgkOK
	mGKRWLJFsOHnRvwmD5+GQ==
X-ME-Sender: <xms:d8keZkERrxjQVD88egKPNV-VSahK0o9qnImRgcjp-NEepO3mLB4cpg>
    <xme:d8keZtXa7Fn-joeR0mk3sU7fF8d2T0n-k-jlhgvBI7jUjgVVZBqxLu2zijI35ILnY
    bd2GShl9q0DBRoS>
X-ME-Received: <xmr:d8keZuLiMIDqDL6A9qAtgo2eOJxTLMimWHp50f6XntQjW6K2cUDCmEZeCl1ZqBW8Q8Q-Wt9GHY4tgcAZu6yavw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejiedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesth
    ejredtjfdtvdenucfhrhhomhepmfgvrhhinhcuofhilhhlrghruceokhhfmhesphhluhhs
    hhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepiefhteethfegfeetgfehueegfe
    efheekudekfeffjeeguedtgeegjedtieehhfevnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:d8keZmES4-mp7lZwpnu44pqQwg6VzX4zFAL_weOv-ApUubPutcR-cA>
    <xmx:d8keZqW94eOVXinGt62B1iUCRFP396sXXjbZUSslo2qF4Yr3hNZuXA>
    <xmx:d8keZpOZgkJKSYQLnHAeb4dsgnnIleOQW4aVS6cc2CqzusA9eOCD7Q>
    <xmx:d8keZh0HtydaTcNj4suwObROVyWWUWRz0PqzxDpNZPQ8NKol3DV16g>
    <xmx:eMkeZnj6hjUaRiz8pS_dyBiBps2gJcQeH5ZWQOUCQsAiEyQcQxVT1pOI>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Apr 2024 14:54:46 -0400 (EDT)
Date: Tue, 16 Apr 2024 19:54:45 +0100
From: Kerin Millar <kfm@plushkava.net>
To: netfilter@riseup.net
Cc: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-Id: <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
In-Reply-To: <20240416174748.5612bd27@localhost>
References: <20240416174748.5612bd27@localhost>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Apr 2024 17:47:48 -0000
"William N." <netfilter@riseup.net> wrote:

> Hello,
> 
> I am trying to "compact" the following rules:
> 
> table netdev filter {
> 	chain ingress {
> 		type filter hook ingress device "eth0" priority -500;
> 		# ...
> 
> 		meta protocol ip \
> 			tcp flags syn \
> 			tcp option maxseg size lt 536 \
> 			log prefix "TCP MSS: " \
> 			counter packets 0 bytes 0 \
> 			drop
> 
> 		meta protocol ip6 \
> 			tcp flags syn \
> 			tcp option maxseg size lt 1220 \
> 			log prefix "TCP MSS: " \
> 			counter packets 0 bytes 0 \
> 			drop
> 	}
> }
> 
> into something like:
> 
> table netdev filter {
> 	chain ingress {
> 		type filter hook ingress device "eth0" priority -500;
> 		# ...
> 
> 		meta protocol tcp option maxseg size map lt {
> 				ip : 536,
> 				ip6 : 1220
> 			} \
> 			tcp flags syn \
> 			log prefix "TCP MSS: " \
> 			counter packets 0 bytes 0 \
> 			drop
> 	}
> }
> 
> but I am getting errors, as my syntax is obviously wrong. The first error is:
> 
> Error: syntax error, unexpected size, expecting newline or semicolon
>                 meta protocol tcp option maxseg size map lt {
>                                                 ^^^^
> 
> What is the correct syntax for this?

meta protocol . tcp option maxseg size {
		ip . 0-535,
		ip6 . 0-1219
	} \
	tcp flags syn \
	log prefix "TCP MSS: " \
	counter packets 0 bytes 0 \
	drop
}

-- 
Kerin Millar
