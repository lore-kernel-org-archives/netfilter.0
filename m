Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E1518C015
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731599526; cv=none; b=QQkCBhpTVDplf9kvmZeHO0gYMLfCOCq4BXU/gkBvhvo95//0ISU3PmwuzZuVzQGZR0E0S4VfNTlCxRYJ9sKCz+rKojBritx/6UyDiRhRM34/ohBPQSwUcG5UVxSMDeZ6hSTSn2GoGlAgr6EJrLPRX9E9VDySB2awHvZy06MaxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731599526; c=relaxed/simple;
	bh=fy2nNPQlrcEMTPKShTiTwj/Kw9aM7ZrzuUAqUrQOajo=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=p0qCY4AkT2eCSDPTOkpM71HU6f7rxdb1mn8aWtF/5L8gL9E7JWAiOY+GnnYCn+6C9FK6hQbAbTxyQeE8VacPwSsz/4bsptR3huE5uXNFycpxQ0y0tLDiqzMVoiUGC7q50aGQBKk29Kw0av9wqKw9avQN6Uhy1e170NyDfT2Svro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=hW9GXpJj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E6sKLB8s; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="hW9GXpJj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E6sKLB8s"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17D3B11400DA;
	Thu, 14 Nov 2024 10:52:03 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Thu, 14 Nov 2024 10:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1731599523;
	 x=1731685923; bh=fy2nNPQlrcEMTPKShTiTwj/Kw9aM7ZrzuUAqUrQOajo=; b=
	hW9GXpJji1drhx3cRrq5ZTqECIGtYl0DhW05CiZ5QVCw4iZD/LJYAkyvXdw/rmNL
	/hFy56hAX3022pHAXrjZifq6dQNHvuL7ekFUAIZDOcT/GdBSzDYkz4+7s/O7gwvH
	JkHM9INnPqF1frO5H8Wa7c3N9YOjSKZ4OMaRqLReLEPXY3fq9gahMSinVlt44OaV
	ujw39ZCgSZvOd1nGUKzK8F1iTnoiogoPN2mJX4C/LrrfbqMTUhrBPZEt3OvwOBGE
	yMCe3CGNiwMdCXyNXFEPSEWNM9AVJByBSI94yoUX25lJF0alZge1xwuCjW2H4SOi
	w+VIS3mXjNwNKLE5IBfCtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731599523; x=1731685923; bh=f
	y2nNPQlrcEMTPKShTiTwj/Kw9aM7ZrzuUAqUrQOajo=; b=E6sKLB8sZIPK8zDUG
	Ki6ZwLD4xA/r141L4jyEnqxpN3vUCNs0czDSXJykHo/3TYGErbrPPLIJ6BBtniXb
	VYgftq8jeWDLUuvg9EXE/AnhJpAQVMcgAKNagU5CXeAg5AlSrUfAxMAe9vyFTSnF
	j5WSVbG0yc0xFCRE/gq4px0opFokHGrZhoczP9wZvy25qo/0QzXP8pBGecTFuiCn
	6Vh1oXTr9ECMsAM/dYyPryeutFJMn7NG+ze6W1yG/RPE2iM1E3kejBuyLkA1fLwK
	nbUoFtXMZlViqofWcIq5vSWp/DNr5b+9zLjFbN21QPpW1zNtBJ35Ra4FV+4WnoMg
	umHLA==
X-ME-Sender: <xms:ohw2Z2BtHoM2O8BElm4khUcjlIZhj3tT_ezewIQCnsEwzIdbdGwoYw>
    <xme:ohw2ZwjuroanY3qvglxK0Hy0equypfXutwyhxSHINO9-ZX6cLaXDIiOh8rrLU3rNL
    OMQudRTxPhoNW2i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdekudcutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:ohw2Z5nhFtmd1doZppLCw-JvAxNT2SvOp7-njEvTTrIwJ0w1RpwHpg>
    <xmx:ohw2Z0zwXOkE44SVCa9MU520znrPJnzCYalm1fS4yw798hpHuGjmIQ>
    <xmx:ohw2Z7RcyobKAb1urpn-nnf7UGyhRwdXFmh3L5H1vTJ4rOxf7YD1Qw>
    <xmx:ohw2Z_bMSULBU0h7vy5oX0UrkgYlKs2fnBP36uqW3glCIFLyW3wmHA>
    <xmx:oxw2ZyI5jdgIOro7AZ8W1E3YQ09Hu8FV4z6BCA3QCBTdvVfBF9WWIkKu>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 589E33C0066; Thu, 14 Nov 2024 10:52:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 14 Nov 2024 15:51:24 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Thomas Koeller" <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Message-Id: <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com>
In-Reply-To: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
Subject: Re: Dropping of the end of a chain
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Nov 2024, at 2:01 PM, Thomas K=C3=B6ller wrote:
> The nft manpage states that if the end of a chain invoked via 'goto' i=
s=20
> reached without a verdict, 'evaluation will continue at the last chain=20
> instead of the one containing the goto statement'. I cannot make sense=20
> of this; what is the 'last chain'?

To say "last chain" is highly ambiguous. I suggest that it be rewritten =
as "evaluation will continue as if the invoking rule had instead specifi=
ed 'return' as its verdict." Such would be simple, coherent and correct.

--=20
Kerin Millar
