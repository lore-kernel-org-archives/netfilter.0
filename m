Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A521C8604
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741030339; cv=none; b=SFylo1ttZCtjnjOQ+WTnkLgB8o1mEUZ2kpyb+LhXabcv4ODQ0TQuZiTQsMV1fL4t8N/rpC22Sif8XfBEQExpogTc4jikbfz/twWO2UXHdCWG5Feot5coXGFr/sMf+/h4001xBpSDIjVTuqKtV0yJirRx50V9PoJDUGqOffq8APU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741030339; c=relaxed/simple;
	bh=NE196Eg9zAZxst//W1Fj7XFch+UAB/9W4bKmVZkSNsE=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=brJna83tkqLSsFUqiJcD7Nbk7efKWqHewLVdIxC/OqwJXVEM3AR8Ufap6I8yWDI6UFa8qCf13UH/+HVgJCuPJAPsrtdpn1agWGnvM8ekqpkqUGxHCBtqfXi+60cj6j+wOP5NUfAB71PH9rbfqLaOD+y4hEzFCG7vPIoo148SjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=DbnVbf8U; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hYEXIFat; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="DbnVbf8U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hYEXIFat"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 42D3725400CB;
	Mon,  3 Mar 2025 14:32:14 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Mon, 03 Mar 2025 14:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741030334;
	 x=1741116734; bh=JENjcYKnYkHbeUF0VtIXXr2iSwNjyT9tzJ45lEnRShw=; b=
	DbnVbf8UGLeQU3MQPORHI+4i7xPJcVqFTSTRzfQPPA04VKGq6A6/T3HJ/THylQli
	BwhKqGifyCJl1JXoPKGaC0KmVxYhvOCuFnreCSvAApPKVVB3z7TBohQnOqpKambb
	whpa4Q6l+Us+F4sIaEGn5+XoES0MrbdyiLmj0Y2Py+Hw3iWkWWfMQpi6jZHoAtqh
	sjiLwQj2rkyoNvVMJ5q12mvALCQ2MSIN4I2s2IfuVHbwvdfPh8UmjNID2loV5LKj
	HE1OegVUQb81qlLUC4SlZ0S0PEuMf6EpXDiE2Pm9eFC6Fd6ZUhIVr5ggOliU/eCL
	5ibjlHOhWOWdB3ZbqnGl6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741030334; x=1741116734; bh=J
	ENjcYKnYkHbeUF0VtIXXr2iSwNjyT9tzJ45lEnRShw=; b=hYEXIFat4EOIjSuPV
	KN2g5Kw4d2VowM5r+hfhQnvLrrnWK6+id19yy24/ZZ6cMyPAegslnZZ+Hziwlau+
	u33kZVN9PThThK7Ei+Vm/iUkm6PkFCnPqKx01WMkMXPgIJhEMrCMgtemcM+qXWIk
	A0gvxg7wrX5JqB3vtXjpk8eXSml6iFCSa2FVP4OlWOtHnerwWLddr/T0135nClxU
	EtMUm3sbbGGTG+2IC2t0F/AZeCnwE8Ovy5utVNkxevmyaLfrsbIesVT84J668sjB
	HqZEZ6hKkDOgD48/vrVV4ERKtGXGkylUD9TrHyr2RWIHlWHXOv5R2VHzWV3txyPi
	HoAvw==
X-ME-Sender: <xms:vQPGZ5Zy7vJXc2hR_X9R3Zc9hbVbnQNeHbseAgjL-tyQffkOuPHh5w>
    <xme:vQPGZwaqt6h3ejJV8423Ey_5z65T6QFhIdRn1exfOZOCXMZ9NS6mW0EP2a035mCAW
    snPIT0lIlfVF3bv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
    fhvffkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfmvghrihhnucfoihhllhgr
    rhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepie
    egudegvdevieejhfeffefhueekfeffudfgueehhfehudeiieeftdegvdffkeffnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnvghtfhhilhhtvg
    hrsehgmhgthhdruhhkpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:vQPGZ78g3cEhsMKJxRGd3I9cO9rA5wHvniYCBLmIDN2NbdNPv6H_7A>
    <xmx:vQPGZ3r3iU3NXtI5MSxBt4OJZFGj2AXk3cLPBJYeXGskCx32HX97Bw>
    <xmx:vQPGZ0q_0SSpZC7347JEYAd2mdmUZkwLuuYzIVzrZC3dGI2HfdyGqg>
    <xmx:vQPGZ9SKSSSWWk7Ed8oNEaHbe6Tqcx7KyqtfVgl4JgCkdpLEJavKQQ>
    <xmx:vgPGZxC4dlWF0jkgYEgyaINc-pESI7mIwFPcVXR8CtMOe-D2xyrsiZ1z>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B35673C0066; Mon,  3 Mar 2025 14:32:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Mar 2025 19:31:32 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Chris Hall" <netfilter@gmch.uk>, netfilter@vger.kernel.org
Message-Id: <4050eda5-3e19-401a-ac7c-b80258484ec6@app.fastmail.com>
In-Reply-To: <e526722b-9ec7-49db-8b22-a756a390b24c@gmch.uk>
References: <93e5770f-86d1-4c07-b9c9-ba8953e1796c@gmch.uk>
 <e526722b-9ec7-49db-8b22-a756a390b24c@gmch.uk>
Subject: Re: snat and Port Numbers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 3 Mar 2025, at 6:16 PM, Chris Hall wrote:
> I'm trying to understand what ports the netfilter snat will map TCP/UDP 
> connections to.  I've tried, but failed, to find answers elsewhere :-(
>
> ---------------
>
> For iptables the SNAT target may be set:
>
>     --to-source [ipaddr[-ipaddr]][:port[-port]]
>
> where [according to iptables-extensions(8)]:
>
>     "If no port range is specified, then source ports below 512 will
>      be mapped to other ports below 512: those between 512 and 1023
>      inclusive will be mapped to ports below 1024, and other ports
>      will be mapped to 1024 or above.  Where possible, no port
>      alteration will occur."
>
> Is the nftables snat the same ??

Yes.

https://github.com/torvalds/linux/blob/adc218676eef25575469234709c2d87185ca223a/net/netfilter/nf_nat_core.c#L641

>
> If a port range is specified, will all source ports be forced into that 
> range ??

Yes.

https://github.com/torvalds/linux/blob/adc218676eef25575469234709c2d87185ca223a/net/netfilter/nf_nat_core.c#L659

> Or are source ports below 1024 still mapped separately ??

No.

>
> Then there are the /proc/sys/net/ipv4 entries:
>
>    ip_local_port_range:        32768   60999
>    ip_local_reserved_ports:    <empty>
>    ip_unprivileged_port_start: 1024
>
> Do these interact with the source port mapping for snat at all ??

Not directly, no.

>
> RFC's 4787 & 5382 REQUIRE "Endpoint-Independent Mapping".  Is that 
> supported ??

I'll defer on this question as I have yet to read the RFCs in full.

-- 
Kerin Millar
