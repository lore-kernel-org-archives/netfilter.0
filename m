Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD013BADF
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731601626; cv=none; b=FxBFzr6fHVmfCdNFmnWx5AcmdC+gtodmDl4g2D6uHtTwwTb8k8J1uopOMMYsnO8mKnRsWKCQHYdc2RrIo/oOpUwA2iZGchTel6nDw9yvcE3f+BsobyWefofs35CwMxvbVutbHmi3q+yY6ICXzSw5n74o1t5CPsRNVDOtuZFHHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731601626; c=relaxed/simple;
	bh=VnKcKnkfFiLHo83vlqF7EWJ717fYvCa6AY006COds88=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OFCprMz3dnBvxGsr1PbOW04UO59NAMhGKjJnNdpWgaO9bjvMq70hm2tTTLiNejCGzyc1lcXYp/5BTtbfbSblYbaCUpDJeacyEQSWUeh0t2nF0AYxSWM8+eUUu14ulhYzgQNQXii+mL0JYXA2Ix+dFEcFMGBtfsOeEIfBOzRWIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=eZhmxvo5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E9kgFGDW; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="eZhmxvo5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E9kgFGDW"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6045911400DA;
	Thu, 14 Nov 2024 11:27:03 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Thu, 14 Nov 2024 11:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1731601623;
	 x=1731688023; bh=5/kmjQx26F3G+ZJfrmxziQ1GO6ETULaqC5TYo9TFYR8=; b=
	eZhmxvo52119kIgVRvp0tfwVuud9ePZ5efvHb1L/PTPKQw1Ot/xLfhCK7WbVFefX
	SukSeMKjXfHj2Vf8PnXgkELTY0guehVO0yAFkNtCQVk6QKiLyxFSTj2Q1fwxjvEV
	oZOXTzMc7aZwQ2vK7gNQ/WP4tqOYMOd4yJXuNr3OqfaImzDfUCUhqkmRamKOgeBT
	uaF6AXHmoAR+n3C2DpjhY46YE0Huviho+cyi900SBI0qn/cjIvemyKFL4y1oe+yr
	rjoeqV2pc4VOe4iukcHri3P81VhZizhLZVIxWGnbCLUIVabxqdfTKzKI0ebEK7Gn
	eyYP2ZZXb1CsX76rdeEdlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731601623; x=1731688023; bh=5
	/kmjQx26F3G+ZJfrmxziQ1GO6ETULaqC5TYo9TFYR8=; b=E9kgFGDWBVyxH4dBh
	oipoNixVuX5AYiDcBz7ps3nirlNA2JyWPaPtoet72Yd/1Aqeu14OKquu+vev4D4t
	PA+ggcJM8tom0YfB/WmFy6QeegWE2Yx8C6hcuWDBKYuZV0qbuIsKsEqs6iYkbNuv
	Br5zWFXEldWvBNDZSyoupbjf6FP2WEiZCANAJr4Dirc++rksMPhtuLiKsihjlSKp
	0Vz9TrY4afaOSZTCyDOKewD0PeuLOVd50sZePFS5h/2bhOKDuttQyhfEGSy3nLL+
	Hx+2E81m3NtQfcBUOJDMDna8bNAGrKdPzGwoYPHptXRGUWK1eBDNbgOdkRXtaks5
	1Sn3A==
X-ME-Sender: <xms:1iQ2Z93kzXpZEP6lB-kONh0m0z7srNtkK8z5TrllIG_b9xhdj_gDjw>
    <xme:1iQ2Z0Ec-y6Cmo3SutlDX4Z5aHRD3AMudpi8i3zGAM8J0amjnxceeg3K95xxtNxnV
    wjv0zAaq8uKRtvj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdejnecu
    hfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrd
    hnvghtqeenucggtffrrghtthgvrhhnpefgfedtfeejuedvvddufffftdffffdufedvueeu
    leegudfgkeegkeevjeethedvveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrsheskhhovg
    hllhgvrhdrugihnhgunhhsrdhorhhgpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1iQ2Z97Fmf0GBd54v5bAQTc4AQCYUWDP3RQm8yAM6F11oeWFa7B_8A>
    <xmx:1iQ2Z60fylOpk5wtjSMBO6KuedpJNmL_eKZ9RTkC8bs_a0Vud2gswA>
    <xmx:1iQ2ZwGvRLsIokci9BDLukxpghObeY-XsygkJwd-ccX0p9hb0DELhw>
    <xmx:1iQ2Z78FTCWosmVJVgXX54eGsSBTYLUQp046CJ3d76Zrr2zcBVMrVA>
    <xmx:1yQ2Z6OTEnnZ_7wyTqg2WCGHdvT-p_ZxSLvNQfZ_01IW8Op1R99ghor4>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE58D3C0066; Thu, 14 Nov 2024 11:27:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 14 Nov 2024 16:26:42 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Thomas Koeller" <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Message-Id: <ebdf9189-3a2e-4501-aa07-a29fbc4d713f@app.fastmail.com>
In-Reply-To: <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
 <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com>
Subject: Re: Dropping of the end of a chain
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Nov 2024, at 3:51 PM, Kerin Millar wrote:
> On Thu, 14 Nov 2024, at 2:01 PM, Thomas K=C3=B6ller wrote:
>> The nft manpage states that if the end of a chain invoked via 'goto' =
is=20
>> reached without a verdict, 'evaluation will continue at the last chai=
n=20
>> instead of the one containing the goto statement'. I cannot make sens=
e=20
>> of this; what is the 'last chain'?
>
> To say "last chain" is highly ambiguous. I suggest that it be rewritte=
n=20
> as "evaluation will continue as if the invoking rule had instead=20
> specified 'return' as its verdict." Such would be simple, coherent and=20
> correct.

I just re-read the relevant section of the manual, which is as follows.

       goto chain   Similar to jump, but the current position is not pus=
hed to
                    the call stack, meaning that after the new chain eva=
luation
                    will continue at the last chain instead of the one
                    containing the goto statement.

I think that the language is reasonably clear as it stands, though it is=
 lacking in punctuation. However, I can see how some readers would be th=
rown by the use of the world "last", particularly those that do not unde=
rstand the concept of a call stack.

Perhaps the following would be clearer, without unduly diminishing the t=
echnical nature of the language.

       goto chain   Similar to jump, only the current position is not pu=
shed to
                    the call stack. Consequently, once the evaluation of=
 the new
                    new chain has concluded, evaluation shall continue a=
s if the
                    the invoking rule had instead specified 'return' as =
its
                    verdict.

--=20
Kerin Millar
