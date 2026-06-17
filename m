Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F91B2E7363
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 02:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781661847; cv=none; b=UVELmOqzDlJmTN3FWfvjGY2XoJjMgrMvGxn0vUxUwOUv7CJHLjXxVkRFmj5wIpP13liSIa5ISxRgk0r9zJ18aNTv3Q/EWCT0qZj2CIRqAByx4tOfwI+dLRG/teVQGV91HV9YHlFsXsLtBW06LTvt3GD9AKn+yl/3q9M2T5rw704=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781661847; c=relaxed/simple;
	bh=HclMW+9yqhbk1Inxg03QAx8xM8S+cP2wK7b1aVhGVMk=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qBWC2w7RRT9P1WejCFZmz0IMnybzZ/fj3Thr/EBQi54O2AVjKebVELm4bKE4LfR8ZBNdjxCGIkysIh2VxRt2hruwSwaALqiKK9crntsLhMCsbvmJ8hItKhyl+wJ53iKUOJkoRaZoxNaHGRWUrnrALTCYDgUIhnWsMTYcj4L6+T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=f14YUmiY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fM5VCQC9; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="f14YUmiY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fM5VCQC9"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 41FFA1D000BD;
	Tue, 16 Jun 2026 22:04:05 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 16 Jun 2026 22:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781661845;
	 x=1781748245; bh=BniPE4V7mtGhFsNFCTtzR+Frk6tn425uUnR48+hRIwM=; b=
	f14YUmiYuPkZlZdr9LhmGQpBGaG27Zbb1EMIJp88d2zRhqQWJy1OPFZVbYeTKYH4
	T+j7DhNReC42HTAixH8Tyw7lBZXx/NkAHCdNUmwlhu0wnmvzvIhTyzO9iINc+A14
	E/XTaFmW3ZF0HzYEHRL6q05/4Fq/1xP342Mq8Wm+TTsXsQ6yXI+hHeNxxoR9gVqe
	AIHisjUCFyPiGArM2x7UTZiM7iIHFcXmcP7jxVkITzwfx+uArcRqaC7CIPUvBUgD
	1uDC1OJ9X1qQ87YE4cWprw0TZlYHFYBxJ7tZbUFP5mje+kcWGEvUcN2MF9XWMYKY
	HwmNgVZnm8dr4Ybz59LLhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781661845; x=1781748245; bh=B
	niPE4V7mtGhFsNFCTtzR+Frk6tn425uUnR48+hRIwM=; b=fM5VCQC9hddEyIwKp
	naoMTJ+l41wo2FJfNl9gHlomUaDe8c3GltqdN21i4QNShaBvUfyVeDtwr6SNssVk
	H9Bv55f2GdeXy3Mp/eOmph0l8FENh2I4RKjGwSOXPnKw2vtGKjvhPyLPsJA5s2MG
	nlwm7/Nr5dZDHgA+rk7RaBjSJlk3m7uhLFitpL8H4fgwjuQWbXR+E85rSfiDAXme
	pjZeG/qKRvEJrwh3pwRkBQKWIs+SmOG7xi9c2aSkTBOMH23+U+EBlrHGr6GZROY6
	+9jvTt671ewy2V95iGIrLWJ8qR7TIqSQg+XaJZFvboebQSUSm9fEHKRs3lT7NeYd
	vdo2g==
X-ME-Sender: <xms:lAAyaozCBQagLdKcw0S63DFUOaJmkjlIJlohzykqng9ZThwko2TwIw>
    <xme:lAAyanFx3FkwK0jfn3wU-F60XmJqr-QQowBMyXDPCJUNIHGCYp1IUF0ciU45-Uguh
    TWkD3VvhNm061jrrS-oMX4bdquB_D5w-Bu6kg6A1B88S4IetHY>
X-ME-Proxy-Cause: dmFkZTG2IA7swFpny8bUrpjP8hx2bnFReo9jwa8rfnb56e8NNO/Rl04ij0DuSPJDk7fV9w
    +pQYoS/YxMcIXS+uJBU12DE9zwMOkZrBckk06I5kZU4k6Bm1dsL4mBeRzTnVT/S/LAMceD
    1HoyB9gIZhGO4IK5hHeyqTy1SDOQKPKhyfxcprdefjIbaW0vnX8YkOVXYxsqC0qFuhGy71
    9cvABk1KOjV6ep6QFMH5Ugw5+NXuGdxojvQY2/X1h6btxH7zUKoKGj40OU2TdkbZU6vIZE
    yCJPNoe7tvQwcwVDC0D6dws0CdkQeVZ5PikaAHv/Q/t3KN1S21q+B9NiUo5aVKl269G5oV
    kqw1MS5BsQyeUl+2DdTSNlENCdoDRiBuWdB4q03+X5FJKlfI8a1MLq6E4rI8SkDQ7kKVUN
    ec+C3flsyiyTIL/nkocx+EeSZZLct3HP8hSiFvcJ9ue+MNW+lOky0GQWyiFB1UlEG86yPu
    zhYvQgIBpooYuEwdE5WJz630wiYEBuqtPK//qktJXIvl4SGvq4fg8/4GABvNChhtOug5yM
    R/UHkWYRFjRuMes3/LAtVTQJX5cZD79jHkE/5lOESFG+agPUgxUfdkQ6y4ZUO9QzAdlnhO
    LiLZxli8mJ43fQpSPTwL3M/3VsOT99YZ8jGivIKm62ewijdSfNUIOMQ9IH6A
X-ME-Proxy: <xmx:lAAyarfktTVx0CImi5KHfAb75F6laI_76vpuzH7WTJJxhT9wXRsK9g>
    <xmx:lAAyavIUffzsiu3hTh5G9zYx9gYgFKrXS9SVi5F052HrDQhx9f1pYA>
    <xmx:lAAyasHU8fbH9-9LjpHU-ApdQcdYYuGplBxhi02qyLIiO1Zt6Hr6dg>
    <xmx:lAAyaprnoIfU9_vCSQe2WdiEKJeRfl2npFDasKQT6Ckxt-bIKsYOUg>
    <xmx:lQAyav0IExTpOrNX7YPfHQjYcF7IPbvIqfeJBqhn-CqBt-gn4SxpCGe->
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D0CC3216008A; Tue, 16 Jun 2026 22:04:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4AgOTky-GBw
Date: Wed, 17 Jun 2026 03:03:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Corwyn Briggs" <corwynbriggs@gmail.com>, netfilter@vger.kernel.org
Message-Id: <51e12579-9901-40d6-8223-ecf6a94eb6c8@app.fastmail.com>
In-Reply-To: <efd80966-8380-4d70-a313-b6d9585ef0b2@app.fastmail.com>
References: <8400bf65-82b4-495a-a5ef-4ad7a1fafb08@gmail.com>
 <efd80966-8380-4d70-a313-b6d9585ef0b2@app.fastmail.com>
Subject: Re: No meta ibrindex/obrindex, only meta ibrname/obrname
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 17 Jun 2026, at 2:52 AM, Kerin Millar wrote:
> Hi,
>
> On Wed, 17 Jun 2026, at 2:34 AM, Corwyn Briggs wrote:
>> Hello!
>> I am somewhat new to Linux and am configuring a custom firewall for the 
>> first time. I have come across a discrepancy wherein the index of an 
>> interface on a bridge (i.e. a veth bonded to the bridge) cannot be used 
>> to match in an inet chain, but the name can be used via meta 
>> ibrname/obrname. I would like to use the index since it is a bit faster 
>> and my interfaces should not be dynamic, but meta ibrindex/obrindex does 
>> not exist in any manpages I have read. I checked over the archive as 
>> best I could and did not see any discussion about the feature either. Is 
>> this an intentional difference or rather just something which was never 
>> implemented?
>
> Support for meta ibriport/obriport was introduced by nft v0.3, then 
> changed to meta ibrname/obrname by nft v0.8.4. But these are only 
> usable within bridge family tables. For the inet family, one would use 
> iifname/oifname instead.
>
> One cannot compare against the bridge index; nftables simply doesn't 
> support this at the current time.

I may have overstated this. Where iifname/oifname works in an inet table, so should iif and oif. But there is definitely no such analogue for meta ibrname/obrname (which pertains to the bridge family).

-- 
Kerin Millar
