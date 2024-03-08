Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25E22086
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 02:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709863452; cv=none; b=EoWPvDf0Y9tE3LusxKLSjBddry8MW2oUZagaGBfmFFNvpGmsUnJnkb7tBivacEOYF92+pucRLIpI1yJrQNYpfe8XPjtRN4bbwSkW0Uv1S+MqAf7t9lclQS9nKfT7y89bErNVDlIqabtqRQtlYWrykDljZslpmMNpuUos0OJLmu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709863452; c=relaxed/simple;
	bh=JeQP+MtCd3Exk2eLdBtAPxhmhGs+v3ZKSqFEw/a4dtY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LA6QDPTmKSWxFEmKK1kij8eDfrnKgcrGwJeIFXKY5kOBR70BK4LxqiVTbl01yD2lsWK9OJiStm4jyecD3VC3Hem/+yEhoFpXVYiwxXnM3Fa0CF+lUgbu+XFFn0q9K+OF6vFxd6x/MkaSEbgcO7sEiBvzizUD7CZDwUespnqfqeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Jo/KgwgM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N4gBSPPp; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Jo/KgwgM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4gBSPPp"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2204D18000CD;
	Thu,  7 Mar 2024 21:04:09 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 07 Mar 2024 21:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1709863448; x=
	1709949848; bh=RC1Rut/diMQrghmzB4MlNGn0cvGSjeL5S+kM0Syce5Y=; b=J
	o/KgwgM9jzi2bnQPnRXYA+rgD4nswC5zxef/9GwzaGvYIyMdov3l4YBQ7WHK8Ns5
	aTX0/wiNA1E7KQYkP+TN+W3YYfpjrhCe1hWvo8+7x64K0SKVY9k2rrfrhIb/yjq7
	B684ec8yBkR3W+2JWc1v50bQ4kQQaXHuct4L+8gsqzqFm5x60YgP2dVuEEE8NGPD
	PsfpZIg+MUO8hVEjreMHdCa9Sk0nk9nyvHwm952PWukX8tkwI1JDfBtvvBnUWJ8E
	jA9ahvEaIZMp8wJuFT67S2f4gR8exaYOCiGrDJ1MROEDHdhsFcI5fMQELaqmLrHW
	30HaD+aOw8lJkhN/9APmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709863448; x=1709949848; bh=RC1Rut/diMQrghmzB4MlNGn0cvGS
	jeL5S+kM0Syce5Y=; b=N4gBSPPpIxhYPNs2Us6/BwEJ+OJqKxd4n8rARleLZDgt
	5sHMspiU4zIGU+iRAIWcyEikbvGOl0NP4X3FP3B4+E4RT+48tIcTCFC9qF3NsBOQ
	2CjYJtCGzUVjgZTErSrHZPbdm7sZIDhqrpinut8SOIL5k8RDw1IWw4R8kvkDoFTt
	6+kL8ZnGZoogAjwTWqXs822m9U1s6ZFJCVI3jyeuDtMRsTogMwiQFt3tPLFlhUut
	vgZLBU/AQoX6MASuavkhy/VshvyZOPWAEKCkYZS5F15u0DwaoUfR0hdblbLdPuuQ
	xUzxlud7tYgqh2WmkeWpTd2kO2RBhARlFDAoj/iq5Q==
X-ME-Sender: <xms:GHLqZcC-Gscvqip3yaPLd_MYXyM-V0rBEP57oottTv95NLR2JktafA>
    <xme:GHLqZejTuW7JER0BjX0OwU2zo5Naub6adCfWEUHvKrYojF_nGVFGgxsWuQsMik6ZM
    Cvypi0qdg2D0YrC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieeggdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedvleejheefkeekhedukeeuhf
    ffhedukefhgfdvteegvdefheeiteduffegheeljeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:GHLqZfkBwpqnMcaW9U3SUgC0TkKnKzW4K2R3oygJ7hsueBN_KFZYCw>
    <xmx:GHLqZSz5zzZbvglX0qkkpq2qrwzbW2tgXI-Nt415ZvymeKh09n5Tvw>
    <xmx:GHLqZRRkPkmEiT7FgUekUYdHLdCS5AJZYPaH4-GBVL6hV8u_RtAEYg>
    <xmx:GHLqZQJ-RK8_PWG5wj0tvcCplULE2rKkO8hudXnvCxXVzyZ2GXBlIbfWvi0>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 64AA51700093; Thu,  7 Mar 2024 21:04:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com>
In-Reply-To: 
 <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
References: 
 <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
 <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
 <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
Date: Fri, 08 Mar 2024 02:03:47 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Sreedhar M" <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rate limiting per multiple seconds
Content-Type: text/plain

On Thu, 7 Mar 2024, at 5:10 PM, Sreedhar M wrote:
> Thanks Kerin for the Info.
>
> The workaround is not fulfilling . The use case for me is multiple
> seconds combination.
> I Wanted to keep new connections, at given every 10 seconds period I
> don't won't to allow more than 15 connections
>
> Let me explain , as I Wanted to accept new connections, at given every
> 10 seconds period I don't won't to allow more than 15 connections .
>
> With the below rule, ex: say on a src client  If I run 15 connections
> in one second because of 15 packets burst the rule will accept, from
> 2nd second onwards it accepts 1 each second until it reaches 10

You have to set the interval long enough for the bucket refill rate to be immaterial (1/day is the longest possible interval). The example had it as 1/hour; I do not know why you reduced it to 1/second.

--
Kerin Millar
