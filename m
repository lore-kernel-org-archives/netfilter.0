Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FA15D1
	for <netfilter@vger.kernel.org>; Sun, 31 Mar 2024 06:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711866846; cv=none; b=GLKo3FSgK6zAhsfTDW29kkCqq+agtxPFag6E4sEQGKuLHYWP25NIsfDVyM8MxEgIvVbDc/mJPCgGmoemKJa5eFwCvC4t6+nZxLkmd5Zs2HIzokXcZmZLQHmHqTSfjX1pkpxE0Gg3b9GY9q7a+sI6ph3Tkhny7t/43oLyulGBFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711866846; c=relaxed/simple;
	bh=B9Ib9FJ5RwslYi4NJS8sq90QSEsP4Is0zrobSXaP4Hs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=P32bn4EK/htGwef8IYEmjZofZmeJwbsXaUO2qhL0T89G3HPKGR5fbvYuGBsvS/k8K2tVdlXfjEvd4M6cFgwogMddjvcba18yGGVnipvdrAedZbqTYznZY4MAj7iqoP6Jc6ntGN6FAK9sd+Yxka0se+wgnejA+OzVKgqG+qIF6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=Pj/VIVTC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jqOt0EG8; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="Pj/VIVTC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jqOt0EG8"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8D51213800C7;
	Sun, 31 Mar 2024 02:34:03 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sun, 31 Mar 2024 02:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1711866843; x=1711953243; bh=prI8FyFtyG
	GziVGjhgd16x6zAVdaLNMoe0K2X2XSEKI=; b=Pj/VIVTCFdQLbJryXxUg37VKWS
	6DGka1knAkyy0DCwzmyMpN0LhXhb1hVn+pwtdhEg9Vi9BJbHtoTxMM3Aa2d5QHN2
	1QIuoJ5oh0vf1cZvYp08xVacscvkN4+UHig65YXMdfiHucJIoCg4x5ohER2f1osJ
	4PfJJA4sT8JV4GYPaPeZ6BCGw9qtk0AatgDU9g8WrtijW8hQ5DvPlissxNhoilqe
	zvXxJAXphjxVmVQK25lXYbJNprqV7np3GusKif4/M/kZDRzLura8bsF8EKgu/fnh
	f0637cM1CFVw4GPS7kEy2hEtuLVnXu0XlhdFGSPn3RnHVtro04MY6WglOfWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711866843; x=1711953243; bh=prI8FyFtyGGziVGjhgd16x6zAVda
	LNMoe0K2X2XSEKI=; b=jqOt0EG8vKfiNn0ulMvJPenIzGUQz1iU2gQvXt2Z4vId
	d1h+ZtpUKHKK1H7iJrsE/rNzb+Tssm25+A80hhFpBC8741Q4J7QCxzWb5Wz7yAmt
	TCtUxOViVOdHBXoi6Jf8VNWvv3KOKqXcDOKhA4+zERmIKfMYU4UckzYlcRWOhVE/
	7cEE4qAMd9/mjHd/KKSe3DBDUCVmsH5v6zr5zDZZIO8y63gKe2mo0p5if2SXF2lk
	hev7Zi7z9drbBa+k8J4AozdQZN+AHsWB85sRWeGqIB45LixFQc/oFmQaIQOtuhID
	RxIwq812uMfmps7J5V3yeyNDZ8q0YSW7ltoWaF2bPg==
X-ME-Sender: <xms:2wMJZnxCBxQv25s2F3NDqqQe2vfEBF_aiX3JT1dKO4Y5mYXlOrlgRg>
    <xme:2wMJZvTSGCez_m80J1EuLTToMJ4v0hZIqasNyduWex8ojdAK-r57w76WaIhCMFrsz
    DzwTJlxMbXIYgo2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddviedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfmfgvrhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhu
    shhhkhgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeekheffffetgfduiefgkedvfe
    duhffhfefhkeffvddvfeekuddthfffieeggedvffenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:2wMJZhViafu9hBRhqHtzh5xNAEqCJvFTlDvHpHxKFCn7-f645LbsYw>
    <xmx:2wMJZhgNPaCCNwqRDo7h3m7m8J75_MWaTmuQ4WO56ZkfLO5RAmA1GA>
    <xmx:2wMJZpDnJTLjrYiainuLwO7STSVSURUsrIOHEO6KDufbS2UTMGZxfg>
    <xmx:2wMJZqKU1UHj9A7dUT7CuSwBgaASvEvOGE1uirVKG5n6v_psp5QhcQ>
    <xmx:2wMJZsNWUKaeDXBpCSyPPfeja-EeClGgHx4NBrjVDivzzgVvEPnnKg>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 451691700093; Sun, 31 Mar 2024 02:34:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f1e198cf-949e-4dbe-becb-25d2ee4c2950@app.fastmail.com>
In-Reply-To: <20240330194139.561b5a24@localhost>
References: <20240330194139.561b5a24@localhost>
Date: Sun, 31 Mar 2024 07:33:42 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "William N." <netfilter@riseup.net>, netfilter@vger.kernel.org
Subject: Re: nftables: How to match ICMPv6 subtype in a rule?
Content-Type: text/plain

On Sat, 30 Mar 2024, at 7:41 PM, William N. wrote:
> Hello,
>
> I have been reading RFC 4890 and 4443, as well as nftables wiki and man
> page.
>
> It is obvious how to match ICMPv6 types using 'icmpv6 type'. However,
> as RFC 4890 recommends, there are situations where only a specific
> SUBtype must be accepted, e.g. section 4.3.1:

As far as the ICMPv6 header is concerned, there are only types and codes. 

>
>    o  Time Exceeded (Type 3) - Code 0 only
>    o  Parameter Problem (Type 4) - Codes 1 and 2 only
>

Those are types and codes.

> I have been searching for days and I can't find any info about matching
> ICMPv6 subtypes. ip6tables can do that (as shown in the example in the
> RFC) but no info about nftables. ip6tables-translate cannot translate
> subtype rules (it converts them to a comment).
>
> So, what is the nftables syntax to accept only a specific subtype of an
> ICMPv6 type?

These are the relevant sections of the manual:

LESS=+/'ICMPV6 HEADER EXPRESSION' man nft
LESS=+'/ICMPV6 TYPE TYPE' man nft
LESS=+'/ICMPV6 CODE TYPE' man nft

However, there are some errors in the manual. One is that the ICMPV6 HEADER EXPRESSION section does not make it clear that the type/keyword for the ICMPv6 Code is "icmpv6_code", instead generically describing it as "integer (8 bit)". Another is that it erroneously documents the keyword for the ICMPv6 Type as being "icmpx_code" in the ICMPV6 CODE TYPE section.

Anyway, the syntax is:

icmpv6 type <icmpv6_type> # where <icmpv6_type> is any valid ICMPV6 TYPE value
icmpv6 code <icmpv6_code> # where <icmpv6_code> is any valid ICMPV6 CODE value

Both of this header expressions may be combined within a single rule. All of the possible values are documented by the aforementioned sections of the manual. Alternatively, you may ask for nft(8) to print out the supported values for you.

# nft describe icmpv6_type
# nft describe icmpv6_code

-- 
Kerin Millar
