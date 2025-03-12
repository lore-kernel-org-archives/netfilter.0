Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1C145355
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741816245; cv=none; b=I3a7r9zjwl1ZDFzXQlQYIIecprfA0BBEuoTxwUeUg0GGwy0w0AbMgjgF/2tRn/3MmJ27rnT679tCWEb3PhmP/SQL+g3Ag8BYZgcU3LPv2V1p08a88ormdwuKc1tJEBPULbjApmqx24qEVVZJVSO9X93OIgviAO22/TiSs7b3TGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741816245; c=relaxed/simple;
	bh=BPtDZ+ESraSRgqeleASN9fd0s0sBJZb0DialLgm8FBU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JM4Er6Dkmq5wvjMCSqzqxxwoyLcsVEPJ+WXbRvN8ch2v19r37GHJLkU8Ekvjf55AzsuZ16z55rHxjSk28PenPI0Ht/YW0jLb6ErYLyOCmk8uwAUEzD3PSUJS/H7oXoxsVpbYIpxqTWtDGPtsp+a4RaMSyGVxDadLdyNdpbtMD7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=WGD7xHIJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=7QfbbFjT; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="WGD7xHIJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="7QfbbFjT"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id E19FC1140166;
	Wed, 12 Mar 2025 17:50:41 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-11.internal (MEProxy); Wed, 12 Mar 2025 17:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741816241; x=1741902641; bh=115C5i57FERV0rzohLGQL/iE2p3meyui
	uolXz8SYeB0=; b=WGD7xHIJSSj03QHhoQDTPQRSrzXEb9Vu7J7FiAZ0oR9Wb+Lv
	8/3x3CVEhFKq3vBGwcAK1r0VIqAH81zkNl12sGCB5sG+EU4ulSYu3KIcj3WBXx0J
	DczlTDZEErJMLCJqHqXlwEBE4Y47YqtSMAH9ucvfl60SVGCauE0DyvCzsxCdQX6f
	2tn6HeqoaZ1nbjRilFNxkdKN+fgS8P7rkUU+XSILzUgyyo8oZT+RV7LkpS1yibAf
	beszoqO3CVHhss/DDkqD6ndSmLHQP9vagdZLCzpOh4uzzVLhuxFwjL9R8u8aX3et
	BsOXA3IZvzzsNP5jckw1yG875EdxfNXghda0og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741816241; x=
	1741902641; bh=115C5i57FERV0rzohLGQL/iE2p3meyuiuolXz8SYeB0=; b=7
	QfbbFjTuzuXNsEqum4KgzVQRpwwRdd+PKL+RxqcSJWUA26FneUf1qrWtnXcIyg7A
	94Iox40UZzI4ycyDsGg+OFWjUhuICLRaMzVNNEn8WQ0z7hWu7ByUUQb0XgnBba4T
	6695maxMidmjC/hAeOC8xzGXlDAkXBKSYCDLhLSMSMuXdG5hai87gos2uzuHn5NE
	fiXmntI6DZIb2fULMYk5W1Isc/regDESxaQVsa1MEklkDfF9gL3G6tvW9JLXprSv
	hBbKJyR70xb/QZCVNfg1x01PW/vKp22IByy5KGSGF4Ww9qxy5fscuaaFQMi4hLWC
	GdTwRDH4iZ3K1dR4titKw==
X-ME-Sender: <xms:sQHSZ2CcMZtaaq4bRgBpCxXogYG70Gf70-hpgmhbgABjcOYUScQl7g>
    <xme:sQHSZwjxE1eGA1MzTmnTNsDK50QVEqy6O3cXTIeE5YpAoLlpawSDLAQ7k3f_pzIYj
    y1EKZ2UUxZ6DFHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdeiudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkh
    grvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeffveeuhfekteehudevgfeggeejffei
    tdekieevvdeujedvjeelleeuieejjeeivdenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggp
    rhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlrghrshdrnh
    hoohguvghnsehgmhigrdgtohhmpdhrtghpthhtohepphgrsghlohesnhgvthhfihhlthgv
    rhdrohhrghdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:sQHSZ5koyxhLRBl8ZmslGG6FK3duqvEwmOcvSFHmxntVqlUbKmRG2g>
    <xmx:sQHSZ0wr6XRDxzdt8Wr9SinYAf0jjFGTw8mp_sukMvT-XezK0nAi-w>
    <xmx:sQHSZ7R7gVIGt5QJBLq8AT_ZNvONMfZ4XImswnfJUaWkFdge4aIEVw>
    <xmx:sQHSZ_b_Gxnfmk19FeoDsrlMeSEMTdh-SrC4YRy3VZnCD6QVJMyOxw>
    <xmx:sQHSZ2fLVHjjydKwbjCFwNlFy2NrYlVnxedfO7gOk-YsZX6hMCom1iuP>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 22E3E3C0066; Wed, 12 Mar 2025 17:50:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 12 Mar 2025 21:50:20 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 "Linux Netfilter Users List" <netfilter@vger.kernel.org>
Message-Id: <7773800a-a467-4821-8ee0-bab3bc001ab7@app.fastmail.com>
In-Reply-To: <Z9Hk8SsJwZArWo9C@calendula>
References: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
 <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>
 <Z9Hk8SsJwZArWo9C@calendula>
Subject: Re: Dynamically appending addresses to a named set
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Mar 2025, at 7:48 PM, Pablo Neira Ayuso wrote:
> On Wed, Mar 12, 2025 at 07:44:25PM +0000, Kerin Millar wrote:
>> On Wed, 12 Mar 2025, at 4:08 PM, Lars Nood=C3=A9n wrote:
>> > Hello,
>> >
>> > In NFTables, I have created a named set called 'bar' in the chain i=
nput
>> > in the table foo.  I can add elements to the set manually,
>> >
>> > # nft add element ip foo bar { 192.168.2.2 }
>> >
>> > However, I am not able to guess the syntax to have a regular NFTabl=
es
>> > rule do the appending automatically.  I've tried a lot of permutati=
ons
>> > of the following, but always with fatal errors,
>> >
>> > # nft add rule foo input tcp dport 22 counter add @bar { ip saddr }
>> > Error: Could not process rule: Operation not supported
>> > add rule foo input tcp dport 22 counter add @bar { ip saddr }
>>=20
>> For the kernel to raise ENOTSUP does not indicate an error of syntax.=
 The bytecode intended for the nftables VM will already have been compil=
ed at this point.
>>=20
>> I suspect that your set has been declared with the "interval" flag in=
 effect, in which case updates from the packet path are not allowed. As =
far as I can tell, this constraint is undocumented.
>
> Maybe Lars forgot to set on the flags dynamic;

Not to go off on a tangent but that was my initial thought. Yet, neglect=
ing to specify the "dynamic" flag does not seem able to cause the error =
that Lars describes.

# cat test.nft
flush ruleset
table ip foo {
        set bar { type ipv4_addr; }
        chain input {}
}
# nft -f test.nft
# nft 'add rule foo input tcp dport 22 counter add @bar { ip saddr }'; e=
cho "$?"
0

That's with nftables v1.1.1 and Linux 6.12.13. Ultimately, the set becom=
es a dynamic one, even though it was not declared to that effect. I find=
 it surprising because:

- the behaviour of the implementation directly contradicts the manual
- it seems difficult to fathom, predict and explain the behaviour
- it casts doubt on the purpose of the flag (where is it even useful to =
declare it?)

I wonder, also, how nft(8) can possibly be assured of my intent in a sit=
uation such as this. Imagine a scenario in which the admin adjusts a set=
 so as to be non-dynamic and forgets to remove a rule that updates from =
the packet path prior to reloading a ruleset. Could it not simply abort =
upon encountering the rule and require for the admin to resolve the inna=
te contradiction?

Or, is "dynamic" destined to become a historical artifact and be retaine=
d only for the purposes of backwards-compatibility?

--=20
Kerin Millar
