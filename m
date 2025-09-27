Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F0224B0D
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759000807; cv=none; b=b3sQO/i6F97YPdddNp9Y02mOqXK3vtz0tbxnyQ/LNLErVt3aKuihF0aaiZ70apTzns3WCnu93OULadtUGCaIGvxTa/fcZKWoDxuU6wzjiLW3Emymzqphc0PPeOAFMQilNNh6aLuQyTaLRjU9irS5D2DQO6RZ9/LeAlCQAiJ4uBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759000807; c=relaxed/simple;
	bh=bCfGGsLPS+Yt96B8aM4OwI7ehs5huTy14WKbLLYDcD8=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KMW7RdaGv0QEXzfEYELQSQxI2cKXjsAU73JmLzTLcpVeOXebH2ApGqkUar5ormOPBC5DVXTfNpuAA9k92lrgkkc971JyRwLFaBKmsWoh4VzdE8EpJ0dQ/YEaBzV3j/j/0N1MNI9QgnfA+Zu1pGRobRIQ1zgjWl0BA1laCCLtX0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=GbRgnrnx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pU/w6FIm; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="GbRgnrnx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pU/w6FIm"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 87509EC008F;
	Sat, 27 Sep 2025 15:20:03 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-10.internal (MEProxy); Sat, 27 Sep 2025 15:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1759000803;
	 x=1759087203; bh=xgiCoU1hOTTUjTLRDAPR7urS0kOfnLe+77Ow/z6c4rg=; b=
	GbRgnrnxbZkoOYWi1l7Efn3oXcwlvVx4ngIPO9uaxmpEn5r6XCneH/d4DApE/m2C
	V46hjVu1JUEz19X63XlsUNCg85WcEpf9nDioXCE78GdsbB2eSdVPWUwlOxWRNuBi
	M159OYMYu/gGw4t4LdlJnVLXHcXb3ez/NVv/2pAqL4ua/8Y54zMk6gj7kBLkMXN6
	X6hf0yQlCzikvzFLIUt2P8LPn4J5qBqySrl2oWngAMM3FBsWA6pCsQKGmRDgHM+g
	ediricT20XbfWFw1qGxPiJ0VPzHP/IU+SnxbMXxhMCKUqJy7WGpco5ZLJmA0x7YI
	/AOA82djWhJbBw8nJ5ZtZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759000803; x=1759087203; bh=x
	giCoU1hOTTUjTLRDAPR7urS0kOfnLe+77Ow/z6c4rg=; b=pU/w6FIm9URdEZAZz
	gzTwgH36T4RNpIoCIVi1243BxaYNYVlxNjfdsAHaPuojwgJjN4n1tvi3e3gxuIpE
	I+McRSTeYEikHmoD9WUVCY/fpo9bb2MAIbURDUZaT3ZiWH0r7m+GQU/A887QFb06
	KESgY4gV7bQZLX3rfjVIlLDFhu7QdSjLK8V+IADMKgEpC9OCawMyyUJyGMhR/iaC
	+5nrlUJPkjfvtNSQMCW+v3vHX8wfHVtA2r55WKY7G+cAbff6N8NloCgf5LsVgUlx
	axDV2X4G+x7h7oogG4++Y1SLv3xZ2f89GpI813U0Nkj5nMbq2tG1jKXHe+xaksMX
	PZ95A==
X-ME-Sender: <xms:4zjYaCmifvuGkNktvDJbLcT6-CuYjz--tUiNWrXXNkzwkRQdvqHvZg>
    <xme:4zjYaEq19sHmM3uN7SgGCAzdJgh4KYuB275a-ven4EzG7iflswxRgUmX007jprar8
    oG9vU2GX1LHg-e6UjKabq6LcuVC3HBSKtLNFDUmz9YhpgnQGHwR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejfedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthhqredtre
    dtjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhk
    rghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefjeeuvddvudffffdtffffud
    efvdeuueelgedugfekgeekveejteehvdevnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspg
    hrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugies
    shhlrghvihhnohdrshhkpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4zjYaJTlSa7xrN4d_Mf2hok6VrY7Rh5Buaw4gLovgFWn5KqbYSnaww>
    <xmx:4zjYaAsBBL5L-sKVyCraW5Mwh4pOPYlnTNwd-3xmXv-Lyu3PTIctsg>
    <xmx:4zjYaGbRjuoYZj9FnNjAWKRaIRbt-wbLAGZ8xQrflMHP5m3Edzp5Pg>
    <xmx:4zjYaNu3kEoOjw6ptUzEWRGZ9MdyJNmcAnypLHfzM4hcOuGxlIKWhQ>
    <xmx:4zjYaAmjvsU_DB1dUmRo8U95Fgy5kGJ7oa5Tr8vhOg2xLwoRA52ir4hB>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 026912CE0072; Sat, 27 Sep 2025 15:20:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmmvrmHs2kGs
Date: Sat, 27 Sep 2025 20:19:42 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-Id: <8f4996a6-2b16-477a-b753-515d2af8a84c@app.fastmail.com>
In-Reply-To: <589E8454-6788-40BA-A2F5-B60ACEADD97B@slavino.sk>
References: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com>
 <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com>
 <5f21dad4-bdad-4b03-bbfd-c767768058e8@app.fastmail.com>
 <589E8454-6788-40BA-A2F5-B60ACEADD97B@slavino.sk>
Subject: Re: list elements of set
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Sep 2025, at 6:24 PM, Slavko wrote:
> D=C5=88a 27. septembra 2025 10:59:54 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>
>>You could parse JSON with the popular jq utility, or some other JSON p=
arser of your choosing.
>
> Yes, one can parse JSON with jq, but it is not simple task for shell, =
as
> output of list sets is, hmm, i don't know how to describe it:
>
> 1. the nftables is list of objects, thus one must first filter the "me=
tadata"
>    object, it is first list item, but who know if it is guaranted

I don't think this particular criticism carries much weight.

The presence of a header means that the "json_schema_version" number can=
 be incremented in the event that the JSON schema changes. It further ma=
kes it trivial for a given program to determine whether it is compatible=
 with the incoming stream.

I was surprised to find that there exists some documentation in the form=
 of libnftables-json(5). It promises that the first object is a metadata=
 object. I can think of no technical reason for this promise not to hold=
 for all future schema.

> 2. then one must distinguish, is set object has elem key (empty sets m=
iss it
> 3. then one  must determine elem key's type, as it can be list of valu=
es
>    (scalar) or list of objects
> 4. then one must decide if value of elem object is in elem or prefix k=
ey
> 5. then one must again distinguish, if value of elem.elem key is scalar
>    or object
> 6. and finally decide key(s) of that object to get real value (val, pr=
efix,
>    concat)

All of this is true. The irregularity complicates the programming, placi=
ng a greater burden upon the user. It seems only fair to ask why it is s=
o.

>
> Thus yes, it is valid JSON, which is parseable by standard JSON's tool=
s,
> but with jq one need either to construct horrible script, or create se=
t of
> simple sctpts on per set base...
>
> I currently play with it in python, and with my real set of sets, i am
> still on step 5 (of above).=20
>
> Please, why is JSON output as non user friendly and differs by set's
> settings?

Presumably, interval maps are stored differently. I suspect that it was =
easier to implement the current schema than it would have been to implem=
ent a schema that is more regular in nature. Of course, this is merely a=
 guess on my part.

--=20
Kerin Millar
