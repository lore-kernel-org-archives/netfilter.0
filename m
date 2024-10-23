Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5031F4707
	for <netfilter@vger.kernel.org>; Wed, 23 Oct 2024 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729726972; cv=none; b=Ua8itAcZ5y6eEW1tusmDhXhqcgDxe1FOS+4nYy2HdT1arHbvCf108YwtqQE5T/2yLfPEHp7v9oNwkiiAVEwTUX+WRbhLmd0reU/ar/PJkaXNvjg8rw4Mafns0afqaiEZ+LAXOxhbxTHTbPGIHhfBsKXxmvMtJfz4JyMJvfqulf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729726972; c=relaxed/simple;
	bh=v3np+MnA+C5ENe7d8R1ceTGDe79m25OtRAxyFZA7ym4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RTEjZXMgTwx1F7v0ozCAWMOUwzHf7YrQaQrYbbVQd3T7YBAosCT6jf9+XGykI3CP09xv/hgK9gynVDf2e11fG5kZZpnhX0qrNLCzeXSt6G76/eh0+HgxarZC7WdnKHvYUCPBubRT+8tMt7ci7XFOMxyXtCEnj36NDcrXOdvMQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=bC39dLWt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VPb65SRg; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="bC39dLWt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VPb65SRg"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3E59B1140142;
	Wed, 23 Oct 2024 19:42:48 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Wed, 23 Oct 2024 19:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729726968;
	 x=1729813368; bh=e7+Bg7DsOCGUjnT30jeUcUQT/3fPGZLT/DdInrAyLbE=; b=
	bC39dLWt4+cg169xzGJSx7wXRjLU6r/AUPEn7KctoeCTcPeI6r/vven9Lap7NH9f
	1H9r9smUVu9Pf+uOGdIXKmBBC+8OGgjTlgnCGlZi8yMMzy3xfqpcZ8JG1K6w2rBL
	FIICj1GwdNciddjDkyT2qkQIHAEahCltthNbp6z91DpcEA3+oV8Cf6ERkfbOYNc8
	TlY2zHH/RxFHbk9kwFBHJlj5xIZ8EgY2C0gyxych+CUi8b8hQYs0+SHjIVlGmZVf
	mAzoEU4OhrnSeTj+Cyxti3fiofK3gbWVNm740PSWpEWknxNYvzZIgUNwvWHF7qqG
	F8/IVmWOO4mBeCNzyCWKPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729726968; x=
	1729813368; bh=e7+Bg7DsOCGUjnT30jeUcUQT/3fPGZLT/DdInrAyLbE=; b=V
	Pb65SRgT1afdVRi1QdM3w7aJk9wg/BdU3Qnsyoy9VlJRaoLp5eSJVDtyqIpAOavK
	4azrSa2Wut7rrYRoDlmMKEIOBtw+zpcKulbAZYKyFKxVDevht3NMXALO1NMZjTKH
	tqR6yst2ZML9iXtqtkpCUgg5gHxI8IMmolLxCdcWvQUaoH+6Eqgm7PbhAqzNkJhF
	o54FEHQt39cK41xXjChchn9wLW6RDPMnn9bzyR1TtPE+9ZhrxzCxKrheJ92MUiKG
	IM2fl7NLXLKmCv2ifDPj6J/mU6EF+0p01vKKtkjrUP/GhUOs3qbiYEd+9ab9blO4
	FqR0O0wXlnwN/BgOP1ZhQ==
X-ME-Sender: <xms:-IkZZ1Duvnd7o-AekciB6u38-BeEbxELZ6w1kj5XjE_S73k0I1HVTQ>
    <xme:-IkZZzh0HeBWxDA2yTHDKNBq-cmhI3QhSEuJCUGUHqoa3hPHLfBIoMTwU40EXXUdO
    w_pZn98L4l8XQOZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeikedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrg
    drnhgvtheqnecuggftrfgrthhtvghrnhepgfeftdefjeeuvddvudffffdtffffudefvdeu
    ueelgedugfekgeekveejteehvdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvthdpnhgspghrtghp
    thhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhiirghgrhgrsggvse
    gurdhumhhnrdgvughupdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:-IkZZwkk9Y0MilyDFcKC8jkDSptV0Nre6AOP1mxi5SUqqcjPpnijnw>
    <xmx:-IkZZ_zZ7_rILkW0tfsNKWvqK6iBQMLnEwhlcKReNTgxMI_MxUUTvw>
    <xmx:-IkZZ6T8iw73xTIVS2Qg2KM5PgW-mIauQueuTfwzYJWZvhsUUM031w>
    <xmx:-IkZZyaGrJb8pQIW1WZYj49NXX38fILGEityGKUZ3svYAoQMGfrJig>
    <xmx:-IkZZ9KoEXJTHArdpHsg4dfWlgLy2eptBXfYs8Ojv85-O0fMELNe7H8n>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ECCAA3C0066; Wed, 23 Oct 2024 19:42:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Oct 2024 00:42:26 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Matt Zagrabelny" <mzagrabe@d.umn.edu>,
 netfilter <netfilter@vger.kernel.org>
Message-Id: <d3b6500e-0d6f-45f5-9363-9fbad985b880@app.fastmail.com>
In-Reply-To: 
 <CAOLfK3UqOC6Mm+R+N9cQRPg_LvQzRfsRb-nRNRjFc4HR6vmV-A@mail.gmail.com>
References: 
 <CAOLfK3UqOC6Mm+R+N9cQRPg_LvQzRfsRb-nRNRjFc4HR6vmV-A@mail.gmail.com>
Subject: Re: location of conntrack rules
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Oct 2024, at 11:10 PM, Matt Zagrabelny wrote:
> Greetings,
>
> I have, what could be, a simple question.
>
> Do folks put their connection tracking rules near the top (earlier
> rule) of their ruleset, or near the bottom (later rule)?
>
> I used to believe that it "made sense" to have the conntrack rules
> earlier in the rule set, because the packets would be
> related/established and wouldn't need to hit the other rules
> unnecessarily.
>
> However, the conntrack requires more kernel memory to track the
> packets. Therefore if every connection is tracked, then that would
> drive up the memory required for having the conntrack track every
> connection/packet - thus possibly exhausting the memory and not
> allowing other packets through.

You may be under the impression that rules of this sort electively subje=
ct the matching packets to the machinations of the conntrack subsystem a=
t large but that's not quite how it works. Once the conntrack subsystem =
has been activated, all packets are within its purview past a certain th=
reshold. The latest revision of the nft(8) manual briefly touches on thi=
s.

"With nat type chains, there=E2=80=99s a lower excluding limit of -200 f=
or priority values, because conntrack hooks at this priority and NAT req=
uires it."

Therefore, if you want for a given packet not to be able to produce a ne=
w entry in the conntrack table, you must go out of your way to make it s=
o. Consider the following nftables ruleset, which employs "notrack" to t=
hat effect.

table inet filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
		# The mere presence of this rule will be enough to
		# activate conntrack at large. For many distributions,
		# such entails loading the relevant kernel modules on
		# demand.
		ct state established,related accept

		# There is no chance of otherwise matching packets
		# traversing lo based on ct state (see below).
		iifname "lo" accept
	}
}

table inet raw {
	chain OUTPUT {
		# raw evaluates as -300 n.b. lower than -200
		type filter hook output priority raw; policy accept;

		# Don't bother tracking packets traversing the loopback
		# interface. In many cases, this can be an acceptable
		# means of conserving resources.
		oifname "lo" notrack
	}
}

The same is true of iptables, only the syntax is different. There, one m=
ight use the built-in raw table and the CT xtables extension.

-t raw -A OUTPUT -o lo -j CT --notrack

>
> So, now I am wondering if the conntrack rules should (always?) go at
> the end of my ruleset.

Rules that match _exclusively_ on ct state should not be situated at the=
 end of a chain. The consequence of doing so will be that the probabilit=
y of inadvertently composing a faulty ruleset is markedly increased.

>
> Or do folks put the conntrack rules at the top/middle/bottom of the
> ruleset on a case-by-case basis?

Generally speaking, they do not. Keep in mind that if a ruleset defines =
up front a suitable verdict for all four of the states, "established", "=
related", "invalid" and "untracked" then, by definition, any packet that=
 continues being processed must be in the "new" state. Such is convenien=
t because it obviates the utility of explicitly matching on the "new" st=
ate.

tcp dport 22 accept              # convenient
tcp dport 22 ct state new accept # less convenient

-A INPUT -p tcp --dport 22 -j ACCEPT                            # conven=
ient
-A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT # tireso=
me

However, many rulesets never have to contend with untracked packets at a=
ll. That is why it is common to see examples of stateful rulesets that o=
nly ever explicitly match against the "established", "related" and "inva=
lid" states.

--=20
Kerin Millar
