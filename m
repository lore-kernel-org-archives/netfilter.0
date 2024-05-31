Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E6158D8D
	for <netfilter@vger.kernel.org>; Fri, 31 May 2024 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172832; cv=none; b=Dt1GFJEQgk7aJB1d/2VZWZVBMufJ62r9EF1uKSK5wdAIvOT+DIXmuSeAhYJRRkQgQoe05kpENe3qwZoAgjOs3bJM9RD95DMOQUDvT7Baeb9H9s/iXylhlD+1yWfaMQap5qW5JSOkd5u1towfJwgEfmufvODEE6mr3AxtFz/JS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172832; c=relaxed/simple;
	bh=n7awgHxy0dI69grDtC0a1AcZgkyc5pjy4PJtJYf5Ayw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=j3jfGW9tUr4vaOdW9b+905fu8mp8X/P6C/7qSoeBCxaqr7N9ZQuPZgs+6coYXuBHAKqw5w2XXlOb4/vEEDZyAlXopwdsKXdmRLr13ACcM4wEZh7yY2zJiznqzYInsjp3wGnRZBwSWuWjHAMIrzlNdghYzYntbV4RKac80aDt9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=H6pRdWhT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cPIIfX+f; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="H6pRdWhT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cPIIfX+f"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6120B1380091;
	Fri, 31 May 2024 12:27:10 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 31 May 2024 12:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1717172830; x=1717259230; bh=26bCJnm42n
	BA2SnTiA0xiimXFlZLGRTvUnTzN33NzYg=; b=H6pRdWhT5MrdmvA0qv4n78faho
	cistFOOYBElwEzdlI1+Qwq2rql9KQgWGdz+urWoakedKMnkFoTai62qv54wXxoUS
	dL+bJiBF5cF2DqbZadLXYM32yAyGW02F3yM2VhZwtgK30I8sa6KiOELH4Nw/sMF6
	Xh1s7ABYvWu5nAHLdEpOe8BWbxn7OrIL1JV8F5nwM/HGw9SH9Y35kW1ggpwQrap/
	YTU76aeuxomwiYfZOMeNtGlkFKdvQml7R9fGezAaIoqHgDaSKPdWNm1yddsSA/GI
	w8mDeSG2u3G52ohcqrTiAzK2bFUfYPQNWH9Li9ekA3JGodbSutBCzY2XNh6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717172830; x=1717259230; bh=26bCJnm42nBA2SnTiA0xiimXFlZL
	GRTvUnTzN33NzYg=; b=cPIIfX+f1KaCk4g9jmMz4AzMibUQjRTCqtf4o5PD8EUh
	vfefJ6HRMJwXNZfLMezD8cCkrwOOpyCzSw8Fc8U4n+pmlYK2qWDyRA9l+gN7xyDz
	Ae2cHgj5i9DHDk1ulvmriNNqGohw44h7XDyXSgjrPasb+xvz+cFMn/0xBhbmQIVz
	hqw3SLeGDpTZE+VNWTRNPezY5730BRF9FugF0W5kz0Bwr1+qJzREekuF71GtHBaZ
	hSS9IJ58qEBSBj0HwuUkgdDG4wPGtt+CR6YADOTVPbEIN9mWn9+D5kByjKVCxOpW
	IaFwXDlAxs/7dASqekEQi4VmYHwXCqSffwBJ0XSmlw==
X-ME-Sender: <xms:XvpZZiuPvdt6LM-ayDTngfVkjKKY5AfkeXyIZlbseJYglLYVEMhkUA>
    <xme:XvpZZnez8Gtt2X46F4mYJnIwncKaFIA28VE4zRtEkCJAzuArzEknDOgGGzVPxTzOG
    ulZNcmm0sg96OcW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekiedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:XvpZZtyrzdGaViS18NVcO3lSlNx6XGp5E6k-58Yz8N1Vdr7G1F20bw>
    <xmx:XvpZZtNArZh_15DhaN3PbAxTCzlhtDBM9TOQBKQy7RZ5IAZXoeCNVw>
    <xmx:XvpZZi_wyaJ2Mphjvh4pWIDn8wAWHyx-ON-mTJBQBlD-yjvwFl6H7g>
    <xmx:XvpZZlUaAGzKFPj5enTbkPZFdLoqumsJCLabHH0tX45pbJLA2GGYAw>
    <xmx:XvpZZolzbtAwXLIHV4SNh5kWCMAjakJ0rocMkTXlg8jnJo9FJumKjzLK>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 059831700093; Fri, 31 May 2024 12:27:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <2d9205b5-6bee-4e63-a47f-5c77a3bec186@app.fastmail.com>
In-Reply-To: <1649672530.20240531173405@WKraft.org>
References: <14110673198.20240529174630@WKraft.org>
 <4ac23ef0-13df-4423-b1d5-aa9d5eb5423d@app.fastmail.com>
 <305618533.20240530185617@WKraft.org>
 <79ee1677-6a97-46c5-ba3c-af6e1b61638a@app.fastmail.com>
 <1393698327.20240531171132@WKraft.org> <1649672530.20240531173405@WKraft.org>
Date: Fri, 31 May 2024 17:26:49 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Wolfgang <netfilter-user@wkraft.org>, netfilter@vger.kernel.org
Subject: Re: Problems understanding nftables part 2
Content-Type: text/plain

On Fri, 31 May 2024, at 4:34 PM, Wolfgang wrote:
> Hello
>   just sending and updated diagram, as the previous one had one big 
> mistake with a wrong route!
> regards

Regarding the query about the routing decision having one output, it is there to indicate that a routing decision really does take place. Since routing is not the responsibility of Netfilter, there is no decision to be made by Netfilter at all. Nevertheless, it is practically useful for the diagram to show that it happens; in particular, that output hooks are effected afterwards.

-- 
Kerin Millar
