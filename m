Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F8833C9
	for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597059; cv=none; b=Fib8/DqdAeU9HKgzgr85u1IjF5sYmsAy083RvwVRHBW6B/IfjDEN/UhjYYOb+4CxB3ua2h/3j+xpBG6ostwNneYIFXu6qtNrwEMo1AhIQP1htvb6niHjW5MFSOsPB/JynCAFiQOrrkswE1U7vWkdlp41ZyNhXO66JP9DZ6bqjjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597059; c=relaxed/simple;
	bh=aGk6edSB8NA0vdAe4d2dpVKS5sKHVipUEaxXT5IWgrI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DNuMsimm3mOGVa7hd52msDxgU5Jwc4IKzbo36f/oFVb/lPcUr0vpmKG0RfTH3FevhGikbT35M5MFVEnc58ZIUsr0pD1Xe2LaS2Bp6Ms88IpgNc2lm7MoUW66CxMWxhDhU34Nknt/ua+hJcWSYkaC8PZvFU3O4Gu56LR1gwRcyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=fNZh48Rf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LFbkR2W2; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="fNZh48Rf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LFbkR2W2"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id A0F821140188;
	Mon, 30 Dec 2024 17:17:35 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Mon, 30 Dec 2024 17:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1735597055; x=1735683455; bh=xL/hvSUOPvRGdwCTHD4MWc/36l8lhMW8
	InonPX7GKso=; b=fNZh48RfwSf5kq0/YxK4OtgsMGSF0UqV6AIjn3Mtu4nxapzT
	XETqx5IPqkaKILcFwoDNKlnTDtX5gnJoQfswGXSezzihrDKXAp4gLsnP0bidVSlv
	ZBv4P3T0fJtVA8XEdIqlSu7Mlj0ly5T1cW4+Q2I76ujyVK97xwCApHdGYZPDcg5Y
	Ugq1qh035QItJyQZCFZOeV2g50D2G63srQQ0JYpsgJXtFRiQjZZuSfPb1Q5ybzrL
	wMitcQtKOYnkOHPe2nnKx3US6yvNPvgMdAIDpLoRK47h90zShPssDg1hbY6cw04Z
	MtE66zakuTvaHtUwe5JviPhmX2b0zKms6Aokug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735597055; x=
	1735683455; bh=xL/hvSUOPvRGdwCTHD4MWc/36l8lhMW8InonPX7GKso=; b=L
	FbkR2W2WJCGYS6wbxkPKAHQXKwV86sTvOaw/ViMeXf0YlSPeBTHJzbbu4nV3z9tg
	VmpPYq7pk/q3572/qXUddsODittDq8G5wHGznzH8IN8l2KLG58ex0zIDnrWhHNzL
	p3r3edCuIDNml7r0cQn/mqVXUgf88Ji/YBXlTq2P5yVNI9ot1aL7rBycG4VlzSPy
	AA8HgVxDFQNdkmPoF1oPFKv2wKRH7BP1CQv5w8mq2n47OaXz7oQ1fi+tvKsNFrME
	SfgsuIa+RRm413cWnFA9NtAJP9+RGeTXYwOjGyLgZ/qvYEtKyMIcssHQI9PxXLgD
	reEz1vLkYFnr1A0xjqRnQ==
X-ME-Sender: <xms:_htzZ8J15XBnO5T_xDA2-Jl77tHiMPlMdQBmak_djjBiRFEc2J0zGg>
    <xme:_htzZ8KLTUw3BcnKDdmUr6SZdNmA_71bBqcLyporlXSGQVu8adWSxqlLU3xqsQJYO
    W87_icJWN6n0sMe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddviedgudeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrg
    hvrgdrnhgvtheqnecuggftrfgrthhtvghrnheptdeutdefvdeivedutdehieduleeugfdt
    fedutdegvdffkedtjeejvdetffdvgfdunecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhilhihughjfi
    hgsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhdrrhgvihhnughlsehthhgvlhhouhhn
    ghgvrdhnvghtpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:_htzZ8slzTKgA3VuNiwJJlbdhe8okmcB8Lcb6goswnvmjz9J7hB3RQ>
    <xmx:_htzZ5blVBfkJJltnAxbSMukBFLcu96fPHfhUoBDy0g4AdJwjsoaBQ>
    <xmx:_htzZzZJ9itQ6yL-sA0RPAyQP67PaWlW3f7_NVg1jm7yD2jpIYL2Cw>
    <xmx:_htzZ1BMUtAfb1z5qwVtzuWsaONjcCC5B_luMNkDZ8l3oiY6KSmhnQ>
    <xmx:_xtzZykH0X3rLlpei_tpt5n4lS6B3_vVue9Abaa3QceYVXmtmPxDL5FB>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 98A7A3C0066; Mon, 30 Dec 2024 17:17:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 22:16:55 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Reindl Harald" <h.reindl@thelounge.net>, lilydjwg <lilydjwg@gmail.com>
Cc: netfilter@vger.kernel.org
Message-Id: <4cbb5060-62ba-4c31-a290-f294ba6f621e@app.fastmail.com>
In-Reply-To: <897d1cb9-512b-41a3-ab26-a8caae37d460@thelounge.net>
References: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
 <95e9679c-0ed0-4f57-b7d0-203729321d3b@thelounge.net>
 <Z3K5_wCC4LwwCKHu@lilyforest.localdomain>
 <897d1cb9-512b-41a3-ab26-a8caae37d460@thelounge.net>
Subject: Re: expires larger than timeout causes error
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 30 Dec 2024, at 3:40 PM, Reindl Harald wrote:
> Am 30.12.24 um 16:19 schrieb lilydjwg:
>> On Sun, Dec 29, 2024 at 06:01:48PM +0100, Reindl Harald wrote:
>>>
>>> Am 29.12.24 um 11:00 schrieb lilydjwg:
>>>> I have an IPv4 set with timeout 2d, but update its elements to 4d when
>>>> a rule matches
>>>
>>> why?
>> 
>> I just found it. With the timeout seperated, I could distinguish
>> frequent and active IPs from inactive / once
> you can't anyways that way - when the remaining value is 1 day you have 
> no clue if it started with 2 or 4

They can.

# nft 'table ip t { set s { type ipv4_addr; timeout 2d; }; }'
# nft 'add element ip t s { 1.2.3.4 }'
# nft 'add element ip t s { 1.2.3.5 timeout 4d }'
# nft list set ip t s
table ip t {
        set s {
                type ipv4_addr
                timeout 2d
                elements = { 1.2.3.4 expires 1d23h59m54s923ms, 1.2.3.5 timeout 4d expires 3d23h59m58s323ms }
        }
}

-- 
Kerin Millar
