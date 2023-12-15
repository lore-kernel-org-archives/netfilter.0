Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8522C689
	for <netfilter@vger.kernel.org>; Fri, 15 Dec 2023 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="G6b19mB5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="3K6UMk4w"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 3B0275C01AD
	for <netfilter@vger.kernel.org>; Fri, 15 Dec 2023 07:13:19 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 15 Dec 2023 07:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1702642399; x=1702728799; bh=7X+DByEzDq
	2QQ993dL4Kbfof32rMa/qSSH7ay+UXnCY=; b=G6b19mB5Iv0S5uc1vFcA3rN4Kv
	0YZqL+nGjWGGb/j0jy/0H4dQwaERtkXz5rWsQmBxjszN7i86obnavTUPs/odRNLc
	PL9BfcxOgdmMu4DBTkJPyciIEL+5w2rX+a4fohncAtiK52+0ywGAin5sFVWvS3UT
	IN9zK4MnvTIKc04tDV0gtAjSbWNtfTPE9KXcDkgQgRGoYI3Idil4scDaBCeCKtas
	7tL/kJKpnL3XLsT8CVUoiKktv4V+22l8+XjdiSNcPulpdHoC8b6ss2SWVoLviqqv
	nL5wecnSU+cG0pW1vHDeUF78vpZLGfqKhWE0sBxJz/2EF4P8iEzrPHA7z4eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1702642399; x=1702728799; bh=7X+DByEzDq2QQ993dL4Kbfof32rM
	a/qSSH7ay+UXnCY=; b=3K6UMk4wbT4kfTXd8qodoIZflDMWzqZTedA/alEOqHgx
	bsaBv061q6vCrduBa9S1YBkzTJshmJaHJ/sSJrtIqJpsN5v0B4037Pe606od4IrN
	gyhDm9KjY2g4aR3o7j07B3i9Hk6x8iksCd90IOUFwnb8NfoLVPM8GwZG91QaUcvb
	mUTb6hcY/7qQMFi5bMsR6Vn/9Yn7Byqj9jSaUdsKwaIfAC4NP8wgVh92D7Xi2KKC
	D3kIJ4Pu0jjDIYRCdbplrjCqjlXv8fG8HEjd4W5KyN7QZcwiP9TH3ySIOniRwlJv
	T4QjoGpoHiRRGPxKV4anRc9Vg3NJbAUtQ47gD2ShIQ==
X-ME-Sender: <xms:30J8ZZGfMuvSI7ALST6RIInryV3ad-tusYPifI1ccZLtcGpXLL89Gg>
    <xme:30J8ZeVSjL-3SiZU93mEz2F1M3A1oDN1EEfSisbtNXnZk6EGVtT-XYWn8Lg9Xvkiy
    g3u8doFrGHw3BWQOTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddtvddgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhs
    thhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtth
    gvrhhnpeeiudevudeuuedvhfduveetveeltddvveejhfethfekffevgfehieffjefgvdeu
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlih
    hsthhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhs
X-ME-Proxy: <xmx:30J8ZbJhtZkqrGuA_YQpk9x6-M8wlQtXpuPTt2ac4SU5bqIJJrArdA>
    <xmx:30J8ZfHw-xiKF-imoRPxZop5KHzHVPsRGhBJAd-Sfcle-k-BEm-3aQ>
    <xmx:30J8ZfXgLVYtc2QGs43i2E5VcJhm7fcXYfuqTVoYAjrlJ2j263SYgw>
    <xmx:30J8ZXgL5234tUhhPe6j2fcjxwdwjWyB0ATa1gnkpcx6joS-2eIZew>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E04551700097; Fri, 15 Dec 2023 07:13:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d75fe7fb-f5ba-421b-940a-09383d8bbf86@app.fastmail.com>
In-Reply-To: 
 <CAA=+QigdCVDHgmDq8G+4U+SjYOGPQ8TrBXAcD8UXYxgJ4Dqtiw@mail.gmail.com>
References: 
 <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
 <CAA=+QigdCVDHgmDq8G+4U+SjYOGPQ8TrBXAcD8UXYxgJ4Dqtiw@mail.gmail.com>
Date: Fri, 15 Dec 2023 07:12:58 -0500
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: netfilter@vger.kernel.org
Subject: Re: Unit dependency of network-pre.target in nftables.service
Content-Type: text/plain

Just a followup, since I was working on applying netdev-family rules after interface creation on some of my own systems. Assuming you are using a system with systemd and udev, you can do something like this:

/etc/udev/rules.d/99-nftables-netdev.rules
----
SUBSYSTEM=="net", KERNEL=="enp1s0f0", ACTION=="add", ENV{SYSTEMD_WANTS}+="nftables-netdev@enp1s0f0.service"
----

/etc/systemd/system/nftables-netdev@.service
----
[Unit]
Description=nftables-netdev for an interface

[Service]
Type=oneshot
RemainAfterExit=yes
StandardInput=null
ProtectSystem=full
ProtectHome=true
ExecStart=/usr/sbin/nft --includepath /etc/nftables.d --file /etc/nftables.d/netdev-%I.nft
ExecReload=/usr/sbin/nft --includepath /etc/nftables.d --file /etc/nftables.d/netdev-%I.nft --check
ExecReload=/usr/sbin/nft --includepath /etc/nftables.d --file /etc/nftables.d/netdev-%I.nft
----

With these in place, you can create a file named /etc/nftables.d/netdev-enp1s0f0.nft containing the 'nft' commands you wish to run when that interface appears. This will work for physical interfaces (in which case the udev rule will be triggered during the transition from early-userspace to regular userspace when the device addition events are replayed) and for virtual interfaces (in which case the udev rule will be triggered immediately after the interface is created).
