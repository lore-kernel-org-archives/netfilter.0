Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51D1A9B48
	for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568488; cv=none; b=sQG1Hfuyq9WdM1ts1hUscrKAevHZJ+rsRuZZxIzpi4MHvdnKY0GluYuv5KtGnNHvWdOmdpomifSQmWEpmjB4iWxkTqPhMsEAYczvWYvJNz82Pt5IjKqBTUf0Gj1FMn+yuKJLQGyumHG3cKWtWI8EOcfXqfxl2ECtEfSfTO55Ar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568488; c=relaxed/simple;
	bh=ZnHJRcsR8lM2Jlr1jJrqfKEHXAFraDuZyc4VE6TXfUE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mfCV5Es8HdjDrFl1WOjFANYfNVpPQwM5ss14A+2uZV1T6bQN6+poGgPDuVEo3mFBLTsu9og0oMWQ0hQTxbw201qGPAZY5+xcJ/P/ZMJObUYf8cpJcHIUiJw7Aowb78t25Nox3rHyy4RxT5rIXsA5yxf+0VQANttFznaslbReKL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ciZgf5i+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q/lAd6Hk; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ciZgf5i+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q/lAd6Hk"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C11A911400BC;
	Mon, 30 Dec 2024 09:21:24 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Mon, 30 Dec 2024 09:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1735568484; x=1735654884; bh=6iolNtSDmSXtFGRVcActLgZl7uFMRTuM
	FIaSrOqoO9o=; b=ciZgf5i+M4XIh0niMLL6fogRTIYjl80YKu5Crel08Yu5tfyX
	m23U0JAcXw0CzIg8nBWMArDLy94Ea5FnHjG6uefP56zsc6EkH/3ToAS7yNsngXgA
	e04sQcFJHLKAnxuY/DI6E/Ghvn9kRTghu0Kp+fjSRH7ih48U+GoWcKhnLUkUnHxo
	hYCL2tFzko5P1CDIsp4sx+FxtbywqMemwfoq/9Z/MCvj2w1hRWyIRpvBKu0HqvUO
	VODnAR6saL5Y9ao+uMxtv1U1tZkeb+A8K12GTjyDtflz2VvVJdCVhF4QtEzNaBfh
	MoNykeQrZ5CDiRc6RiST9IElEKrvZ9hqFmL4JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735568484; x=
	1735654884; bh=6iolNtSDmSXtFGRVcActLgZl7uFMRTuMFIaSrOqoO9o=; b=Q
	/lAd6HkadzS+ZMyJMitDm444avwteNb8Xy5IRINBYDH7mElMcDARZY5nd39/errD
	SKYmAMp9dgRV59Wg4TuFyCNv2W3rqO1wmqbO3z+L/axODkG8qtA/uL79zJ3acl/d
	ZBG6LKxkJdRDL02DqMBVeGYCUFt1lyKy39V2U0rwI/BvaKD+Ge6Pk1iEJs+u627o
	KFQxg6gwqVBucKGklbf31F01edsSNQfnaXjniYZd8oDUFr5QgIsn8HKJysrdELXO
	SkAopcYsy0lgvc7415oIc54GlQQoWQSDO+80ZE6S+d80gbdLAaixQrdek7g0yvff
	eVYejQHP0RyyFxCYm+HjQ==
X-ME-Sender: <xms:ZKxyZ4n2tRYjSQkrFUPvp6FstyaIerINgdieGL01GpHjfIW6lrLW9Q>
    <xme:ZKxyZ30qO4Onz3vlSESXkMKHml1gLlEzbmHAYwtZytJ-qJVcRrrSK5akBSxGGJwY1
    tngM2KwEAUzW7tl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddviedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpedtuedtfedvieevuddtheeiudeluefgtdef
    uddtgedvffektdejjedvteffvdfgudenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhlhigujhifgh
    esghhmrghilhdrtghomhdprhgtphhtthhopehprggslhhosehnvghtfhhilhhtvghrrdho
    rhhgpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZKxyZ2q9-ZB25vgdeKNAw3POu1jSd4mxO5X4irYEbfKYZ4OdkeytUQ>
    <xmx:ZKxyZ0lOHumUQCvBKZ67QUvWXCbBHdgUXdY3nSm7TmrcluhwtVAUGA>
    <xmx:ZKxyZ22vzDGH-o8HwdaBKO9vMWAeFdj4Xq9CGgoN-SHdarN2-pBopQ>
    <xmx:ZKxyZ7s7JdlTRji1RfKHEi-Tg3aUkkrkNxwyH-TP9yPfmXhZmHISvw>
    <xmx:ZKxyZ0Bd41bO8gl0FAleICmKqIWsCtrafhrMmWuSvNWt6obhMKLRDw3N>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 643CA3C0066; Mon, 30 Dec 2024 09:21:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 14:21:04 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>, lilydjwg <lilydjwg@gmail.com>
Cc: netfilter@vger.kernel.org
Message-Id: <9baf59ed-06b2-48d2-bd21-c1f744b761d3@app.fastmail.com>
In-Reply-To: <Z3J8fo-l0iMglG5v@calendula>
References: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
 <Z3J8fo-l0iMglG5v@calendula>
Subject: Re: expires larger than timeout causes error
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 30 Dec 2024, at 10:57 AM, Pablo Neira Ayuso wrote:
> On Sun, Dec 29, 2024 at 06:00:36PM +0800, lilydjwg wrote:
>> I have an IPv4 set with timeout 2d, but update its elements to 4d when
>> a rule matches. It was fine until kernel is updated to 6.12.6 or 6.12.7.
>> E.g. the following snippet gives an error when importing:
>> 
>> table inet blocker {
>>         set spam_ips {
>>                 type ipv4_addr
>>                 size 65535
>>                 flags dynamic,timeout
>>                 timeout 2d
>>                 elements = { 1.2.3.4 expires 3d }
>>         }
>> }
>> 
>> a.nft:7:16-22: Error: Could not process rule: Numerical result out of range
>>                 elements = { 1.2.3.4 expires 3d }
>>                              ^^^^^^^
>> 
>> kernel 6.10.6 worked just fine. nftables cli v1.1.1.
>> 
>> Despite I can't import the set, existing elements can still be updated
>> to timeout more that 2d.
>> 
>> A new bug? Or a new limitation?
>
> You have to use _timeout_ to override the default set timeout policy
> for your elements.

It would be more intuitive were the circumflex characters to indicate "expires 3d" or "3d" as being at fault.

-- 
Kerin Millar
