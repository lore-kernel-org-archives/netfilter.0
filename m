Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626842056
	for <netfilter@vger.kernel.org>; Sat, 26 Oct 2024 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729940766; cv=none; b=PU73p7U6RXzfcPG3tvCfcBD6ROwKuWwYGTBgM2ZCHKTl/sokp+Lx7gW0XcyfppX7O8R21ePoXDrHZtzT9hKKeRRl36qweEAmNfs51K2p7ouN2UOQ5SjTVXOyr/8ANHN0L5WSEr3gSJ4EuYcaS95mkpPssmcL4O2faK6zlfc48fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729940766; c=relaxed/simple;
	bh=0UkQ0vGjyXX6SDUeXB7XMZF9WsDTl2uMsq/hbhnVWBo=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NCCRKpRcbRzln8j+rZQq4VJtwjQJkMognGby76s4rfvfh0Ux+/aEtTfbipFr2083AwtKt/LQL4VHuyBAT1xS+WSjOo+Qt/SCu2d/gqxSY0TSIv4A3X30PQnrZLOniwEzKSkscuDd+6WBk2MmPFHdAcAKfekXmXj7QU2+Z8LJvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ah38wFxd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CtAtEITf; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ah38wFxd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CtAtEITf"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id EB4F711400D8;
	Sat, 26 Oct 2024 07:06:00 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Sat, 26 Oct 2024 07:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729940760;
	 x=1730027160; bh=0UkQ0vGjyXX6SDUeXB7XMZF9WsDTl2uMsq/hbhnVWBo=; b=
	ah38wFxdrTorQmMr+gXbptXytM7vBlSVs/LEKamBjEUuYQHZufVJuBIxaiDg1ULd
	nurIBk9SlK32KJL2LVAu3jP6GH7MBSyFiSAVuHvJWsIXExSBy8FxbQI8e/YwQBI4
	uwMBq47eu41Iw0eIe/K75CzcJ8yeJvx9OvS5T68zsnRbGivwqhNTQ0L40x1dC9Az
	FJYszU0RyyqfXMdnoGtaJT0cNlSEuiafUOOBnnNyRQyuEs3A95dhMNNmDqVub2IR
	UR3OEvEeA3s1d6TYX0sQQoMW9HPF5fBXi+EjG5yos8swoLBkoSi3f7OkINHrrkfo
	u8bRG9uGLKLZfImqZF0Myg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729940760; x=
	1730027160; bh=0UkQ0vGjyXX6SDUeXB7XMZF9WsDTl2uMsq/hbhnVWBo=; b=C
	tAtEITfHHoozkadfTiRgB7L/6goRynvDkbM3jfotjQHCz/J4BjCTeOvMMyTI5pjf
	NoO+/aamgnEMpwRKAEEj8jJ4sbSIXcnjgDpkbUS4FoE9PvSpKckuS+VYrdANbPTZ
	qaAMboRiEld3vfVh71CZS4Z7BLjMpGrmWcMHpRk2gNqX6GEy8/64myY9aOyqaSMS
	nNhIuW4nd952HYFWwlOke+p5Oqo50eFZI96Ce8mV6GR9L+PmURwif51BaLW6nV+7
	DdgxY7KLPXxsNC9S4xOMeN9d0hoP6LCiwtLSwHmo+eGKW/yVeAXoqVSzFvEshSYf
	RQ4qRWHkulQJZth7NcP1Q==
X-ME-Sender: <xms:GM0cZyk9hduP5Aw6aullwpRflavOFCIJ5HoUtzBSGbzC_nw0LuWexQ>
    <xme:GM0cZ538b2ScBeUWOCQziEC36ZkZFU-o0Uqat_7X5mqo6pz_A9wJ7fcPRzY9T0yms
    82ZFL49zLqmqaq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejgedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefjeeuvddvudffffdtffffudefvdeu
    ueelgedugfekgeekveejteehvdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghp
    thhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesshhlrg
    hvihhnohdrshhkpdhrtghpthhtohephhdrrhgvihhnughlsehthhgvlhhouhhnghgvrdhn
    vghtpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:GM0cZwr1v16IkD-a5VU8p6mPxILXreB9pC6fK1wFJw4FXjgUkBa0bA>
    <xmx:GM0cZ2m9_aPHZuwVyXyWPhVuZTQ7XB9gJwsGQxds1mrNdj3KycCmgw>
    <xmx:GM0cZw3ARbLEGaoSrNrVVuPNX9HbfBr2qefbXDTlk8pTGUScR3drew>
    <xmx:GM0cZ9sPIWXwWLeNaarS9utNO_Gp6xeywZF0ezMpZbGTP6Z--oAPfQ>
    <xmx:GM0cZ-Dh8d60uib5X6ofUhFpe-NKYVKAYT2MtGQQEv7gG4aASUsYONOF>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0FC583C0066; Sat, 26 Oct 2024 07:06:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 26 Oct 2024 12:05:38 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Reindl Harald" <h.reindl@thelounge.net>, Slavko <linux@slavino.sk>,
 netfilter@vger.kernel.org
Message-Id: <58bbba7a-958b-4153-92dc-2090f464fb06@app.fastmail.com>
In-Reply-To: <07588221-314c-4ccd-9344-3696d267a870@thelounge.net>
References: 
 <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
 <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
 <B840B6F3-FBF2-449E-9AE6-F713CE6BE111@slavino.sk>
 <a166ff38-c2d8-4528-b0f7-8b72d50159ec@app.fastmail.com>
 <07588221-314c-4ccd-9344-3696d267a870@thelounge.net>
Subject: Re: IPtables rate limiting question
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 26 Oct 2024, at 11:23 AM, Reindl Harald wrote:
> Am 25.10.24 um 23:37 schrieb Kerin Millar:
>> On Fri, 25 Oct 2024, at 9:13 PM, Slavko wrote:
>>> D=C5=88a 25. okt=C3=B3bra 2024 18:12:56 UTC pou=C5=BE=C3=ADvate=C4=BE=
 Kerin Millar
>>> <kfm@plushkava.net> nap=C3=ADsal:
>>>
>>>> To that end, consider taking advantage of ipsets. Below is a sample=
 ruleset in iptables-save format.
>>>>
>>>> *raw
>>>> :PREROUTING ACCEPT [0:0]
>>>> :OUTPUT ACCEPT [0:0]
>>>> :limitban - [0:0]
>>>> -A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
>>>
>>> Please will conntrack really works in raw table? I live in that raw =
table
>>> happens before conntrack...
>>=20
>> Probably not
>
> for sure not
>
> The poster did not say which table they are using
>
> he did! >>> *raw

He (Francisco) certainly did not. It was I that wrote "*raw" and to whom=
 Slavko was replying.

--=20
Kerin Millar
