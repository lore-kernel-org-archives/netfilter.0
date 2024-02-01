Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B915DBB4
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790078; cv=none; b=ORqREi1kfKqEQwYyz7rycDwzZdSxBWJvgLxt3/C5Xqz4F9hf/kweUydpTU4rOr+vRJgsx7sxtQcIE0a6wLClH6f3fEG9r/vfl9C8bHxiLMprd9OtdFler9uwhJlQVCQZ2MVyeKrgog4z3PzKBvUd4tRo5QZTAXH/a0E3gTNeg24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790078; c=relaxed/simple;
	bh=JpT8ow1VU65/UZ1t6Eahke5hIqwnQ66uLxM2h9F/Jnk=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Ee5wpBtzeYVT/6LOa7lOvgkqG7zOEJhoZjqNqoylO1v7ogeUc2UgwL4VQ41xbqL8WqIshJ0T49CqwEVghxCEzWlpOplZTTsNGrezR2I6iQSEZJpVMTp204jpsaoOwoBYSiBSedg/wWuYujVLzBKdIV8FNoJDZ6/imSQ4wS8SNaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=B2LxsKaH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g7t5P8nQ; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="B2LxsKaH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g7t5P8nQ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CBF70114008B;
	Thu,  1 Feb 2024 07:21:15 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Thu, 01 Feb 2024 07:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1706790075; x=
	1706876475; bh=ha6pHSyyXKANRcqPeWyz6vnOY0tSvlCGrW+4aDNzpYg=; b=B
	2LxsKaHLiiQSNm4tnZ/CU/vNMJHROJT/kNmNBFOo68awQuKvBQTPNjXyhoxqZgWr
	3JG7Cavj6VGIV5oDOun04ublSbus3FQootZckuUmX9bCiZvQWlCK/1FqTvUqZiuh
	kRHZnqz6s737e9mnzW4CkqoRHLty6CUmUUzE6z3BnwcEW3uDyXEIhbf+WUFe1oGA
	eRjpk247lGZDUzW5cLSEJby7Fhrm8Lgpo1Ra+UQa4kmLXFK8axH8wHS8mVNcp5dg
	HsIvtyjkiphPCwg4ghvdo7gZubhBgXaxJaemy/iBKMklT/Seod6hVMv84IttemFn
	H3UL9LagoOEK4hkoffm4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706790075; x=1706876475; bh=ha6pHSyyXKANRcqPeWyz6vnOY0tS
	vlCGrW+4aDNzpYg=; b=g7t5P8nQx+7jD/UaBwgRVWR90lFN/AwXHHQFA83W/Q5n
	y+QvNsCZhSf27Dedhjvvbkg9RUGYlPziqYxJtZ39KECuyBpfFVdYl7bBbCQDpof/
	qABjYMrB32PrKscZ04yJV0lB9Z6DzzHbRUHEGjh5J6SsV6phnrCSOXe9obEdZ66o
	EH+hm7RR2yd9XlCBXGwDvQd0uJmOQ2SiB/IiRzLqafw7CnfmK+VQEyn7LfCL3UcZ
	gN40RFmu83vzM1tTPYCVGBK9kM7EeDHhi906v8WpTGuRWG5bb+gv/wKPxmP/0HHW
	PUkBO+Avnjuqgkg3Jq1x1AFIkBfydkXAVZjxkP6bHA==
X-ME-Sender: <xms:u4y7ZfVkWkTsgyHvaPGnuO2mQ3sOQX4gw7bXlxQTO8C0z3BmE9-SPg>
    <xme:u4y7ZXk2AyG_GxwhiN3pjXdfmB4Rf__m2Q2-ZEnBy7E30qjUrtPVOPjeE7bRJ7nmz
    qzH9-fX1527yGS2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduuddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpedvleejheefkeekhedukeeuhfffhedukefhgfdvteegvdefheeitedu
    ffegheeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:u4y7ZbY_Ow7h2slylCWvtjxKHak5owVPAql6oX7IXkiqqPRMHggEUw>
    <xmx:u4y7ZaUQIx-Bt-wsfqdlBOGnRgdBhXrjbQk4dSpNOfdh8cJm4Zg5PQ>
    <xmx:u4y7ZZkYQm21JckGLeaCq5fTEdnj5Gvx_foO3dyIb1UWy0jiI1tH0g>
    <xmx:u4y7Zew_tHQ2yXpyKUsLdx-oluiv8CveKc3YQpco8TB7l_dzmljV8Q>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2C1701700093; Thu,  1 Feb 2024 07:21:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f1787459-57fb-43e9-b04d-bad0e296dc80@app.fastmail.com>
In-Reply-To: <ZbtnQXFtUTkVRZ0C@calendula>
References: 
 <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
 <ZbtnQXFtUTkVRZ0C@calendula>
Date: Thu, 01 Feb 2024 12:20:47 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>, Anton <anton.khazan@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Is there an efficient way to delete multiple elements from a set?
Content-Type: text/plain

Hi Pablo,

On Thu, 1 Feb 2024, at 9:41 AM, Pablo Neira Ayuso wrote:
> On Wed, Jan 31, 2024 at 10:14:41AM +0200, Anton wrote:
>> Hello, I've been experimenting with nftables sets for the purpose of
>> geoip blocking. Let's say I'd like to add ip blocks for multiple
>> countries to a blacklist or to a whitelist. Perhaps the most efficient
>> way to do that would be by combining all required ip blocks in one set
>> (for each family). However since country ip blocks are a moving
>> target, I would need to regularly refresh parts of that set. My idea
>> was to delete all ip addresses corresponding to an ip block from the
>> set and then add the updated ip block. The problem is, this is very
>> slow. While adding an ip block takes (in my VM) 0.09s, deleting all
>> ip's from that same block takes 14.5s.
>> 
>> This is how I'm doing the deletion and the time measurement:
>> printf '%s\n' "delete element inet test testset { $(cat test.set) };"
>> | /usr/bin/time -f %es nft -f -
>> 
>> (the test.set file stores a comma-separated list of subnets)
>> 
>> Is there a more efficient way to do this? I could of course flush the
>> set and rebuild it every time I need to update some part of it, but I
>> thought I'd ask before deciding to implement that.
>
> It is possible to flush the set and fill up with content again:
>
> flush set inet test testset
> add element inet test testset { ...  }

I figured that this approach was already on the cards ("I could of course flush the set and rebuild"), though it is possible that Anton wasn't aware that it can be done atomically.

As far I understand the original post, he is aggregating multiple country blocklists to form a single set - a blacklist or a whitelist, as it was put. That would explain his interest in deleting subsets to begin with. The flush/rebuild approach may well be faster but it would also require reading in all of the subsets again - even those that haven't changed. Perhaps not a big deal in the greater scheme of things but it does make me wonder whether there's room for improvement as far as deletions go. I might test this on the next occasion that I'm experimenting with set behaviour.

-- 
Kerin Millar
