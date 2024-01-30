Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098465BD0
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706611227; cv=none; b=gTJrbb46affMSJP82Bjo+I3iwHSdu5AI6SvlWNRRkC6IVRbTra6T9F0B/Ijs1KVTFEQ+59uqRkg1K6N3gEnt4bl6a9Ksu1bG4TVFbV8O+VaVCN/yCX4Qg1T+1Q7I7f34eofUAi1lrTvAx8A2GuA8TtHKDQ5aQdERBG02ZMbtZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706611227; c=relaxed/simple;
	bh=Mrx7QHb4rAbwMS34g1hx1iVZJV3zFYF/u27DdpFymLs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=bm55yf8PLw0dGwPjc3wJ/GrBl3VVNhNvO4ZxwZVUWa9Yv/xdGEFCR59ZKBDJsidZt/pW7OYN4vbgV9oA9YMkHt+3ggDvHmk9igYWm6ZIZDRa5mJH1AV0NxU0893A4pDTnEWXKX95c8CTsB3nukb4q9L4cYLGVUOnIcBDiJTey+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=vatu7xlx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=of8EbIxn; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="vatu7xlx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="of8EbIxn"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C3E9311400B2;
	Tue, 30 Jan 2024 05:40:23 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 30 Jan 2024 05:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1706611223; x=1706697623; bh=jMZjjxd/yB
	VHh8o1gCSKIBEU40zhE1Yk2Xvv7lFegU4=; b=vatu7xlxUI0L2T2rsgLFTlxTcw
	A15TXVE6tNUj27x3c5g0GgfYC9eEZcpx1liAN9UdZ1ZwRpiAj/9msQYG9kIXML+Q
	rWRD9j51RuOXUcvIDvfn/BwRmBvBTp6xDap4EC8TKfhIaIq6D3LkzgvGZ04LmCaS
	3wiUNYe/F4spC9mmls/yy9luzKhmps9cDvuzmeevr5hopmF/D9OZXG+21YeAFKOT
	vHm9gw/Ef90v/UecOZDzJcLPIAuexJoxH8T/zJ+GIedj+mpJmk4ur4wW+BulFcBb
	MuDBT7Kx+weVR5BbzwOamvtkXkqSTZ3JmxmMOHdmP+2G3EHo8b3RlU5J+vDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706611223; x=1706697623; bh=jMZjjxd/yBVHh8o1gCSKIBEU40zh
	E1Yk2Xvv7lFegU4=; b=of8EbIxnj6ICcV+m89cQOwfv4nv5h7Bf5H14scu5152/
	YBGJQ+emvB8ffSto4X38PtzSaUJKhwuxL5yIfUIr9IVR4Gfp/yE7cLQRRND0sH/p
	APV3/Cu6WscT9CCLx1B9S8DdsIB/IL0SuJdGvKli0plwODpXLWsC0SHyD4YjKx3j
	QIIAqlMaSuFICrV813URW4FCLBjds5MMeBtlEPVT7IvD3AKYE6QWo46Gt96RucmM
	Vs+ai6zEbMgjIy5XxyODHowRVHSuyfbMlvmDy5Ac5YEwKt9n7WatQDSWYTRTVixL
	QmS8249OWm9IJzxnnWrbKeNq5ahVGzhuj3+poeqyXA==
X-ME-Sender: <xms:F9K4ZVQGJfitKKJeffCWbaAZiUqjLWm4PjCnBfi1kvlCnK90DKXMoA>
    <xme:F9K4ZexF2eDfzziAioaXc3oxMb_fI4Oz6ygSKR-CrLbx7l619ie1UT5G2CUTM31OQ
    O35R5SqbsFWv1nF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtiedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepkeehfffftefgudeigfekvdefudfhhfefhfekffdvvdefkedutdfhffei
    geegvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:F9K4Za0lRQZ1KFoGw8myC-MOPvXJ93XnLpjcU_4vl9dli23a7bG6TQ>
    <xmx:F9K4ZdDkqdExa-RPbHXIh9Wxwp6DtziOF5NE5cWJzNYceeh2ci9PnA>
    <xmx:F9K4ZegQ7XTJfep1FmsiMIW3udX-cM-ind78Llirlh5-TYpz4IvHMQ>
    <xmx:F9K4ZSa6aunGkYKFRB1WJqVvRj7kp_HIjPPvXg65xGI5oWqLnhX2gQ>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 83BA81700093; Tue, 30 Jan 2024 05:40:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
In-Reply-To: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
Date: Tue, 30 Jan 2024 10:39:57 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: Daniel <tech@tootai.net>, "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain

On Tue, 30 Jan 2024, at 10:17 AM, Daniel wrote:
> Hi,
>
> nft 1.06 Debian12. Is it possible in a set to combine ipv4 and ipv6 ? If 
> not, does it exist another method to do this ?

Combining is impossible. However, the value of an ipv6_addr element is permitted to be an IPv4-mapped IPv6 address.

-- 
Kerin Millar
