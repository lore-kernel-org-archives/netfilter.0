Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3DC2FB
	for <netfilter@vger.kernel.org>; Sun,  3 Nov 2024 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730661012; cv=none; b=pc22G9enAirRnqY2ideyxiJAL8Ao9DD/nsdaPUkaBY/LDxrNsIawJn8/qx3PwOGPd1ObPMju7MUBZFnFryRargIj2lKN3mL21seyG4EAdFvHCGvAXJKeKUMkRdZJkjWa+DwIxDu7bkQnIqijE9jofmWIWgIY4CTtW6Urc9kyfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730661012; c=relaxed/simple;
	bh=Fir5jAyMUPC1/qO31UugPMJ6L1S9gOPl+vhjldFWtZM=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Uve6Cv1Ux7R8mSDKevAd4YKCIzlSCLbH0nTyJqVI3TINR5pgmdmZ60yC4lvt20F/t8cTMzGZvxxJ0kxWulvxOJa11k4G9Nj11bcFCj7ycTZejsa+2FjqnPcZSIR2Ch6xHIlpuOjpwSnLNR13en7XPnwFNa80fFpqr9gRXJaOxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Iapvnqfv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y+RN0bGy; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Iapvnqfv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y+RN0bGy"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2703011400E8;
	Sun,  3 Nov 2024 14:10:08 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Sun, 03 Nov 2024 14:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730661008;
	 x=1730747408; bh=VUuPIMGYRiLGOgYAkZOs6dgBaICpKyK+atjbiwsNo/0=; b=
	IapvnqfvihtqZyAx2BLgCWvZ5t9cTVNSG68bqD1c8OozUw0vES6QERUs2lfQuiC6
	vh08HOZ/GtrS/JJ9KcidqcLzH+FZcb5odtyUf0kzxAxFZ/WyB1b4nAkoxeoi+IAK
	QkN36kZr4HvK+sDG2ZVoKKS5Vr2GqG2cEGb8jPiCrMFha0cKPGjP6aRUwn/j2hNS
	iQskIoGntB+RExdDxycDp/ddCi4k4GzJtFdXoG806gI1JiN0K299sZn/JZog7xmF
	8+yEG+m8WFx2eW0UQMulD3473l0NzgMsV/SXoqLDBNtAWXKxfIatdwlx/YPq/lXb
	isC6i3qY81CiJqYhzBPO2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730661008; x=1730747408; bh=V
	UuPIMGYRiLGOgYAkZOs6dgBaICpKyK+atjbiwsNo/0=; b=Y+RN0bGy2PjeDDIuh
	qXEj5LTOOy2BqgeyrIXqlr7MZzRyQF4xBRp00iIrw8EQLidq7X4GVpOyuqNPp/Ot
	WH2kc/VDdNmdJhinkcbJ+tIXtgQLp76CUwzEX2h/gLGaMIOYzKpOPw1lxZZf9cUH
	0yIYid3RRl/DZmKhrdVgU9axxzWAWxjcfwIC/B+inXI84k+jJwycLXfzmrlJqu9J
	NILQi0TCE0OwNYQzwm8kDgO6XP/qpdQTIJFHKZfpnZwi8+gLC4o/WGgD1e/u3UAR
	baiR2AoBeczfOFJqXkEt1ase/goiSZ0NlO9BiYXqXIOfL5hmW45Y+8tGnC7NEERW
	mfVyQ==
X-ME-Sender: <xms:j8onZ859lZ1jdI5VYEwqfKdpUgbCn4XkCUFBXFh7Xpt4yquzSI5IEA>
    <xme:j8onZ97Ai014hx1eBUFPLRwJyCFMV4X-QhyAO8yO5zK9lEYSJJPpO2H3bmlx1i1Zn
    WM25BnsQrj7B8L_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpefguefhkeejveegudekudehtdegveekkefg
    ueetleefveejgefgiefggfeukedvveenucffohhmrghinhepuggvlhhrohhthhdrnhgvth
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhm
    sehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlrghrshdrnhhoohguvghnsehgmhigrdgtohhmpdhrtghp
    thhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:j8onZ7fq0NvmWE4Hpq3btzh0aAkob-QlNpGSTbx1fXjT0n7GOfxgsA>
    <xmx:j8onZxLGa6LPHL9mvz3yHXr5IQBEwCygyeIfCsutt-8M9Qxa7wsWWQ>
    <xmx:j8onZwJGs2wZo4MpTHYpxRiHAzvZ0fIv3CUyRkxwEIOx6BsaeZaYsw>
    <xmx:j8onZyw3-R8_Lrn83EqYd1Zt8eYshEcIWsfgO9Ne55avHoafejLBEQ>
    <xmx:kMonZ6jB2skmfuA4UqtuICar9UYfwG_0VCp26kT0bNzEX7Of2XHnrx9q>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CCAA23C0066; Sun,  3 Nov 2024 14:10:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 19:08:42 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 "Linux Netfilter Users List" <netfilter@vger.kernel.org>
Message-Id: <66933c54-769b-4371-bbf7-b115a85de4c2@app.fastmail.com>
In-Reply-To: <f0624e62-0079-43aa-9bd9-28f820914263@app.fastmail.com>
References: <d985d5e4-18b9-4f66-9e24-c7b1c9640caa@gmx.com>
 <f0624e62-0079-43aa-9bd9-28f820914263@app.fastmail.com>
Subject: Re: Countering some types of SSH spoofing with NFTables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Nov 2024, at 10:08 AM, Kerin Millar wrote:
> On Sun, 3 Nov 2024, at 7:51 AM, Lars Nood=C3=A9n wrote:
>> Greetings,
>>
>> There is some discussion on another list about dealing with the probl=
em
>> of a type of spoofed SSH connection.  Here is a description of the
>> problem, along with how to use tcpdump to identify it:
>>
>> 	https://delroth.net/posts/spoofed-mass-scan-abuse/
>>
>> One solution offered in a message on the other list was to add the
>> following rule into its own table:
>>
>> 	nft add rule ip accounting input \
>> 		tcp sport 22 tcp flags =3D=3D syn\|ack counter
>>
>> The following seems to load without error and I have some beginner le=
vel
>> questions.  Specifically, I wonder how or if it does the job.
>
> For that rule to be of any conceivable value, you would have to refrai=
n=20
> from ever using your host to connect to an instance of sshd(8) that is=20
> listening on port 22. Moreover, it does not account for RST=20
> backscatter, should that be the job in question.

Upon reading your post a second time, I noticed that your sample ruleset=
 already contains a rule that depends upon connection tracking. As such,=
 you could use state matching to assist in accounting for backscatter.

table ip filter4 {
	chain input {
		type filter hook input priority filter; policy drop;
		ct state invalid goto invalid
		# ...
	}

	chain invalid {
                tcp flags =3D=3D syn|ack counter comment "possible backs=
catter from bound port"
                tcp flags =3D=3D rst|ack log counter comment "possible b=
ackscatter from unbound, unfiltered port"
	}
}

Owing to the use of goto, this would also serve to have invalid packets =
be dropped.

On a different note, rules such as the one below are incorrect.

  iif "lo" ip saddr 127.0.0.0/8 ip daddr 127.0.0.0/8 counter accept

The lo interface is used for all packets that both originate from - and =
are destined to - addresses belonging to the host. You should remove the=
 "ip saddr" and "ip daddr" components.

--
Kerin Millar
