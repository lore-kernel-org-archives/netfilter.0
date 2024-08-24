Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19353AC
	for <netfilter@vger.kernel.org>; Sat, 24 Aug 2024 00:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724458156; cv=none; b=kfCL131Jg5o7htOJF6/XaHFslB7dXQUYKjYEfd7edM5ts5cZ7nl4RV3wPdDGg/d5+gEGd5NsqeDyM+QK1VsELltt9AlzNc03igEGYnAdOjaG45HkjX85F7GTHcUhOMIhxYkbflSi+4cHJV+w4q25+My1fxcMhzFePADznInw2kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724458156; c=relaxed/simple;
	bh=yFam02ZM1bdmb28Qj3G7xWYC83oS8CCJWNtLOqPf+a4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oj5A4hWAKbwkD4RBOskSiznExJC64+LWoblBnvvyMvSkYWYhIhlcaFe/OWQqCS5NQ1hZctwJWj5c4TaAYKF5AKBo0jk9cupG2kQsjCI56AeWEr3hA/cxf8VpAtH2tPbWOOXgIe7PbOWM6x+LzkgOsPGs97/0FuDyPyojVW+Ih08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ajdEJIDf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Prh7pssJ; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ajdEJIDf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Prh7pssJ"
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E3C581151831;
	Fri, 23 Aug 2024 20:09:13 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Fri, 23 Aug 2024 20:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1724458153;
	 x=1724544553; bh=QoYUx1OKz3PQnMaE6mV2/5m+2Jx6O8IUe+kMKUH9waE=; b=
	ajdEJIDfLLSWIVZfHSuYpzSRzKieQ2epE/SbBVtVJUnlBzOx8yz06miO1sXs2Vlb
	pdBGkiDgpIH7+0yHIBuWYnw5njKVn7X3zRbwicIn+2BuSdJNIEZsTKborAO9a/VZ
	f1wUboGSsjeIrl1RjaEEiXijz+1V9TY51LS5ON2kZ+QM80rBhKYoTNtRp2+oYQZI
	IiQ98dP/WDyaQpHKM5jKmHkGbtsPaHgjd62UIcRy4Ai7dxz3/IUK/nC3ZlbxVqMM
	VYqTRonxGjWk94k4Mv+NhAVzqfjQjV5fVpZL04m3E0GAqJPSLjWv3mCFenzkupOf
	k+hg4LigKtOAWvPS3z87DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724458153; x=
	1724544553; bh=QoYUx1OKz3PQnMaE6mV2/5m+2Jx6O8IUe+kMKUH9waE=; b=P
	rh7pssJ4xOsP+Opd8jTQPXZ5yps/3K26EjFnaHD/Zb2POHl8haAZtCG6bo0X8+qI
	f4h73bHCq/vQ6o9a7TGsa+DMM6CzcplPc0ka4er/cDKH0k1XDBp2TMeralI9nbM+
	qY0+fxzA44Q8Zrr3wZYl46sa8xRuaVIR+2+N0pwd81qDRA90RvFVf4ZQtFd7lLWh
	t1l5U0QQW4LPx85d6SHzIR8+ipVvMRnLCO5goJaGoHTz8Nf/eoARv+fBkRphzQCK
	YmOuLRyXNqwIuQJR5DHcmadZWNVBpur7ekzDBmJrGAu4YoFCT9+gw0Ob3cT3o4MT
	LxmYlRWfk5Xn8EpiV87jg==
X-ME-Sender: <xms:qSTJZoZ_GFbXrv4lVKR430MvBX3le53uRcde-QiAAzGem4sSk3uMOA>
    <xme:qSTJZjbMfraDf9IGTbP4BPFmdnLz3tpldOlksty_Kv4edCfi4UZCpe8dTAW7I91iq
    VgNLEWsHeljhq1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefoggffhf
    fvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghr
    fdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedtgf
    ffleekkefgieduueeukeegvdeugeduveeiffehffdvfefhjefhleduhefhteenucffohhm
    rghinhepnhgvthhfihhlthgvrhdrohhrghdprhgvughhrghtrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhk
    rghvrgdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepsggushesfhhouhhrthhhrhhivhgvrhdrtghomhdprhgtphhtthhopehnvght
    fhhilhhtvghrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qSTJZi_PnazI75kzsYEbASu7ga2qEGyY8EgzfO1SGGpEdczWDnFtLA>
    <xmx:qSTJZirdjE1YSguUbsJ8poS84YukkP9C26WOY2kqwIpVXP5ugwcrfQ>
    <xmx:qSTJZjqrqR42BQJsCmE89idR7QjIhBdLW71j27fSZLOElAY20rSkWA>
    <xmx:qSTJZgSgciStjMon-vpScvznkDdpVUv1i044SP2cpto9eVJfS-mCvA>
    <xmx:qSTJZsCj7qRSuh8y2Q5X8-sCRtHpM9vY8v8BJRQnXIIJN8zBBRg5Vhm9>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8C1D83C0066; Fri, 23 Aug 2024 20:09:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Aug 2024 01:08:53 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Brian Sammon" <bds@fourthriver.com>, netfilter@vger.kernel.org
Message-Id: <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
In-Reply-To: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
Subject: Re: Understanding output from "nft list"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 23 Aug 2024, at 11:50 PM, Brian Sammon wrote:
> Is there a document that is good for understanding the output of "nft 
> list"? (more specifically the kind of output that comes from "nfs list 
> ruleset")  In particular I'm looking for a description of the syntax.
>
> I've been browsing around https://www.netfilter.org/ and I've been 
> having trouble finding the kind of information that I'm looking for.

There is no formal definition of the grammar beyond the source code itself, and no good documentation for the grammar beyond that which can be cobbled together from reading https://netfilter.org/projects/nftables/manpage.html and the wiki. I would say that experimentation also helps.

>
> The first questions I have:
> Can/should I assume that each line in the output of "nft list" is a 
> separate, uh... "thing"[1] that can be (human-)parsed independently 
> from every other line?

No, though it is possible to compose rulesets in the iptables-esque fashion that you imply. That is, by writing consecutive commands of the form of "add table", "add chain", "add rule" and so forth. However, the nft(8) utility does not have an option to list the loaded ruleset in that way. Instead, it always lists the ruleset in the declarative style.

> Is there something that signifies "this line 
> should be considered as part of the same Thing as the last/next line"?

Depending on what you mean, the fact that it is enclosed by the same pair of curly braces.

# A table (a namespace, really).
table inet t {
    # A chain contained by said table.
    chain c1 {
        # There may be rules contained by this chain.
    }
    # Another chain contained by said table.
    chain c2 {
        # There may also be rules contained by this chain.
    }
}

That could also have been written as the following command sequence:

add table inet t
add chain inet t c1
add chain inet t c2

Commands and statements may be line-continued by way of backslash-escaping the newline that would otherwise terminate them.

# This is a single rule.
meta l4 proto tcp dport { 80, 443 } accept

# And so is this.
meta l4 proto tcp \
    dport { 80, 443 } accept

>
> Should I be reading each line/"thing" from left to right in my attempt 
> to parse/understand it?

To say forwards would be more accurate. In several respects, the syntax is not entirely unlike that of the shell:

- whitespace generally serves only to separate tokens unless quoted
- newlines are metacharacters unless demoted to mere whitespace by being quoted (escaped)
- semicolons have the same effect as raw newlines
- upon encountering an opening curly brace, the parser must look for its closing counterpart

> This is complicated by the fact that the current firewall config is 
> generated by a "front end" package, which I'm also trying to learn.
> I wonder if the output from "nft list" represents some weird syntax 
> generated by the front end package.  Can I assume that the output of 
> "nft list" is _valid_ syntax?

Always, unless it happens to be a hybrid ruleset produced by iptables-nft(8). See https://www.redhat.com/en/blog/using-iptables-nft-hybrid-linux-firewall. If you instruct nft(8) to list a hybrid ruleset, it will include the following diagnostic message as part of its output.

# Warning: table ip filter is managed by iptables-nft, do not touch!

>
> [1] - I'm not sure if "expression", "statement", or "rule", or 
> something else, is an appropriate word to use here.

Such is understandable. Even as an experienced nftables user, it is difficult to explain using strictly formal terminology.

-- 
Kerin Millar
