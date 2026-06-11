Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596981DED5B
	for <netfilter@vger.kernel.org>; Thu, 11 Jun 2026 01:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140230; cv=none; b=tuv4J04aoA/cDlEN/rvXytJ+wrGoB/k6mtIuV0VV6JlKWTyUYK0O4/mBsCS6gK401ByYWDvgdLBh2wPiMw3e2m3w/jkGcya2kTK7+DDuLguKgk18WqWMbBBGn6MuO8QGz7yZ7NmX1iI4GXsuH1T3+7DNLx8IpCyDbRs3zh6w4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140230; c=relaxed/simple;
	bh=aAZa0j/WNt3sKdBpKKgHA0ZIB6K6xYms4QhSEmr+tJc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j5LDW5F9kbZK1bxiMwRXWPogwiPfSDN/ISCLMgwKSh6mkQ1l+WRLI874fuD2brLrbm8tmIGan01gCeH+p9LGy4HIs+xxtNhcaVQGAgKHFoHFiJBPJ67L8KVn4EmlOUiSGYOPLXB4g2j+fwaCrE4f0p5s79GkIxCzrfZYvomDV6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=g/4XyPNF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UlfdoZuW; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="g/4XyPNF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UlfdoZuW"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 861D01D0008D;
	Wed, 10 Jun 2026 21:10:28 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 21:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781140228; x=1781226628; bh=/m7deDyz7+l+OqJKvVVpVvBQFYITggNa
	kEEHJCctWRM=; b=g/4XyPNFVJj9nYVZxMGCHFcEG5PUCQ7zpilDjql4ZuAyHzVv
	6/RXP5QjVOt4sCNq9aCeNfL16aIWeGCp5kWJGkB3hDqUHtXpvhZHI+9TQIt9gA+O
	TmSskUnoa5rpX76eXmqhVTdi71LYnQuqoAfStey43fDDPDFBhm8CG3xGpME06pl4
	V2dP8U2Q+oXH9WVXn5eWpVS+b4RrhZZk+SoincMebgbHreIV06PWd1h9tEBKR+d4
	CX1y/FUEOkFcgENP+AnYr7qlF04M9zx0io4G9ECPLHRorOJL1CKSGmM5dXu1zOs4
	KVqDxMZHnxkIUEG3HupGoD2EFONzbNbzFyBRYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781140228; x=
	1781226628; bh=/m7deDyz7+l+OqJKvVVpVvBQFYITggNakEEHJCctWRM=; b=U
	lfdoZuWJy4iq7iJZ+JbMwwVjgufibckeU0BHjvEtcfWL0KBbcHeVjdRV0BZ58ocU
	tQzVHPo5HX620GFsRQz9IiTelbiwOS4en3ZwVOo+b438ortqBekZFyb6JWi/CHp2
	CvlwN6bkGw5AecLkW/dau//1bSVMN8HjP6SiFVBQCR0sJ1LL8Fm+Pvm8a6bQShvI
	OZSb1wA2reXe0Ck886zofAkBqbVbqWa8EDmed5bbnIm4+j4quNcffkKPu9pco1NB
	OobjgjFXyCDkE4cfEq1Sl47lUeKRIx8cYqosNrLMOv5wUCPluUQXYuKzqRe/bacn
	Dzu2OlzN3b+NGx40Nzq5Q==
X-ME-Sender: <xms:Awsqajdea5AiI6NN83WAL5CfhRVUs6V2mDvmlp0Cdc4U-rMEnKCGFw>
    <xme:AwsqakBbn1z67S6hqa3DcidBTXn8J-xOvQBulGdZ5_I1bKoxeel6_BR_f1Ee64Vsa
    VAPnpRKgcS0A17pwKHi2eQCRy3rPnUT9alxEDXfxbvzpb9owerH>
X-ME-Proxy-Cause: dmFkZTGV7yN96crkogHumRDNAI8Od6IW+bNxkvqJD9JaVXjCRiE05Difs+Q5MBAFrcB1gQ
    DpCQREBrUTV17G+KLFhEAq8slhJQZhuqbtdgkAOV2U3kqE1SnZ+G4hpP7+f14ClpmrZWi6
    cv4u1W1XvVNALq8Q4jE4iUt5Auhu2bhQIBsVwEtyxwF/GY4hdW92J7LgL3dgCcyu+F1kaK
    wfhj73dhu9ixih1xGn62AxCCm53xt2X3NwoGBPfbT2Ch9jFgXaU8857je9Q4EEWKX7ZXt9
    96iuetHuAMKgr/OmcWiMMyZIsoWpLBoCZ6cSdRsj8VfRyk3/tDiHUJp/9HQLil7r8T2+IZ
    SjkmrQaFTvfXF7jaY2uChAoz64GBiaVJTJFwbLwVILAH8jx3BNbU18OSKZZgXo9o17VqD9
    E7xIFM8r/UCT5QiVXSltYM4kQGeBiNJhlG2FAMDzFvejsI2lPXN2IPMIkpssWtA3PiTG9R
    if7/reX8Pm2iJCGsjarRJxBwJWQMnITZrj6RuQp5dQ/ItKr/yMmQxqFkYLljaPmX4bkwf4
    PSnK5gio/TtdAuY3cb3NyRCgbWxkw/+v5x/c9S1dt4KCRqZhVshDJNoZscQ3UmA3er+vFf
    UmS67a/XA5x/UfYP14Lky8MP+6KdVWA5VgefkwnXep31/gBpsdan3k/prXUg
X-ME-Proxy: <xmx:AwsqapYPbnD38HSTp_seGI_nbiHIyMgBSMOOVYAzGR3XFOtIf1tyGg>
    <xmx:AwsqaoLq7xto9PqHw3cQ9cHHD1c4bolCPqYDAMeqU-cHzHoD4cR2gw>
    <xmx:AwsqavAgEcjV-yNjBXX3DglYODDq63FTxJ2ZJiN9adzmEP6YW_VF8Q>
    <xmx:AwsqalontBqK6pcSA1mqzMYF6I55SZVlksO3n8Tmzt39LyRvLH1d3w>
    <xmx:BAsqagzUV45_AfdlfCoUXU5TYumvpUiSbpaapQkp1-Xw_o8qBCdQg7xy>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC90E216008A; Wed, 10 Jun 2026 21:10:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AaxyEWkns8lg
Date: Thu, 11 Jun 2026 02:10:07 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>, Binarus <lists@binarus.de>
Cc: netfilter@vger.kernel.org
Message-Id: <1e155a71-b849-494d-94cc-4de58f8e2f0c@app.fastmail.com>
In-Reply-To: <ainwA_Lkyr85C6dB@chamomile>
References: <06c74ee3-64eb-47db-8575-bfe42eb47c4b@binarus.de>
 <ainwA_Lkyr85C6dB@chamomile>
Subject: Re: "nft list hooks" not working (empty output)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 11 Jun 2026, at 12:15 AM, Pablo Neira Ayuso wrote:
> On Thu, Jun 11, 2026 at 12:24:28AM +0200, Binarus wrote:
>> Dear all,
>> 
>> according to the man page for nft, "nft list hooks" should list all functions registered at each hook, along with their priorities, and including the internal nftables functions. I am understanding this in the sense that "nft list hooks" should output something at least when there actually is a ruleset.
>> 
>> But on my test system, that output is always empty. Please consider the following excerpt from a terminal session:
>> 
>> root@charon /etc/network # nft list ruleset
>> table ip t_IP {
>>         chain input-filter {
>>                 type filter hook input priority filter; policy accept;
>>                 ip protocol icmp drop
>>         }
>> }
>> root@charon /etc/network # nft list hooks
>> root@charon /etc/network #
>> 
>> Of course, that ruleset does not make any sense, but it serves its purpose for testing. "nft list hooks" should output something in that situation, shouldn't it?
>> 
>> This happens on Debian trixie, kernel 6.12.90, nftables 1.1.3.
>> 
>> I also have tried "nft list hooks inet" with the same result.
>> 
>> Furthermore, I have created another ruleset with an ingress filter and have tried "nft list hooks netdev", which also gave no output.
>> 
>> Any advice or explanation? Where is my misunderstanding or mistake?
>
> It seems debian kernels do not compile support for this command?
>
> grep CONFIG_NETFILTER_NETLINK_HOOK /boot/config-6.12.74+deb13+1-amd64 
> # CONFIG_NETFILTER_NETLINK_HOOK is not set

For that matter, someone asked about this at Libera about three weeks ago. It's a puzzling omission.

-- 
Kerin Millar
