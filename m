Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F02DBF40
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758970821; cv=none; b=beSY7alxMpRxtYPcoecCaqDA/X85bBAWefn4hhbrGEFTykHhxM71eY5SarI8hi6h2FuZhR7lcNgZWmEqTowT4u3BzO6N3wJ0mfryphu8FHFafwEM2qjezbyuqhP7byzm6cGi0AK8+xG9RS5tVpUt4LOXryhFhXm3G+ex73qJHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758970821; c=relaxed/simple;
	bh=Z09dJPi4mlPeBtuS5kPYz9NUGgSBjBQ16RK3IUxThAM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f8zsQ/LP96AGe5tWYe4wFi7plzzjqhIeNutt008xHJ70wYiF48fd52xs8GcGmsf7kZo34YNkwhxw2ARh/h9qxatqe+yIpdTcKkY+t3nxriy1Q6D6nWRP28oZChEXjfMw+sWLXi7EOOCHgr2nUIhURPOmhC/X3471ulP0odV8M9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=pnnKlU1/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TvedFVcn; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="pnnKlU1/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TvedFVcn"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 32DF17A0160;
	Sat, 27 Sep 2025 07:00:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-10.internal (MEProxy); Sat, 27 Sep 2025 07:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1758970816; x=1759057216; bh=IjrZrVkv/tlcbSJJlrmafKYN4uS0Oa7t
	1GrMYQCz2ow=; b=pnnKlU1/HJRYfk9rP2jnTomRFayK6OPOXYGLhiDJPPhbXpwz
	EpSIHwIiDfy1diLQSJd3REQCaHeOpYYEUM9EnKgUIS8DoLZej1QuTLizPAMYvb3C
	aOx9T+k0FdYSayw2W98DnEf9LzzmgCO9GY/r+rxFmZvLi6TiqwDE6PVBI5Lr5nTB
	lWTdKT2SXO1JokFOsDEKtdFvaNIeGuMwMSMxE1mAT6DtWAb6Ze/ysYH+tyvdhkCv
	zPBG/u1zlQoc31s3xw9MqBCYP/666Mf5CoQ9feAE6QNk6swsQlYAcA9ci0BLVLug
	+iJzcvCFG+rCX9GfqGTIdIvwiboKb7fsNtzmVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1758970816; x=
	1759057216; bh=IjrZrVkv/tlcbSJJlrmafKYN4uS0Oa7t1GrMYQCz2ow=; b=T
	vedFVcnX92wwlMrdTZBb/fUI5q8ccH2g8vVVOT40bgvpL1v37cqQO0plQolbPNMM
	LmjXDjJDGZShsgstjBtcdR088lvjlYq5D0cbhsOGWBnXvopF87rt1bncpjsu0M7F
	H4XxYdLKvhZPjOy0+qbmCO8Tg3360QucO4RcA8CYzGhwOz9SRZp27RCB+om03Cax
	7Adhn/1jBw1FylNxblcAS5W8LxqTyhswXfg+a2B+Pkb/7FHCnglZc2v4pE+W62mq
	/sx1wnUmbcQywFqIQ8Do6hgzMD/EXrIeyHQwypJZlmu393SwhRV+i2SYJxn4iB6r
	BIDJOfNRSGCWDOTWaRdUw==
X-ME-Sender: <xms:v8PXaCw323ZCcYhlYdQle2lP1yOkdMoGZm5EZ-QDCU_RVmhdMlFf7g>
    <xme:v8PXaJHZBm8M8iKGqVJtt0Xcusc0earzvl_xtJcnhXr40YVTATGtQxl7BaYQSAj-e
    r_igFlbAl-bkOB7NSOCWW8Ct60r1SauCg3X2o0pAXtnyRfK2mVj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejvddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhh
    khgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpedtuedtfedvieevuddtheeiudelue
    fgtdefuddtgedvffektdejjedvteffvdfgudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsg
    gprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvhiggehj
    figvvdhkvgiflhgusedtgidurdguihhgihhtrghlpdhrtghpthhtohepnhgvthhfihhlth
    gvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:v8PXaFfBUV8Am-LyeZw3jxQ2Jm6gRDRsp4hm58KQkSgEOmL11ZIWuQ>
    <xmx:v8PXaBLFkd-QgnJU3Ld37jyRkBShpghP4LJSEU5elMEFFv_7Q39EkA>
    <xmx:v8PXaGGSfVqfV46CB4WLV5xAxGkvz1ZlkJBU5v5mvGj2Vm0KogotdQ>
    <xmx:v8PXaLpk_gV3ETIN0Ds5tehU8cGs-4170tAI4Yo0riT9vJExbwO2gw>
    <xmx:wMPXaJhwlLtPBLPCRxEA4JStcDOL89J6ATDhhl6F1ou6UZohIR8p7IC3>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9D9452CE0072; Sat, 27 Sep 2025 07:00:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmmvrmHs2kGs
Date: Sat, 27 Sep 2025 11:59:54 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "0x1 | nftables" <dvx4jwe2kewld@0x1.digital>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <5f21dad4-bdad-4b03-bbfd-c767768058e8@app.fastmail.com>
In-Reply-To: <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com>
References: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com>
 <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com>
Subject: Re: list elements of set
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 27 Sep 2025, at 11:42 AM, 0x1 | nftables wrote:
> Thank you for response and deeper insight.
>
> the following command seems to work:
>
> sudo nft 'list set basetable mx_bans_cidr'

Note that you omit the family here but nft(8) assumes "ip" in its absence.

>
> output:
>
> table ip basetable {
> 	set mx_bans_cidr {
> 		type ipv4_addr
> 		flags interval
> 		counter
> 		auto-merge
> 		elements = { 1.1.1.0/24 counter packets 0 bytes 0, 2.2.2.0/24 counter
> packets 0 bytes 0, etc ...
> }
>
>
>
> The output is a bit "verbose". Is it possible to retrieve only the
> ip/cidr elements without the "table ip basetable { ... " 
> lines?
>
> I still have to use cut, sed or awk to retrieve the ip ranges only.
>
> Ideally I would only get:
>
> 1.1.1.0/24
> 2.2.2.0/24

You could parse JSON with the popular jq utility, or some other JSON parser of your choosing.

# nft -j 'list set basetable mx_bans_cidr' |
jq -r '.nftables[1].set.elem | .[].elem.val.prefix | [ .addr, .len ] | join("/")'

-- 
Kerin Millar
