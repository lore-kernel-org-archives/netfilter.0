Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7843145B33
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711910053; cv=none; b=ocZ9LSIuGeMKKZqoErkkoWFka+NPSjMfqNMML47MNht45ML24dyI4EEQLCMqZyXbVcKcb+cCN4IXi1Z381fV5VCtsMT6qKOkr+odOr8agucrIy5L3P+UhpgQB9S5hwNN693RNZGgz7c6+h217dvJl4ZF5nOjrG+7FiVu400usNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711910053; c=relaxed/simple;
	bh=Yl/he8M7X5FoFNEy8S4QCeJVO5uSwN+Xb7TLmEk48zU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PlrnUjCn8ktpOb4gTqeammctQoLLkVYE1Cv2Ry+J8c604Vqaate5l08yjQ0Rs8QjGJauRz0pS72CGF4VG5Q+YNPshUEK68AVYw9Xwdh5vxmyA4t4geGQXK/phe+hEVUxTZbP2ZgVsbH/jr7GSLRlCLcc9eIijT5LDZb/Vvj3D94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=q1YvaGqw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iCEtLu9u; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="q1YvaGqw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iCEtLu9u"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id DB7AF138008E;
	Sun, 31 Mar 2024 14:34:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 31 Mar 2024 14:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1711910049; x=1711996449; bh=LHGsDz9ZgvmwplhiK9sjNiSXh6YU5sjw
	xL6X2pJcNNU=; b=q1YvaGqwolqV09nRBNdiR5CpJfuhLAfWzzVgQiryCQpQsxQc
	AMs1AHZRtdGP6C3l9bpM/ll2mLcsMvXI1EBMuX0GpeQ6iN7e/2/Fhf89YoZNo2+r
	9PCjl/Jj0nSP5vtnG6679oBk9CHp0L06vhEtiG2tIEc9kz744JB62xR/gJYkmHcR
	DvEh6tDwbKsedmosUFIYESBDkXunz0P2WPc6zHHQzJvA36xGfCYcNnfBZQJh8+4Q
	Gv8ST81nvNmQdCBRiZXyXoB1yVcstEOmb+WIwHnITQMdK5BzUxZUyd0XE2pUECGm
	gzY7EcvGP1KJgS4mjI7Ou/WTMkboq3Ioghk+OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711910049; x=
	1711996449; bh=LHGsDz9ZgvmwplhiK9sjNiSXh6YU5sjwxL6X2pJcNNU=; b=i
	CEtLu9u6v6CPPeJknW4eVqWSjFsVXhNsb+wwYWNpwtA3QcJiFwqUe1WU1p9v0sqx
	5anPXNURTf2lSsbwKylX0mVe8ks3n5oFPjqnIxjh6axsuhSq+U/oju0xqsIomikN
	W+6ESMydcZ72R/bVim8pnbnXdQHXGGfhWHsP07OIrhMScpSKskENPl+zpidSWLtm
	ihNyC3GPneGsIU1bHyeE3/VMfEGqtCwS0XOu7kh5FcbpwJ8K09LJy/MMTGLbeFPz
	LZeZeAssfgJg7sFgnWCUqSVxiPcy/hZCqQ+07RCkm3v2n4ICiFBHRIvgC92HAkyY
	3nhwZgXDR7KA8mEPm76bA==
X-ME-Sender: <xms:oawJZo5DUiXuxe6SNjIFD2qZgOizNeK6vxAfpxJcjWgq-5mq6gGi3Q>
    <xme:oawJZp5zln_sT52CxkCc1BxYUoEzIEhjmaRnI_fxMZ2iVmiI-TlfER46tRme-VJRD
    x63vIq3s-uoomIq>
X-ME-Received: <xmr:oawJZneG9w9mcmWoEg_1mgpLIU3jX884GMt4Az8HTfFGD2HASF58ouocnKHMZ-HVd-dBbaEatR9I8czk65g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddvkedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkjghfofggtgfgse
    htjeertdfjtddvnecuhfhrohhmpefmvghrihhnucfoihhllhgrrhcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeeihfettefhgeeftefgheeuge
    effeehkedukeefffejgeeutdeggeejtdeihefhveenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:oawJZtKWyptivPaE_G6I4-kDm3JN3fnj-ws2aFN57L9nOZC7ywNMSQ>
    <xmx:oawJZsKnnroREhEfaNezR7T4QNCmirLvMAPSH_rzCtad0UG8RS6C0g>
    <xmx:oawJZuxVBGTIueO0vND_d7zdt24GG2_fTWmod42GhAJlEjUZF_z-Qg>
    <xmx:oawJZgIvOMu_3zW8dD1W6qYGHx8-AyAwoLI7R7mvYeyq7wRgyZyOZw>
    <xmx:oawJZg0NsXr81A_xT_WNTJoaihxIKtfF8EsxIf5jtv_oHwWveT9b2A>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 Mar 2024 14:34:09 -0400 (EDT)
Date: Sun, 31 Mar 2024 19:34:07 +0100
From: Kerin Millar <kfm@plushkava.net>
To: netfilter@riseup.net
Cc: netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Message-Id: <20240331193407.3e40cb6ed1c4b6e9fb038c1b@plushkava.net>
In-Reply-To: <20240331170259.068a0db3@localhost>
References: <20240330194139.561b5a24@localhost>
	<f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
	<20240331170259.068a0db3@localhost>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 Mar 2024 17:02:59 -0000
"William N." <netfilter@riseup.net> wrote:

> Thanks for clarifying.
> 
> I actually found the magic word "code" after posting here but I still
> wanted to wait for a reply. Yours explained it perfectly. I suppose I
> have been confused by reading too much from different sources :)
> 
> On Sun, 31 Mar 2024 07:33:42 +0100 Kerin Millar wrote:
> 
> > However, there are some errors in the manual. [...]
> 
> Have those been reported anywhere?

I'll open a bug.

> 
> > icmpv6 code <icmpv6_code> # where <icmpv6_code> is any valid ICMPV6
> > CODE value
> 
> Having such possibility is interesting, as the integer code has
> different meaning depending on the type, i.e. it has no meaning per se
> and it looks strange to filter based on it only. I thought they must go
> "hand in hand" but obviously not. I wonder what purpose such filtering
> may serve.
> 
> In that sense, the output of:
> 
> > # nft describe icmpv6_code
> 
> is somewhat confusing (e.g. compare type 1 and type 3 or 4 in RFC 4443).

Yes, indeed. It seems that the symbolic names were selected under the presumption that they would be most convenient for the common case - probably with the reject keyword in mind. Come to think of it, that's probably why the manual does not reference the icmpv6_code type in the ICMPV6 HEADER EXPRESSION section. Fortunately, there is always the option to specify an arbitrary integer value.

-- 
Kerin Millar
