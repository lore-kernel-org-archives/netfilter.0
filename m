Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588013B7BD
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715259312; cv=none; b=rjSQd/VR4VACy06wydWMc/rZsnydFYQY2AQEEvY4TOitRhYeNUTQTUmvUj+6sPJ3q+XkZpPda+cv5Mb00327dHlw6ddL0toREWLZZjEKAaMFLji90EwJdg1epQ422cMTzbxgzQn2yBrk/S6X6PUh0WqQoMwy/pOhGZR/4yH3teg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715259312; c=relaxed/simple;
	bh=yVyqMMj5qbZbyKU2fsJsGb2I9X6PRuotADmKOp/Ta3A=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=fSsViZoSj8uUmHG2B4hJOOJ21UzWZ+OF5RZmXJXof5x+ghLWsb3Pil+vrSmed1Wn2T3Pg/71Wp6VYqxigulQh7195l8NuQLE03JhrSMh1t1vFQ6qkbPH5NF7vhBLPpx+v1SgLeAGz1aQ71PYQ8We9Pa9aaXITYqyE7TvNzaumtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=j62UVU9p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QJ26q+OV; arc=none smtp.client-ip=64.147.123.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="j62UVU9p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QJ26q+OV"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 13AA31C0010C
	for <netfilter@vger.kernel.org>; Thu,  9 May 2024 08:55:09 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 09 May 2024 08:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1715259308; x=1715345708; bh=CajOcHRnow
	XptahP10K3rgQhrFCVS3IArG0DLaC5pCU=; b=j62UVU9pUoaxxjAgPZA0vnnArH
	5NP8bxIxX6tGBD8asWST0crwAOrEtCdKnU35CAmoAR7hwT40hKpDmtY7Ikjtgj9n
	tZ1hXCZkwj1PHfkZxvy9V3MxrUuqt3UwfHvzXQ0eNKrAfi303OCMqB6Yw8iJIh23
	6jpPbYLG06WqhbeeONZWDsUcETjit7+ygFzWfDIax8QUimRaLKOWQPhiRWuqKUOq
	elbUlqtu9UhwnI4kLADGcvoIShfaPsJkXm38Wr61LvLO/TgoylsWmKQ09acHl63X
	6OFJoU1dBwqqCMP+Y2i6MjtRnNf9QCr4/kUrbRSwq/M23/f7LLFitWXo6imw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715259308; x=1715345708; bh=CajOcHRnowXptahP10K3rgQhrFCV
	S3IArG0DLaC5pCU=; b=QJ26q+OV+kFT0gh9v5siYRbG9SjGXfmNqNfDQL7kL+EC
	jYZoomvn1soF+XnxL4eRVGKQOGXbb3cNNpqx6oHADMsRjjUuTGppuxcPJzA3xhVV
	x/75wDwlBvhoCd0pCNe3cDXLUBmGasUbGFDhKI1rYUPUaS0RcCoDoXV3xFvc6AyC
	BS8GWaG84aN0TsXfEId1p7QotesgEBN9hmYpYqOTHjBtt5CfUT4GjrSrFeAOAz44
	IViwD09VzaAIPHJvKrl0I+Mkflws9VHH7RDtz7ewqh1b3UKLcd0Ywzyor+oGBr82
	BGLiXdqLIN3AuMpwHeUdJms8n0Y/uzrs0FVk34hBNw==
X-ME-Sender: <xms:rMc8Zta_hUv9piN9Rh00TW0O61edZ_CzwBQaeZEl-KyKwzLmANuB1A>
    <xme:rMc8ZkYOiwdRQCMGcBGe1ojpOk07buxDiN0s-BDUlw4C5lrEb8Lt9s3UgpHuSgpx6
    T8luj1xoAmYYG8x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefvddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:rMc8Zv9P8PiqTaZ8PQ7WVm1-yvmJ5TjYbYC_H11QhT0pmjUKAatg2g>
    <xmx:rMc8ZrqVKAyOSLzyXm7yT8sw9Q9E9WRy_VPSrds3buBcF50lETpkLA>
    <xmx:rMc8ZoqgiDOceeMxO_j6t56H1gb_E6CLmERun6Iuyf4JY-SP546JgQ>
    <xmx:rMc8ZhTzht3Z2-uHuBdtbjx3gY2WGGPnm6Zxe2LstNTKy-fe0KfjOQ>
    <xmx:rMc8ZvTN0XGqpaf76Wj5kQcCZx3pyJuIVt4Xzsgcub0x19vDViQA0NHb>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 632911700093; Thu,  9 May 2024 08:55:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <dd5723aa-6516-4cfc-9a24-bc3e599dda54@app.fastmail.com>
In-Reply-To: <20240509124230.6e5fdb9c@localhost>
References: <20240505192531.5e4ed8a8@localhost>
 <20240509124230.6e5fdb9c@localhost>
Date: Thu, 09 May 2024 13:54:47 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: Sets nesting/reference? Complex concatenations in vmaps?
Content-Type: text/plain

On Thu, 9 May 2024, at 1:42 PM, William N. wrote:
> Regarding vmaps, I found that this syntax works:
>
> icmpv6 type . icmpv6 code . ip6 saddr . ip6 daddr . ct state vmap {
> 	1 . 1 . ::/0 . ::/0 . established : continue
> }
>
> However, just like with sets, this does not work:
>
> icmpv6 type . icmpv6 code . ip6 saddr . ip6 daddr . ct state vmap {
> 	1 . 1 . ::/0 . @ONE . established : continue
> }
>
> Is there really no way to refer to a set from within a concatenation/map?

I have yet to read the original question(s) that you sent to the list but I think the answer is that there is not.

-- 
Kerin Millar
