Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB033D68
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713984592; cv=none; b=boI2KTUFg67GWL8FYEWvHPff2DbfVV1h347nMlijZWLStdkQ86XFTSIO5GU5Z+HaOk4iDGNcf47eRHX8KtAq9yJc0pAW1Atr63ocrU7g0PsCALhfVV/SXVUCFsAz4y2zLs6ZNUtrfppEUijmCX1hLUoH60rQ1kThMnxjYg6ZiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713984592; c=relaxed/simple;
	bh=kW6aT5OOOVQD1DDu6r8La0Zg682hnHxKJ7pVKuCKidI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=KZoeE1iBLmLT9Ry1s2m8dYpjpTUr8P1ks0P7rqjJK1IBbV9t0sJEoJqIc4ue8nMIcmlLATcGq5rU8uyhJRXamGBMsh+aiCCxz1C+Zwv7OWUJ/xh8j0iXWt52bwHjyuhMCTbSDw783fs23nVOyWhMKntjWAd+/ditLjF9yFUqVEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=FTS+tLhY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BT6ucRIf; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="FTS+tLhY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BT6ucRIf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id BAE5818000AD
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 14:49:49 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 24 Apr 2024 14:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713984589; x=1714070989; bh=msusD4SpSj
	yRw71cWhd8Ujn5fo2kQmyOSDYN9YaFOhU=; b=FTS+tLhYVid3GJrL0zFSPkIxHn
	eM+wW3QFOyIhYgUnvMgiatKiU7n6BlJj1Y+39d2FBXfFN2+lYAUIIObKNW2uZv9d
	++E2VjJraxP45onNMhVYdhYCts2HZC28b7FJczgZenTGO+0Poj7Mrj0ZjbfCIMXj
	oKYeAxht4q5yKD24ZWy4WGhuEpfEs8//sL+UVTc9tP6wD4ONpYA51tHOeEqI3WT0
	cRYc7EtCWe4aPHljmXqhMYPSYsA2M8tDluSIXOpi94zQ1CPIN6oA9izWvyaYAPeo
	HyJUFMRhGJYXt+yd2949yZX+lOsymkSbEPIT/cByw+qtBQvvxRJucz0ErmBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713984589; x=1714070989; bh=msusD4SpSjyRw71cWhd8Ujn5fo2k
	QmyOSDYN9YaFOhU=; b=BT6ucRIf1c+mMOZCECvspEHFIb6VdhC6hqBNh6O808XH
	4TTEktSV/x/v3CeYGI4IOYmDrQGAyQPeL7LnCDM+sqi2hRkFeJ1iwb+ZLYo67Au4
	s0XlnWkNOoxPSMwvJHTR8GwcVma7Hmrk2cz8EDzZq6+UU4GLq5LbENXxE/gGRT+k
	ad+vZ6fXLwrNf4S0P09fnyx3vbCMFvgWKQXWe0+TzjN19w4ujSifU7YohWcaJoqL
	s39Ni1RqpNFZ9PI5sbrVVPdJYOnIopCjHrj0ALodyIr12dFI9MXZ5+U7H4WBeFB5
	9pUv7xAUzdmTr74OHB4Q1I9RA1JjHYAUVoBi7D7AFg==
X-ME-Sender: <xms:TFQpZiUmMUyoKyRAkBKp4fKgORv_1bdkAzSW2-CsM2rDlZqr4zivVQ>
    <xme:TFQpZumXRCFgKKZWI6qn5WfcOv0QoGBnXrSDgMbWb__Gfck5mkXzsLq5g7VByUsUF
    19qQTr05ilnJNvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelhedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:TFQpZmZc3NqQ525cj4yxarKdDRtn52Nfk4elYj6W3pVOj1qakXlTXA>
    <xmx:TFQpZpVnwhHh86cMyozJE1LTq_iGtSEsE6HnQYVuUUq8KW5sBCO02g>
    <xmx:TFQpZsm8dShFZJ4aKZ3nmSIUd_G9RQYqcvYjRNQGibCJ9J4YVICcNg>
    <xmx:TFQpZueT8Nl1jwcLYhRHsKdgPfPjZvgb59AKVIN213idAQeg07Kwzg>
    <xmx:TVQpZjtg1vC3P7Ad98Z4pfgSJ1XPOisMBw3RfqLZg2s2PECqLuaincBj>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A946A1700093; Wed, 24 Apr 2024 14:49:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3b215f04-cf5e-49d3-9166-3806b3e53471@app.fastmail.com>
In-Reply-To: <20240424180331.3dfb6fc4@localhost>
References: <20240424180331.3dfb6fc4@localhost>
Date: Wed, 24 Apr 2024 19:49:28 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: How to have a dynamic ingress device(s) list?
Content-Type: text/plain

On Wed, 24 Apr 2024, at 7:03 PM, William N. wrote:
> Hi,
>
> I am trying to do this:
>
> # dynamic list, updated through a bash script:
> define $nics = { "nic1", "nic5", ... } 

Rather, "define nics".

>
> # ...
> chain foo {
> 	type filter hook ingress devices = $nics priority -500
> 	# ...
> }
>
> The problems I am facing:
>
> 1. It seems the perfect solution I was hoping for is not possible:
>
> devices = "nic*"

You mentioned the use of bash, which is capable of serving as a generator.

nics=( /sys/class/net/nic* )
( IFS=,; printf 'define nics = { %s }\n' "${nics[*]##*/}" ) > /etc/nftables.d/include-me.nft

>
> 2. If there is only one device (e.g. "nic7"), the syntax requires:
>
> device "nic7" # not 'devices' and no '='

It does not.

# nft 'define nics = { "enp1s0" }; table netdev t { chain c { type filter hook ingress devices = $nics priority -500; }; }'
# nft list ruleset
table netdev t {
        chain c {
                type filter hook ingress device "enp1s0" priority -500; policy accept;
        }
}

Perhaps you need to upgrade nft.

>
> Trying something like devices = "nic7" results in a segmentation fault.

Can you provide a minimal ruleset that reproduces the segfault?

-- 
Kerin Millar
