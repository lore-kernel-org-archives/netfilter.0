Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60250136E32
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713347432; cv=none; b=eQswg3/Gh8C4cPNjzDlU6BYhbJSYfyAsnZP/QsCWLT7pYzyiKyuHDlh8L7TifStnirsSuKtSU9f0R9yTbjk2h8ZuT6VHQxZGsogBmiJghaEplxJ2fv9oNTyyMuhj2A1kwvEaMBlQLTLzZvqnNNxOkOXoPgcPBuMWEsL7S45Wm/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713347432; c=relaxed/simple;
	bh=VzKh51zt8+H+Nxshd9IhpKv7hfOd7urqrmGDNVb+eNg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=GiMo8pX3T7vpydDitwvauPmz6bMjIHZzk0Hx13ltPN1xz0viiiyKbaW95K4LWEnyzJiIyLglASks9sIIk/GR4hdcbbLBoI6jYnyIC3lhPrneeKRuOgZ8PmojLfc/RS+KMSeQQvTzL88tVBKNoz4gBMbPqxVihXFx6eY/jZg3wLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=XgP16D74; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bsD1LX3j; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="XgP16D74";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bsD1LX3j"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 722C51380250;
	Wed, 17 Apr 2024 05:50:29 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 17 Apr 2024 05:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1713347429;
	 x=1713433829; bh=VEPdJqBlIBMw0sRuBhlsQp7bz1ZmJ0f9wRnta5PV2zs=; b=
	XgP16D74uLkSDZihDb4HK30a2QI1Ji8Hemq/TxGwhi+vz/ofMwQIAdauh8Zbw9Ak
	KkF1bZgewR1aT6ohfDTHUBJw3PbGFb4JnRe9fZVCpU6W9Xcbi8NB10lDTqpEABtd
	Cph9xQK8ASUUFJxWRwZGjNV/qf556n8E1jHq8r8t8Qx606YVV6annQyElBqdYSxi
	pkP7N40RujOXmnqzVpjHEgnApx6EAXtDO5JiPaJjAaXmY8FfQvmL94k9nsupfqzA
	BJJ5p7/LKtr27EKiMZ+Sb+dCfZ1j9JEYVoZPF2h5m1g425NpV0l70TScMEh1EnY9
	ltA9zosSYrmiriqZq4ld+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713347429; x=
	1713433829; bh=VEPdJqBlIBMw0sRuBhlsQp7bz1ZmJ0f9wRnta5PV2zs=; b=b
	sD1LX3jQ+lTa2HpaZ6NlKZgTwU4BnbtrViD4WiC/M1XNcAw68rJRmFxTzyrCPUD6
	C9R6AVaT0boEoT7RYC6V81+hhWA671wCUxY6EXi62s0W8c4wJ3EuBll0OCHbSG/0
	ZC520E+H4ACcNOtlDmr+cCeNbbEXn9DvV8JHRTJuoCTy8VOMgo1FQNHViEsNyZ4B
	fFeIyrUj3+FsuCDDdXlM4tt6VVv3H7W2l8xymElZpjiqTSB3bf1p9suBrYtIHAZO
	tzM+QrxjeqNbI3kcDa/vQZiNnbN2QhlrxC1YJEEZuDbxA4OwxOR4WuMwG942DnGQ
	VcVr9+amjCGtkTVzCizDQ==
X-ME-Sender: <xms:ZZsfZhNuIjYxMC2KAeZRmR90SMA4gKWiMfdYpQ1S3xKXlxqOubSsQQ>
    <xme:ZZsfZj8MCDdhnZLPvRxWW0NfzDOjtRxrZY7A7Ke5JH3-QVwd3exdWfybk6gXZEu6v
    1ED9Fld0K3GMsQS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejkedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
    hqredtreerjeenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepuedvudevjeehjedtffejve
    fgheeuvedtffehjedvgffghffggfetvdevtdfgheeknecuffhomhgrihhnpeguvggsihgr
    nhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:ZZsfZgQp4ow63rqgM5ZGOP4vaQVPpFipbMEn38gpt_D82Aq7FdOHmQ>
    <xmx:ZZsfZtt6uLm4MhCkWSJNMB1zxZ1rFLLRQSAoVRY5Llol7304ecQ9_g>
    <xmx:ZZsfZpfVFDplUxdCHpTS2-8xlQtjkYlCQ9EgFvWdG_7dysDckTVHgw>
    <xmx:ZZsfZp0338xTB_Q3revk5GIIX1Zo4ncNsjseR42Zy6EuU6ez5H_Cdg>
    <xmx:ZZsfZpHmE2chiln7F9tTU23Ljc88cs2gV5dEuOPQ_lzruxZpIi-v1Bq2>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 124601700093; Wed, 17 Apr 2024 05:50:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <2e3ee5dc-0628-47c0-937b-21daac1c76c0@app.fastmail.com>
In-Reply-To: <fb8c2fee-c2fa-49ec-87f9-c563d04f3343@slavino.sk>
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240416191250.04884e9b@localhost>
 <20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
 <20240417082917.5cbb38ae@localhost>
 <890e6c2d-ed3a-4a0d-84ae-5cd1a2425316@slavino.sk>
 <d7419059-cfb1-40df-9280-c673775cb04a@app.fastmail.com>
 <fb8c2fee-c2fa-49ec-87f9-c563d04f3343@slavino.sk>
Date: Wed, 17 Apr 2024 10:50:08 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Apr 2024, at 10:23 AM, Slavko wrote:
> D=C5=88a 17. 4. o 11:16 Kerin Millar nap=C3=ADsal(a):
>
>>> try hping3
>>=20
>> It doesn't seem to have any way to directly control the value of the =
options field.
>
> while i never tried it, is not --tcp-mss option for that?
>
>       hping3 -S --tcp-mss <host>

Apparently, it requires an additional patch.

https://sources.debian.org/patches/hping3/3.a2.ds2-10/160_tcp_mss.diff/

--=20
Kerin Millar
