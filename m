Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45221A4C5
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432695; cv=none; b=WEVrXEPsG0AK850QHKcWLE2dnkB5y4EIAfJun4sUXOQ474lJs/U8ihlIaF+QlKNrh6hY9j9DFFzllO6DQB98xiUZ/bjfPT0Txkh4V3scbNGlnDhLCRkPJgUONtvMvqShIvj2P/Ml6AZQnOf0xvkUSL4fD4Isb536icXRsjg3HoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432695; c=relaxed/simple;
	bh=HOKmuqSA0DPnHwgLmMPSDmWVSkYlIB+sWkAf1Yet9X4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HdwELwn8+vxXlZBfCFvfWUFwYEs8RsPoownAhSJj0Ymmg55Vm/rtLjO5wG4NjS2yEp9wpGwET9PqMkO7BqC1n4ro/6fHL7GWTSU5hJSjUA0qAP05TStEOkPMr5RnX0fi6AjHqUqW+aiPAmKXAkQsq12PfZC/0hHtyzA42GjZRio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Bg6L261x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hAH5sVdZ; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Bg6L261x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hAH5sVdZ"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 67FBB114014E;
	Tue, 12 Nov 2024 12:31:32 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 12 Nov 2024 12:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1731432692;
	 x=1731519092; bh=geLgSctRhrfZDA9/od8yOhQhpQ2X5EW8sjy7l82Kd+w=; b=
	Bg6L261xT6Z4O/UucjIQZqM12BN2XU2Mk1Mli7O4WzNU0HumwnNHwkIMFV6+6GlQ
	KE0vvfz5vtaw0zTEBfs4bNmJUYK8pi35B5vz/9DoY3EpVJr21YKL7DPlmb2eq8/z
	+WbVJMpzliDGPKvH5wz0sXKUenOHWKSe3hp9P6KdJ8hbM0pwWPfpg9ggFo4gAFjN
	0QY/AzRpjYs0oDObWkewGrA77tBiVLJWiGGu68EcaiP3voTk4FQOjAVs7V9F01Fg
	Jpcr7/aLgPlCwtSANLrBpgPNVvAFMN4AnCZwJyt7JrXk5KGQ+eOnjhbNWEgRat9q
	Cp2p5PgTU1s1sDnK5VBiew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731432692; x=1731519092; bh=g
	eLgSctRhrfZDA9/od8yOhQhpQ2X5EW8sjy7l82Kd+w=; b=hAH5sVdZCVHqJ1fXc
	V3lNX9gIf1SCQeD/M9g3FpTJXrzQZ/pfaetKGq+6DcxNGl8/931OpSBudhjotbia
	FyRKMhMtPGUEU4JaGvBUQCSjklGKByu90fkhzA7Xt7put6eca5GsWS67KqQ5OdI1
	D2dTHmcjwGYKydtw5T7BON1yixFSATkd+hNnI0mTWHbU7FDZbE6ko3MiH+uge8/w
	BImRp/fuOZmSqNGnt3yH9K9yPqTH1KqBnGCNV7RlIl198A/LyjkwW/GxsZtqW7pv
	AQl5vvxBUd0LER1fGQSvXlKj5VPu+ZsrCnDeRfGiTvEdfKHRgcFq//X186lGWMu1
	FgPgQ==
X-ME-Sender: <xms:85AzZ5LoQKQ-8EquSKwGk1oIFrCL5veBFP6t63iHUjquCFjqICwOJA>
    <xme:85AzZ1JOJItVFdpV0EuuRRLg9GSyzMtOL6jz_f3Cql_Qwae5EzSbHzi2a7z91O1FE
    kNDaaoqf5E9ubkP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecu
    hfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrd
    hnvghtqeenucggtffrrghtthgvrhhnpeeiteefieehhedujeejgeegvdehfefghfffueev
    keettdfhudettdfhieetledtveenucffohhmrghinhepnhgvthhfihhlthgvrhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhm
    sehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehthhhomhgrsheskhhovghllhgvrhdrugihnhgunhhsrdho
    rhhgpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:85AzZxtdyyNPfsHKp7s53pFMW7NM6Wb3azb84w0uvPE6Kv68Bl-zvg>
    <xmx:85AzZ6ZSBHdMAp4a68FfmLRhj8pJ9Avp03O8Qw7-YWHLfHhaff01LQ>
    <xmx:85AzZwYZZPBL3oyu5b-Esp_h_bHfEdp776jJQZvonPaFjs76mdo0Pg>
    <xmx:85AzZ-CniA_1VJUe2rfZUQVwygrIjLTZBe_ukrt0EhDFoWtMloD4Vw>
    <xmx:9JAzZ7zMOC4Q83MaNXFELw6RoaTlwhBxkZtb5ccojW-jFpSk3GlzVSbk>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7CA5E3C0066; Tue, 12 Nov 2024 12:31:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 Nov 2024 17:31:11 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Thomas Koeller" <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Message-Id: <3e7fbdce-5d16-4abd-a315-3303da3874bc@app.fastmail.com>
In-Reply-To: 
 <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
References: 
 <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
Subject: Re: ipset vs. nftables set
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 12 Nov 2024, at 2:55 PM, Thomas Koeller wrote:
> Hi,
>
> migrating my existing firewall setup from iptables + ipset to nftables, 
> I ran into a problem.
>
> The firewall uses an ipset containing ipv4 source addresses to 
> implement a dynamic blacklist. There are multiple rules that use this
> ipset, and these rules are in chains that belong to different tables. 
> This doesn't seem to be possible with nftables sets, that
> apparently always have to belong to one and only one table, is this 
> correct? At least I couldn't figure out how to create a set that
> is accessible throughout the entire ruleset.

Yes. Rules may only reference a named set from the enclosing table.

https://bugzilla.netfilter.org/show_bug.cgi?id=1472

-- 
Kerin Millar
