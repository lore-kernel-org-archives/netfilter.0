Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C720A5FF
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418917; cv=none; b=PrCm/3jU32YdK0uYYaKw07lSdNhGiXwbn3zHsfGbi2aifkiq1lyiDwbK70jrlaDPr9GyskM2FWW2W0n1DJU5u+sEwqcQGUxz06Q8U1ZJnwR2G9mHf37qHujge5jg+1L2XcQ/EhvR22qtXfQnPc8qaEMFqDDGpNRqzddghIj8Zek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418917; c=relaxed/simple;
	bh=1+BqfvDCcpoTx/RA7LeseKt8DC0qDZOKOHt5gWM/NQI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DyRpnQRl4m3QHn9JMcGriHr20I+BXKPNmvRX40TTc3SO9e1+JuxwnTXFIWIoz0jktc5E0/ySKPw1ydM1r6knOWknJJq+vwGIhiZtR2dAfSiHY73IcleFWwxTsieKuXuRoebt+dd/4xoPiRLlqZCIjEy5WQp8fmYp2QqowmpxaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=fXcM48rQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ciOwN0lD; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="fXcM48rQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ciOwN0lD"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F6F81140137;
	Tue,  8 Oct 2024 16:21:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 08 Oct 2024 16:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1728418914; x=1728505314; bh=6JSTkxM8iVN64PBIYei6x9+snHDE6vvj
	lUSCuGb9MlA=; b=fXcM48rQgttEUd9N6xI3kjuIHPHaRKHT5vkGDSiCiRmHuKSD
	R5ms1VYonzg1GuQ7a1TRckbSxH1iVFUxAL6pA5MFNM90ZMyvyxkF7z2xTi/HX7LX
	7y99rkDtRG4wcqJI18wWAbHkgJSJpWLbZmpoiQNaQNqv4S19/1W3C9gRH7pq0kKz
	O4ZAk6Pr1AzAcJtCqRibahYKjYgawisdccapwT3acjJzsKHwD3r5WgP1uozuMAuS
	OoWI+IvRZyhcI9NdmPs0j2ZhY/xjl17UjeVm/8+0b+SBA+/recGAryRWjQxxtYD5
	f+GCbbLlP3GVl2wkxAFDzJ1LOyeE0iTZuXpYYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728418914; x=
	1728505314; bh=6JSTkxM8iVN64PBIYei6x9+snHDE6vvjlUSCuGb9MlA=; b=c
	iOwN0lDJjyDUexmX+zn7QuzNOE1AsCRX5ceqql69PVPvWUAHcW1WbzNhJTAQ0QAv
	ZDlY1nS5fe6dil5Ap52n+mXaK69CRjUSO6v5oT2MYQltsNLzmVr/Aw8YUeKr1DFr
	Oy0hqUsnPlKEfP/tWowA+RIgDufpmwKAGA1Acdhsd0ap546rE1BNVV0S0ACYiIRy
	KhRfLOYsC+wUVbRpjIoOAmpGm6efxaxKKPgJrdcJO8HlGq/knXg4q/X7qx/mRr/J
	RcssnI5rEYbb28H2lZekzgXkDIpiOG9zlmEaz8AlQhq226rB3C2aMXZUiQgsSnoX
	75WbNjWOWLLEsrWm5wSCA==
X-ME-Sender: <xms:YZQFZx8NaSP1ckXuk33oAPxkoUl-JWAGqFMeMZ9BFFJjfRyA_dfNKQ>
    <xme:YZQFZ1uMDriog52BZze5Tr75fWpK-w2RNbdyhl63pvoh4UecE7YrC_2ggVRoRik0E
    kGJ3PdQTjpHm9hA>
X-ME-Received: <xmr:YZQFZ_Dcj7VcqVuNtZefTdX1Ikj297abWCQ0YtJ83ULnhWQ115OWQxFQOpa7N0otrAvTp6vnaCny2qO-GRa1MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfesthekredtjfdt
    jeenucfhrhhomhepmfgvrhhinhcuofhilhhlrghruceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepteejkeetkeegfedtueejheevtdekfeejueet
    ffejgfefuddtudfhkefhfeevvdehnecuffhomhgrihhnpegrkhgrrdhmshdpnhhfthgrsg
    hlvghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghpthhtohepvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghinhgssegvgigtvghlvghrrght
    vgdrihhnfhhopdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:YZQFZ1ce5KCjZZTTaS-jIYYIjcq769fa2mUg6K1Eb_bRRDthoIjd1A>
    <xmx:YZQFZ2PZ2hrebhlR86BxPkMSq2sZzWhYRK6nQgMhUTh3oT5zl-lEVQ>
    <xmx:YZQFZ3kdqND8Dk-Bh9w1dP6jH1jrprnQWYjpDembOhTSwVOeoQjoKQ>
    <xmx:YZQFZwvUOG5QlAgN2nS7_5U84vdqqSWXpgs1FCyBI7_FHqlWj2Fvsw>
    <xmx:YpQFZ_aPVAjtLzdmGVqo9PZ3ncfIwCg7cbwgfskBoQNgQzb15de9Hwi8>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 16:21:53 -0400 (EDT)
Date: Tue, 8 Oct 2024 21:21:51 +0100
From: Kerin Millar <kfm@plushkava.net>
To: Robin Bussell <RobinB@excelerate.info>
Cc: netfilter@vger.kernel.org
Subject: Re: Unsuccessful adding policy to a regular chain
Message-Id: <20241008212151.9524f0f9eb3e3146376f617f@plushkava.net>
In-Reply-To: <00218364-B6FE-4CDD-AE5E-B7DB3EE35E6F@excelerate.info>
References: <CWXP123MB4792C9E58B0187197122EAFBD07E2@CWXP123MB4792.GBRP123.PROD.OUTLOOK.COM>
	<daa4a802-c058-494c-b47b-f258728a00c2@app.fastmail.com>
	<00218364-B6FE-4CDD-AE5E-B7DB3EE35E6F@excelerate.info>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 8 Oct 2024 19:00:50 +0000
Robin Bussell <RobinB@excelerate.info> wrote:

> 
> 
> 
> 
> On 8 Oct 2024, at 18:12, Kerin Millar <kfm@plushkava.net> wrote:
> 
> ﻿[You don't often get email from kfm@plushkava.net. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [EXTERNAL EMAIL]
> 
> On Tue, 8 Oct 2024, at 5:59 PM, Robin Bussell wrote:
> Hi Folks,
>         I'm trying to create a regular chain with a default drop
> policy and not getting anywhere. The wiki implies this can be done, but
> when I try:
> 
> nft 'add chain ip myTable myChain { policy drop ;}'
> 
> I get back:
> 
> Error: Could not process rule: Operation not supported
> add chain ip O365 O365WhiteList { policy drop ;}
>                                  ^^^^^^^^^^^
> 
> ( those carets line up with the "policy drop" on my terminal. A table
> called myTable of the ip family exists already )
> 
> So are policies actually supported on regular chains? If so, can you
> tell me what might be wrong with my  nft invocation?
> 
> There can be no policy for a chain bearing no hook.
> 
> 
> <https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding_regular_chains>
> Configuring chains<https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding_regular_chains>
> wiki.nftables.org<https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding_regular_chains>
> [X]<https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding_regular_chains>
>  This wiki article states otherwise though.

The article has been corrected.

-- 
Kerin Millar
