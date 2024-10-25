Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4A217F56
	for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729892297; cv=none; b=Y3Lt0bM1N1CHDpZcUXape/MfKxKdi374MmxsqsLqOQubLGchtad6FvH/Df5S+HXvgiKIcU/e1NCKNH7n+UWcsdzJzdflHYusLmMJeyqKFNjDdTYWKlmQTWDT7W7sHmaboEEuudNyOghZjHHL/ugQx35+bz1WmMR3RmxDZtzre/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729892297; c=relaxed/simple;
	bh=hevDqqaKUWDJtH5ghAK2OzqXcpbcmyJ7xkDhhHF/lxI=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r363P6i1bqyLMidO+xFI4aUGrTCcZ067JlWNeDnUMRlXLT0UFuiuUzUWrMmY1PQdpphRY7U3vr0mbISGjxHie+eSPNPMwmZjLrg0xQxfVEFqNuuZIPfsimZvVKSOV0D54nbQ/eix+Tgas7mL3tAK87WTFbPEurxRaTP+VUG2TBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=l+cDFHtL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JpXGnUY+; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="l+cDFHtL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JpXGnUY+"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BE4E1114012C;
	Fri, 25 Oct 2024 17:38:13 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Fri, 25 Oct 2024 17:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729892293;
	 x=1729978693; bh=hevDqqaKUWDJtH5ghAK2OzqXcpbcmyJ7xkDhhHF/lxI=; b=
	l+cDFHtLsIU9lXtA1VTPTGkoO5Qhi9TvUM1eFJ1pWbucprJNc2BKNJuoA3UKQB0D
	4zLHPx9p53UlPHYpGYAhmXnWxN9LmhV+XdrxASC2iq7Kmd3ammHPo7DerUxt6/qI
	KVrYkdcrPouE0XNei4cMd2D7f8u+5iGrz5MA9XqBTGNP9XglZpkzaJyC87179Uzp
	BPyR1Gu4s8Kspqafr7PYkvh2kZKOovvvUZp74loU5AzNJ/cyskQke0uUTmzDghDO
	Lm42mFZ/BZsy2vyh3Ma57z/Mk5G6RXHIs9Nh1xjAtJUnm3k0s/vk4uboinE7wi6D
	tcNbuZiBqlEeALQAqreGxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729892293; x=
	1729978693; bh=hevDqqaKUWDJtH5ghAK2OzqXcpbcmyJ7xkDhhHF/lxI=; b=J
	pXGnUY+EMAeBpV/KMJjXRtfHOTvZmgLFhHqo8G13Z9ia3DP6zrBxTwlLfqLg5UOk
	qHSQy9sedKEBlms2GxEvT1pvrOxPrF4tcEMwwzvLDq2362AMdYE7Z5GWnwIxSupb
	vBdbp4OzH0VygJaW1mNUM2Z6jImb/i5nOu6kb4pe/JODFuhhIeylu2JJpYFmrtEN
	/oePICSi0vORpVT2qhHlf4QOONK415h4R/BzhGo7oQ3Rc9UQrc9+d29FvnM6bMC/
	6ynnVIbg0M/UnkUAKpf9Aq8+1xAZfOWZ5ibnLXvzk1lC8+N1QiiL+UEnvvlKokrw
	4MMuo1kNcwDi2L8w51SDg==
X-ME-Sender: <xms:xQ8cZyi33ksDUV1HCiO6mDi0jgERE5d0j88fpgJ4r7QAd1OxgbeKhQ>
    <xme:xQ8cZzAIODeS3YUsvDxQD2f8BHd0hXoAhrKUbl2OYXk0XMR4k-o3GSNbc2aMhgGJv
    572X7iR-O9z14oe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejfecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjg
    hfufgtgfesthhqredtredtjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceo
    khhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefje
    euvddvudffffdtffffudefvdeuueelgedugfekgeekveejteehvdevnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrg
    hvrgdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugiesshhlrghvihhnohdrshhkpdhrtghpthhtohepnhgvthhfihhlth
    gvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xQ8cZ6H01v0uSmCBVNQ_OPqOTwx6mNgs7yC8kmfz_L4gBuyxpYg5ew>
    <xmx:xQ8cZ7Q6nptM0pF480aHQEGSs60PSU5IUGxxrrJA47qqmaz4E3vupQ>
    <xmx:xQ8cZ_x6UN3HWx7n99kLLeBrbK0X8BMGGVC0P4bKu4iTDQO8I1MOWA>
    <xmx:xQ8cZ55h-fJScGA7UKoqS8qkh2KFmXRhlfDMGMCa1059Jre8HKaNkA>
    <xmx:xQ8cZ4poNrmZahNtKaK-vkQGguzlODwTNPOBHoZj-7Sgsth6ozR93NZF>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7FD003C0066; Fri, 25 Oct 2024 17:38:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 22:37:32 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Message-Id: <a166ff38-c2d8-4528-b0f7-8b72d50159ec@app.fastmail.com>
In-Reply-To: <B840B6F3-FBF2-449E-9AE6-F713CE6BE111@slavino.sk>
References: 
 <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
 <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
 <B840B6F3-FBF2-449E-9AE6-F713CE6BE111@slavino.sk>
Subject: Re: IPtables rate limiting question
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Oct 2024, at 9:13 PM, Slavko wrote:
> D=C5=88a 25. okt=C3=B3bra 2024 18:12:56 UTC pou=C5=BE=C3=ADvate=C4=BE =
Kerin Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>
>>To that end, consider taking advantage of ipsets. Below is a sample ru=
leset in iptables-save format.
>>
>>*raw
>>:PREROUTING ACCEPT [0:0]
>>:OUTPUT ACCEPT [0:0]
>>:limitban - [0:0]
>>-A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
>
> Please will conntrack really works in raw table? I live in that raw ta=
ble
> happens before conntrack...

Probably not. The poster did not say which table they are using, nor exp=
lain why they were matching on the NEW state to begin with. It seems pro=
bable that "hit" was meant as an attempt to open a TCP connection and wo=
uld hope that "PREROUTING" was a reference to the raw table. Based on th=
at, let's say that it should instead be -p tcp --syn.

--=20
Kerin Millar
