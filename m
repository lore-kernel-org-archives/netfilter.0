Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9B285058
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055578; cv=none; b=dQ0TIsQdn8ZShdRBUtHyxruLk5c6RejTexEFxE232pmECmnHqhjtMHBANxp9MpJHArfvhFfCX0vtYItADpZ7R6970F83fSkOdExKxkSOxj5rMU4Qlw4yFjqlAdSyJOL8JYwNFy6f8q7BaWc3oadwhLjHEB5oMT5cxWezrN8kCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055578; c=relaxed/simple;
	bh=AuwIOwxmdbbPDEkwTHbMLx3ZOX78wZJqtpzKavBlsCY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=E2OV+5rFx4Vscsh9N+T/SbzowmCgoIgaZcg1ZZPU8G9Dqz0XmHzqatiyR0hqcNoD/qfDWZWVrSIElzgKT2jw3jzun7Bmaz6YVd0ZHBX1vydAjysCq1JFlsCO9S/dS5M6MX5qPCL/B/0BuHfahWbBTHThE//Nd3B+fciH1FXDx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=osoyDiss; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jqQBOGxo; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="osoyDiss";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jqQBOGxo"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2E9321400113;
	Tue,  9 Jun 2026 21:39:35 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 09 Jun 2026 21:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781055575; x=1781141975; bh=uHux3YooBwtUw8hfYO8k7a3jwMgIDJ20
	5s/16qAU/v4=; b=osoyDiss7efHSjkXtbq5yd/j8Rs1MlsbcOzv9i3wUjU5WBnZ
	RM4PWTTsv6ZdX206pSnHvJ3EoKwa19uQWfRwMqMUEPIB0nGve8fBzBhWPWOrGaKj
	tgCFeKdaWfGznPIlZS9/rKdihbU92EI3lq+koO8Zl0JngVeM5TgPWwlm7xNEW0iN
	PXT6rGLJmCr1LLMGNEHKiKk/uszAWNwOfTbx07zMiC/gwe2TIjPDddDbBgc9xnJH
	o19w2lDghk+EpLQygKo8xO2EUB1Zs3MIjb7D2wzz94SFTcfA5IzFZgdfen9UxTg9
	41Y3z0/6A6M3bYbza9HFycM48uM/3OjTINgwhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781055575; x=
	1781141975; bh=uHux3YooBwtUw8hfYO8k7a3jwMgIDJ205s/16qAU/v4=; b=j
	qQBOGxo4CZOIBibZmI1tSwIOcnY0SXq7gmi4FYgblfnpVMJeIA2yGSsi24rLwlhf
	76bTk1vTN3CXB6dJhud+NjUD7npxDtGF/vHOegXV4EI3F8Jtyj/whx5pFR43TBb/
	sK0FDO0XooDwBnYUPPDq344qF/Am+m9UYSEdpwayvIZbn8Gvwo3KyYBOBJ+CA286
	bVbbQM58HUvvYI4LzqCssViPu4gQYYVI2TkLq2miH0SQgZ+cSvBu9LEOTbSgnxUO
	+kr7YzPjukLX5THiryxwlAGy6zX0Tu5BwvZXGcn2zbR/opUkwpkjHyzmkVRHrX7J
	nurJ5GFPyWRm+yYRs+ZCw==
X-ME-Sender: <xms:V8Aoan8V9wRlFMfHOqEGSw6NU-8nPui4wEuaiNW_uCu3Jw5khHja-w>
    <xme:V8AoaugUJ-kKzdFftrFir9_Ozs64bpLtwEnZrK7CvYKiW-INsYoUfbQ4m4eORqD8A
    jfQ-gDl4LCqWhNwFqWlbF067c3Fn3EpRjRUYyG6_8fUsy6tiW5n>
X-ME-Proxy-Cause: dmFkZTGe4gDgMrMro+kB9DX7HCtJHj5166Hh1WXEUfeli5UX7Pl6Y7UyDlSVXf+U5HZEy9
    tmrkRXarmHu5yI8EGy5QOe9ZMnxj8BI3KYsbN82fW5C5QHFG/Qxxouzo/Bk5vUWTuVizXX
    7bUhdo6ldBjsdtnV1F4vckvi1Kxx60khQTe/fTqysyJysXXW/wU0EkuBREqlj9cRgb4YrN
    3ma+KT0tYyy0onWjjLggBFdmfBBww8Nt9W7gWbmIoLz7FJwlDGpOKcAkctNVB9BBmj4/3h
    iPynAAkFCSDbVgHihkxYS6YqLR+W1UCDw4gkw1K5cOB0/0NVhI8NtupgsbQBlZyYyTxCR7
    /mcZasAWSbNhh4qTLVvqAPAC43nCUL0okKiZTWplAVHSRXx2tzaPDf3g2K6t9WVo9R41p/
    H+Le4ouguBJYDa5RweRY0yGrJd3+pQkeG0296qpTrDO96X1SCTYdjd3PBliyP/66mbjg9K
    diOfC44XrOI/6RmjWm2SaGJClIEtefa5/+BxHWqueLVnh3VL4XojgZk49wcu0sSiw4+QJS
    m1bHPiGUx6RR03ErYOBr6hbwmMvcKa0BH6B0MUYmVuTUPOktYpwmZPOIxDbumRx4IgIMm8
    jDNJBGP0RSwVtGDZPPsFTZqaN2BchlncSmhayHpXZeOh9NXLPmqNmcLgeCRg
X-ME-Proxy: <xmx:V8AoamravYmartaHpGvUyt9W9vMfQX1unO7Prr-WWzVuI_4GPSIBJg>
    <xmx:V8AoaimEo6UrLObvBsd-eplSE9d4uAQKxMOFCkuj2RQD3u2GSN5JlA>
    <xmx:V8AoaiyZ7rxK9KhIkkv0q8i0qZ3BBDquW8pZeYDIdDMcsAsKr31E0w>
    <xmx:V8AoaimrXMlaLCBZrPzH71XZKpwb4Kk7jXdnBDvm5CfHR1-lQjAIvQ>
    <xmx:V8AoasTWyTfsgkhuuptJWNuCBNsxDaX3ErQ5RKI-goq5DhBwV1OtDQrI>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F0EA1216008A; Tue,  9 Jun 2026 21:39:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Wed, 10 Jun 2026 02:38:56 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Randy Bush" <randy@psg.com>
Cc: netfilter@vger.kernel.org
Message-Id: <211299f9-1e80-4f8f-8d5a-c0642b4edee5@app.fastmail.com>
In-Reply-To: <m2zf1318p7.wl-randy@psg.com>
References: <m233yv2r20.wl-randy@psg.com>
 <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
 <m21pef2ope.wl-randy@psg.com>
 <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com>
 <m2zf1318p7.wl-randy@psg.com>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 2:32 AM, Randy Bush wrote:
>>> sorry for being insufficiently explicit
>>>
>>> the ssh attacker is getting through to 42.642.11.82, which is a piece of
>>> hardware, not a vm.  it is the ssh port of a hardware switch whose
>>> security profile i prefer not to expose to attackers.
>>>
>>>     define VULN4 = {
>>> 	42.642.11.34/31,
>>> 	42.642.11.36/31,
>>> 	42.642.11.40/29,
>>> 	42.642.11.48/29,
>>> 	42.642.11.80/30   # <<<====
>>>     }
>>>
>>>         ip daddr $VULN4 drop
>
>> 
>> In that case, the question becomes one of whether your nftables host
>> is responsible for forwarding packets to "42.642.11.82" (as you put
>> it) at all. And, just as importantly, from which source address.
>
> the nftables is on the border router.  and traceroute showed the path
> in.
>
> the sources of the attacks are a ddos, /82 logs the ssh attack as from a
> jillion source addresses.

Probably best to trace only packets with the SYN flag set. Otherwise, the trace output could be overwhelming.

ip daddr 42.642.11.82 tcp dport 22 tcp flags syn/syn,ack meta nftrace set 1

-- 
Kerin Millar
