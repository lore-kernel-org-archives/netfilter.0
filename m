Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="P9yDO7qu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cev1FwAx"
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8D91B2
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 05:59:32 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9222F5C00D8
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 08:59:30 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 01 Dec 2023 08:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1701439170; x=1701525570; bh=Yo
	75GqSkoxIinltrD2RJ2svSbU7+wCE9ikhXt6+Dd6I=; b=P9yDO7quJkH+h7aW5S
	liszYxsFLo6Z6UPwcTjanh5aAyV3mmoNuiCOBxz1jj+D2GY1H8WFfp+U+eHiKwtG
	64c5xWfI6X9DBMC2UpUH62QgKcfaNbqWEpLgAJC+AYg/0lPNxewjAQQg23o5lVSs
	egRB3iC0x5LyXmXhkGVzkyLL3I4mo9jeay1CDiK4EQu2offXst78wc/byBEqqMXW
	wf2H5H9P0OX+2nPNngy1yVSXw/Qg9h2u8T5ijVOHD8lbl2ijKu4t63ou9U/y0sfH
	QOBhA3/epHMAUQl9TaHovTsXiUqtq6vxnJRhkHUVCj4Ok+XtSlM6qgRoYGLIW7QK
	M2oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701439170; x=1701525570; bh=Yo75GqSkoxIin
	ltrD2RJ2svSbU7+wCE9ikhXt6+Dd6I=; b=cev1FwAxymiO8qLObKWK0e+ecV16v
	2xsb0K8rsRx06zfwkXna/o7WGarqpRVGsHSAwGabXas7LQB2MlBA+sQmrJBsB8tV
	FX25cdmtp+SZmfD+xVdDqPcxnKLGXIbfhBdP5vZ/irWa8pzqgbaEk2zhstfkat9z
	LPoCJ+wjE1CiutldnqjYANbRn9lduri50Lx8d9cMIerROTpWaEgqbEJNAFSRSjYa
	ZyPEiVQnPKpReXzZ7W+V9BGU5gJ5cKx+DvR6FuWE9Pq66wq59gDZuVfyhxa4jwU7
	0QFukbMdM6PvwkW+Y6SGZWceOrHhmWyI6VF4nIwvJCC15LhF3HCC7S5+Q==
X-ME-Sender: <xms:wuZpZUN4zmeG8MIDJf846sEDwSJq9_s4_TpHoFxl43Fs_NmgCcKb-g>
    <xme:wuZpZa-Cr_KXLBqol57YTm4CsE1h01aHqIWhW9o1pzsb0Ucb-CxH95KE7z5_VOvus
    FtKlJbTxVWKfvV00UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhs
    thhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtth
    gvrhhnpeeiudevudeuuedvhfduveetveeltddvveejhfethfekffevgfehieffjefgvdeu
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlih
    hsthhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhs
X-ME-Proxy: <xmx:wuZpZbQ22DaR-QP8dtPNBqOyjGPywhsfLsgBnLA2wGbNxSMpAgvnEg>
    <xmx:wuZpZctuCGZ2ASzIm6H_tr5VvaFOAh8JxIeD_s6Ol9HcOe6-e_H3jA>
    <xmx:wuZpZcdSiW5wQ6pIKqRF6bdfyvvKmA90hvWeqkQ_cQw9lbPzY5Wl_w>
    <xmx:wuZpZWqITilBLf0D_qVWzPDOEpFTXq4dgrwDATFkpEJN06GRqyqppw>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2C2F51700090; Fri,  1 Dec 2023 08:59:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7d3baffc-fc03-4661-ad20-eec27b13a875@app.fastmail.com>
In-Reply-To: <7a610cb2-391f-4f34-99c1-6c1f38243dda@at.encryp.ch>
References: 
 <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
 <84d15779-675a-4c2d-a287-49dd39a9313f@thelounge.net>
 <7a610cb2-391f-4f34-99c1-6c1f38243dda@at.encryp.ch>
Date: Fri, 01 Dec 2023 08:59:05 -0500
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: netfilter@vger.kernel.org
Subject: Re: Unit dependency of network-pre.target in nftables.service
Content-Type: text/plain

On Fri, Dec 1, 2023, at 08:43, Serg wrote:
> On 12/1/23 13:15, Reindl Harald wrote:
>> 
>> i would be interested to hear a use-case where you want fire up your network completly unprotected and after the damage ist done assign rules
>> 
>
> For example netdev table

If the devices used in the netdev table chains are virtual (VLAN subinterfaces, bridges, etc.) then you're back in the same situation, you can't create those chains/rules until the interfaces exist.

I'm in a situation like that right now, so I've chosen to copy the nftables service unit file and make a specialized nftables-netdev service unit which has different dependencies and also waits for systemd-networkd to indicate that all of the necessary virtual interfaces have been created.

The 'standard' service unit file is just a starting point, and will only work for the most basic of configurations. Admins should feel free to not use it at all if they wish (I don't), and to create their own service units which properly order things to match their system's requirements.
