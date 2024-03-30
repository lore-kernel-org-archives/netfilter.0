Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4328F8
	for <netfilter@vger.kernel.org>; Sat, 30 Mar 2024 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711780069; cv=none; b=WXGDEQ8w2roykyuOH2ZfpcQhwdaOHzKBk6N7M/M+jlnvyZkOM9qVeGhezmPdf0tJ2MJJS9ts1UneYId/Ei+GKTNH/0ZTKY06X8Iau+hG2FQThE1ND7Q2+hDz+IajKyLWIOUHBhARDqE+odljA0eFO0kpEfVo4iSX5rgwvZuKwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711780069; c=relaxed/simple;
	bh=bkPWZHqY/AzdSrJ8DrJVTWNyd3ai1vJUTfSXHXoQ1NE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Yn/y066NylUQIC94ymQSzBtMRnbImM2DEjVrmPGl17b9Eml8dImGBm9d3EIACDrR9F8w/mcG6nTvgH4/KSX1G2kcqV92zw8p4vcLWP0ZA44o9Dox5YzGDPls5IL4vtZvQde8p/Fk2t7nWqFgznfdxUxa7RYFkQRjs4z2i+FhHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=XPJffBnA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=or3f+mdj; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="XPJffBnA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="or3f+mdj"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E3FB15C005B;
	Sat, 30 Mar 2024 02:27:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 30 Mar 2024 02:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1711780065; x=1711866465; bh=lRRoTH0bDeJlrvbVWY3BHwC5SvAcPNzb
	QL7+tdEKuaE=; b=XPJffBnAmXXULtoREEwW7Aemzjeqw2BMyTXAwBhMFcyrJgsy
	v38OKHltGILJsIJ28GLDRNQM++gVP1o9/CsvGouFwDGCpg6yKbxDp0P0ky78pK4q
	V/NoPG2Lq6Jt5oj/wqcZmmhcKYPqHws/Zp9Oy6GR873LxyjI7ZKJWs2H4ZVdKd3+
	RQ1oLHESM5UpPkCUZdhB8oTfshyjVvTEfHnH6sOlAQsEQiHPtm69QbHqop+DNSBX
	M4blvCi2vGBt8JuFDTCTEMpzT8wlMf+5il3hiNadeuotLYSoJ89wOXPJGqzZs4cn
	SVfhW2dANYBtsWFnKaODtrgmKtQwkkahRLI6jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711780065; x=
	1711866465; bh=lRRoTH0bDeJlrvbVWY3BHwC5SvAcPNzbQL7+tdEKuaE=; b=o
	r3f+mdjrCAA2w7Y+PgiiLcuDJ/pqJ/UFwPxX6Nxt+yrx/d+xDxJVYf2H52TSzPIe
	1itr0Bx3xk5LEjjjTnSY/IsUQHuYMtvAeeRciXKXv80n0jUiQKe8JWTr4q4yitpg
	Asicq0/nOGiuMqhCtIzHrm7fVlPNnhWO9bKRFXEn24XYX3WqDOeL8n0770s5KrCx
	6HDrxxlIwMDxVzqmG1T127D3/0LW9QwcxvHiE2smVC47vsvPEiHXVGr5P0KJHgcc
	Gsnc8gL/Rf0TiOO6lTf28vobNzN78hPnEr2WtX7eA5VINJqBiVy4tBgUS5d0ahSP
	9w7VA/OayotqaOF3jwM7A==
X-ME-Sender: <xms:4bAHZppTiOro5Xaguk_cXI36ojp_HUSI95ePhlME5rgEV4dGhjgeNg>
    <xme:4bAHZroQFj1j8yDCbvLUnlwW7UrNYdTb-SIzwNwgfo4kXNZqLFuKjEO1thdgSvzR5
    quKcrFlhIkaaJ0b>
X-ME-Received: <xmr:4bAHZmOTRIQvsHzoOPdU1slMtecHK9-aYSP-2WH8cWn_rUsK1_xRVSWPycA8-eMouCkki-C6Mmj3t9dGJ_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddvfedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkjghfofggtgfgsehtjeertdfjtddvnecuhfhrohhmpefmvghr
    ihhnucfoihhllhgrrhcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeihfettefhgeeftefgheeugeeffeehkedukeefffejgeeutdeggeejtdei
    hefhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:4bAHZk4fxetcNcnwVHFR_XbTroYtRaYuLKdaJV_coA5zd7WcCCuxsA>
    <xmx:4bAHZo4sOjk8TuHh1dio3Bc2zintWdzHPfrbk0dhk2U69_SyKvxPsA>
    <xmx:4bAHZsgom1lEMCf0O77s6iWkikcF1ayhLUp9sZ8TVnI2XTNYnP3C7w>
    <xmx:4bAHZq6esQgC_Jf_u4IqJoggqdtJhzlwU1pXviwe1oFVeYbJANXdhw>
    <xmx:4bAHZoH9fOHQ5wBZ5SHFavfHWXVPIkHQ7OnUgORMhcBTl7777jbAvQ>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Mar 2024 02:27:45 -0400 (EDT)
Date: Sat, 30 Mar 2024 06:27:42 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Blaine Elzey <Blaine.Elzey@cygnalabs.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Rocky Linux 9 with firewalld and nftables always tracks
 connections
Message-Id: <20240330062742.abeecf69e3c13c6faa45e276@plushkava.net>
In-Reply-To: <SJ0PR18MB388483F4136B4AEF9FF7F8F097392@SJ0PR18MB3884.namprd18.prod.outlook.com>
References: <SJ0PR18MB388483F4136B4AEF9FF7F8F097392@SJ0PR18MB3884.namprd18.prod.outlook.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 30 Mar 2024 05:08:04 +0000
Blaine Elzey <Blaine.Elzey@cygnalabs.com> wrote:

> I enabled the public zone and the dns service (udp/tcp port 53).  Firewalld service is running and nftables service is not.  The connection tracking table gets full on busy servers, and drops packets.  In prior Linux (RHEL7) I set iptables rules via firewalld direct configuration file.  The same rules are not working now.  I set dns to listen on a 2nd port (5353), and tried 2 nft commands:
> 
>   # nft insert rule inet firewalld mangle_PREROUTING udp dport 5353 notrack meta mark set 53
>   # nft insert rule inet firewalld filter_IN_public_allow mark 5353 accept

You go on to show that the mangle_PREROUTING table is defined in the following manner.

chain mangle_PREROUTING {
	type filter hook prerouting priority mangle + 10; policy accept;
}

As concerns the use of notrack, let's consider what the latest nft(8) manual has to say.

"Note that for this statement to be effective, it has to be applied to packets before a conntrack lookup happens. Therefore, it needs to sit in a chain with either prerouting or output hook and a hook priority of -300 (raw) or less."

You have not fulfilled this requirement because your priority level is define as -140 (-150 + 10). Below is an example of how one might correctly employ notrack. It presumes that the DNS server is running at the same host as bears the ruleset.

table inet raw {
	chain PREROUTING {
		type filter hook prerouting priority raw; policy accept;
		# Match packets destined to the DNS server (excluding packets that are to be forwarded).
		fib daddr type local udp dport 5353 notrack
	}

	chain OUTPUT {
		type filter hook output priority raw; policy accept;
		# Match packets locally generated by the DNS server.
		udp sport 5353 notrack
		# Not keeping state for "lo" can also be an effective way of conserving resources.
		oifname "lo" notrack
	}
}

Should you wish to constrain your use of the conntrack table further still, you could potentially go as far as to refrain from using conntrack at all for packets generated by - and destined to - the firewall, instead reserving the use of conntrack for forwarding duty.

-- 
Kerin Millar
