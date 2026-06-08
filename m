Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B813955DD
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941233; cv=none; b=uOwIt9Q86dlHDhJmVN+0mGRiMDmUSGdfuJ1RWGeyLAlP06qY2LfnTLEr4qANjyztDvlHyh0BBILvzBgSBVjKZEh/JNq+/ZK/k6Ut00UWfNhyYNzjYLwD2BYUwEr/TGfFiI1ZW27MK/MGOsB5v5Ntn5t6lLxahLHqXuY4KNgCIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941233; c=relaxed/simple;
	bh=IyB/beGNGBtbm044KeHFR5uJMYXP/p81VVKchXzQB6g=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WBqsFvL59/x1/UAPhNyZKOvmMBkNPOZf5K+BL7TiDQIDGaIO6o8B+2EXOn6ZTRAb4SKRiwq5TR6XFfW+hadyNZhwwfU6Gox8nFqYzZwB3yof59EKGNS8if4+YSkQWUkt+DW+eMChycSsTFma0RO0pcFjwKS/ey/Yzz7mKVs+aj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=fHNEqkBR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XHsl4sYD; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="fHNEqkBR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XHsl4sYD"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 4A595EC0190;
	Mon,  8 Jun 2026 13:53:51 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 13:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780941231;
	 x=1781027631; bh=Bu1CU7XCN9uP7QIeMehNSrbhdoHwDLhncb43/5hxTYM=; b=
	fHNEqkBR2GYsDZyHWV0dQLACDB2q6sXBNUamjWRpNI8KIktNSjbOGCDRCM4JAXKt
	jaNPCtthAWfQDrWkmmzU2dXUcOUOEFF2XYLuMi+z3sORyXC7huwTFQ4TIB4vIm//
	/io9AmgQ+KEnCFU4+wBy64cnWakt7TCSasK+spdQR46RXMR/+I+Vk1TqWlPdPQ4O
	9VwMOAszlprc0q6EBLG+hoD1KJWJbrz/ZkeVUNrDtah6rndEAnpT+/RiP+b25UDB
	PmtzY1geFJVUwJsqj+3T3Un/F8i7eC7fR8vex49hbMsxb0jaC5WdhRdrqimYT4kH
	YjDBq6gZeA2tsL8PyQqzUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780941231; x=1781027631; bh=B
	u1CU7XCN9uP7QIeMehNSrbhdoHwDLhncb43/5hxTYM=; b=XHsl4sYDhkwbqeIPd
	gmNXTFAjfQpahimiV2E6sUW4FCZHnK/Kjh7IvGYi0wD891JGZMRfIJbYWDGeoKDD
	GwXVfSAENLNA7JeUQPx54Tti9BHw4DaIrTpST9qt4gAOzZmbsXDtzwpgZ2OLcepj
	MhjfkOtO7taRJeOTgtinniOlUxbTstS72v2HLLy60UNgHEYJerUj56I/fR6JyNZe
	A8cxkxe4Sh6cm0K20WBICkWDC8gfAYaP5Y3kZa/pWSjGuUggm6qz7WTcNOX8ftBe
	vyKL4r94CXT/30zsr5UfBXFzn9KhNYxDLWkH/QR0aeVUkNJCvgBFzx46EfGifcL5
	c+edQ==
X-ME-Sender: <xms:rwEnasgRtFFSBHGKDH1F6ZFZXnR6edhcaWOPLVF3Ix1UpcD1EYrg9w>
    <xme:rwEnav0VlEGlyoETfSMlYQRs5GrJoJh7enaqqXURQzNpAH50eVT19YvqvRoYwQFjw
    jIa_pojano4JXrpp24EuNK3x9q5jUnPqlSDPG9Q9wazTyVMAZ0>
X-ME-Proxy-Cause: dmFkZTFMyOeMe4zgOQAkLzb74LP48ndsE9qrtfGVX8kPto2M/BJ0+REpI93eQya/cvk00P
    DwV3vMKg2jivmY5Fx+HBO3/ImOCRmDzDa41JD2jNyt0dlxhlopMSJ6WWQsA471vY4ye/eU
    uVoMN3P2AzES8YMbBaN861IoFAvetnaBUNTMzV4bWBiyMBz2/whzVszYTkzRwcveTHYGQs
    WHOPgVHgpoCan8cm0HRAWdBpKyQupPSSMiKfN8mYFasBPzyRgywPrI6arlx8jwNORHInJj
    aAhBWmD4SrKGZtgFzq3Bqqk6N5WbFKl5r2LrUUJBuQQ4X84nzBTj8iMUermyi07tY1TdQ/
    eEB/oiah6+0rszmK+6s6sQ2M3Nu8QJYc9Iz4IdKth/qFlF+Q7d7xgO/xdANrmnRWeOvqfh
    StlZPk1CrceXB9Miu6OoH5sigxSSxMrEqfiRME+GPRMFN0rZJmxmFpkIeWfdQn7vh0MGqe
    uvfXY/5UI/49FqiGqaTazLjIAEioPseoUawQqGGkkhlZbTXyEEzwY0+NVbl3IBHRWcRnqd
    geQhnAtIxV+NzKczulEAsi0Km4JZkoDCLW+0W6dhSmEzagPs5yPd0GdfPJ9V1WG+0qMyEK
    lLPgrvbdjBl3Rd1lAvNIc7sqSkl1b9frR5l46/6vQuhIex74Zlw6B2dlqKuQ
X-ME-Proxy: <xmx:rwEnal3LHR3T0PIlTGOSQfI1MTmUvvU-_VUrWH32muMMKhSaat5FxA>
    <xmx:rwEnagYQuecbgI-AeYEPe8nQG27IwO7jDqd_Xs241s86S81iZ1VQMQ>
    <xmx:rwEnalDpTcOWL7OwiAobWKwTh4SPL753V7Yk-krmlFSz7Q0MzRSZNA>
    <xmx:rwEnaq8uXE-AVvmqECJP5qfm-ORF5tIKk8X1nYpD0QFN3qt4PTOe1Q>
    <xmx:rwEnaoSoSfSNx9Chu5UcjPvaed97y48-RUqvRINtzEGFPMclDuik55fS>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 088A4216008A; Mon,  8 Jun 2026 13:53:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0ZtpkyXIlXs
Date: Mon, 08 Jun 2026 18:53:30 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Jan Kasprzak" <kas@fi.muni.cz>, netfilter@vger.kernel.org
Message-Id: <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
In-Reply-To: <aibwHhKDBOgr2p7M@fi.muni.cz>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
Subject: Re: Logging SNAT'ed connections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 8 Jun 2026, at 5:38 PM, Jan Kasprzak wrote:
> Hi all,
>
> how do you log SNAT'ed connections for further forensic purposes,
> when somebody complains about your public IP address and you want to be
> able to find a local user behind NAT?
>
> I used to run something like
>
> conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE
>
> which did what I want. But now I tried to run the same on AlmaLinux9 host,
> and it seems that --src-nat filter does not get applied - it shows
> even connections which are not SNAT'ed at all, because they are for my
> own IP address:
>
> [1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 
> dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 
> dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
> [1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 
> dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 
> type=0 code=0 id=8724 id=2525400839
> [1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 
> dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 
> dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
> [1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 
> dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 
> type=0 code=0 id=8724 id=2574615308
>
> Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
> show up in the conntrack --event --src-nat output? Thanks!

Unfortunately, it appears to be a bug affecting ICMP. Possibly here:

https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189

For now, I would suggest filtering with something else.

conntrack -E -o id,timestamp |
perl -ne 'print if /\bsrc=(\S+).*\bdst=(\S+)/ && $1 ne $2'

-- 
Kerin Millar
