Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABB1E86F
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714001201; cv=none; b=MG49KY3RvFYyWMJDNTIfyEfv4LD21OlnplxA32bD1xV2TXaUtH/mNojRieaUavs9CE00ZoTz5E9ikHi67njMsetsRsZVTwo18hbBBjuE4lqi62z7wzegsKNquDXlFzkW34Z1LB3keS9+2p3/w1vFi25NalcyLVN5ZKFdK1Fsm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714001201; c=relaxed/simple;
	bh=7w1eHbA7WPbSu5EpRTpzmkw/kbdP03j+fi893E+oINw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=Yvjp3Mxl9TnQB0HkMg4MNZcfehDs797aTAIAZrJnT7UEqWA4xeHPcnjqA9ZR2c0soiuolx4uODMCfWYmgxVyvKR7/v/qbSGlVAE/cYdRAX3C+1SDAtHvmX+jLoeNSocdaSgBvCGPbH+KoozcvsRvMZZNgKmz8YAclQHnZEXBHc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=uMty12i5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rbfg9L8s; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="uMty12i5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rbfg9L8s"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 8A4481C000E9
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 19:26:38 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 24 Apr 2024 19:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1714001198; x=1714087598; bh=cv7VRAo09G
	EzQ3JF8Pf2+17nsbncWP1VfqEXJ6KNYMY=; b=uMty12i5mbEOVQPGnoW2NZ0fYS
	o02Wm/AmEpZrg1LE0lue6Gc87RrW4/niP0DvcdGFia2CW2x2kQCEKjwSH8x3wBtE
	Fu4tXMMT4s56SlJIwNaBiVBTCdzt8022w5SRAAdg2cD+QN+zh1rH3KcJ7iVayEzc
	tEX0wUWiEU2sfxLhNihyoL2JGeSjt72hQq9B68T/MLdROIXQ+RobJRZ5yJzhKZV4
	UXXWhXhAFbIsV1gepRuL0n87kv3F4gxZMgVLvDEOn78ZJiUrvPp4TXR0aA7bBzyn
	PGlCvfOCEj2Rwo+wZtVH6w5TUQjD5zp4SFc474K6+9H5aX+GgP2Iwv1gDMiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714001198; x=1714087598; bh=cv7VRAo09GEzQ3JF8Pf2+17nsbnc
	WP1VfqEXJ6KNYMY=; b=Rbfg9L8sjRh0/CR0P3ZRI2xKvZ+WgAsG7OSy7bDMkaYJ
	iqhkqgwsKDZBDOG42r24e/pRGRuyhq1krHDH6Rg/YuYjNgp/X13rVgIiiksyNO08
	dLmzxKvtzuoZT9X0swM+6hCGrwdvYNOgGJ9I41eTkbYFp1NWyAaxThONzA4CpwPY
	yUxra29HghImD0sfyOJbYeum480EKwOGHtOlVr7ssF3Y9ImYwU8uTHZknGma+Yxj
	Iu0jFvOI3MuJ77aGsDYq8f45B+gNSxzFTgSdmiwnNLulswwD4oNjtLAOOgxkol/X
	ifj7zTRW8xLnp43cKroMSnKSHJHj8dXprxDKhjCHPQ==
X-ME-Sender: <xms:LZUpZqQVp_MfJ0vKndHMiG-41jpJzlnpowHiqG8Yf0dPT3GejUeUIA>
    <xme:LZUpZvyqu07Dl6DlbIGxQyxTXGpPzipv0-LWU5qfiHio0P_m_82QvL9KoevFgh75P
    T05b33QNv-ki3s4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeliedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:LZUpZn2NNkF1bDYkHRLkAqXeVE3YiERC3TUb39FWOO3VLv66Bqe9dA>
    <xmx:LZUpZmD4d-G0SbbX4DgY2f4sAnKPQtD86w7uk_gilMmGGJ0f3VKEfw>
    <xmx:LZUpZjjF_j2bn6MmVl3MxpjKySgnaX7H4gwBc9AWEtMWzokl0OrQTw>
    <xmx:LZUpZirlMCtI-rYMNFEmKmcvYGpIVoP5qf5SChDh54yTBbPM2E4O9w>
    <xmx:LpUpZjL9RogoXOuiTRWX_xYOnM8oy6NEKwts6NnMIeezCc1Au8MzS8y8>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9A37A1700093; Wed, 24 Apr 2024 19:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <eb3a3017-e09a-4484-9a48-abf3916e25c9@app.fastmail.com>
In-Reply-To: <20240424192033.5f05ef18@localhost>
References: <20240424180331.3dfb6fc4@localhost>
 <3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
 <20240424192033.5f05ef18@localhost>
Date: Thu, 25 Apr 2024 00:25:31 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a dynamic ingress device(s) list?
Content-Type: text/plain

On Wed, 24 Apr 2024, at 8:20 PM, William N. wrote:
> On Wed, 24 Apr 2024 19:49:28 +0100 Kerin Millar wrote:
>
>> Rather, "define nics".
>
> Yes, sorry.
>
>> You mentioned the use of bash, which is capable of serving as a generator.
>
> Thanks, I know. The thing is that nics can be added/removed at any 
> point in time, not just at startup, which makes it more complicated.

It does. Given that this cannot yet be addressed by nftables alone, I have an idea.

1) write a tmpfiles.d snippet to ensure the presence of a dedicated FIFO
2) write a script that continually reads lines from said FIFO
3) write a .service unit for the script
4) write a udev rule to assume responsibility for writing to said FIFO

The udev rule would need only to respond to the "add" and "remove" events for ethernet devices. The command/script invoked by said rule would need only to write a newline to the FIFO. The use of a FIFO would obviate the need for the main script to be reentrant by ensuring that events are responded to in a serial fashion. The event loop would be trivial to implement.

# Opens the FIFO in read/write mode to keep it perpetually open.
while read -r; do
   # An event arrived. Execute the generator and reload the ruleset.
   /path/to/your/include/generator && systemctl restart nftables
done <> /path/to/fifo

Combine all that with a partial nftables.service override to ensure that the generator is also triggered by an ExecStartPre command and it should do the job.

>
>> It does not.
>> 
>> # nft 'define nics = { "enp1s0" }; table netdev t { chain c { type filter hook ingress devices = $nics priority -500; }; }'
>
> This gives segfault here.
>
>> Perhaps you need to upgrade nft.
>
> Here:
>
> # nft -V
> nftables v1.0.6 (Lester Gooch #5)
>   cli:          editline
>   json:         yes
>   minigmp:      no
>   libxtables:   yes
>
> On Debian 12 stable.

Alas, a vendor's notion of what is 'stable' counts for very little in practice; they merely pretend to backport important bug fixes. This is an ongoing issue for nftables, which has many bugs. It is at its best in a rolling distribution or if compiling by oneself.

>
>
>> Can you provide a minimal ruleset that reproduces the segfault?
>
> #!/usr/sbin/nft -f
>
> flush ruleset
>
> define nics = { "eth0" }
> table netdev filter
> delete table netdev filter
>
> table netdev filter {
> 	chain ingress_internal {
> 		type filter hook ingress devices = $nics priority -500
> 	}
> }

I see. That has since been addressed, at least.

-- 
Kerin Millar
