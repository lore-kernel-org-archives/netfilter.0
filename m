Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09171205E30
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 02:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713580585; cv=none; b=Xkq08OgTog2LBSTEhytF8/xM+ffRhmmUlfwp0+7OUSFL0dqdko0WJQuOMwbr2DWIjyUS26MelqyfEBjhCVXtpEDDn/On0jHgwFlGbTg7R5txmr51kAEvRQf5GzWfkZuMEUvLTyV+WlgqVRBM8Gsxm2tkduqPgvaSVsVaI6sQOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713580585; c=relaxed/simple;
	bh=+eDd8RDxQ2ZJg8noqytj1JpCXBv9ndSKMMdvde6KmbA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=qPciVMds0uBIhhViO2sItb38P+dtwTuQJhkm+XgTo6Y+09c+nNRG+NMeb7uXayyzV9Ikh9VyP9dTaVRN6PongTo+T4jtWaCZL3RJK1p4t2Z/1+HS9oJiiS8JGPBxnTKZlkGMVG66KeNJE0Fdb4smPPM8WDVyN4ZmP3oTIWwRe38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=dhN8NJMq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ajKhEeAR; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="dhN8NJMq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ajKhEeAR"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 026601140151
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 22:36:22 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 19 Apr 2024 22:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713580581; x=1713666981; bh=yAua+e4EHA
	buDPZm+c1g9F6szbA2AbT1FIpWE428Tws=; b=dhN8NJMqKi1S+0lG+JvaRvH3V2
	sS1H9g0RUPHCh8hYwgrENezVSmoV/xZCoWL8y0/S4YPNnYZlh6/6CRGbG7NAUyAL
	L528hZDz6Hhjoa7i2eAu8js5GrFrIAMqaCa/fn5Qz9GQy0u7I7Lwgjm6TjMqnwiB
	6RZoiM5Iiudb2fPne2jC6ri/H01oAVQpx2M6c9FOQ957xiHjp1Cb5Waz8wgXNFp2
	QHTpFhi/k3LAxtLCIfbNpJiP5W7CZnkvkUGCQi5+mDza58ODM6BfAhb6fIOW3Inc
	LIE5polzz7CoWuYcxpKUvE/zyC/SI0N0kKIhmJZRXiwmH5+eSCujqtb4nOEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713580581; x=1713666981; bh=yAua+e4EHAbuDPZm+c1g9F6szbA2
	AbT1FIpWE428Tws=; b=ajKhEeARmu3b0rylZo6/TG0cCkCKjgJtmUqWFe+TkWQm
	S94+8xu/62vVo1jKu8evK4k+q4OfcDzYIv/itWYy1AJkCTNQu0U5xo8sRrsJYoyU
	OVo3SCMfPjnVRts4BV+hWiLnlhbRW2umz5Hv378p/0j32qN54lQcc0oxGQ57YzFj
	YK+7+TEl60/u4KRc9mg/e+FoBcCz7D/Dd9drHKLXrtVmm0mRdlCgRuKgxvo7dICi
	kOQEDlQLw7TGj2V37sYsssA2Co4D6p3eb9/8lI4VRytSZdV64bUeOl+ETGQ3iw2q
	yTrMUy5qNgIs//CTJbQVNuUqASdrTQr7lDkbtY2TVg==
X-ME-Sender: <xms:JSojZudepGs3OZfTvetoS9Kbz3Prt9_e2Z4kPLFRg9WTf1UyHfeGEw>
    <xme:JSojZoMOKplVPDUVsSo5dlgkUm3i9l9uzaGHORsoav9uZBONMryME6q5XFNFtJvIN
    fCmFngFb01PPwNj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekfedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeffleeuleeujeegudevgfehie
    eltdelfeevgfffudetkeefieejtedtueevfffhueenucffohhmrghinhepkhgvrhhnvghl
    rdhorhhgpdhmrghrtgdrihhnfhhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:JSojZvg3FvIx_gfunC35wiYoDjPLeC7f4v0ePEx-S9CRCfucMoDSdg>
    <xmx:JSojZr8QQvcEwyLI4-xQXJvFeA6Z6RatdKrYGITwKJpS7UcmOhaFaA>
    <xmx:JSojZqt_hPBAP4Yl2cVpBjDvNiJn5xC3ihZxjeRwmmiTeBa8wi7c5g>
    <xmx:JSojZiGaqO-7SKsZGwK0TIjmruJkCXv4SXD57p97ecnRMD4P8BXXBg>
    <xmx:JSojZg1cxUg2pLLcKoNYZhovgzmholEBfSvPuYbQEXDsLNYR8JTc55dK>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97D381700096; Fri, 19 Apr 2024 22:36:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3732a410-afc7-4b42-85b1-6952ece01db4@app.fastmail.com>
In-Reply-To: <20240419105542.74aaac89@localhost>
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240419105542.74aaac89@localhost>
Date: Sat, 20 Apr 2024 03:36:00 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Content-Type: text/plain

On Fri, 19 Apr 2024, at 11:55 AM, William N. wrote:
> Is it possible to combine, e.g.:
>
> tcp flags fin,syn / fin,syn drop
> tcp flags syn,rst / syn,rst drop
> tcp flags fin,rst / fin,rst drop
> tcp flags fin / fin,ack drop
>
> into something like:
>
> tcp flags {
> 	fin,syn / fin,syn,
> 	syn,rst / syn,rst,
> 	fin,rst / fin,rst,
> 	fin / fin,ack
> 	} drop
>
> just using some correct syntax?

(This might have been better off as a new thread)

To begin with, I would recommend that you jettison these rules outright. It is probable that they would otherwise end up being useless. But why?

If you are using a stateful ruleset - that is, one that matches against ctstate in any capacity - then generally invalid TCP flag combinations will always be classifed as "invalid", which is particularly useful for the forwarding path. Here is proof of this claim.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_conntrack_proto_tcp.c?h=v5.8#n700

This check is further augmented by the presence of a TCP state machine, by which a packet may also be classified as invalid. The following post explains it a little bit further.

https://marc.info/?l=netfilter&m=159842459323063&w=2

If, on the other hand, you have written a stateless ruleset for a host that is not being tasked with forwarding packets, it is by no means clear that the rules will confer any value other than, perhaps, for statistical purposes. The state machine implemented by the TCP stack should already know what it is doing.

...

That aside, it is my understanding that the rules in question cannot be expressed in the way that you are attempting. To write "tcp flags { ... }" is to attempt to match - in the sense of the "==" operator - against an anonymous set consisting of elements whose values are of the type, tcp_flag, which is an 8-bit integer.

# nft describe tcp_flag | head -n1
datatype tcp_flag (TCP flag) (basetype bitmask, integer), 8 bits

The problem you have is that, while "/" concerns the matter of bitwise arithmetic, it is not quite an arithmetic operator in its own right. Rather, it is a syntactical shortcut for treating "expression / flags" as if it were "expression & flags == flags". As such, it constitutes a test, not merely a constant value. Knowing that, you can probably see why things go off the rails in the course of trying to compose the set.

It doesn't help that this is entirely undocumented. Indeeed, arithmetic expressions are not mentioned by the manual at all, save for a vague indication that they are supported for relative priorities in the CHAINS section.

If such a thing were to be possible at all, it might entail a set of tcp_flag concatenations. For example:

{
	fin|rst . fin|rst,
	fin     . fin|ack
}

But the imaginary syntax that might be necessary to wire up such a thing isn't available. At least, not that I can gather (if mistaken, I would welcome a correction). Given the number of bugs I just discovered in the course of experimenting with all this, maybe it is just as well.

-- 
Kerin Millar
