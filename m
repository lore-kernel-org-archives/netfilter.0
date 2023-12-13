Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="AK3FH/jc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yAXaO08R"
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A68F12C
	for <netfilter@vger.kernel.org>; Wed, 13 Dec 2023 09:07:31 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 414F45C0456
	for <netfilter@vger.kernel.org>; Wed, 13 Dec 2023 12:07:28 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute6.internal (MEProxy); Wed, 13 Dec 2023 12:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1702487248; x=1702573648; bh=l6vyL6U9M9
	SBEajE5kLe6MYg9mJQBSYXfKRV7NzsvzU=; b=AK3FH/jcgVpbWkk35x8GRw/XY3
	o9I6UAzTRdoI0LDpsT/JEhLDJ9WfN3geT2LXVfEX4DkRGQB2MEsMyMHGTC6zp7ul
	+v0fNmlinFfUL8aYOl/xOvsMU90CbSj9pNPL1i0Bj7TccrZMi/uiELoiHJzIZItk
	4EZY0bAZzgepvO+YU5z42wCbenoLzViJhrwD/qjo5KEkxqWRWiGy1Z2vrnS/lGro
	UocHcgk4FxZESCp5B8AQwdTLwwVPuE+5PVXESGbPkRudNTPXTF6DHAc9XBqTChrQ
	FTHHngMdUdMJXE6z2xYBg9q0Twe17mtZucZ6QmARsFtLrE5naXg4nqLaLShQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702487248; x=1702573648; bh=l6vyL6U9M9SBEajE5kLe6MYg9mJQ
	BSYXfKRV7NzsvzU=; b=yAXaO08RGOMSc/DCReHdg3xaNUo3gU7yElQ1DVAy2gOJ
	8bPhV0fni9D7N6AyTSdRGbMk6OLuyLd4y/fxBuGb/dEZmjMzznLA0VDX7Hn8+X+L
	Y1a4Wt0o+6ppSiwuUbLiYXdb20fHnG/Ywd9bMKgPHSKGG4UTexIVGmhb8YDgQ3Nk
	Snjc4YoEkCrwUTIrNyL483HaKt8kVETKVPnNQpiCUNmLH03hT74u42BhSwSAwDYF
	NQRAmn3zqVbmzhA4I10BdoevNR04gWoffBhl2IHdyfk+iH4rtorVbIpOG7SLTLaE
	5r8ggFYNDXxi14yajRu6TJVnE8T2un4yGY5YPoOXnA==
X-ME-Sender: <xms:z-R5ZesRCwWpWMq-mwjVzeHeRIT_dc5cUTpLnO80vogMMzkH9zNmsw>
    <xme:z-R5ZTffaa4yGwjn4nSDpcnJroKqB_CTFqffOKW8bnhHlJF43cCiUCTBmilMAQEvJ
    i1hw4mUCsgU3wjkHpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhs
    thhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtth
    gvrhhnpeeiudevudeuuedvhfduveetveeltddvveejhfethfekffevgfehieffjefgvdeu
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlih
    hsthhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhs
X-ME-Proxy: <xmx:z-R5ZZzMs9H5xprUT2HSxlTAiSxkcSRTcsWPEEVCJWsscqgP2gCSbQ>
    <xmx:z-R5ZZOyFQAl8b4kx_i9aPiKwHJYkgmKzlQCIs3fJoNwYtyIOmW5kg>
    <xmx:z-R5Ze_edN3kfRa1GnCqdWoHKeEyCKQaSBHy82SnJIPRtEhtYzlHCA>
    <xmx:0OR5ZRKv1Z7B6fZ-H6r3-rIH6n6H0L0ierN6J5x6wFwDC1KVOOd5Ww>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BFA80A6007C; Wed, 13 Dec 2023 12:07:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d1b6d26a-d5da-4204-ba56-f69cf3218caf@app.fastmail.com>
In-Reply-To: 
 <X0U3OYDrZPaZhXRC3CS0pWaiYN7q9_seiIuaK6u7nQ05lq7ojtp0bIGhYbYfzKtIuZFapf0UgPtb5Dn7o6MaKpapTqTrslGBUenfWQOtgiw=@proton.me>
References: 
 <PUZPR01MB5044183AE828E0A504D4014ACB8EA@PUZPR01MB5044.apcprd01.prod.exchangelabs.com>
 <zg20uRQPjgqpXOGX2T-AaXxj14SLjreS1CgEezKdQ8MOE_u_H3zY09OM4qYxEjKF_LJW6yrotM0eChbOChTIYLH_PnO7YmemsBXMvdz1b0U=@proton.me>
 <SEZPR01MB504716A57016E9B43D326034CB8DA@SEZPR01MB5047.apcprd01.prod.exchangelabs.com>
 <X0U3OYDrZPaZhXRC3CS0pWaiYN7q9_seiIuaK6u7nQ05lq7ojtp0bIGhYbYfzKtIuZFapf0UgPtb5Dn7o6MaKpapTqTrslGBUenfWQOtgiw=@proton.me>
Date: Wed, 13 Dec 2023 12:07:07 -0500
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: nftables problem consultation
Content-Type: text/plain

On Wed, Dec 13, 2023, at 10:48, Eric wrote:
> On Tuesday, December 12th, 2023 at 22:56, ye4 yu3 <ye4yu3@outlook.com> wrote:
>> As you said, I used tcpdump to check the status of the ip packets,The rule to set the port cannot be successfully executed, And i see the ip packet appears to be damaged in the tcpdump (they no longer have source and destination ports).
>
> That sounds like a bug (or by design?), maybe netdev tables don't know 
> about L4 ports?

They do, I have rules successfully matching on L4 ports (but not modifying packets).
