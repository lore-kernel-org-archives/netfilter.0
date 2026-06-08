Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0553A23645D
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922778; cv=none; b=NFSJ1ZNs0x95CoFog/qaiLUJ/JPV4BdNHjebLRNPyuO6B4Az7hPsLuwSwZj9k6RmJcdBBK3ieFExfHW+P1LbJCuj5ei/2YeVsvJ2LQuBXlne6ADg2zujuZpqKE2c+0YSGxQkTcflUVVh9rC14mOoSfVVHjQfpU9CrSATJdd9gGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922778; c=relaxed/simple;
	bh=023rA8wN7GYDjgGoZkI/MbzHOcDZbPWDE2WCckIOiR4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IxDgPSHml/RvIXkbtvSBKh1XEl0zEeyOR3d/m+IIsU0l2yXxwB/3yX0K/KSKRnAkTQrdc5qxi2f85R2ok3HTZHRNiJalB4bfHbQJL+4bHHR25llw2gOTumqA0TScaJ2MBFsbeTbPqr6nVZ3kly1s3tsRnR1y7/CIsQJVfWkffX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=DGXaWjpy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dYLMxpGf; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="DGXaWjpy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dYLMxpGf"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4104114001B6;
	Mon,  8 Jun 2026 08:46:16 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 08:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780922776;
	 x=1781009176; bh=4UcXtT/hyWvJrWwnteXqom+X8zuHFPmDKfiC9nAIu4Q=; b=
	DGXaWjpy8tKqEujWwwu4UGNeW7f6uJWL80cVOd500uBJ8Bsa9WViq26R4x25YLU0
	jtjj+NWdj/roKPCkE5uhOmUEuZa2CRZ/ixa8M+PJmeY+DLcz6ULYT8UfFQcWqAP8
	q2qPJOgib57kUsCA6RBToudHcTEnAtUcvGydwm9tw8cnEdvwGdnImdfslygmEbvD
	4bX9umvjNQRVT+bY33zLxkepm4Qf9Ou4Lv8vwunDyQj8RI/WFp7f8AgiF7Pio6tN
	V9E8Vaa7OQURaHY53nlDBc0+/ufg2XNH0Gp3nT8VWWBRDdCWPtkuY4LElafCEQiF
	qhmSlp1P0oJs2Q4S4oMzDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780922776; x=1781009176; bh=4
	UcXtT/hyWvJrWwnteXqom+X8zuHFPmDKfiC9nAIu4Q=; b=dYLMxpGfxqVFiwqkx
	Qx6hMc+FXjXq1ODkPorRZ9Gg/7e8aoSX4iafAclbC9WZM7c3k4cBwsON7Q/w6tpa
	UDI59ecTHfhYedbjSPwulw2Qx/iZ/kZPlvT+wsdGGUwi4hDWwRHMsAuoWAyIaqUq
	m42HpSo0ZazJUQQ04TXOAIXEgoun91pdQ9DBvEwRVQ/xXiZfveHiwRMEHKr36PTa
	eamGgANszO0l32LltI60qyms+TLVCKmmOizmDhG4Qz8h2qTA3dNUpVZfdO2pIgsc
	Yddz9fclZ3u9AKTBcvA0IsyxeuBo2tbFOkgj1zyKGDrRqNmczKvo/jqTzDqpc4Zg
	2K30w==
X-ME-Sender: <xms:l7kmajqLdfRupjlikgt3plS0a258Y0MVbquZr-EEEqCMbQS-6PUBYQ>
    <xme:l7kmaoc3KTIW9dosLdW9zCG-yULXSzi5qcPy2fL1dflzeZwoliazuuWUp_V-qtER3
    1kSMOV2qfM42csI3IxgfesiiIeFDWt4ENvDm149gYGcY04BWb0>
X-ME-Proxy-Cause: dmFkZTEhpJWXUAUmMD39+K+77BzvvrM2w0AKjJqB2UBpWpY6kk1V/KsMHZNpyEou4x2nfS
    5dIOSPsKwQgV0CzohRMrb/Dr3a/F6G7H3LvV7B+SMLugqvXnW2m+HmelmEEfm3pA4+1ozz
    Hv1bK4JUejsfrVOFdx/OluXfJnyIM1ssOSRx/ZwbdAXX8HUbXJWdoIyD/ZoSsPykxik7oR
    moNdjzmyDLBJiBzJGP0uAghsM4QRThg3hGLYv4tLKZSUprRhOxQ8wveHQFtC6juL4+TqVq
    jKsZ57yP3kP4HfHuls0n+zkupu5K84i4iJqCiPLAvz00zaULZPttq9LwBB4tfR3pC6ZFLu
    q7zNnCSn84RaaSOe12JZ687tFbNAlUQZKYTV0sk0711FE7ICCiAVD3hf3smdhNZkJqvQae
    CIjusr8LZ1yWJU4B6DMpPJN5ViO42jOHjU/emxmBlDMgdgjFrnhQh9t6jbFAJGB72nKItT
    S3TX8ju04iiGxJw7yf3FZzCulW9fwUuTuJFbRONAgxmDyZ+orrhiW1hKwF/kwuWVcZTy7n
    3z355T0eCoBpWRLDKwA6QJiqhhCYb4OMdkB13HSDhEZfD51X3wwAij8g9qkoMBw7CDY/53
    vHT784OWMlT8bkpC1GMThI9Vop+Bt/ser6rRhGZlX1DIiRa4jMWvsEhTKsSQ
X-ME-Proxy: <xmx:l7kmauU0gc7hSzODt02tkP86yvIoceM_Fz-NWqQlr0fyW166yOn-zg>
    <xmx:mLkmaoiMf4MTq75TGUoEenRURpztB7ptFn5dKTn62yltcx2DZzQe_g>
    <xmx:mLkmap-Dt_w2l7WQoRjinsvgPNAAaC5QErpFo3T8G6CTa69DlQ6fyA>
    <xmx:mLkmaiDQj1DY7bPSmlOQFdRBerWHwpUmKMZ24yxpnvnygFwXuIx9jg>
    <xmx:mLkmat7pDXQSzE42s-l6HyhaKsIxNVFSMzNYGsXtrHEDTm7Tt02QcfV_>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CFFF0216008B; Mon,  8 Jun 2026 08:46:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABFZICgcHfNg
Date: Mon, 08 Jun 2026 13:45:55 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Andre Rodier" <andre@rodier.me>, netfilter@vger.kernel.org
Message-Id: <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
In-Reply-To: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
Subject: Re: Question on rate limiting on nftables
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Andre,

On Mon, 8 Jun 2026, at 12:30 PM, Andre Rodier wrote:
> Hello,
>
> I am testing nftables SSH connections attempts limit, and I read about "meters"
>
> I would like to know the difference between these two methods of new 
> connections limiting, and to ensure the first one is correct.
>
> The first option:
>
> ~~~
> table inet filter {
>   [...]
>   meta nfproto ipv4 tcp dport ssh ct state new,untracked \
>   limit rate over 10/second \
>   counter add @banned_ipv4 { ip saddr . ssh } \
>   comment "Ban SSH bots"
> }
> ~~~

This sets up a single token bucket whose state is controlled by any host that sends packets to port 22, facilitating trivial denial-of-service attacks. Consider the following scenario:

1) one or more third-party hosts hammer port 22, keeping the bucket empty
2) while it is empty, you innocently try to ssh in
3) you are added to @banned_ipv4

>
> And the second option:
>
> ~~~
> table inet filter {
>   [...]
>   meta nfproto ipv4 tcp dport ssh ct state new,untracked \
>   meter ssh4 { ip saddr limit rate over 10/second } \
>   add @banned_ipv4 { ip saddr . ssh }
> }
> ~~~
>
> Is there any advantage using the second method ?

Yes, because an individual token bucket ends up being maintained for each ip saddr. Be mindful of matters pertaining to resource consumption, though. You probably don't want to size your sets with the intent of being able to cover all 4.29 billion addresses that exist in the IPv4 namespace. As such, it might be preferable to ban shorter prefixes - such as /24 - rather than individual addresses [*]. To do so would reintroduce the problem of collateral damage (as with your first option) but would limit the blast radius to batches of 256 addresses within each /24.

It might also be useful to reconsider the problem that is ostensibly being solved. If the problem can be characterised as "I endure too much log noise from sshd and I find it annoying" then perhaps configure sshd(8) to additionally bind to some other random port than 22 and expose only that port. If, instead, the problem can be characterised as "I'm worried about being hacked" then be sure not to permit password authentication.

[*] This is made possible in nftables by its support for bitwise arithmetic, e.g. "ip saddr & 255.255.255.0".

--
Kerin Millar
