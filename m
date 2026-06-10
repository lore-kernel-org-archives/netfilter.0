Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC012C158A
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108225; cv=none; b=NvWI47C4NQhSiwgu28qc0edA3cvOUg2Ug8+MwNXA6TaNJeINkwXaeX2PpUDAWrUkbkNGb+v3Oailt1/o8GF1jw30wOOL+u5pEa+/G1XmVUpV5l3bntlFFLKyNj+AM1JzCgREYK5IOPlRlqKDMq0ge16USTGfSmtuweY9tvBuug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108225; c=relaxed/simple;
	bh=XAOzdO1MyGiXXFkR2crV+kuzxEo4PQLS1ohR3go0TOE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lA3aEsdhp1VOfJaRI/OwDxMFtvsZl61OMAfQ7ejMiOmzAyUZmRWfhYukCVI9RIyy9pZ9GB7MpTLfdVpixZvRXaUDJHQCIxLKlylv8vMfajZOWw1IvIsMVF22NNjgj2edVVWJnc+xjj5clCv44DNGyW2nGnpOgAi8C0Gi/xRr/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=XFIxbHoT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HlTHb/Vh; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="XFIxbHoT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HlTHb/Vh"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8738214000D0;
	Wed, 10 Jun 2026 12:17:02 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 12:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781108222; x=1781194622; bh=GDsUTsPRSdBTtbhNzPNWrUv/Srd1UUNT
	JIvkYWtpHOY=; b=XFIxbHoTNu6IU5FMivhTaLBD78REFNYPGKuEUd/sP4oNj5M7
	5QJgLtVOfpB1lfIamom7VcZobPQVBuSQY188jNZt/Crc7okZqNlo0JkEVzJvePbR
	uXfVuc8Vq5GIoN2D2CN1KcrOhu8q4zEemqv/2479TB1l4GJzv8M/4i/U4p9MBoiR
	XmJj++d+m85PWVrO5Qa9bFT7aiA77OcqntmlceK8GX2MgxjyEiSMiYSyGCjjanK2
	E0/J6RoACo9Tdax1pbSzlzKRC8Hc1PizV4EVy2o9ywsVoTwWThBGk4t8Gw4ZXu4N
	dFLV/VuUkY7xWlyJQuOpTrD2DIZoUb9Qrf7riA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781108222; x=
	1781194622; bh=GDsUTsPRSdBTtbhNzPNWrUv/Srd1UUNTJIvkYWtpHOY=; b=H
	lTHb/VhiGOKXvcjqykFUIBGeXNSfiy2/oLV+ECxLxxhn1WfYUc4PBoVf05MQbtnW
	zc6L1TcbvPk7T/vXc2BM0kOvxL5X5mdfqgkyQupVngqYJfO+A8gYMjBiaJW3+akd
	q3BAV8jLQZvWwYqwV9g7hdnKb0Ibn53C6TtOh8IwD5pSJV5JKMJeuRAS7v+hjQh5
	gB66zTGoR83lexXnY7NgTkJFqp8yEhnTiT8xAKHGvIfFW1zZcSHhRH3XOs2s8YVr
	oUVs1DuHaQezfqwRfsyq8ZSxdn4IS13JlFTSQbjnkxesj3ys/XBZq46CaH8G0e05
	0mg1C/8KBX50LPa0SpTKw==
X-ME-Sender: <xms:_Y0pappkWUToE9TJtRFqT_l9L3dY5E9gpZzFA1af4CusnYcCJJbykA>
    <xme:_Y0pamcF-Y8sfr6r8loWgwuiOg_8gvW532ObVScvS-BzkFfRrWvD4trNroxcn2KEj
    H-jRURvjVne_S-1Fiq-XLHgEbAfcxYVFFmjZiyyNbU21q-3Ct4W>
X-ME-Proxy-Cause: dmFkZTETq52ayO7+kFD78lcGGbeIgVs/IAOGfKPzTFAvaHpimCpHvLnbP0wEEl4/gmCekU
    ix1x7+m+I6zHViMN/+pJ11Fu8T1qzJob5VbYGgBI39xB7qnDS7FdJlskEexNFBCidca+mM
    kkzjUJpdzSDt4O/Z2Zcy8XkeFxTgbzPKK9kii9z3P2AwrcIEp3D6swPpfpMEVdaWCqyt2g
    wvfj8JAaCtSOkEFiiBRdise2XWMwd3bUIKB/fDpgLRSPTR5I8dOxILx1vO03aUuC8IHzwP
    m3o2+4uAJS7KsjHc6F+7Kb1CQcw70snUjijlC8xg/sJryif998wEGJlIypPe2cejEZTii7
    HCMhD3K7FUERcSgYK3KJ1wJ6P9Km1y1HTexykj2WRPE/USU6xRc9JzIyLYrKoCoa06nWBZ
    R9MbO92UVEUAj8nsQ72fsPuj+7RV1rwMTQjLAWMyTWoKAQVGflWkhpAiJ+jJbrohjc3bnW
    b2Tk/VdBv0UxJVlgbwL/+rGOwu4Gq0HT7yPuyE0UgLLBjk6a7FuP+zg/Gx3dk3phpFd2a9
    Rroe9i+aytUS7o5hIZWm1PbMk6bUy8xrl2mJoPK2Wj95c9AWpkekMMs7v6zAL+a8p+Viem
    qLJ77wyS2cdPe0xQHxykl0skJ+HMiPybiUycq8MweeyKwc1U/a6mW8e5xP8w
X-ME-Proxy: <xmx:_Y0panPnVaUIxY3PUvS9VNLsrbuMhxL8W0gqOxlVfg3_Nbe8PLMUtA>
    <xmx:_Y0paiFfGraTiA0aPzeJ6r22UWxAPKi0yUrJG_ajV5BbV0q-vn-c8A>
    <xmx:_Y0pauMw8fg67hqTP27VDcX9FOmUDNCf7tG_vSG6qRNhr7llgOZy1w>
    <xmx:_Y0paj-DEP88SI-UY-Xnf-cyQBNu5tqEix3hjcTopY7JHFYFzczAaQ>
    <xmx:_o0pahpzOflnuzKNpmwx5QlU6Cx-wOjf9nHfhYJpeAHwkzNTB7GJ4BGW>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B3C1D216008A; Wed, 10 Jun 2026 12:17:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0ZtpkyXIlXs
Date: Wed, 10 Jun 2026 17:16:41 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: "Jan Kasprzak" <kas@fi.muni.cz>, netfilter@vger.kernel.org
Message-Id: <1a556bd7-51c4-45d9-8c7b-ca637ed584e1@app.fastmail.com>
In-Reply-To: <aimDYp2y_oxSIIzi@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <ailH6MomrFCvxH8Q@chamomile>
 <74dd050a-3587-4fdc-b06f-c82a9fd398e4@app.fastmail.com>
 <aimDYp2y_oxSIIzi@chamomile>
Subject: Re: Logging SNAT'ed connections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 4:31 PM, Pablo Neira Ayuso wrote:
> On Wed, Jun 10, 2026 at 01:04:54PM +0100, Kerin Millar wrote:
>> On Wed, 10 Jun 2026, at 12:18 PM, Pablo Neira Ayuso wrote:
>> > On Mon, Jun 08, 2026 at 06:53:30PM +0100, Kerin Millar wrote:
>> >> On Mon, 8 Jun 2026, at 5:38 PM, Jan Kasprzak wrote:
>> >> > Hi all,
>> >> >
>> >> > how do you log SNAT'ed connections for further forensic purposes,
>> >> > when somebody complains about your public IP address and you want to be
>> >> > able to find a local user behind NAT?
>> >> >
>> >> > I used to run something like
>> >> >
>> >> > conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE
>> >> >
>> >> > which did what I want. But now I tried to run the same on AlmaLinux9 host,
>> >> > and it seems that --src-nat filter does not get applied - it shows
>> >> > even connections which are not SNAT'ed at all, because they are for my
>> >> > own IP address:
>> >> >
>> >> > [1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 
>> >> > dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 
>> >> > dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
>> >> > [1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 
>> >> > dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 
>> >> > type=0 code=0 id=8724 id=2525400839
>> >> > [1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 
>> >> > dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 
>> >> > dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
>> >> > [1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 
>> >> > dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 
>> >> > type=0 code=0 id=8724 id=2574615308
>> >> >
>> >> > Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
>> >> > show up in the conntrack --event --src-nat output? Thanks!
>> >> 
>> >> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
>> >> 
>> >> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
>> >
>> > Maybe then this helps?
>> >
>> > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610103039.167819-1-pablo@netfilter.org/
>> 
>> I have not yet tried it but shouldn't the helper function be checking against the protonum field? Also, the referenced commit appears unrelated to the fix. I think it should refer to b4c3a23c884c.
>
> Thanks for reviewing, v2 is here:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610151735.192168-1-pablo@netfilter.org/

Thanks. I'll try v2 out here.

--
Kerin Millar
