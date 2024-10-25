Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F7202648
	for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880083; cv=none; b=aPYEQf62YkHxyUuK6jByOGnAqDli9JULyQfA27D1WUOF+ALSl1O85YUaWWJby8/djckc3X/Tc4HC662cGJo2mm5U7YdkXBbWHxfsS4ZLajAUqKutvvqDGGz9rh7X9edANVzIzxtCCe9ygT46mBuvaRKWAIYuM6k5YYH5Sr8K1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880083; c=relaxed/simple;
	bh=R0Chre5io/Wr2XAcBY5vzpxHgf9IRiPJBoVgJuk+YU0=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KF1NtE6F1eGBcm7NvfM00kSi7dgkvHO+Qlw2r6RLqEopdhWRfuaDYoC2/jl7sVoJVwb+oHW6l1237/G2OlJit6Zzp/I9g3F9WDQb9M5RnVIZy8LOJvTb3ADPX8GOysJ8nTowvu5q6vzgaQsglNbWaapBkdWuImi/gD3UouLrD64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=egCTf2fQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZU66LC2J; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="egCTf2fQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZU66LC2J"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BB35211401E4;
	Fri, 25 Oct 2024 14:14:38 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Fri, 25 Oct 2024 14:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729880078;
	 x=1729966478; bh=JymYO4ZlvmoJQAP7SefekxVKrvh3k0LLfy/iW021aCo=; b=
	egCTf2fQqLgRISu8Ta5MKNojK9IRljWkqQxXHX3jKae38IP5NGK5bRN4gkaGIIp3
	d27VSXTUwDBX4Eu3VsIB/ogaI6rMe5b/YXc49fM5J+EIohspFSyfN4ViS5MVRvGX
	PMJbH+MRWGcHL98mNM3YQblZ2ld0/WfP7GQzf/lk/sCoNW47dQJJV0GDd6yyDKNh
	OHJGNqaC1FE1+c8/mfSwbecguy5I+WlbC4+sEhNGc8x0m68fMhSguYgoCOaWLk+x
	Ha/MjradRKlo86c7obFO2aPX0Ur6qrMYbNtD53A9pPpzySraFQJIYPvo7KKeAPkO
	p+Gz/CkIkWeUztwVaLZA1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729880078; x=
	1729966478; bh=JymYO4ZlvmoJQAP7SefekxVKrvh3k0LLfy/iW021aCo=; b=Z
	U66LC2JDNhTuqaSHini9Idc1H7KsHHKHO7AGVhqcfdSEjtrgtyZzZ9xWPjemseKn
	HD7Bc6y5ZOq9/w2Sf2sMWznxMC43mPraZIA6QKTPIIowF6Tq4FkT0LhRflsyNYZS
	G4JRnT6o4HEhxSNrnm1oOoV6Mtn8Q/MW7dI77CNAj4fXqWP9eiduFTj0a1IQPx2q
	in3KXGwFDIPPiAtfLj50W1sDuN/scasL2lpvhIlZk6YIsKvu9OGubdGXN9+1OHBM
	wE0RlT51AJMHLxFBbBmkKR26b6AyP42+fAi06kxz3Qe0HUH1KomVlBGGDlDWmhc2
	zHxn9N+TgiWEn317hdO4w==
X-ME-Sender: <xms:DuAbZ6ElLHFLNCewaONS5vBF4AC4Yc1vRqZbiwlIzMxiiaerTt3aDA>
    <xme:DuAbZ7XH_G_dPTMnLGjRjkJuSr70q1dSyuaLv3POzQWb6amKEClwVHATo7FV_i3LF
    vPL2fnxaIHClB44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpeeikeekgfdugfdtueegtdfhhedtheffveff
    uedvjefgteelieelteeltdevfeevvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrdgrghhoshhtih
    hnhhhouddvfeesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtfhhilhhtvghrsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DuAbZ0L-SdIGxYr7UMBNqTT9njqpJUDo3r7BCGUoJh3cQIg7_7vBgA>
    <xmx:DuAbZ0H6q-kx8mpDkxvTT5DmgnPWt4r3qUPMS_XQ6q3R9xBXy0mcEw>
    <xmx:DuAbZwW4P09Fcg8KXDtIHHtXX1zji3zC_qXeRPTyFfQXs5WKZ2C56A>
    <xmx:DuAbZ3N0-HiqpyhPYDjCDWmE6LjhY-XkmaWTUpPDR56Fb_MQFkIh7Q>
    <xmx:DuAbZ7esVZWEaB2DD3bI2dxoFzWGSA44HQ4rCzPdWWMBTl_uppt9rffl>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7AC2A3C0066; Fri, 25 Oct 2024 14:14:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 19:12:56 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Francisco Agostinho" <f.agostinho123@gmail.com>,
 netfilter@vger.kernel.org
Message-Id: <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
In-Reply-To: 
 <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
References: 
 <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
Subject: Re: IPtables rate limiting question
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 25 Oct 2024, at 4:19 PM, Francisco Agostinho wrote:
> Hello, I'm trying to implement a rate limiting for my machine using
> iptables. The use case is to do 2 things:
>
> 1) block traffic from the same ip+port combination for 15 minutes if
> it gets more than 10 hits per minute.
>
> 2) block traffic from the same ip for 30 minutes if it gets more than
> 80 hits per minute.
>
> For this I'm currently using these rules:
>
> 1) -A PREROUTING -p tcp -m tcp -m state --state NEW -m hashlimit
> --hashlimit-above 10/minute --hashlimit-burst 10 --hashlimit-mode
> srcip,dstport --hashlimit-name test10 --hashlimit-htable-expire 900000
> -j ACCEPT
>
> 2) -A PREROUTING -p tcp -m tcp -m state --state NEW -m hashlimit
> --hashlimit-above 80/minute --hashlimit-burst 80 --hashlimit-mode
> srcip --hashlimit-name test80 --hashlimit-htable-expire 1800000 -j
> ACCEPT

Why is --hashlimit-above being combined with a verdict of ACCEPT?

>
> But it's not quite working, as soon as it gets on the list, if you get
> another hit the timer gets reset to the default expire time and it
> gets blocked on the first try even if after the expire. So are there
> any suggestions on how to achieve the use case or what i'm doing
> wrong?

I would suggest disentangling all three of the following concerns:

- determining whether a rate limit has been exceeded
- adding to a set of banned addresses (with attached timeout values)
- consulting the set to determine whether a given address has been banned

To that end, consider taking advantage of ipsets. Below is a sample ruleset in iptables-save format.

*raw
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:limitban - [0:0]
-A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
-A limitban -m set --match-set banned src -j DROP
-A limitban -m hashlimit --hashlimit-above 10/min --hashlimit-mode srcip --hashlimit-name test10 -j SET --add-set banned src --timeout 900
-A limitban -m hashlimit --hashlimit-above 80/min --hashlimit-mode srcip --hashlimit-name test80 -j SET --add-set banned src
-A limitban -m set --match-set banned src -j DROP
COMMIT

For this ruleset to be loadable, you'll first need to create the ipset that it references.

# ipset create banned hash:ip timeout 1800

-- 
Kerin Millar
