Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53303101A5
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939476; cv=none; b=V5acIACfUe4/1VEH3ji2nw/nKgMYnNKrhx7sMvDpCmLSY5G9ett/cCt48wucdqL8R9C45WJLl1NIMRAWsihS7j6hDAwQ+y3O6O61eVtwLmGt8pVLVwZzXWgpcOjDodVxkcBdXWgoKPrgBEd6dSM19gHt7t3u/B/7jegNLALq9Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939476; c=relaxed/simple;
	bh=9ogtXMhEOlllolftDXwyEYf74pLYSfudhbsNBP07eYw=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=anRoJU+F3svI/bf6RKC450sxnNcmQm9CUVjOyupbcmtPxbI4KUn4rivvvpntt6lGlXmwIGMruYMcl1ilydUt8imlNwObtXsaBdVYXWfhzyc/omRCzK7anO17Nv8X99L9ylxFntX+dOqRsrb4lC1/CoC4UJeYPbdz6b8W02aodbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=M9xC5Vl2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SXbDKaCy; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="M9xC5Vl2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SXbDKaCy"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E55AC14000F0;
	Mon,  8 Jun 2026 13:24:34 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 13:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780939474;
	 x=1781025874; bh=9ogtXMhEOlllolftDXwyEYf74pLYSfudhbsNBP07eYw=; b=
	M9xC5Vl2JcYnQje4rBEoaWC6yGEvDON8osG63qyxnUNA1u57GZa7wTlXgOXhT5LT
	f/GhQymcTXwY+bfDRiMfQz7I46Afk6E0O4YXi3BRQGiA9kKFiq81ez4I8hZGDS4d
	KpsSqJ/s1zv7GXeVZOGd8i60MgHueuQ+HIW/H25pVnPsMr4SqchtafvW2BhF17tI
	ozZp08LqBoFy1aFzlnMOzX2cqr1fR4jvonBUcmMYbcMbQK+JSNFNFhwv6PmFRIBN
	KEZA4c9m6hwtbM8kCsjfMzV6bcLSBlMVJNsQzWbXNe43VPq0ToOVquFEUBXU55B+
	J9uRzBeHcMHIUtuxb9pxxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780939474; x=1781025874; bh=9
	ogtXMhEOlllolftDXwyEYf74pLYSfudhbsNBP07eYw=; b=SXbDKaCyyTA3c02h0
	xlwR5jSkzqjPAyp0IlaC6d8IP5TQ3f/iJJrURu4vVAVuCp5PqNgk81g4vU70QOpJ
	9hsgQagXstLCpvNHV66N+9/dmXDfsmX+chIzQyRmUm+R9NN8iGBLjHF4Wuz8g1eg
	9ooMdMGJX7k8fksUfdwZRB7TbmX/sNBEhFFi5+RH/1RIBlGL2CGISDMawR0+ly25
	4HuqxbWMYUymuPycFlmu2JpXZI3yiQ2B+B0V/iS4dTOHA3iIGsru9iCQj1vIUdGf
	tdTTWUGOn7nNnX8j8trreJR+pIQJSeRL75/UX2h9kgmUQ8VSdiwYH3mmfQWbEmvw
	D8qqw==
X-ME-Sender: <xms:0vomauZ_r6bes5_VNmMOiawr0V87bQ6nlbXmC-kbJ5YzucQSv6OxWA>
    <xme:0vomasPsON0CJ02M4AGVlFB0Unzcb0_OlrolgnrFNl6pwzA-nfCcQLcBu420dWaTz
    LAxDOSEas_Ire7hjIDxNaJw9b6HX6qdcN1fH9xcaRTBAmB5Ju0>
X-ME-Proxy-Cause: dmFkZTFfnQn9vZHEoOVPPEKLi7kwtS3WUhCTkDFFYOPOdFepht4kyQ6FdU4sur2OPtGB4i
    6CDXIV1JVpQJW7oLuF8H8sG3GK8e2z1WKx75nxVMgGb1IvUVicJiOym0dH59iQRFaqxhU1
    PMfzHkkBI7AU68n+C0E6lBBShuqbzm85A3wVxSobba62gVW5//rZVO10L702hEXQ5QPhKK
    JE+RJ8TXCYriMHjlUdmi9awFOkgsfhQYwlfu+v3AjQfNbqmK2nrugZr6Ap7VQT7cFzixGK
    +YPruGPpd4BmXaNYSHONIWrjTPIxeNyHsK5JPVv6j2r9eWH8GL/nLfMMn50PFA+o+96hf3
    qaiSXpMOouvUfnL02vkKbB0C9PPEsox91N0KuDjKwa7mbzLYJ/XEIYGd490I4/lYsk9Uab
    MtMiJkjOQ/S2jNCdeb6Pb7dw+U/keUUQAazFU8oxB/xDHJ6s0ji/dr5svner8t2uUTB8PU
    GObH/gpzGRk3BCKvoa3DFVDjzVN/w8ODYZOH6sKGJ7e0Izlph2p0E2WY/VfooRzJ9EAiEn
    24Nk8eC1QpfkhsOggLZb1GzLQYt06lx/Zgb5mvL/AXFz3cz+QZWc1cXqKcrbiEa0fCKIQ1
    Pgcc0zuQUKXZadIWxHy0FFPbJjddmkANhx+lkrT6fsMjE1jzLzn53FA4Va7Q
X-ME-Proxy: <xmx:0vomapGsEeFjNdXl6cTDPSNWqbA1XtBpyBwhjhagE4SUH1JhTu0MdA>
    <xmx:0vomasQIF7GWB6p7yY7ERyq6GrKeEv8_an6F_NrFn4FOF6ugLzEzWQ>
    <xmx:0vomaitRJQ8xNpUC36XlSUB25mHQH63P7zy67Qln8hQe5zL1jRZ1qQ>
    <xmx:0vomarwcDLWbkLeLie1WSCb6UYMkBi9X6Ylb5dUPCj-H2eX_d2vHjw>
    <xmx:0vomajoz8L4Ale71IGAfnZkrt5xwDk543zKps1lTND88F86HpnyvVv0R>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BA6EA216008A; Mon,  8 Jun 2026 13:24:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABFZICgcHfNg
Date: Mon, 08 Jun 2026 18:24:14 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Message-Id: <0e59c5fc-9a9c-4cf1-9eed-42f499d728d6@app.fastmail.com>
In-Reply-To: <CF337785-88C0-4EF8-95A7-2C281AF067A7@slavino.sk>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
 <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
 <CF337785-88C0-4EF8-95A7-2C281AF067A7@slavino.sk>
Subject: Re: Question on rate limiting on nftables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jun 2026, at 5:56 PM, Slavko wrote:
> D=C5=88a 8. j=C3=BAna 2026 15:01:37 UTC pou=C5=BE=C3=ADvate=C4=BE Andr=
e Rodier <andre@rodier.me> nap=C3=ADsal:
>
>>There is a big advantage on changing the port number, though. It is
>>reducing the noise considerably. Also, a connection attempts on a
>>different port should immediately raise attention, as it is involving
>>more than a basic SSH scan bot.
>
> I used high port for ~10 years. Yes for first year or two
> the noise dropped significantly. That is from server where
> SSH access have only i and password auth is disabled anyway,
> thus i didn't watch it then in detail for multiple years as
> it was just noise. About 5 years ago i did some closer
> inspection and i collected some stats, and i found, that
> in average there was attempts from ~1k unique IPs daily,
> with spikes over 2k daily, i decided what i stated -- not
> worth to setup non-default port on clients.
>
> Thus again, changing port is only short term solution. My
> scanners catching stats (on some sort of honeypot) shows
> ~8k unique ports scanned in last 90 days, and that are only
> most obvious scans blocked after first acces, without well
> known scanners (shodan and familly), which are catched by
> other way before...
>
> Try to guess how long it will take novadays to discover,
> that your SSH listens on different port and how long it
> will take to appear/share/sold that info on some dark
> forums?

Allow me to put it as forthrightly as I can: I do not care in the least =
where such information appears. I will continue to select a non-standard=
 port for as long as it demonstrably improves the signal-to-noise ratio =
of my logs. And I will gladly change the port again, should I wish to. A=
lthough, my recently introduced anti-scanning measures should diminish t=
he likelihood of that happening any time soon.

--=20
Kerin Millar
