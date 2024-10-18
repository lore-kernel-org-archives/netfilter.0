Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C518C332
	for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287614; cv=none; b=h3sh0jUxxsu63I9cymOShd8aHbySF4aaJUxTRzBfNpsBirOclPi6CjhYsl9B6UHWP319TwlLShONO6QpmDRMBVk7TjKl7kKEodZEpBe7WNmWedtyUMhsHqyMfVObud+XCXfqDwZPUD3ml46iAzFsHoApUfA/OWkj2wu6r9tH0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287614; c=relaxed/simple;
	bh=WdaQ+d6qJ+R1kE4iY6lvpalmPHHw1JV+92JZMfmF4/E=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XI324VQDaZAw1i/uNgrJx1GifzxTywH6mgYjo6aZ+TAUUsw+ml4/FMUCNVWW1uRSi5mHqCTRuU7z2xaVwrSWVoctEshzPUmLL8Mg7T0MwOatLGfOlb04eUsTEQlvRku+cXOnStNqEKMRfs80nL7XmEPgdhYPpb772GVPoXkgdNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=hVkOl1Ko; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oex3jJmp; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="hVkOl1Ko";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oex3jJmp"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1976411401CC;
	Fri, 18 Oct 2024 17:40:10 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Fri, 18 Oct 2024 17:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1729287610;
	 x=1729374010; bh=OlMkbFOaVfTpb/kFAXxaEPBNd+iNikgYdNSNvsSIVok=; b=
	hVkOl1KowDHqIE4nPG2a2zafPsbyY/Z4hnfxhLyKRzvNRrq+FNpKoO9iNITkBx68
	OmFe78p1hpW+6YpV6VqXnQspYtXYFnPbWYN4FNouMDN2XMGQpaC4iH+2mTu7qxDU
	qNeSCChdWRf+l7Ffak6XSXYSuwANYeVUD5xnd2MdtBs2qdM5qc27gpZhKKdghxAB
	O6V7z5vevi0bHpwUHHe4r+gfggBSbxEbDGbBjgwtH+PxfEQhctfgRFZC5orWAnum
	q3+Q5AewzK+p9IBWiSfHFifaIEon3xEHCPpKAvuqd7jtom26lVkHqXf2Zhztxhgz
	1Kko7vBG+C+11gfjLs97+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729287610; x=
	1729374010; bh=OlMkbFOaVfTpb/kFAXxaEPBNd+iNikgYdNSNvsSIVok=; b=o
	ex3jJmpxjo9Nqf0UtCyzU1pwDHLwTcczsUKDHnp25XButZrGJxLyyTyhc6aAiGWS
	7ZA/ka6BBaVln09+cdzZsrrUYnf7qmLnlBoo49b3BVa0rr2MOhsKUq0PfiMdBfCw
	wN8GK1pqNeIgFa7f8dMe5Mr5XPiJloZsKnqBnT1wig8V+xH1i66HCyGjKohh76+f
	zm2wlc7FcNRw3m6wChB4eax/98p0+51m8J24BCtLirKaoE2WYkBoV39K/YzcKvHm
	9sU3JnqV/bk4BMkhI4/4mUiuiteH8IJAVxhqG3A42QJlQQFFs9dD3N6Lid8/hLkZ
	zsqQ39YjBo3KD4CboP5Ng==
X-ME-Sender: <xms:udUSZy3ZVsyhld0yIC9TXh9USZvU4A_dhs1a2S1WQAcSgbaW0awobg>
    <xme:udUSZ1ECi4urrbPrLSkNVNrsbAaZi5pyutvRUfntZ7Ya5OiEEemwz2pTC5DNjT8kr
    dAIwYied4BPitSo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehgecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhr
    ohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvg
    htqeenucggtffrrghtthgvrhhnpeeikeekgfdugfdtueegtdfhhedtheffveffuedvjefg
    teelieelteeltdevfeevvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthho
    pedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguihhorhgunhgrthgvlhgsrg
    htvdesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:udUSZ64aUabQzXM9Fsha4ugSL4SuGrXr9h7nX7WeN5g7-7zqqTjHBQ>
    <xmx:udUSZz0czG_5q1jTPe9e1zeGDghwkv1IUXbOxoV7k3KVW_ZGV6sYyg>
    <xmx:udUSZ1GYxiWY6MeC2XDR6kd7cIm7jvM_stxRTkzY4q1WYFocBAi1Vw>
    <xmx:udUSZ888-qv-rnv77x7ueJ_kiqPkHILvcPQOQlf__WL40mEiXHPaNQ>
    <xmx:utUSZzOSAUIVEg7ik0VpC5_qkbbFvW9-O3BV-QITB7kOlXrtScp4ZB5c>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2F7A3C0066; Fri, 18 Oct 2024 17:40:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Oct 2024 22:39:20 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Telbat Diordna" <diordnatelbat2@gmail.com>, netfilter@vger.kernel.org
Message-Id: <4916d96d-7fd3-4576-b574-b033be66c196@app.fastmail.com>
In-Reply-To: 
 <CA+OqyoGkVcvgVYPBMc6v-JeRwncoJz1OyECma2-megULkvQ0xw@mail.gmail.com>
References: 
 <CA+OqyoGkVcvgVYPBMc6v-JeRwncoJz1OyECma2-megULkvQ0xw@mail.gmail.com>
Subject: Re: filesystem access to add/remove/view ip addresses
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 18 Oct 2024, at 8:30 PM, Telbat Diordna wrote:
> In iptables there exists the recent module (-m recent). This gives you
> the possibility to add and remove ip addresses in rulesets (usually
> blocklists).  The advantage of this method is, that you can allow
> access via FACLs to ordinary users for selected configuration items.
> E.g.:
> echo +/- <ip> > /proc/net/xt_recent/<iptname>
>
> Looks like, that in nftables there is no recent module. How can I use
> nftables in a similar way?
>
> Thanks for any information/link etc.

That's an interesting use case (that of defining FACLs).

To manipulate an nftables ruleset requires the CAP_NET_ADMIN capability. The only thing that I can think of is to write a program that would compose and dispatch the necessary set-manipulating commands through nft(8) or netlink(7), while exposing a simple command-line interface to its users. The binary could be granted the CAP_NET_ADMIN capability with the setcap(8) utility and either:

a) be limited to the relevant users and/or groups with chmod and chown
b) perform its own user and/or group membership checks upon execution

Unfortunately, this technique cannot be applied for executable scripts (BINFMT_SCRIPT), so the binary would need to be an ELF.

-- 
Kerin Millar
