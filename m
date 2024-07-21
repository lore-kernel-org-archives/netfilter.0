Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610ADDBC
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721555962; cv=none; b=sojmsS1F1LNUemrMRWfryFAfR10LwJ+0f3UJP5kBlGPSKVMYEaH65SrXYd35MEkSOg+1/msPY5wvcoVryk0ffBLE2AAAW3rbmEDaPB7+wCPrFc4nto+JQ2SuwABWE6zAWo0HLUIYvhYQ+D9b26jEzgRas+E/mbu8izXqhZ097l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721555962; c=relaxed/simple;
	bh=E+aYjqQRLRg7pmMM/8OoLKd+nEiMs/6uqeEFO+eLmYw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=NHg2h8hfQUxWOXBHJNvsDIMJtAfUll0psAkCrRB4VKGwdYRZAhC6Z63uRfI+9oNtWrgsVoiCBDPgxJhesu2XPqiXNSLCHT9dRCqDmk3la67NSM8bLLfh0wha3s2fODYNx90emLJtTq44uRIoHa7KFtORFwf5mmFnuW4BAq7zmGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=U+cZNL2U; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mukjOi7a; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="U+cZNL2U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mukjOi7a"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C86661140300;
	Sun, 21 Jul 2024 05:59:18 -0400 (EDT)
Received: from wimap25 ([10.202.2.85])
  by compute2.internal (MEProxy); Sun, 21 Jul 2024 05:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1721555958; x=1721642358; bh=ckehLUFKeV
	qDslC1H6SkYPMYgna4jH4B4oO/NpxQEhU=; b=U+cZNL2UE4Masc+QNlWe/ZZ6mG
	t2MbqmN3bz4VHKOa+JEwrR4T7Yr+HEPbsPx77+VEDLaZl8Aka3DriiqH+3yv5lrm
	q75jrQo53dv5a5ker5wMkOkApmeZ0os/RvMWV2Xxxzu5qaDcfYUUdsKF282heVHx
	OmGmzj/EwHEi83nazEWDxVIPVs9mAcGumnrEqzhTKddETHFOav1J/Ik5+rKCnOPW
	1/9PybJIr1IFc12Uwqb8K1u3pSpYz9g3fXuL0w57dSk1cvMHMmuxbdvkH6OJ215f
	a/hS3FuhFR2Qjq35mqUH5X3mo2EHKSRTuF7rEep3fZ9menhgQK2L4HVvX/6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721555958; x=1721642358; bh=ckehLUFKeVqDslC1H6SkYPMYgna4
	jH4B4oO/NpxQEhU=; b=mukjOi7akNcouamaiNF7VE4gAYCZbpYazqRdx2zOSbFe
	t5F248wCSsqRrOLq2AAPg0K71M5nnWPenmxFhhIoY5lRh2i+jS49mRA6hVTk26/w
	LmnbX8v2B30RR5bdLKm8S35S3UZBb1UwzI/tv9JQt2VNvIh/4UUK5PVMTAVbnMjd
	K7OySHi22EPkXIbgsfqHl1DfXnKcw8NV0L9jXtyXDQ+PfyPdKMaFvqkoR2zc/3+D
	ryji8tpWX2jPi5GSIbUUdSiRn6c6XmG87mEmqwNrWSdkrmJoBzyJTx7vxPNArXNX
	MXAAVe5OWJJVwIRdTXcpr/wVzXgFczr9E1tK1qJgyA==
X-ME-Sender: <xms:9tucZkVCt4J4DjtGPwaNISLIgh87BtVIngTz8FZfMBIHzkd_MHTwtQ>
    <xme:9tucZolRI4OnYs9p0LmSGD6w0VjBMr11qyzhTCTB34vVOOhZiQWwPgn5qWrOgr9xk
    mJSFmqOfVPGYTQL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheehgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfmfgvrhhi
    nhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpeekheffffetgfduiefgkedvfeduhffhfefhkeffvddvfeekuddthfffieeg
    gedvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:9tucZoYl94CDxYJk8C146KdcXyH_oambKOLsKr0APUqeCGKYUGLYFA>
    <xmx:9tucZjXKXAUHLW6-d4kj_LIKQzq20AL0L5zoOLwH3RKRdgexdM8Kcg>
    <xmx:9tucZul6TUGZ06YOlZKmQmOw84jSmWLg3jYLC3iLEXv1ixsz2cfQ5Q>
    <xmx:9tucZodHHUgNxZMVYdGY_8tktNkDADzaRdhjO1k8JmA5nL0YujT0ag>
    <xmx:9tucZisHjZIxgPlpEhrs6uxHkbM4sXplVlwqSiNjI5DB35rJQRXbPJK4>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 45E611040061; Sun, 21 Jul 2024 05:59:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
In-Reply-To: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
Date: Sun, 21 Jul 2024 10:58:30 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Content-Type: text/plain

On Sun, 21 Jul 2024, at 8:44 AM, Slavko wrote:
> Hi all,
>
> i recently start to port my ipsets to nftables set. I was using these
> ipsets (beside other) in manner, where they was some timeout set
> and its content was regulary updated (from various sources, online
> and local). If some IP(v6) was removed, i didn't bother to remove it
> from ipset, as it was removed by timeout...
>
> Now i fight with the same approach in nftables sets (kernel 5.15, nft
> 1.0.8). I learned, that to update element's timeout i need to remove
> element and then (re)add it again. As here is not simple way to do
> it from shell (simple shell command) i play with python script, which
> consumes IP list on input and produces appropriate nft commands,
> eg.:
>
>    fetch someiplist | myscript.py | nft -f -
>
> Now i am not sure, how to produce that output. Have i do it per IP?
> Eg.:
>
>     add element ... {IP1}
>     delete element ... {IP1}
>     add element ... {IP1 ...}
>     add element ... {IP2}
>     delete element ... {IP2}
>     add element ... {IP2 ...}
>     etc

Firstly, you should not use "delete element". It will never be reliable because a given element may have expired by the time the command is processed, in which case nft will raise an error and abort. Use "destroy element" instead.

Secondly, though you could handle each element one by one, I would not recommend it.

>
> Or have i produce output for all IPs at once? Eg:
>
>     add element ... {IP1, IP2, ...}
>     delete element ... {IP1, IP2, ...}
>     add element ... {IP1 ..., IP2 ..., ...}

Yes, grouping elements in this way is sensible. Note that there is no need to worry about the ARG_MAX constraint because nft is being made to read from the standard input rather than use the -c option. However, I would suggest generating one element per line because the way in which nft reports errors is atrocious in the case of long lines.

{
   echo "add element ... {"
   sed 's/$/,/'
   echo "}"
} | nft -f -

>
> Please, is here technical difference or something other to consider?
> The IP lists ranges from some hundreds to some thounsand of IPs,
> thus nothing really big, but not small.
>
> Another question/problem is, that this approach (delete/add) does't
> preserve counters. Please, how to preserve counters? Is only way
> to fetch and parse counters before i delete element and then add
> them into final add? IMO, this isn't very memory friendly (in script...).

As far as I am aware, it is impossible to add elements in a way that merely reset their expiry times in the case that they exist, which is a ridiculous state of affairs. Though there exists the "update" set statement, only rules can take advantage of it. Neither of the following commands achieve the intended outcome, despite being processed without error.

add element ... { <existing-ip> timeout <new-timeout> }
add element ... { <existing-ip> expires <new-timeout> }

>
> While these counters are not crucial for me, i use them in some
> ipsets for statistics, eg. i fill items from various sources into one
> ipset and group/count them by comment then. In ipset it is really
> simple task for awk and it was working even on small OpenWrt
> devices. But nftables sets doesn't produce as straighforward output.
> Please, how i can/have to parse element' counters? I am even not
> sure, if i will able to parse it by python (but i didn't try it yet), is here
> some tool for that?

I doubt it. Perhaps we need a new "update element" command to act similarly to the set statement bearing the same name.

Mind you, it gets worse. While the nft utility supports a JSON output mode to ease parsing, its output is less accurate than the conventional output mode in so far as all "timeout" and "expires" values are truncated to integer seconds and conveyed as JSON integers.

-- 
Kerin Millar
