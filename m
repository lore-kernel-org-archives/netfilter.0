Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD054FA4
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709894083; cv=none; b=IpCNjqmWN9OpohyfOsSj9qXw3KwM2sB8BmQvyiSsz9VpYaxbX8I46EzNU7NcwwkZmkYH9fBZDoVpohP0sD0ApRn4Ey+Ds6SvltkxQHxc3FrAinDYYsv+ZLdTz91YU0uVHANqPLegjptROLHeXNvsKkoyeK0586bTE/XZjzsr0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709894083; c=relaxed/simple;
	bh=ju0ov5NkzMelzLyt/cKHYdoAujNUURUQCnyflsjyBfA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=E58Olf1qn3kQS++ckBRi7Jzut1LQK9l0af5D8hAw7mNVTLmcdOj/6iBjZiVNhEB4zIDg4k4SU+EtRucf/aa7/g4Cn+piSTqJUry0MlROi92bZnJUp2gqKQkhGuqeedCD9Xe1vvswlukJh9htgwsRufk9QqmEh5uUESKYZHXhBTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=oFQrpmb3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WYzsP2nP; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="oFQrpmb3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WYzsP2nP"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id D979618000D3;
	Fri,  8 Mar 2024 05:34:40 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 08 Mar 2024 05:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1709894080; x=
	1709980480; bh=K2MYPxA90OzyNsEDX/HCHFKBV0eyuYqBWAYJqSRpNtU=; b=o
	FQrpmb3PDoe9r0RSeGREOo+jbzfyN+sLDsBJKmhO6MUTCC33lEKd3fOWe1U9dHRA
	NFo9PcNNVLfR/DnakeCpChTwvCJyQQYH1D58LyHzvaNQvnZBZh7A0sEx6ICwxAMh
	8nuff5LB3apWWpZGEKmwQKN/kSaTFkwua/1KBD+B8wawoRUfcWiZf6T7hrKubfVv
	95K9FD3dFBBQS9tC85Ss5RMdS9s32J97BFlwVaJ36roJMoDmEoRkLsr1YdRnPRkC
	xKObdwU9ExmxFWrIwStv+M7V0uuFU05rSH1UJs4J40V7HNSpllOd7dzv0ao/AVsB
	UAQth1XXCYjb9FRTJxRhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709894080; x=1709980480; bh=K2MYPxA90OzyNsEDX/HCHFKBV0ey
	uYqBWAYJqSRpNtU=; b=WYzsP2nPVWatKJaQ47W7OVM0Kc0G7AtsnrKTkIvjRQWV
	92gKJj+lSxkjKg7P74B+13iC7jkcyFpuyDt07d9Wk66i4fEc+fWAWXk9xuDx4lWv
	TzV+LGm0XfUomM917KrUcyMRRBhRTjxN9KoL+BYoSghLoviM73aCD5VoHC9pSq85
	969sSxQ2whkHGiMDTato1XE/4w073+JxrMTLMlne+S3i3s8mGme0XH9DjA6aADpg
	8PKGBsqT/CYMVfdzdGjjP6+BcIrwlUwhAdkNRBHGxX2Kc620t0gvkbLmB8HIku1K
	cawIRsPtKOoTu97aYuwuBdo1KMFelmLZWdaUihcMkQ==
X-ME-Sender: <xms:wOnqZXmxqiAaa7SqGEi3PafNq9pyQEPtDDR6ADebrbcETu_9ZX4ZrQ>
    <xme:wOnqZa1iohUdr3d17EI6eYRVXfPVqOzBEMoDWmVi4EgKDEBgqnjqvSePap2kr7sPn
    irVXRNuIYJFgPwx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieehgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedvleejheefkeekhedukeeuhf
    ffhedukefhgfdvteegvdefheeiteduffegheeljeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:wOnqZdrJpw8QQRZ-BGoM5PNYtvki2xK3y7Ml7xJtqomgymTFHZ_qjQ>
    <xmx:wOnqZfk5ps-ObMe22QhmtjNAB_DTd58dSjawiYIQnmU1Nad_hX2j1A>
    <xmx:wOnqZV0prF01ApkfaZ9v1Nh7ec3htRfMmerfn_0As_L-d2pGc_f-8w>
    <xmx:wOnqZW8rwyXxWsjRxLo-sHL1dDwGrvGBpwjSkPS0TllO5-JBPXFHAkjQGIQ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 29B521700093; Fri,  8 Mar 2024 05:34:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <55db52fb-ad08-402d-ab2f-9106ddd538fe@app.fastmail.com>
In-Reply-To: 
 <CANvpR2CLZcSOUXhRxn9g_9kH79HA7T2=AXF5s0LY8tEqxQ-pLg@mail.gmail.com>
References: 
 <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
 <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
 <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
 <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com>
 <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
 <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com>
 <CANvpR2BxFSxecbA5LsRis6WsC+4Cxru6M4vX0fxKYwZt-Xb0zw@mail.gmail.com>
 <cd20799d-91fa-4f5d-ad04-04eba4c9f28b@app.fastmail.com>
 <CANvpR2CLZcSOUXhRxn9g_9kH79HA7T2=AXF5s0LY8tEqxQ-pLg@mail.gmail.com>
Date: Fri, 08 Mar 2024 10:34:19 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Sreedhar M" <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables rate limiting per multiple seconds
Content-Type: text/plain

On Fri, 8 Mar 2024, at 10:19 AM, Sreedhar M wrote:
> Great Kerin. Thank you so much for the support.
>
> With the below rules specially using 'add' and all my uses cases are working.
> nft add set ip filter myrate  { type ipv4_addr . inet_service; flags
> timeout ; flags dynamic; timeout 10s; }
> nft add rule ip filter INPUT tcp dport 7880 ct state new add @myrate {
> ip saddr . th dport  limit rate over 1/day burst 15 packets } counter
> drop

One more thing occurs to me. Now that you are using "add" and, given that "1/day" might otherwise appear confusing in the course of reviewing a ruleset, you could probably get away with changing the element template to:

{ ip saddr . th dport limit rate over 6/minute burst 15 packets }

Consider it optional; the behaviour should not change at all. Still, it does, perhaps, better hint at the underlying policy i.e. something should happen after 10 (60/6) seconds. Normally, that would be the bucket being credited with a token but it is my understanding that the timeout policy should prevail.

--
Kerin Millar
