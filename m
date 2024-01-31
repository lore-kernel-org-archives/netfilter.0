Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC07868D
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706703637; cv=none; b=j8GQ9xuTD20l8YOBoUQCmKZX5cMx3NFriFmY5rpLYUz873WXYgRC0q4YKHUML2xLYopf43x6JzvxwTsKSAxkHAPkDqwInlKAZdbhY/9nGfEGTrtovNZ364WE7uIyk8tBOX0vJCyAWdtjwPykgjDD7A6lhmmVaOkWrg+YOprssNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706703637; c=relaxed/simple;
	bh=OGtPYYTp0GoCJd5g1YjPXg7YuY4XVHtNHhxGyiSQLoc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=Yd/+uJ07nA4DCFK16R34okm77Lb4Qcwz7iGCLGPVTQAbBHgzZnACKs36+Hq3uqPARvbBjib6utsN79B/xmGoto9+fJDYc1k5hALyV5q/1wXWUy3i3uDJwdgblrLHtVp7JjW6iah/wdQyEorIBNt3DRicxfsZXV30GLqEX0lj8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=wfahIboQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iKyQjayp; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="wfahIboQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iKyQjayp"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 84BE55C00F0;
	Wed, 31 Jan 2024 07:20:34 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 31 Jan 2024 07:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1706703634; x=1706790034; bh=Xfo2L91y51
	kOFZxGz7b/mJ12He0O7xOTyBDGfLwKBy4=; b=wfahIboQQcuHEys2GSGoe6BSnl
	o2GajzEyFX8W8MwOJjDCW1RFR38M5sSp33XCu9i5H3xJpSd9MaVya2+s37vHgFdQ
	0RhhmXeAbLVvcJANd4HJOxGmtRL+MqpPYnkNSKVZXnwfWfmckqnNHfEiU2ilqjNz
	YLSpdzC8rCixvbmMnJk7By6rcQZlALKG5ENGel3+ii0d/fWSisZX9cBhR7jZLnkp
	YX7+0pW1xzwyDkqV+v1i9VVpXuYR89ZBwE+urZvVKOMKFKmNJqYu+xrkp54pkm5U
	+pMjipzl9nfvBin2gx7mRtwqV3b56iVAlTz4lUsw/8CUaTAw2KN7smVOcfUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706703634; x=1706790034; bh=Xfo2L91y51kOFZxGz7b/mJ12He0O
	7xOTyBDGfLwKBy4=; b=iKyQjayplGnU7r7X4N6ML5uYl5TOv8dXaRyvDBMeW86u
	CW6xyIXihZvQH+BA46XCObJO9AjVfjg5CXWuqB3N1/Tjp7MVY2UxJok+c6whFi7Y
	qkVTP78I7NTat2Uj9DDSbQur2/eTHAhZ/fejdb/tUBQSOfEMWqPDc3FO3rdOLB9v
	OA0o9OM5kzuEM+k3LazSoBK6S9zwPTnrimMM8bK+cRfZ6LejL0Mu+eMFGTpz/+kM
	6ILG8yWYaJhTMyONz4SNN94FCurUYoQsBHmhB9XpG0tsS7IJxTmZPi4XzeJT7bwD
	Fvrgbc/S+2RsxQH+o/LexDyrjFjw1E+ZsMflkRcWBg==
X-ME-Sender: <xms:Eju6ZULFycsSeKTgu1db3bBbT4YCIcMeQw90JXQ86FpRk_BdKctdhQ>
    <xme:Eju6ZUJl8GiTDL2Rv5vGQq0VApPDQoDVhOUYUZ-WC1POyvNsU5kJnwi17cbB_3ej5
    7sWXCdDT-ZYycgt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtledgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:Eju6ZUvBjDWpp0X3AIf6DS4Ptj5m3ie70EYjMKlne3jVa3apsa85iA>
    <xmx:Eju6ZRYbn8KVy8OKtxxGhphPJYK7hkPr-0nR3kVHuqgEVOLQ-ajXxw>
    <xmx:Eju6ZbYQoBgN0jHqLpT2e2qbjTmMJK9j8MT92icVILBX6FgmkYYPwQ>
    <xmx:Eju6ZcCcVgApbtqlmfqM5IEP6_GauVxSpl-c96NNvJvqaET7HeYj1g>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4623D1700093; Wed, 31 Jan 2024 07:20:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3cfd95bb-93ca-4f40-9e1e-bb2526789161@app.fastmail.com>
In-Reply-To: 
 <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
References: 
 <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
Date: Wed, 31 Jan 2024 12:20:09 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: Anton <anton.khazan@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Is there an efficient way to delete multiple elements from a set?
Content-Type: text/plain

On Wed, 31 Jan 2024, at 8:14 AM, Anton wrote:
> Hello, I've been experimenting with nftables sets for the purpose of
> geoip blocking. Let's say I'd like to add ip blocks for multiple
> countries to a blacklist or to a whitelist. Perhaps the most efficient
> way to do that would be by combining all required ip blocks in one set
> (for each family). However since country ip blocks are a moving
> target, I would need to regularly refresh parts of that set. My idea
> was to delete all ip addresses corresponding to an ip block from the
> set and then add the updated ip block. The problem is, this is very
> slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> ip's from that same block takes 14.5s.
>
> This is how I'm doing the deletion and the time measurement:
> printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> | /usr/bin/time -f %es nft -f -
>
> (the test.set file stores a comma-separated list of subnets)
>
> Is there a more efficient way to do this? I could of course flush the
> set and rebuild it every time I need to update some part of it, but I
> thought I'd ask before deciding to implement that.

Indeed there is. Your method isn't optimal because the command substitution causes the shell to needlessly assign memory for the sole purpose of containing the entirety of the output of cat(1). Further, cat(1) will have to complete before the printf builtin can even be executed, which defeats the asynchronicity of the pipeline. You should feed nft(8) with a command list instead.

{
	printf 'delete element inet test testset { '
	cat test.set
	printf ' }'
} | nft -f -

If you would prefer to express it as a one-liner then you may, in which case you must also terminate each of the three commands in the { command list } with a semicolon.

-- 
Kerin Millar
