Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727F54F96
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710782188; cv=none; b=CRWZBLX/ZEK4+4Xt+heB5MIEhLvnMzIoQ1ydSznd/vTnWJo2x6qZsjS/ybqP0P+Mer/0DQ0ccQyW5uPpRUdf4TLC7dy4/ob/b3x/eNew0KoATPWXFwYvo14aoL0UIBDgrIttPSVhbapHeUerEGF1J/qjEeyg5R2BqW5bDPV1JlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710782188; c=relaxed/simple;
	bh=T+0uuLsN1YWtEZItiBpyQGTTJp/2PNy/Sg1jbK+jQvc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=mGQ1iMCwiPAYSQ2wBiiS20aBYd+jN0hxPC0pSYR3ZjleWScD5d3v8z/M1h08QOUs/b8WX9HlQ7bsZ7MYfe2Gnzu6QibKnkmyuC9n6IFTBieJS82clQ0uGxYF8lwSk7gjCrLXuo5mE60uEhgDOEt7804nNctLlk477nDZNL02oIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=LjxMKT09; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UdAg6e7D; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="LjxMKT09";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UdAg6e7D"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 1F9F21C00098;
	Mon, 18 Mar 2024 13:16:25 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Mon, 18 Mar 2024 13:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1710782184; x=1710868584; bh=nF6u+HDxsl
	fdMzFt93XzSn5WaCSZqLt6c3ay8S5hJ1s=; b=LjxMKT09ILNAauLPdm1fgyxTP4
	XR2wXyAKgtlHTE/JxkeVZi+0pvQZG3BPrS0w7UQz4kS3Sr3vhsTitwXN38o5aRBv
	TUlrb5VLnRrC72yTPl9nem9V0cCLkGIe+8P8Auxgu1qc5iuJNA8q9n++gq7HJrmT
	DqMroArd7GhK/9kYhHy9hkifa+4QDQEs+4nBazNjnSDlLgJNMRAsze4+y1Ep10Aw
	4BlkM42k6sWWMuCGKe5IbKgxWMuNWPTFZHw2AHmQg0zxuzDDQGUU3jcofl73fzr5
	zXrly0XEYnkkIF8Vo3BdbGRXlIMR98ctWDrj+OoWuZKlpt3iA7vKL7gT5sXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1710782184; x=1710868584; bh=nF6u+HDxslfdMzFt93XzSn5WaCSZ
	qLt6c3ay8S5hJ1s=; b=UdAg6e7D8H6p+t2JLLADfE5cuydsPVNcT/8CcoW16GJh
	SipgBQI2IWiet3bDOUYhNVOpHtg3MHsnUxgL7phzbToH44P3qI+Oiw7QvENY87Xw
	gnalitD73ATfnS4MhiEQOe6pcKeAfC5nGJKnl6oQJheeOKR+nmPxqeJs3zZpuxUf
	PicV4xVIMrw5nI5KQufDKFy2Upl3MxRyhi9pnzDBsdI0/FntfOSPSJEyGPKQlfrI
	/P6HTpB21FDSidOnVDW7K/6v4uoJY5s8PQtIp0GdQPIAAvtO/wVRN4co0JOh88Bu
	vgNGAgo/7NVK/yiFG97c22j+9S27vNBqZoEzKS8daQ==
X-ME-Sender: <xms:6Hb4ZQYQddNea-BWSFiABGe-lSvBK0WCz-FyNBeVFJf4Dv-_HSDD6Q>
    <xme:6Hb4ZbZSu3YS_YwCaIiUvQnVlFLoorA1RLly_SWGiD2VTVWHnLuL2rVFOp7LNsafv
    6HphfHwvU8V0Bpr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkeejgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfmfgvrhhi
    nhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrg
    htthgvrhhnpedvvdduudekuefgteevgfeuieektdehgeehffejleevfeetgffhjedvlefh
    leeiteenucffohhmrghinhepmhgrrhgtrdhinhhfohenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:6Hb4Za8TOuWINAghJuHz4cK9ESOG68CQCK3pEcPjo38RyXDptj5c_g>
    <xmx:6Hb4ZaoHofNhSZLy6y-2aLFgi96IMsTHcuSKEgmEzjjI4cx19mDVlA>
    <xmx:6Hb4ZbrDbiEDsF_IOZJhV1fcKzqbt0kHTZjkQiHB61oM4BF3oiBJcQ>
    <xmx:6Hb4ZYQOYfzQT-idcL4albWiBXG_78uV5ao1wPnx0qNXhA8PW3btdw>
    <xmx:6Hb4ZS3OhKdBrFu1fxgFCXumZrwBo5PP3vqlto0q_mdGA3z0OSKH7qLomS0>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4C2F41700093; Mon, 18 Mar 2024 13:16:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-300-gdee1775a43-fm-20240315.001-gdee1775a
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3f1bf63e-8f04-4659-b06d-b47f96d6b9df@app.fastmail.com>
In-Reply-To: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
References: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
Date: Mon, 18 Mar 2024 17:16:03 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "List Support" <list@tootai.net>,
 "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: IP not banned in interval set
Content-Type: text/plain

On Mon, 18 Mar 2024, at 4:36 PM, List Support wrote:
> Hi,
>
> nftables v1.0.6 (Lester Gooch #5) from Debian 12. I have a set which 
> contains in a table mytable of type inet
>
> set toban4-smtp {
>      type ipv4_addr
>      flags interval
>      auto-merge
>      elements = { 194.169.175.17-194.169.175.18 }
> }
>
> chain input {
>      type filter hook input priority -100; policy accept;
>      ip saddr @toban4-smtp tcp dport { 25, 462, 587 } drop
> }
>
> But
>
> nft delete element inet mytable toban4-smtp { 194.169.175.17 }
> Error: element does not exist
> delete element inet reaction toban4-smtp { 194.169.175.17 }
>

You would need at least nftables 1.0.7 for this to work.

https://marc.info/?l=netfilter&m=167873533514569&w=2

> where
>
> nft delete element inet mytable toban4-smtp { 
> 194.169.175.17-194.169.175.18 }
>
> does the job !
>
> Also, with elements = { 194.169.175.17-194.169.175.18 }, when one of 
> those IP is coming back it is allowed to enter :(
>
> What's wrong here ?

This isn't particularly clear. Can you share the complete ruleset and explain the test case?

-- 
Kerin Millar
