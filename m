Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9626AED
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721580424; cv=none; b=e/TI2EEymi9wE8jazO8tN/wG2jPpMYpmb9opk7Qfgqfg9AhNp4071JjikPleNqtmha4/dW8Ca6sCkKIWFL4PclS1SrgfLSDyF+IaxYv5cyq5kA/4PRgBEab360z+x5atW1PsgUS3r13GLQJ+e42yVQJTlf0zzS6pRbLWNyMhyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721580424; c=relaxed/simple;
	bh=/45fIRpp8ARR+la7TSfAcRwDcrZULBVs31KBNqIBQ98=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Mtbra0KLXX7PVVbEyYZNSiCU+m11HhCjAkctMbNgkJy/q8NuxJFAAhgebG4OJQxQih4fkH2yKKA1V9EAj0SvdlTRxDSDyBIdIPZrodtBqmLid9TATHp5JxA25TeUhQZVm5bYWPC69oJ4WvJufOurmISR9DjUy92MD/dGNlGcrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=YjOm9Lja; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b2iFGbYE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="YjOm9Lja";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b2iFGbYE"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id AFCF711400AC;
	Sun, 21 Jul 2024 12:47:01 -0400 (EDT)
Received: from wimap25 ([10.202.2.85])
  by compute5.internal (MEProxy); Sun, 21 Jul 2024 12:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1721580421; x=
	1721666821; bh=+JcC99b/ZgLnN7c610G9UtteA/BZAMSUyVxnyY5oiXs=; b=Y
	jOm9Ljaew6NzsdU+ThtDjiVFbavwtARMMjYfoAd8C1lfcjEU05G1tCxZXsNGTP9t
	95q7+2D6NX2KLLNuxqVUeWh9MfboZm0f5LJv5fi8IChKAes7rNyBi0a9g8cYgrcM
	Q9qglXpMgkFg8//sCCSyLwqDlvJFyElr6Qv0CJ6M8+LRIIst6E0TaDajiPOW7H5Z
	LqjzRXqRAcuhzFtqA2fOyf+NrKmOLtoGEyvXtR00J4b+uN/e78q62a19/G3ZtQQP
	oHOpC0AqLDL2tera7jqsHVpVymqp/o9IOpQ+38He5v/T2k8OBFu/nPRybmRjJEMW
	QF01v/0fE/hEuzbQiASSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721580421; x=1721666821; bh=+JcC99b/ZgLnN7c610G9UtteA/BZ
	AMSUyVxnyY5oiXs=; b=b2iFGbYEXyAHaN4kqXdQWcma6qp0C6+b3+vTpnEbQGtk
	8Hnfa1w7QNNLm5IEDAuSfllRqsBEP9p2gtrFOQPTtYshNVotwkGDoDJ1CiXdRMfx
	V+NZ9IAHTREkU6TCjFILEOcQ8wqcuM6ZBcFXz7pLfAt4TFyBUMSb2/0NgspCEQjd
	V8IZHcCguNPUNIuZmQMIJLrqbZd/3Ed2rVAfz96oEqC0ZSroBJloYxOsLflzYQel
	m2MChEKlVfBz0SXQj9HxrfVORSDjxj45qXfuvCkPJWTYpRXpNXvxuu6TcG1O1i/f
	AcXqI4w8+YHNw9z+YGHije/AAOmIFapuuhidbjzoeg==
X-ME-Sender: <xms:hTudZtC6rFJ4H7cCeqXwROfLL1iumzxVZVnKjiBFAAQCaYCA4k7nTA>
    <xme:hTudZriGGENVc5pj_Tuz-ukei4bdXWqhM8_dLEG5iLLTZy9SbzcvA8Zyl0GWG1caY
    VjwHEZDlbmJq9QJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheehgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpeelleeuvdetgedtteduvdetheegjeeigfekudekfeeugeelffevkeek
    udfftefhveenucffohhmrghinhepnhgvthhfihhlthgvrhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgr
    vhgrrdhnvght
X-ME-Proxy: <xmx:hTudZokEe1PH0Qbvkg4y3RpNg7LcQtCG9oG6rnlRD8z8-5L5OdKVRA>
    <xmx:hTudZnxwo1LQ024MDI9Oe38KeesAGE4FT072lr7RtmkYEIEWFaUC1g>
    <xmx:hTudZiQROn0vozHnaGAJqC99h-JiGQH-XcP-Y3a1VrROZY2R5L7AgA>
    <xmx:hTudZqZANgMsWFdLkF4nj0qhkUu_DUHDSEtIo8JYAgppydqhxIjlgg>
    <xmx:hTudZteeIMi4qa53f5SZL3biyDwVJtQ0zSXqOm6p6I9ujnNjpts0xlen>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31D4A1040061; Sun, 21 Jul 2024 12:47:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <25712e6c-a8ec-4b90-a3f5-9598f2732a73@app.fastmail.com>
In-Reply-To: 
 <IaAIguFhd9166N8ahepxBr7RDvjeW_BR2R0yuNXw0bCEGePrIv2hmcAPU6J2PM6JciU1Rd3YaqzqRA75zSf8OliDMf-gqNetZkmd-3SNHf4=@proton.me>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
 <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
 <IaAIguFhd9166N8ahepxBr7RDvjeW_BR2R0yuNXw0bCEGePrIv2hmcAPU6J2PM6JciU1Rd3YaqzqRA75zSf8OliDMf-gqNetZkmd-3SNHf4=@proton.me>
Date: Sun, 21 Jul 2024 17:46:41 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Content-Type: text/plain

On Sun, 21 Jul 2024, at 5:09 PM, Eric wrote:
> On Sunday, July 21st, 2024 at 02:58, Kerin Millar <kfm@plushkava.net> wrote:
>> As far as I am aware, it is impossible to add elements in a way that merely reset their expiry times in the case that they exist
>
> 'reset element' was added in 1.0.8, but requires kernel 6.5 or later:
>
> nft add   element inet xyz set_ipv4 '{ 1.0.0.1 expires 1h }'
> sleep 10
> nft reset element inet xyz set_ipv4 '{ 1.0.0.1 }'
> nft get   element inet xyz set_ipv4 '{ 1.0.0.1 }'
>
> See https://bugzilla.netfilter.org/show_bug.cgi?id=1689

Thank you. Putting aside my disappointment that the terminology shall now forever be disjoint with that employed by packet path updates, it appears to be a broken feature.

# nft -v; uname -r; nft list ruleset
nftables v1.0.9 (Old Doc Yak #3)
6.6.36-1-lts
table ip filter {
        set x {
                type ipv4_addr
                size 65536
                flags dynamic,timeout
                timeout 1h
                elements = { 1.2.3.4 expires 57m38s723ms }
        }
}
# nft 'reset element ip filter x { 1.2.3.4 }'
table ip filter {
        set x {
                type ipv4_addr
                size 65536
                flags dynamic,timeout
                timeout 1h
                elements = { 1.2.3.4 expires 56m37s83ms }
        }
}
# nft list ruleset
table ip filter {
        set x {
                type ipv4_addr
                size 65536
                flags dynamic,timeout
                timeout 1h
                elements = { 1.2.3.4 expires 56m5s366ms }
        }
}

Further, defining the initial timeout on a per-element basis has no impact on the proceedings here, nor does defining a new timeout and/or expires value in the course of issuing the reset command.

An additional problem with it is that it raises an error in the case that the specified element does not already exist, just as delete does. So, even if it were working as intended, it would continue to fall short of achieving feature parity with ipset(8).

--
Kerin Millar
