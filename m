Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="alW/MAMB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DVFH/DP7"
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904F11729
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 04:06:47 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 8A6BC5C0190
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 07:06:46 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 01 Dec 2023 07:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1701432406; x=1701518806; bh=wB
	RP0DFpMdt0nis+H9eAMoEv8qQl4mc2KO/iXwghpHc=; b=alW/MAMBd7XQl8g6jV
	nkuCisEVgHtsuANMmeuSRyDOMDq7DlNu1s5IBhzRJMTkFpcIbGCFDyeQ3++PIl3x
	FNJ3uZjRHoEgcliEhhGuUp4phMvvgG+nJOjYuhSaWtx+xj2QGbkh/5Th29xWc2li
	6V53/riSXAPim2FVPMkQj42IeIhyW2q7dAmILiiQcKKapYyjvp5iHFHa7LPDVt28
	9ixR/Ufk07bRYS/t1qbWjTn29L+KScRnmfDWnaCMhgjGrLvUO5CYJI2qlc6J6om7
	XkJmcS0rPv24i7LgCp6oHDSgIST2z5eY1kaBNPJdg788atmDtTP3JrqZM1WeMpgR
	I0BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701432406; x=1701518806; bh=wBRP0DFpMdt0n
	is+H9eAMoEv8qQl4mc2KO/iXwghpHc=; b=DVFH/DP7/T7JOlxjOSAWAlzNsO16Z
	3awc4P2tM2Oc51PMYUqaK+ZzV0vsyZuUPNlef/gOAkcTdZlV+HS0eVlm398Y54Ti
	kQWwjDFWdp5gBG4rXSsBQtSm+CbRt2HHYouKPz/iceJRJQ6h+1pJdbyWrOYAfeCs
	wrvSzBdwsZBkEpZ1iW4PD05WylOZy6lsmC8qqzFh35nz7XtBZeOiClRuXwZ61bV3
	y8Lcov500vd0TOCJEgp4SlWcPmY/IMBH4H0SsfJH0ZETTlNpF0SUsyfi6BidQq1o
	4y8GWPcRidZbRr8p1QAD0t8K5doa3fFFOjhlGq4NTzGc4K3eYfGT4bLVg==
X-ME-Sender: <xms:VsxpZU7UENC8A6vZ58QJUTEP-d_i1WGH0UmwlVT7aWPkktoZLZWXfA>
    <xme:VsxpZV6Vxlk0shwXf_aI11uzyKX0UgYQEQQphiMv17L2uuW27NKh2DRl2KNmyVkq8
    rf0aoO6N4FMv9KBSiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhs
    thhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtth
    gvrhhnpeeiudevudeuuedvhfduveetveeltddvveejhfethfekffevgfehieffjefgvdeu
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlih
    hsthhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhs
X-ME-Proxy: <xmx:VsxpZTdlyNGOUGRGsVuWFmsawsTjuok1olB5k0H8IKfa9DgNjg-nAQ>
    <xmx:VsxpZZLu2aLHWAX-yAYdvLDMp0Rv5hhk7rnc_xYgWT-C5mE99qjaUQ>
    <xmx:VsxpZYKE_ekarZHA66a_qPzTJkI1a7X6g-xHSWHpaLxWecFVfTRn-g>
    <xmx:VsxpZdU6nvNY1r0AyWrC-fzwUACGhk7WywegtcDduNJ0AwqFK5ZXHA>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 33E661700090; Fri,  1 Dec 2023 07:06:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f5f7f99d-184e-47b8-9dfc-73b041b9dd3f@app.fastmail.com>
In-Reply-To: 
 <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
References: 
 <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
Date: Fri, 01 Dec 2023 07:06:25 -0500
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: netfilter@vger.kernel.org
Subject: Re: Unit dependency of network-pre.target in nftables.service
Content-Type: text/plain

On Fri, Dec 1, 2023, at 06:50, You Yu Lu wrote:
> What is the reason to start nftable service before networkd configured
> by default?
> Is this the intended behavior for nftable? Or is it fine to modify the
> service unit file and change the dependency to fit different use
> cases?

If the firewall rules are not in place before the interfaces are configured and brought up, there will be a small window of time when the interfaces are receiving traffic but there is no protection in place. If the system in question has multiple interfaces and is responsible for forwarding traffic between them, then during this window of time traffic will be allowed to flow between those interfaces with no restrictions.

If the firewall rules are then put into place but allow traffic to flow if it is part of 'established' or 'related' flows (using conntrack mechanisms), such traffic may continue to flow even if the rules would stop new flows attempting to follow the same paths.
