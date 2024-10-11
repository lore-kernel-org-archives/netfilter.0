Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EEE20C484
	for <netfilter@vger.kernel.org>; Fri, 11 Oct 2024 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637351; cv=none; b=ZKoQcQY4AfTfw4ZjMyj4oOwF8jT/46e2geiatsqgsrUwLGDcZjFQ5iUfJUFjRFHYjZ1/tZhWJ7mcuh7jzJ8LwLR1GaCMb6piKZpnb8ET/RULUu0HFM7VfU3rcF2y4DccwNs6DB2Q8LTiE4HAtgmPq4VUDRYlBc3GAHsfl1eMKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637351; c=relaxed/simple;
	bh=8tBx7LJ3Dpr8oy9f8rSix0svk5qomTNfnmtVj3mWYzE=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ud79ITKgSk7Zzwg56y5jds8dpg2OsW83F6hc8Hjx5yo3kLsw1OoKR7X5lshpcdRwYWr115UFkuRF8UpqlMEeMSESBaEaRCu7IlnwR2CyBRKh+BSn8kBiGNSndsklyuZmWGPESk43OhTl/62AIXOfuWlsjYtK7yZNretiJkvrilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=YllAewap; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QiSnotAM; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="YllAewap";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QiSnotAM"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 598181140145;
	Fri, 11 Oct 2024 05:02:27 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Fri, 11 Oct 2024 05:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1728637347;
	 x=1728723747; bh=wnnlntif3+fVGHunRc5sI/zDn2bYjrpFSu69trWE5iM=; b=
	YllAewapjyufKjdqtxiluB1kh1CoClzZryBfkMARr7V516nRdAlxplnvaO2iB9or
	PIdvmn+691+vZ8NitO5jxark4n+Y3mCCe1qP/QNygEMyCy2PRbeUPlmYJTGNvLf1
	dmDMDdM6/8SNeMvZDD/C8RYSnV8A9nXTB+DzFOayJni3Vlh5/u6mz7PM35M9NVFt
	N421L3u9ZgsEEKSX02hwGTcuU3ik/y6/u+42G2KsD3Xua38xHn+3z9LjLLXb5HGz
	zew1ufPGkVdwrB50yilaXbClLKh20oGpbxeDyZMpi+ldAHHxe2pSrcge5LLSdppO
	NeKwdV2LGccwfDtiPQUAZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728637347; x=
	1728723747; bh=wnnlntif3+fVGHunRc5sI/zDn2bYjrpFSu69trWE5iM=; b=Q
	iSnotAMcmsTLPhSC+FrJtkIXOkeliRRDNnoqpTWQtPHx5KXQDa7MPQ8KZ1n/Z1Dt
	N6MCFo5mUlg1xBxUETtlI/iJH6NNbMunchO5v+MhFEPWIYrYpLTe2UAKU8OfEaF8
	Y8UJ4Zg/g6D8qjCUViPpvR6PtRmIDGAcrjys+wVTp76hwSBly/X5h/SLcRU2hM38
	fJoKiTsDt2/Rq7P4AaCR5cfsOI0gunvY5xndBdkPOJQhRJBxkgtlOPvY9ItVQ6uH
	jFaVZKl10LYra48OGv1hFRPqgSJ7aeXVFCzPRm/p5uByPU38P242HQ61WBx1voT5
	O1F5+KizIQkLm9OS8kkoQ==
X-ME-Sender: <xms:o-kIZ3kHXfZAz6IJTTFiZv_mwDvhM7BICuhZhmiHBc5eA1wTWlwT9A>
    <xme:o-kIZ60A1ZPEHmBnm6h4Pd0uE1iQkyFt5NQMHtb5lpfBNEjRoyIera6bytTddDSQq
    kaajGlMK-kZeVLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefkedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepieekkefgudfgtdeugedthfehtdehffevffeu
    vdejgfetleeileetledtveefvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghp
    thhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhtihhnsegslh
    grtghkqdhshhgvvghpqdhrvghsvggrrhgthhdrtghomhdprhgtphhtthhopehnvghtfhhi
    lhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:o-kIZ9oPKe0l3Ymcu8G29kp4jOPouAjVDr7SeAeE7Q_3mz1BbYC5Yg>
    <xmx:o-kIZ_kHlcxgn1NNoeMakFbTUE1scqe0zFMazF1VcU5NS2cU-YcF_Q>
    <xmx:o-kIZ13fbYQKHSHZjQtY69d2YfSFUL5CtlAvgHLQjizqYJt7CZZy4Q>
    <xmx:o-kIZ-tEGCq5SeZ9NxrzXkAZqKQHt1ljat5lBCckpXX-UISHWVfCyA>
    <xmx:o-kIZ2-5fdjcUJv9qZmzLr0iL63GaHoeMxj3Xfp-5bEmjHlskrIn5tEB>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 011AC3C0068; Fri, 11 Oct 2024 05:02:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Oct 2024 10:02:06 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Martin Brampton" <martin@black-sheep-research.com>,
 netfilter@vger.kernel.org
Message-Id: <afa35ef5-37d3-42f4-a429-3c63d99a189e@app.fastmail.com>
In-Reply-To: <a6bd13dd-5536-4aed-93e3-51b14012bb57@mtasv.net>
References: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net>
 <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net>
 <f1f09316-a0f3-43e8-854a-a7d6a7138aaa@mtasv.net>
 <798fe091-1614-4db7-8692-66c2d03a9f54@app.fastmail.com>
 <a6bd13dd-5536-4aed-93e3-51b14012bb57@mtasv.net>
Subject: Re: VPN nftables
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 11 Oct 2024, at 7:40 AM, Martin Brampton wrote:
> Thanks, I'm sure that makes sense. But I'm on the point of abandoning 
> the use of nftables with openvpn. I've already spent several days on 
> this. Other servers (about 15 in all) are running with nftables, and I 
> would prefer total consistency, but not at any price.
>
> When I say can't access any services, I mean literally that. I can 
> create a new server, install openvpn, connect to it and use services 
> like ssh, mosh, https, imaps... And I can do that with an iptables firewall.
>
> But as soon as I add nftables (removing iptables) and connect to the 
> server as a VPN, mosh sessions stop, web access ceases, mail access 
> ceases. Given that the ruleset opens all output ports, on the face of 
> it, that should not happen.
>
> And from that point I cannot find any way back to a working VPN server, 
> which makes testing harder, and is disastrous for a live VPN server.

I take it that there is no out-of-band management system in place for the affected server? If so, you might consider whether the kernel is panicking. Given the use of Debian 12, it would be surprising but by no means impossible.

You can test rulesets more safely by using tmux or GNU screen and running "nft -f /path/to/ruleset; sleep 10; nft flush ruleset". Assuming that you are able to access the server after the ruleset has been flushed, there would be no practical impediment to tracing as a debugging method.

-- 
Kerin Millar
