Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD083152175
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713799635; cv=none; b=LAuyK7VTrIQ/8XQiCxG7ITDync+Ra7XpJUIK5lYirmYITcD6ow+I+Lv7B4FiVuUnxWs3oavDHre2eHz0eNVas8SmRQDkN3EMfpu69UjJ1Ud0jEFWOP7pxbNmkOwEjxKT43/D6Nv87YS7WisFlZF+DG+Vj7U2mBbh5gRa58W9VtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713799635; c=relaxed/simple;
	bh=+sxygJUxrI/2HRT5OfpHsNG3yIoweVtS17YHWaVhM+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MYvLL/2TRdHulzz1dc9rh2ej0E2MIdA+8e2dJDdjFvwor9P/edaZdWNchXQHr5KCQ4omrwLKA5MiryL4NcHZ8AMHgLNBm4+/RRNwlvSuiX3oNQMlulnkdE3tQGQRGBrfoKQqj5XgxpvklS8h0tnnwWkoLsmZC9LfBchGDUq9rcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naccy.de; spf=pass smtp.mailfrom=naccy.de; dkim=pass (2048-bit key) header.d=naccy.de header.i=@naccy.de header.b=L0RINFtq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EUlZua84; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naccy.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naccy.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naccy.de header.i=@naccy.de header.b="L0RINFtq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EUlZua84"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D03A711400FD
	for <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 11:27:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 22 Apr 2024 11:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=naccy.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1713799632;
	 x=1713886032; bh=yikIezUsCHBIaIdA+gFwMiuBrYP3igTyyBYM3maEZA4=; b=
	L0RINFtqYSrYl02oceS75bH/SD7qTGkpm50JPUQUiYEbySgo+0xGTauaCEht+FUE
	Fa7GZaZiwzC17C47TV4K8q1SJuY9AGj9CEXbUTvBlcM+3GI66AVkwCxWMRjk9Nu8
	pu1NEablOeFSxlrm546VaNHAd5YGljP69s8KOI9UVkZx/syRotxz3V8qDzFEaKFU
	nurxTUpeI0oTbEu7Ne6BElAqq30/1XYFunKieMwRFjzT+w01vkq9IWd36vWDFYo5
	brksBxUFliPb/lgJ0OUlMaOepP4NqDwHeKDEDlTWA91QPdxeqZ/l+aMTL/HBn5lJ
	JciZRs8rJXXC5giD+xXq1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713799632; x=
	1713886032; bh=yikIezUsCHBIaIdA+gFwMiuBrYP3igTyyBYM3maEZA4=; b=E
	UlZua848GWyjPI/tPaIjVcqthft35fZWD2Or/a1r3AKz604rlxEFRD1Swyt1OrIf
	C5S/ixlbn6QS90kIqh/N+KNGOF+JCnGjjPD5HDH6Q/lYOOmtLpKNhkjXjyi0ojBE
	wKqNeS2TDzZO5f4lF9Q/yrx6NkV8SCddYfGA3RNzJmsbrclgiNqrmTIvhKGRHimW
	+N32v/GPizuooWPytnn7UofqIB0gZCylu5nT1Ux2mnQLRT467uS4vSP0o9ic40KG
	Ki2tn6rrBLpl4kcduhYEFCM9sceyr+yG+iw4m4SdejtCHM4KG5cNpAuZf0AbZcqR
	EejAgz3kM2hD7a2SXMWOA==
X-ME-Sender: <xms:0IEmZrwJRvJ0kHCcmajPsOzep40G1Ce--KyfgY74vF7P9uQmxqbdYA>
    <xme:0IEmZjQp113XJA8IbKcBXj95PN6dz54-DHfvqYJeQF0x7YR61Ilz7ptEDPl25vhy1
    49IQbJUqIClICTKX0M>
X-ME-Received: <xmr:0IEmZlWb8U7YljCxkQdEjqaSXGwHfH84rH53cUNYIvzkwR-AraE7V-fsgGht_TF5xUC1-epOR6SrqAmREBONQ7MBlMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtje
    ertddtvdejnecuhfhrohhmpefsuhgvnhhtihhnucffvghslhgrnhguvghsuceoqhguvges
    nhgrtggthidruggvqeenucggtffrrghtthgvrhhnpeetgeethfegieekvefhjeelvdevff
    efhfegudeijeeltdfgtefhieetveeguefgteenucffohhmrghinhepkhgvrhhnvghlrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepqh
    guvgesnhgrtggthidruggv
X-ME-Proxy: <xmx:0IEmZljtrNstc5YX75AmFKvCr-y4iFcHZBmOXdP4gx0EBfrWZuObwA>
    <xmx:0IEmZtDiQT_ihqaREj09Zoi2e-48qod3h437VrDbhJDjzktnVrHw9Q>
    <xmx:0IEmZuIOexnaWCUUMwBTaUbRxAxGoy1p65O6N3j1u1FQqDdrGhdiXQ>
    <xmx:0IEmZsDzuY82BVPJfoTsjSkujxIDIkyCjzcwt8h54nm1JnQ9u9bjbA>
    <xmx:0IEmZq5Lw8kx-obgTh33Eq9oKif7bsQfJEDImD2EdprJk9eipdDrjI4g>
Feedback-ID: i14194934:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <netfilter@vger.kernel.org>; Mon, 22 Apr 2024 11:27:12 -0400 (EDT)
Message-ID: <93219c99-b8a8-4878-87ac-53ee0ef4ff0a@naccy.de>
Date: Mon, 22 Apr 2024 17:27:10 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DoS/DDoS protection for end nodes
To: netfilter@vger.kernel.org
References: <20240417194340.20430839@localhost>
 <7370616d-fa0a35c7-09c3-4db9-9b8c-03b944b73124-at.encryp.ch-74726170@at.encryp.ch>
 <20240418121340.58c1fa6e@localhost>
 <07f45d43-0ab0-42bf-87e2-9c8ce00bcdb6@linutronix.de>
 <20240418153254.65058b50@localhost>
 <b513f4de-6717-4306-b56a-70144a59dddc@naccy.de>
 <20240422151227.4b022e75@localhost>
Content-Language: en-US
From: Quentin Deslandes <qde@naccy.de>
In-Reply-To: <20240422151227.4b022e75@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/04/2024 17:12, William N. wrote:
> Thanks for the feedback, Quentin!
> It's great to have you here.
> 
> As discussed in another thread recently, I wonder what your testing
> procedures are to compare the performance of one ruleset with that of
> another for the purpose of hopefully optimizing whatever is possible.

I've used pktgen [0], which is a kernel module able to generate fake traffic
at very high speed. You can define the packet size and rate. Using two
servers, I've been able to estimate the processing rate of iptables,
nftables, and bpfilter's BPF programs by using the rules packet counters.

I'm not 100% sure checking the rules counters is the best approach, but it's
convenient and reliable.

[0]: https://docs.kernel.org/networking/pktgen.html
