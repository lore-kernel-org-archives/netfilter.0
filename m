Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8718D625
	for <netfilter@vger.kernel.org>; Sat, 19 Oct 2024 19:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729366560; cv=none; b=S6WA2HkEa6hGDHok83cZC1J6KznqOahyjGjhE5auiQAdTQXDGcMGMbv3wUE8uF05jPWdp/Kod1ZZ51Dsq8m4Hhi8F5rEw4diGbv+9FLd1sapP3/HRbUb3f2cTjxVC1H/AeWa/g9K0Y2T7BZyXN2B+fvM9brnRE4Bkj5Ku+EYxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729366560; c=relaxed/simple;
	bh=VMr/Q9BJeeAbyD9AQZQdaZQfSoKUI3ZsyQVEXE6R6iw=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mWtZZOLB0Wkdp3UWoQpDbWsD8x2fqJvVv+OU6rHV6Sg5vMlyNExbUEeTPbbIQWCa4FGwkuDCZGb6kNsCZmij6ALnTAoKq2nVxDZG6CBjI9CzS+25MhgLk6Wm/stXNutjkR7VaWit95WFVKpZapGp3DucspHrarZHw3bLEO1nhP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=LGOgvYf+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U+ucHOLr; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="LGOgvYf+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U+ucHOLr"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 73A2F11400E5;
	Sat, 19 Oct 2024 15:35:57 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Sat, 19 Oct 2024 15:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1729366557;
	 x=1729452957; bh=VMr/Q9BJeeAbyD9AQZQdaZQfSoKUI3ZsyQVEXE6R6iw=; b=
	LGOgvYf+RuqsQ5TnkT1WKQiXzvCQtffLxvKmn1Z/KE9QjnX04QwRnwtjEL+l8TcP
	WaJd818XLRN77talhfQOd50ee7ziOwdiNtOF4bFgeT0hdqhS7MGw8f+A8mzUtWOj
	PDcKvtF2q0+wY+U28qn3N5T/MYATCzYnKi6ZxflSjyExlRxW6n1wPlPk4663dlLl
	u8budWIeCCPNJe6ZOLJB7lSokcveMbhLrwrY8+jrCJbdvBhwZ7++DlY91lzt4Cvw
	Q9mXlco/YI5RWErCB6gzahaBmsHIwpl73whbP2bdkm0wMFAXAIDRw01zHOxM/iiq
	BCy61w8/XM/8U/xcZh/D9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729366557; x=
	1729452957; bh=VMr/Q9BJeeAbyD9AQZQdaZQfSoKUI3ZsyQVEXE6R6iw=; b=U
	+ucHOLrvoammKkJex9fR2JskxeX0bXFGzkXzGv22ashdlFGo/qIJCiMwBRFuQVzd
	rlRZvv5FL5/Tt2fxMr1cRHKUhSsHEu1X8caVZoQruMiv+CgHy3l49sDmMsZnbp2T
	6KjzCmB3S+IWCaxFIFhj+X0mdpqjkmh7dBkuIG+SKN4pzg4eBeTMw5Eg8cPYZEY1
	+tck/OtV2cDckv14qZ9L5uvJKqtu1T6IpwBb2sdfNtRQkE7EhMPIkHOpxieQ3YkE
	r7ckNUv/W3bXcdzS8Dhv43xj0s7wUkdhlppOyBgEtLeQX/BrpAVxbJfA50sCzB1K
	bztztKYMSU9wVz9uI2www==
X-ME-Sender: <xms:HQoUZ_t2g1wnKP29oQvPG5eB8CfkX1Clx5ZRvbs6SV_pNAzHXVIUIg>
    <xme:HQoUZwdHOSIMMkxLLH-9rZw7m3OP1N-ElfuEvtzg8YAeHxZ6PBGi63aS1TmCyrGnr
    _66f41vzuMCCQTn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehhedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpeeikeekgfdugfdtueegtdfhhedtheffveff
    uedvjefgteelieelteeltdevfeevvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguihhorhgunhgrth
    gvlhgsrghtvdesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtfhhilhhtvghrsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HQoUZyzgB4ymCSwCJBuIzdrarMy2IfwkJRG21A1YVWw8I0JkE8RszQ>
    <xmx:HQoUZ-NmNcjd1nTL7ZQJUsKrp7F1-eCQfRdI__THBHc1KAeRDQdwAw>
    <xmx:HQoUZ_-EtChys1msRHajcuoInhIKNopZH9FB6N6dNvXojJDut0Esvw>
    <xmx:HQoUZ-VWVMKyy3dGiLwKL305bWhfBqKlHPqXGIKooA1J19dBhG7vWA>
    <xmx:HQoUZ5lL7_C5A-lnsecviVQIeztSKx5od63GvYMoQexDoWnDnjIkzHEK>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 303973C0066; Sat, 19 Oct 2024 15:35:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 19 Oct 2024 20:35:36 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Telbat Diordna" <diordnatelbat2@gmail.com>, netfilter@vger.kernel.org
Message-Id: <e4bd55b2-c6ce-402a-bc19-d50d7c626591@app.fastmail.com>
In-Reply-To: 
 <CA+OqyoGJhT75-FBdO1mLxaLpHpWck6wPe8hTwRLCmKWq6b679g@mail.gmail.com>
References: 
 <CA+OqyoGkVcvgVYPBMc6v-JeRwncoJz1OyECma2-megULkvQ0xw@mail.gmail.com>
 <4916d96d-7fd3-4576-b574-b033be66c196@app.fastmail.com>
 <CA+OqyoGJhT75-FBdO1mLxaLpHpWck6wPe8hTwRLCmKWq6b679g@mail.gmail.com>
Subject: Re: filesystem access to add/remove/view ip addresses
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 19 Oct 2024, at 5:35 PM, Telbat Diordna wrote:
> CAP_NET_ADMIN opens the door ways to wide, while the older iptables
> method allowed access-limitations/permissions per directory (=ruleset)

If you cannot bring yourself to trust a homebrew BINFMT_ELF executable with the CAP_NET_ADMIN capability, another option would be to write a simple shell script to wrap nft(8) then compose a suitable policy for use with sudo(8). The paradox would be that sudo opens the door wider initially, on account of having the setuid bit be enabled.

> Can I read your answer in that way, that I still have to use iptables
> and can't migrate to nftables, when I wish to use this feature?

Yes, for the following reasons.

- no procfs interface exists to modify a ruleset or its objects
- nftables cannot integrate with xtables extensions unless using iptables-nft
- the procfs interface you are using is implemented by an xtables extension (xt_recent)

--
Kerin Millar
