Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710039FE0
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706740792; cv=none; b=dNPM7C2SCZX+FUoYZBevSmJtR3qRT2rwFR0ebX0LGNxHWENPKf7OuPMEI2PJyFt8bnJa4CX1KTNT8Uay6z6V6AnOotBdL/T4BK1RRWBFy/SkI4tluQ/iZzJpRNa4j8glaN+jlHiWZChu7obtXCUw6y9W5ZA67Hx2wOO9TtihQNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706740792; c=relaxed/simple;
	bh=WiI6QKo5oM+FBEVCt/mKZfz/JzxHx90xWXuytt0TEyU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UpPhzpi3r5sYPr+PBAQCKkDgPwB/qgatV38kSu+mvXbCqzbLydH8c7pM5jS8jLpIhetUlKBevo7qdW5mrsL/wA5H6nKFD4xwSMGVQ9qdGUjpzXA164yEUCweKoIOReuzwfRnXy74E9QWB6ohWAi+PtJ9GVT4LjM1H7Zq4oVsGkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=2sSWMtCQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v0XFZlOM; arc=none smtp.client-ip=64.147.123.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="2sSWMtCQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v0XFZlOM"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id F1F733200B4F;
	Wed, 31 Jan 2024 17:39:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 31 Jan 2024 17:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1706740789; x=1706827189; bh=hFczB1RNmtjI1pGC2ptZwYWWq/FrM68Z
	Ai9JxSMm6ok=; b=2sSWMtCQtNcmiO1JpRIGQ028mJNNPAVNaFqgCsNVuL0MzMtE
	VQy1MlbZDPAOSmyAH0LqgJdNd2FGIeBt99CfMXfqSkhOtZws8dt5zadfIKA8NBYp
	j09PwjOqGLkzV3XK5CSpeaWWsIka3Y8q7ksjHgcTHwEBG0Byz1VpWlCwNaoBZGQr
	4P8/tlfUiWcBKxs2NJueLHJP9Ajhdl+LmUIEWGOFzw/hCUlt7ujgXUiNSEBA3qW4
	BC/z3Jsm7V3bNh7RGtw8nAyamPyd9VcDJPShGbvdy9c5KlVy/L1lLQqS1irF4hjy
	bt+5sii1apH3dSLS8/55sgN8E+DNsx/chvVLWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706740789; x=
	1706827189; bh=hFczB1RNmtjI1pGC2ptZwYWWq/FrM68ZAi9JxSMm6ok=; b=v
	0XFZlOMQ1z9u1WVeaoKou0saKjdKFIP8qQX6YFVaitDvRawKrGcyTtmqZ/qblU4Y
	2Qzqh3sFWj5OY7ETAHZbdRJS5QEZUUGW8OEDzm7bV9IS3AKzo+RP8IusrwHZroS9
	6fgWA2eQ6+XtBEgm0Ga/mlCHLm0Ti/6yggJQ3I20EiFwu/qR+UaTCe9t5t5ghmZi
	IyKbJkwvq7INFNg0IsGEbSWE1yhNb0ydS1zHOg9b/mng9R9ImQNBmb1hh5Rzj2/r
	pLOceb9+tVNjOlzv26PbqmuaszL0+5+Rs0VpKdhvMgAiFaSPQvMZ5mxjycZYT40d
	MqZh0OwzIHqS1AUFOtXrg==
X-ME-Sender: <xms:Ncy6ZXIYoG2kf_Vs5okCr25NODxgGebPo35JYyjN0qTTPjMSTgweHw>
    <xme:Ncy6ZbLwLjBGDMBeEF8NZMxDoyUCFVcOCn7jROVzj0TElhBny6awO5FXCyvs781rd
    6lUPL-z4fGkNGlL>
X-ME-Received: <xmr:Ncy6Zfu_tOcsNIWJOv4FnYMyLBbIYf9iJvU0g4Cv3N4WP4gy3uIgixET55g-p-opTvpji6UdEJJAHllwMY2C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedutdcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkjghfofggtgfgsehtjeertd
    fjtddvnecuhfhrohhmpefmvghrihhnucfoihhllhgrrhcuoehkfhhmsehplhhushhhkhgr
    vhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeeihfettefhgeeftefgheeugeeffeehke
    dukeefffejgeeutdeggeejtdeihefhveenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:Ncy6ZQasuPYItTzlV6zhuPjR2Why_KIEtCWarQgCE2TzhGHfRsQOfA>
    <xmx:Ncy6ZeZm-vyPl06YO7IJAF7iMiOrDCbfTCPG3uaQ-UV4bZAme9NahQ>
    <xmx:Ncy6ZUAQ_396h3qrIHzUrdQvzJs3P79Niuwv9n0psl6NcEc9ggeqPQ>
    <xmx:Ncy6ZRzy2jKdV_2Pv5S9op0ZDkWq1PuWoOBBnOzuzw9K5icRhOOzAA>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Jan 2024 17:39:48 -0500 (EST)
Date: Wed, 31 Jan 2024 22:39:47 +0000
From: Kerin Millar <kfm@plushkava.net>
To: Anton <anton.khazan@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Is there an efficient way to delete multiple elements from a
 set?
Message-Id: <20240131223947.525533518741b6cae01e2d6d@plushkava.net>
In-Reply-To: <CAJE3=wmhLSHY7Gqg7vHX_SAAYKx-PMQFC_i2iEek4mBnghyAbg@mail.gmail.com>
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
	<3cfd95bb-93ca-4f40-9e1e-bb2526789161@app.fastmail.com>
	<CAJE3=wmhLSHY7Gqg7vHX_SAAYKx-PMQFC_i2iEek4mBnghyAbg@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Feb 2024 00:13:37 +0200
Anton <anton.khazan@gmail.com> wrote:

> While this is better in theory, in practice no performance improvement
> is observed. This sort of detail is worth paying attention to in a
> loop. In a single operation, the 0.01s saved is insignificant.

It's not true that it is only worth paying attention to in a loop but I won't argue about it here. Suffice to say that it depends, in part, upon the ability of the program reading from the pipe to perform useful work while reading. There are plenty of programs that can. It seems that nft is not such a program, which I suppose makes sense.

Anyway, if the performance of nft seems unusually bad for deletions, it could be bug material.

-- 
Kerin Millar
