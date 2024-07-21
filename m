Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C088F5B
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721576861; cv=none; b=GH9Nf+RlPotP8SZdPUuw2eQSboep3WcWl0hSqqZmBNlsibnSSu/3rwawkLc2uxVnD6yLbKYlLmo49ErLNMOHBOeRXiYJG8iG9gVA/d2TA/ry/0foR9gPZ2Z/Su8GVdP8FlQe1SYgpkR2QHtT1Iirp6dEqQu67JL+Z17lFVU4PAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721576861; c=relaxed/simple;
	bh=8BthB2m3dfGB7k1raAvTxJIAXSQL/gkE5MZKxBC7V08=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=A62QPqIT56RSw1nrHIAiNDqgX7JOm618WrSwpjEdXaIxCr9Ecsc2N9F2KTpOpmJWP2RfSOl7oazSakfwyw9oDpiu2+8TQjd4q5Sr38gsBmU8TW/OBo7mf20FVYO+AMq8LBQ4zS49ZJ2VCRRjKDCQsN4FPy/h37BUkHztH5jp+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ktRokX/3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AwAYIpdL; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ktRokX/3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AwAYIpdL"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 34DF41380127;
	Sun, 21 Jul 2024 11:47:38 -0400 (EDT)
Received: from wimap25 ([10.202.2.85])
  by compute5.internal (MEProxy); Sun, 21 Jul 2024 11:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721576858;
	 x=1721663258; bh=8BthB2m3dfGB7k1raAvTxJIAXSQL/gkE5MZKxBC7V08=; b=
	ktRokX/3hczDYW9eKUtGMX43cOuHXM54OZDu6vK9c/IwOrKC7OqZn+NalW6vXZla
	HOpq0vqXnr6yQQ3dO76J6bKh9OCbxSVNoRKJ4XsaXsHnN8U+ymUvcVU5wkE2gBQD
	uS6ijlwBzC218FGVjP8bUahLladRHlWVfz8WRP2u3/eYbMSdcItyK9jOuc5sEPQa
	1/Stc9fJN52lhfqg+2XbQIhtqAar7tiS8n38PUgY/ptN1+vafiUsMb4Hqhkbf/B3
	n/8iqu/xeFTQu8Ux+ru/iEZ8q30TilJN43MbG9+i7IQk0RjCJKUFGroZqhI4ijeI
	h8Zs6qB/Kk4l8vAMncDMaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721576858; x=
	1721663258; bh=8BthB2m3dfGB7k1raAvTxJIAXSQL/gkE5MZKxBC7V08=; b=A
	wAYIpdLaUyFCa/HYElq2SMrvyWTvtxUsV0fxJBA+/dMykI6rT1+ZTmp4EW9YrLoj
	fGrcA91ESCyjQwm1SEmOXPN8vxy6DpyWjJd2P8XdF/9mrV7dAHktu949TnhC037y
	AlR8wOikU1e9Y9675BOwB93wtyUu//m3+xSCa+oVSI9bS1An+zs19C2VsAEWr9ut
	MTPxdH1+Fdhl1gBF8vhnJQH88wsJz7x6/8nifvVqdN9tUwIvRh4IgC4Ts9Ln+9zv
	2v3d/Rq5PwpHEytyGXVy6/cgEX2Hx0bVWfz3FT1oWJvRJvhH0OkyvQ75Yf0v1DeT
	X40cD7TVG4L4nuXgFsaGw==
X-ME-Sender: <xms:mS2dZlqdCGm6HO8ycz-2NR5v2XZRU4klMXLhuVtRkAvDXWIaVVLvNg>
    <xme:mS2dZnr399jrfsid1DtXqFGK2kssH-29fopoG7lmFYVzfJ7N-0ZC7Lr3hUwxgpKVP
    NJJVSMndwo6J-Pq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheehgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnheptdfgudefhfffveevffefgfduhfelvdetueethfekjeevleefieffudel
    leegteetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:mS2dZiNTxBEHOjEQ9UTJTN-Fn6i575OqN5fCKgxjCc-8ASJr8X1Z2Q>
    <xmx:mS2dZg5EcDY8lxdQ6E0AFY78xuGmPA1ZOuVlL8izmxBmb5Nwp3Bh7A>
    <xmx:mS2dZk5SHShlZJNIqGGZLwKoKo9VkE9qHXmg8drccnurdRyvTTJXUg>
    <xmx:mS2dZoi7PHGmICSrkLaNTOCvxk0r1CGAZ4-iM-rgJSznXJU5OF-BkA>
    <xmx:mi2dZiSDGmLRoVMdFEpnIXVuNwlNx6Cnqrp09KDLCKb5sMn3BKXPhdmC>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A335D1040061; Sun, 21 Jul 2024 11:47:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5f5f7d91-d370-40d3-92bd-9ab5fa0c1135@app.fastmail.com>
In-Reply-To: <9C0711C5-60F3-4A5C-A441-85EAFEC8592A@slavino.sk>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
 <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
 <20240721132337.29d2fbc9@bonifac.skk>
 <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
 <9C0711C5-60F3-4A5C-A441-85EAFEC8592A@slavino.sk>
Date: Sun, 21 Jul 2024 16:46:56 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 21 Jul 2024, at 3:38 PM, Slavko wrote:
> Hi,
>
> D=C5=88a 21. j=C3=BAla 2024 12:29:44 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>
>>You have a point. If on a severely RAM-constrained system, you may pre=
fer to avoid the use of asynchronous pipelines and generate temporary fi=
les instead. Doing so would minimise RAM consumption.
>
> Correct me, if i am wrong, please...
>
> AFAIK memory is not problem in pipes. Yes, any pipe consumes some
> memory, but AFAIK it is somewhat limited (i don't know exact numbers)
> and if full, the writing process is paused, thus stops to produce more
> output, and thus not consumes more memory.

Yes, the default size of a pipe buffer is just 16 pages in Linux. Howeve=
r, one must also take into account that pipelines are fundamentally asyn=
chronous. That is, all of the commands that comprise a shell pipeline ar=
e executed at approximately the same time and run in parallel to one ano=
ther. In that particular respect, there is a potential bearing on memory=
 consumption. I must emphasise that I am definitely not trying to discou=
rage the use of pipelines - far from it! I only brought it up because I =
had the impression that you might be contending with a system that is se=
verely short on RAM, in which case running programs serially can be help=
ful as a deliberate memory-saving measure.

>
> On other side, nowadays linux systems uses tmpfs for /tmp, thus storing
> output in temp file can be even worse (in mean of RAM) than using pipe=
s,
> as whole output is in that file. Storing temporary file on disk is pos=
sible too,
> but doing that too often can drain Flash's lifetime, as modern Flash s=
torage
> are really limited in that (in comparison with magnetic disks). IIRC t=
he disk
> was used for pipes in old Unixes...

It depends on the exact circumstances but yes, it could easily be worse.=
 If you have a mktemp(1) utility, it is probable that it responds to the=
 TMPDIR variable, in which case you are free to point it to something ot=
her than a tmpfs-backed filesystem such as /var/tmp.

>
> But yes, without temp file, one cannot produce the same IP list multip=
le
> times (reading it into variable is the same), but at least second temp=
 file
> have to be avoided...

It is not quite the same but I understand your point. Assuming that TMPD=
IR is backed by a tmpfs, both cases would result in non-disk-backed page=
s being allocated that may later be paged out to a swap - if any - under=
 sufficient memory pressure.

--
Kerin Millar
