Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5528819CC02
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 22:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731622028; cv=none; b=Dy36S7dS3IuFkZzGF2TZ+y9YLRI/bTZDDhccDNvp92U9jzIekfTEAovTDo4AdL6nKIk+I7gC8ro54KOIL2QmEEsLDTuSgQpOAGW2ZHv6o3L70oRQP+GO/hELspz20+COjnSBjj/jpVbq/OwN78xf4seJGdKsEYOlz8dddMw2dlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731622028; c=relaxed/simple;
	bh=JERJvNp3PCbNojiMwcwPl4lLxIziwmJQw6uUxVk7Ps4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gLi21tEhVfHR9dUY83Oa8BZj2bHCZrUirJcg5L3BPqtmsbAAZ+gsdzBEwCINM++sAwpzuHt4mizogulLBT+Om59cNLE0HvrzbvixNafzWWJwjMJJIK9PrRQNlLVt49ME8JznyeSFZd0YTj5Hgl/DavXohWVQ/IUz0PtEC9C2Alc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=VkTgQhtL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mRKABWkJ; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="VkTgQhtL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mRKABWkJ"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 475ED1140162;
	Thu, 14 Nov 2024 17:07:05 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Thu, 14 Nov 2024 17:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1731622025; x=1731708425; bh=QpZWpy/O8bzkST0LEf/ufqQVnKLDjwe6
	E4I7ZGu0JXM=; b=VkTgQhtLCJiUBunggE02ZUt5upeEuOXFY/MPuzobhI4Q7+ul
	QLSP4w9y9Ah5E5mW4UOnYll10zaAgx4uqgPHp/NQYoeIFuKQJxuEYFcYf4h6cnOW
	p/540coERkFXCro3goJXx57ITtavJ35rP4s5ZvMTixAj+RABhsx8+WgpWSPpN+Xq
	pVTFSjzF/XjopRNDV/CdvgxzkX2bESF21aDG4T1p65Z0uRahbYQtZsqlpodFoxGn
	nwQr01mKYsm5Q9+4sbuz5sRxSc6a8Kuh3L8Z98Z/mQuGosypDSdfGksSDFFy54OY
	W7hTsw+YBLGT0fvW2xURKjuhcQ+FCz171d1MSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731622025; x=
	1731708425; bh=QpZWpy/O8bzkST0LEf/ufqQVnKLDjwe6E4I7ZGu0JXM=; b=m
	RKABWkJOPGTpIMr8b0hIs1Pg5bxzvGQW4YXBOiFv1qt8JZ+4Vt5HPRHdH68T4QPQ
	tLAje7PCjhp56RHdQdnB0bt2cp8fTcb0vjhds2toO6Xea/8p+OsrlbC9oKNPsFy+
	8oCJyr0JMuacoVvXQ06yrodbGnVA3SPXL4xVZGDajXqSN3/NO1e6QWyvQ2nqKwT8
	BE/AvJ4K6B5/cIJOpiTFHO6/9IKVMon5+q4AGh8fh/3rI7YBumvf/POBtNAel1gf
	zkn0I3oYALyx1m6MFTUTanMayiowk+IXXyRSUgP1kk7Y4zZezB0xVM/DupgQNM25
	VoMUfPojrZbHMlXBMwMHw==
X-ME-Sender: <xms:iHQ2Z7X93GIIb3wjSiJc06nwnLck-4MDIPhiJu_QUyesRklsTxVrKQ>
    <xme:iHQ2ZznA2sRXUhMDhuE9kNTpU6BJFGk-7PTQfMWtDGHDh0uFJuvkxcL247m5FBSQe
    RQXuCWf_Z--24I_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvh
    grrdhnvghtqeenucggtffrrghtthgvrhhnpeffveeuhfekteehudevgfeggeejffeitdek
    ieevvdeujedvjeelleeuieejjeeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvghtpdhnsggprhgt
    phhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrsheskh
    hovghllhgvrhdrugihnhgunhhsrdhorhhgpdhrtghpthhtohepphgrsghlohesnhgvthhf
    ihhlthgvrhdrohhrghdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:iHQ2Z3Zmw_PmhbiLSL-izCMSppzQe4MQEWgRYHmkiO6hf-tyK62PMA>
    <xmx:iHQ2Z2UQ7GVmHFLOCw6hm-TWX6Owr92YXAt22zEUWNN0le7EFbhysw>
    <xmx:iHQ2Z1l9nWtAuWdZSVk-L5lQrTS3GglNOEIrI_Fe4_fiavfRsbO2lg>
    <xmx:iHQ2Zzfxno2ZBrNWoWC62bSLE0bCoHk-RaLfjyoMCbKN757J2CqLbg>
    <xmx:iXQ2Z6x8z9EH6YAeyK_O69c2Gr4hZcvzY-TOb1vJLb6DCwg_fkvla3Jx>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A5463C0066; Thu, 14 Nov 2024 17:07:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 14 Nov 2024 22:06:32 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Pablo Neira Ayuso" <pablo@netfilter.org>
Cc: "Thomas Koeller" <thomas@koeller.dyndns.org>, netfilter@vger.kernel.org
Message-Id: <3eb90ede-c19c-409e-a882-e068efeda7e7@app.fastmail.com>
In-Reply-To: <ZzZh1TM96YVgTl8y@calendula>
References: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
 <35678cc4-98df-4929-a22d-b50ba1b2a7c5@app.fastmail.com>
 <ebdf9189-3a2e-4501-aa07-a29fbc4d713f@app.fastmail.com>
 <ZzZh1TM96YVgTl8y@calendula>
Subject: Re: Dropping of the end of a chain
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Nov 2024, at 8:47 PM, Pablo Neira Ayuso wrote:
> On Thu, Nov 14, 2024 at 04:26:42PM +0000, Kerin Millar wrote:
>> On Thu, 14 Nov 2024, at 3:51 PM, Kerin Millar wrote:
>> > On Thu, 14 Nov 2024, at 2:01 PM, Thomas K=C3=B6ller wrote:
>> >> The nft manpage states that if the end of a chain invoked via 'got=
o' is=20
>> >> reached without a verdict, 'evaluation will continue at the last c=
hain=20
>> >> instead of the one containing the goto statement'. I cannot make s=
ense=20
>> >> of this; what is the 'last chain'?
>> >
>> > To say "last chain" is highly ambiguous. I suggest that it be rewri=
tten=20
>> > as "evaluation will continue as if the invoking rule had instead=20
>> > specified 'return' as its verdict." Such would be simple, coherent =
and=20
>> > correct.
>>=20
>> I just re-read the relevant section of the manual, which is as follow=
s.
>>=20
>>        goto chain   Similar to jump, but the current position is not =
pushed to
>>                     the call stack, meaning that after the new chain =
evaluation
>>                     will continue at the last chain instead of the one
>>                     containing the goto statement.
>>=20
>> I think that the language is reasonably clear as it stands, though it=
 is lacking in punctuation. However, I can see how some readers would be=
 thrown by the use of the world "last", particularly those that do not u=
nderstand the concept of a call stack.
>>=20
>> Perhaps the following would be clearer, without unduly diminishing th=
e technical nature of the language.
>>=20
>>        goto chain   Similar to jump, only the current position is not=
 pushed to
>>                     the call stack. Consequently, once the evaluation=
 of the new
>>                     new chain has concluded, evaluation shall continu=
e as if the
>>                     the invoking rule had instead specified 'return' =
as its
>>                     verdict.
>
> This extract is very similar to what there is in the iptables manpage:
>
>         goto chain   Similar to jump, only the current position is not=20
> pushed to
>                      the call stack. This specifies that the evaluatio=
n=20
> should
>                      continue in the specified chain. Unlike jump,=20
> return will
>                      not continue evaluating in this chain but instead=20
> in the chain
>                      that called us via jump.

To my mind, there are some issues with the above.

Firstly, "this chain" might be ambiguous. Such a phrase could be constru=
ed as being a reference to the just-mentioned "specified chain" in the p=
receding sentence. The likes of you or I already know that such an inter=
pretation would make little sense but this may not be apparent to the fi=
rst-time reader. Ideally, there should be only one possible interpretati=
on.

Secondly, proceeding to use "return" as a noun rather than a verb could =
be construed as implying that a return verdict statement must be involve=
d, which is untrue. Also, return where? Compare and contrast to somethin=
g like "Unlike jump, if the specified chain is returned from, evaluation=
 will not continue in the calling chain but instead [...]"

Thirdly, to say that the "return will continue [...] in the chain that c=
alled us via jump" implies that a jump verdict statement had to have bee=
n involved, which is untrue. It fails to account for the control flow of=
 the following ruleset, for example.

table ip filter {
        chain INPUT {
                # This chain was never jumped to.
                type filter hook input priority filter; policy accept;

                # There is still a difference caused by using goto rathe=
r than jump here.
                iifname "eth0" goto input_eth0
                iifname "eth1" goto input_eth1
        }

        # There are no return statements.
        chain input_eth0 { }
        chain input_eth1 { }       =20
}

Fourthly, referring to a chain - any chain - as "us" is not something th=
at I would expect to see in a technical manual.

While by no means perfect, the wording that I proposed tries to explain =
that, if the specified chain returns - whether implicitly or explicitly =
- the behaviour is as if processing a return verdict statement in the ca=
lling chain. The idea was to encourage the reader to cross-reference the=
 description of return, which accounts for both scenarios:

- returning from a chain that was jumped to
- returning from a 'base' chain and thereby being subjected to the polic=
y specified by a hook

Put another way, it tries to leverage a definition that already exists e=
lsewhere. Although, the description of return also uses the same phrase =
that threw the OP. There is only so much one can do, I suppose.

--
Kerin Millar
