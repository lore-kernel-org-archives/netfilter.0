Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC91E104B
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728419327; cv=none; b=CUTM/OdwwjL87xbNJa1e0iVUnqtGiGqkkrj6xrz4quFf3SldqTGus94JDevflFdcCix+e5tdaSk2AwK5aIHCr6ABEGVxULcmMtk+x7SJQIFMnYemp38bOMqGwn1h0etGNqcKOmvMdC64aSTgJKmrEzJTC0N8nYq2LHVYcAF3RK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728419327; c=relaxed/simple;
	bh=wH9+gCW7MBXh01YuBaRPJ/JHJ7nss/c9oYyZA6F6iOo=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=s4hYEapVPe77Var2+rV5HxVUtksq0rIzi5hqrOr66OHzhtvc28Z0eEz66BabOqeBmCVdW6fF4VkJ29zMeDUWTbvE+FbHEMvuDZ8Kq4orH/kmrftezsLQNtckm+WXSyCrK0RLUl+/y2HRaHgtZrMypvqs4dY+5pZBKBdGvkAELKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us; spf=pass smtp.mailfrom=kevin.km6g.us; dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b=Ihv0retO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S7PaUUt6; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="Ihv0retO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S7PaUUt6"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E0A3114009A
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 16:28:44 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-05.internal (MEProxy); Tue, 08 Oct 2024 16:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1728419324;
	 x=1728505724; bh=oc8Zy9Nj5O+DpsVRkn/FRJjPD4dflkt/WV+6w0XlA7A=; b=
	Ihv0retOtfniNLWOEvLI0dRFJPftGNxPL/KlpI5FTH5iod7nz0uThxB4vJ87faOr
	F+Dtw2sJXTKXx5Q0VoDJ73WtBAXnoe6vrvFKu0kktTGVlR71TeMuXxoJpD82bB1J
	k1ktQozHL3vQcnFZZ6CF6dugMdy1t8xy9xlSeCvoIssFJVBwBdw+2VOlEgc09jk1
	rnq0Vggd/WaDTFZiISwiHEXqVMrA93hVT0Cz+6vKaKH10UmDKf7YSebb6wGGxwaY
	QO9+ZAdO9LOPTkS720WeCKSY4rj4Y1u1kWkX5OALCo13J4cn+AVAIHqiUuwo05fW
	EnhQtR6ZGv9oKjJ/j5BdWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728419324; x=
	1728505724; bh=oc8Zy9Nj5O+DpsVRkn/FRJjPD4dflkt/WV+6w0XlA7A=; b=S
	7PaUUt6B3k/w9GfJ5VLhuSnMxTZ299By1s0kCC8fWwUn9kpLNsz7jzFRqUP7J47N
	2qi0BKiT+F/MuGSaZGXeoK96fAw949mrGlv+0a0GrK6giH9hZBkq7lxAnqKiCgRu
	Nu3+VKnKJd+fBPpoJ/xu2aynFTA+FDJ/UHk2w08Z+wll94KzcfszZOk9s9+63nbo
	SEaiUsJE1RaGY+0wc2TXycuIqQlgVX3Xd8h6HPlwAwkfnQV9k7/RUR+1XLpkAKW2
	Qm0T8qEuNWmMULduaE922T84O35pcnI/kdVSN36mcsNCnTT5wfIRD4VdiBXQh7by
	AUItuFce8gUP1Fxe/HlJw==
X-ME-Sender: <xms:-5UFZ6Nuzg2m6TBiNh7L0dFlJoaHm6YiOlvYdszQ97GgcbMF-yqhXQ>
    <xme:-5UFZ4-phfg8HgnwVR25bRywgPDnFTHPKPodjDx9r8oG7UvrkEoYjpyOHQVWhwz4e
    O9qjKUmftb3xF96uGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
    fhvffkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdfmvghvihhnucfrrdcuhfhl
    vghmihhnghdfuceolhhishhtshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrd
    husheqnecuggftrfgrthhtvghrnhepfeduvdetffdvvedtieefleffvddtheegueetieei
    gfektefgudfhveeuhefgudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheplhhishhtshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehg
    rdhushdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-5UFZxQEdDA7EnPYDZ521JL5WgvTv3981vNoIwCYTH3aixR1-iasUg>
    <xmx:_JUFZ6sgYzw2kLX6oSItkemyperr_dszNgUTRixsrXK_zRxRcrafkw>
    <xmx:_JUFZydPdmm8wNMQhXWRYGSKvzgy-ZsXGCtNWUlGtO6yDw8Qf_is5w>
    <xmx:_JUFZ-1ZV31ZVGGc20FNIxNC5GTP9vquHVFVPkv3XsjawFGeS5YY5g>
    <xmx:_JUFZ6kPrnj1_tweRtmcpG2Z8NVo9CoJ0kDlcvGDZIxDDAaSjCH9Nm8Z>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DE8EF18A0065; Tue,  8 Oct 2024 16:28:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 16:28:23 -0400
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: netfilter@vger.kernel.org
Message-Id: <bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
In-Reply-To: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
Subject: Re: Problem with ipv6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024, at 16:08, Martin Brampton wrote:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain output {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook output priority filter; policy dr=
op;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ct state { established, related } accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request ip daddr=20
> 127.0.0.1 accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 icmpv6 type echo-request accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ip protocol { tcp, udp } th dport 53 accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tcp dport 123 accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tcp dport { 80, 443 } accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tcp dport { 25, 465, 587, 993, 995, 4190 } accept
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

What happens if you change this policy to 'accept', and make no other ch=
anges?

At a minimum, you aren't allowing outbound IPv6 ICMP ND packets, which a=
re required for finding other hosts (analogous to IPv4 ARP).
