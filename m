Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4819DFA2
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 19:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728590204; cv=none; b=cWnxgvej8JOgQ+pBxWHZdJ9pKo2KC6KvUzS55dNiVJNfP9kOEq2K/MsOQlx5rlPtUa+x7Vx3C2gxpDsZl5mNnrWNunoYXCnfpokoi9acXZ8L+CvSvSXdJS1w0z3YiRmj6GOhDOzBje+TxWL/jdShbJrJlliTEesiOEK+G7vGyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728590204; c=relaxed/simple;
	bh=a1nDa6fLNobBC/Zs4Ht61p7P5wxZaoKyOhSerQRYmq8=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KXKD9LxW3HrvFZjMlM/F3rayNpg/tmRloi/YtP9galC3TB64eVICzOtVIHJB+aSW+1OpdKolUVurUdfijadjSTuUv06kJIW/Qo6JhDgfxiyc9APmbWggCy2jadvvF0ptg/B0BPolsyBXab0JTLq1c2dr0dZi1IBdYD7LsJl8fzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=gVfiPL1r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CvGO1XVV; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="gVfiPL1r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CvGO1XVV"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 7F918138038E;
	Thu, 10 Oct 2024 15:56:41 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Thu, 10 Oct 2024 15:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1728590201;
	 x=1728676601; bh=+kgCefjjULYDtKqSipQnyNNI5cqClvwsRaSJh4siwTk=; b=
	gVfiPL1rcq74u39OPGgbU1eC5chF6bkrrYIZGPRWJQ3REfZ3THiNcMBUZG1PW6Gc
	hbeZ5/Q5enFYuIJN9JgqP293phPHzAS+cp/oEhzE9yyI3xtZwGtjlQKOytOWoW+8
	DoK6BeKRDGuZR09D+++xWDqQvUR0Sh9SsqBN2fx9lYlmzARsiluXmIM/LFm4hZWg
	GrtKnEUVNuleCJYhxONpDHJtbkX3/vOul3MNym864rGI8yu2Rq/CNJftKugMVZ4w
	Rm1lR0E+A0+XFBDpOHN1JQKZ6b+IABVicIPPd8kM7CQwqQNmLyRAQhfgffFfCIkd
	JuQjzvCzLJboy4EbwwsUWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728590201; x=
	1728676601; bh=+kgCefjjULYDtKqSipQnyNNI5cqClvwsRaSJh4siwTk=; b=C
	vGO1XVVAKx4GKcGHys8g40w/COKNExS44udru2vHnpo6B0+eiH43hDH8AhpAxafg
	5IS7zGQI5BBNQkygYElWxQ67sOiSFvI4T7UGXbyNA3Mpr3ljbfYrq1M8Q59O+b5x
	loAfNL1xGMuIV680WDQVrQ4eg/I90BdY78Zr7zAv/tON2AKmGMKJTms7Wz9Vq36m
	P3Azj1Som1HAjFWKmpfBXSIlkwCCNcOXuSLp1g8hLTLFRu7aosWl85JLS80/f+Fm
	9/NImS3j352z7yeZbPlOTE6kktHWOTweYPDMiotNrQhIGUk72yXXYJNOrgJxJRXL
	t3P62OWm0rhxrJEUjPdIQ==
X-ME-Sender: <xms:eTEIZ2MuHDKC4kuJwJjqB4ZIGj2O-p2ydFzmh7EKLjU99mO5pWvL1g>
    <xme:eTEIZ0_O5ozhLlpnJU8N0yRKU70FFcITBg4n84vxx-UlHaqy1zucvab9h5bM8jMFV
    1YNep_3vJ7DxA7e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefiedgudejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:eTEIZ9Qp1QUGmeGwvWxtaXNWszDxBbhLwaTJN4JK7eWAMFYYlNpMqA>
    <xmx:eTEIZ2uzqqvLlqu3xpUVH-HZXnX2OAs92B-Bhw_ONarsldVrtVFcuA>
    <xmx:eTEIZ-dKyOGd17oSfnIQ3Ag_nahZGT2U5PMHZX7rVV6nhZUtb_2t2A>
    <xmx:eTEIZ60KbvWdKBFdVvWDtOXSzoQYFORmyJgYbVS_S0ZF2xx8LhNIlw>
    <xmx:eTEIZyGhPqULskLyqdGCZscyFnGFfz4QE0OJx75uZT2lG1k_t3D-tK2B>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A43E3C0066; Thu, 10 Oct 2024 15:56:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 20:56:20 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Martin Brampton" <martin@black-sheep-research.com>,
 netfilter@vger.kernel.org
Message-Id: <798fe091-1614-4db7-8692-66c2d03a9f54@app.fastmail.com>
In-Reply-To: <f1f09316-a0f3-43e8-854a-a7d6a7138aaa@mtasv.net>
References: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net>
 <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net>
 <f1f09316-a0f3-43e8-854a-a7d6a7138aaa@mtasv.net>
Subject: Re: VPN nftables
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 10 Oct 2024, at 8:25 PM, Martin Brampton wrote:
> Thanks. Unfortunately that doesn't help.
>
> In fact, it seems that installing and configuring nftables destroys openvpn.

In your initial post, you describe your problem as not being able to access any services. That does not amount to a concrete description of a test case. Upon your peer being connected, what exactly have you tried where the outcome is not as expected? What were the diagnostic messages reported, if any? If you were to focus on - and detail - a particular scenario, it could make it easier for other readers to help you diagnose the underlying problem.

Additionally, you may find it beneficial to define a rule that enables the nftrace mode for packets of interest. That is, those that you suspect are being erroneously dropped. I usually do so in a prerouting hook. For example:

chain prerouting {
    type filter hook prerouting priority raw; policy accept;

    # Trace any TCP packet arriving that is destined for port 22 at any host
    tcp dport 22 meta nftrace set 1
}

You may then run "nft monitor trace" and observe the trajectory of the packet(s) through your ruleset in real time.

-- 
Kerin Millar
