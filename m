Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC52110F
	for <netfilter@vger.kernel.org>; Wed, 20 Dec 2023 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kevin.km6g.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="d2iWBFmW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="9BCIKVuX"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 97CCA3200A08;
	Wed, 20 Dec 2023 06:16:42 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 20 Dec 2023 06:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1703071002; x=1703157402; bh=TPBBkTCIEa
	QUOhXpn28z1YBc1BGLqtfm+qc/Xg0r6FY=; b=d2iWBFmW5Rt/R+LloQE1tmTO5o
	CVg+aslZw6gGY2QPDrrovIiYWN2cmV/IIB0ICfPX7g/NsoaVcY5saeOme2gwy7EV
	uBFK73cTQLPQRJa8iMFhqmmDY24ZKDV6qCG/ValweFjw+jg54ZxxmJtSEN66p3M1
	ZBROA1A0s7VeUjR6pJ005Gz5WzMXAp9toXUzvEzizab9gzjzOMZ2XESZl6MEggWf
	i3rE0mVpGeTOCBPWAYVprNN2hddBWm4gQ7ckRu8Mg94Q9fnopjcooccvfDUSliOH
	Yn5ujLFwCMdakGjx7fSQ/TlzrGcHqh0TYshu/pS4xN3jtJD+HVOIY78TTpfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703071002; x=1703157402; bh=TPBBkTCIEaQUOhXpn28z1YBc1BGL
	qtfm+qc/Xg0r6FY=; b=9BCIKVuX9tjMdvbtoXxTYD3/p0PE/nHuqt12/842VkjE
	T5ESooPUNec4gTFpVKMltCGCX0AnHhPRuAIFUrYP9mdGSMwYqpMff+IxppkziMFQ
	FlP4lP3/yAi6U+wDcSs4ptGhXAWMAfjNJx6eyP3XETHOH4pLMn4yq0coxH5+JMAc
	Y15owEeBvDU45aAZzH3U/pstwqL/Ufj5x5Gv/MzLYO9W9TydFpoBXpbazYx422xN
	/MYGey8GoiVxEdC8sy4GM2Hs0dUvUOKAvDp8E1BvEaKrcTAW6g+ews09sJSixdD4
	KD+W4sae4yCyfaYfky8OVLyX83ngP0yPXEybXyf9Tw==
X-ME-Sender: <xms:Gc2CZddqfrrMq2tU9mGwKq-H3TMUz3QQVIiEfCpmOJB1-86iBU9nYA>
    <xme:Gc2CZbPD-jNvncoG0tj4P-EYptIV1Kx9r2YVZBDuQlfYof9micdfXvUSTI8ne14MQ
    WchehBC3VlS3Ui-N6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvvhhinhcurfdrucfhlhgvmhhinhhgfdcuoehlihhs
    thhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhsqeenucggtffrrghtth
    gvrhhnpeeiudevudeuuedvhfduveetveeltddvveejhfethfekffevgfehieffjefgvdeu
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlih
    hsthhsrdhnvghtfhhilhhtvghrsehkvghvihhnrdhkmheighdruhhs
X-ME-Proxy: <xmx:Gc2CZWh9_AdTOeDSyGS8vPsprBO-p2vg3aa08zFO9LXP5BJeqF9QXQ>
    <xmx:Gc2CZW9B8E_SKBIq7DNfqOZ8oZj6uKR8WO2XFlQBYeUuffpv7W3jGw>
    <xmx:Gc2CZZtarbQrDQcCdb66kEIYX0WoN9uT9dbKinium2bWS1zZ1IrfqA>
    <xmx:Gs2CZe6ZgljefBBAyWQZRVrs4WUOPxPGcuJiLC0T65J4qBu9b9Vkeg>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AEEC11700093; Wed, 20 Dec 2023 06:16:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5af510ef-f147-473c-9d7d-d79f031db5bb@app.fastmail.com>
In-Reply-To: 
 <CAA=+Qij5nxLOuj79Zc6T-XkDvUfPzuBaaYJDaiO5i4ZROSKYAw@mail.gmail.com>
References: 
 <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
 <CAA=+QigdCVDHgmDq8G+4U+SjYOGPQ8TrBXAcD8UXYxgJ4Dqtiw@mail.gmail.com>
 <d75fe7fb-f5ba-421b-940a-09383d8bbf86@app.fastmail.com>
 <CAA=+Qij5nxLOuj79Zc6T-XkDvUfPzuBaaYJDaiO5i4ZROSKYAw@mail.gmail.com>
Date: Wed, 20 Dec 2023 06:15:46 -0500
From: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To: "You Yu Lu" <zxc70208@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Unit dependency of network-pre.target in nftables.service
Content-Type: text/plain

Two reasons:

* Those scripts would run after the interface had been fully configured (for example, waiting until an IPv4 address had been delivered by DHCPv4) and there's no reason to delay applying 'netdev' family rules for that; applying them earlier is better.

* Using a udev rule means it doesn't matter which network-management tooling is in use: ifupdown, systemd-networkd, Network Manager, etc.

On Wed, Dec 20, 2023, at 04:40, You Yu Lu wrote:
> Thank you so much for this example. It is very clear and useful.
> I will try this out on my system and see if the inconsistent behavior
> is still there.
>
> Just wondering, what is the reason you decided to use udev rule to
> trigger the service, instead of a script in /etc/network/if-up.d/ or
> /etc/networkd-dispatcher/?
>
>>
>> /etc/udev/rules.d/99-nftables-netdev.rules
>> ----
>> SUBSYSTEM=="net", KERNEL=="enp1s0f0", ACTION=="add", ENV{SYSTEMD_WANTS}+="nftables-netdev@enp1s0f0.service"
