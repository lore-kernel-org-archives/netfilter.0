Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1A125DE
	for <netfilter@vger.kernel.org>; Sat,  1 Jun 2024 20:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717274089; cv=none; b=bxKdA1loO00nyTmHjjPg/zk7p/pFG6/Omd+o0s+3z/jd35NJPgo8xYtiOhazM1XMK5JjTNgYA/NI2erAwlA7bKDwQ9WdAguolrc1uoNllo16Mok274qVvwHVtE72AFIrz9wGkgJNz2MYUZwJqyuuvonzk4FfOfxdGFDEQbPATcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717274089; c=relaxed/simple;
	bh=/dhhPurTva9T8pwjuQ111GRRnSXbZseSBxenQA7vGG4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=iEuv4SsHZsHtMzOsGoWnAbXxpvWRNK8QpBKTWDLqgM28XMiQvv44b5YGF8iGw3oPw4aYaKUVTSdk3eNTOHLbkQIADu47E4zxMKNM7NoygLcplhfrfke9nvK0Z3Nz9A0GbIiE/E3dl+LNuuf3g2rm7Bt89BB4MAFV2/yyqhmBNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=SjopMI/2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pPsxHuUC; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="SjopMI/2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pPsxHuUC"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 650F51380083
	for <netfilter@vger.kernel.org>; Sat,  1 Jun 2024 16:34:46 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sat, 01 Jun 2024 16:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1717274086; x=1717360486; bh=eXg4XQbZFH
	BTFTBoz+j6yvUP8MRjmY7T90F1Hva68qU=; b=SjopMI/2DIVdtv8ElXaneRVAuB
	fMULNH0cw2UlbbqctS2rvaa5PjBHPujxxxdwcjrEziQ9Y4zxeTR9XFH1VR24RqaE
	hjNWWqIXYkdzMhUFt0bUQmPceqWsfN7LP/MLiakjAYSVH4Jlic22rfsdU4Gd0dnu
	EXGvtypaj4uIsm6PaZTfzIHicD0IeyJnOzlPzPBCKq8PO1HHbwTLEFckSfUmQpF/
	W4XzWvf109MnCH/NkudepN7EmveAqtDn/Jb3w21UFiysETo4uzsaSCUZMJGR2SjE
	+ke0PLrwfvxcQ/4wrvAlTZnDKb3XIsq5VINsWlatpfGBrA6+1h3ZFppTuhKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717274086; x=1717360486; bh=eXg4XQbZFHBTFTBoz+j6yvUP8MRj
	mY7T90F1Hva68qU=; b=pPsxHuUC4tp3CE+mQEiicE9anMlRNmhtZ+0LKFQ3XY+v
	VJACaehFS9sAxWNrdzY0n+ts5/mKI8e5xyj5PV/9S64Q5X+E1QylFezK8/nIp6DR
	mMeikRVl0uIha9hWRCsD7gvU6MShpEyquPXZLsQ+7ndneXwcyhUkXEBFXmg7qPBe
	5n5ui8cXVVFJq8u5NuSlX1+3DnDjvQHKsx8allkKbk8rsa892W9NpWeFZlrskXgw
	3KoW40LR6ijuKDSnSJwGGX7BYwrt8LnVIX+O4VtPhERt9pWBYhYy6XiPXAuf3xRV
	Nh6VPRftsO0PrRDJNkTMKrmLkAVYwRSgupx47mROmw==
X-ME-Sender: <xms:5oVbZl_ty8OVQKIl0ULylUEH3fKdiZNAVK77O1Y5UXhH3I3Nnnc3kg>
    <xme:5oVbZpuHoRKxldZo6xIU1NEweS0Yx_2_hZwb0neCz0RSIuiU0W1g5yYIjcktAgTh5
    cv57IHwxhp_Fq9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepkeehfffftefgudeigfekvd
    efudfhhfefhfekffdvvdefkedutdfhffeigeegvdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:5oVbZjBX4HLlyiqQhTSPElb0HbM1AJEdD3GnNUNliHjXAJO835hLUQ>
    <xmx:5oVbZper_bzGvGmK46ZIO6BTXy6L6UVwyiyn7tC1SAyFLrw4GORRDQ>
    <xmx:5oVbZqN9o73CbhMzM_IO040ubr6W59v2e_FXPfvgbih00N98PHs6Yw>
    <xmx:5oVbZrmMp0517fEJYQOua1Kao8WtMTd_YWplVSybgxewNuhhzke1WA>
    <xmx:5oVbZkUqT7cwxc-G5uwgciM6GlUXPKvz42oaNqBu0_lleHkcucKiyQXl>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0A51B1700096; Sat,  1 Jun 2024 16:34:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <0fefc5db-1fba-4448-ad56-2e2e3872aa27@app.fastmail.com>
In-Reply-To: <20240601182056.6bd57a96@localhost>
References: <20240601182056.6bd57a96@localhost>
Date: Sat, 01 Jun 2024 21:31:31 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables rule where IPv6 source and destination addr are the same?
Content-Type: text/plain

On Sat, 1 Jun 2024, at 7:20 PM, William N. wrote:
> Hi,
>
> I am looking for a way to create a rule triggered when the saddr and
> the daddr are link-local the same, e.g.
>
> ip6 saddr fe80::/10 == ip6 daddr fe80::/10 accept

I cannot think of any way to do this. In particular, "@nh,64,128 == @nh,192,128" is not permitted.

-- 
Kerin Millar
