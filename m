Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23279938
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706706201; cv=none; b=DlSBHtPfsp/Fm9I8cb6MfSrj+If8AEG7U8ReUJAq1CHMVeAs/VsFZnJetpY+yB799ADx/PyHLrgoHpBvctHn+SLAM84URXqjAeNb1nfc4q2yZXLZFQqjjgatQ3FBMUTkzAWo5wmWMFRLpEtLWexUG+a3NVOi7I7qOEGIb/exHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706706201; c=relaxed/simple;
	bh=GM6bOjQzyZpWZmxE4RvX9Mfrpo1blL+OHQ0DUAZj5rY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=mOBco9t3MOrPxxQeZXRAEgFr4uZe6XGFO883y7ObNZfMwi5vKiMhMRYJPq4mKaJk7XO6cwRRprnTEnkbx74ImwvHDLwYjGUwnuDeqE7QkwE/LflMA1SJCegoKXZ6gjstqBngMC2av2KVwE3JIdLlStmZOj3S/cHEnb+IrRT2cfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=RnRZL5NY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M46wJujl; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="RnRZL5NY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M46wJujl"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6933B5C0112;
	Wed, 31 Jan 2024 08:03:18 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Wed, 31 Jan 2024 08:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1706706198; x=1706792598; bh=fPNr1t0NLo
	KrYcsnv6GNQlKUWIRaOri4uXtSGvnXz6U=; b=RnRZL5NYFwUcx9vt+31KtgaL39
	5rShjuH/53n7AAvkWTAf+0UwTC8ESRYB1ATENNtpQbPN9IOSn2ueN+t6hxbfRJeD
	8gy2I/MGTh1qdr2rEI6ya4xMU4O5FfKuwE09Xbz1zebJsXQ6/pCFuI98heYiw81r
	zc4Kha/Om9KPUYMW+W8CkB2QGbRhELqD8iPfvHYosp96bQKhqN/JwP+omlYUt8iW
	IZ9VLKgp0cAKoglHXB95AxTO/8vKxNcDW9TAsPGcvfkQJ1EE+oaOah6rAe9Txdoz
	GWW7UOAMHR2yAE51+0cPCjN088/Egb3cf/yXZBlZKFIqIJk8sNJz49SCWAPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706706198; x=1706792598; bh=fPNr1t0NLoKrYcsnv6GNQlKUWIRa
	Ori4uXtSGvnXz6U=; b=M46wJujlatCDXnj6lfakmt2QMFW3Quu8V0yg5/PM+QAN
	y9ri3G0XwdDfEiLPGPmNaYE90aYZlnoB1cdBDTMChUqacCkq0qcODg40f7Lb+nKz
	k2LGSPGBPK2+9mYwBBEjlJudpxfGSWM9jOHWvNe5MF089p27PJjp2jMNfIbopad0
	gYjNRD+FBEcYPTFxhPyheE2+kLADQJ/oYUH7IArhDCopOIQOp7f12WL+KA4Limcd
	fi/3/yscIVv0poURX/jdcjjA3WvFmKfMbFBHXcG3jvSSZjRZdOE+nKe7eS3PyJIF
	rf5sxhTNiYE7NwRC2XplLHUo8bVdopoMPCgKJB54kw==
X-ME-Sender: <xms:FkW6ZczX3zzQ1qRIUcuQGFbO5ZAEJdBZ9rvffnwWpkJ2wLR4oG_Tsw>
    <xme:FkW6ZQRGNidP9Xvq8-KAdsWYTPfckFX19yRaQrRJuOG_94itU0fOGmk7-c6KX5OYu
    ZbkPnLmaH5Ha-MX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtledggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepkeehfffftefgudeigfekvdefudfhhfefhfekffdvvdefkedutdfhffei
    geegvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:FkW6ZeW_E3AsrzVYSPHotjl41WREykm5kKcp9d-xHfam7KKJRAG8NA>
    <xmx:FkW6ZajezzhH6fOl2pWyYXDC_Kqi0dCi80n-lgepg75vsHajtUrCIA>
    <xmx:FkW6ZeCBsCEou8WJwltmd0aqolO_OAgYxx5LnRUvGQSzLgk2GWCdUg>
    <xmx:FkW6ZZoUIdanjE6VbRSKq5-sXGEEdJMOINWckv379tjtHKySF2azaA>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0AF1B1700093; Wed, 31 Jan 2024 08:03:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
In-Reply-To: <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
Date: Wed, 31 Jan 2024 13:02:57 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Marc Haber" <mh+netfilter@zugschlus.de>,
 "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain

Hi Marc,

On Wed, 31 Jan 2024, at 10:54 AM, Marc Haber wrote:
> On Tue, Jan 30, 2024 at 03:17:32PM +0000, Kerin Millar wrote:
>> On Tue, 30 Jan 2024, at 1:08 PM, Marc Haber wrote:
>> > This is one of my pet peeves with nft, actually. For iptables, there was
>> > tooling like ferm which made it possible to write dual-stack rule sets
>> > very easily. This kind of tooling seems to be completely missing in the
>> > nftables world. Am I missing something here?
>> 
>> Quite possibly. Currently, nftables supports:
>> 
>> - mixed rulesets (using tables bearing the "inet" family)
>> - mixed rules (wherever it makes sense)
>> - first-class sets of any kind (irrespective of the type of table enclosing them)
>
> That nicely shows another issue with nft: Docs. Neither the search
> function on the nftables wiki nor the nft manual page have matches for
> "mixed" or "first-class".
>
> How would I use a mixed ruleset? How would I use a mixed rule?

It wasn't intended as jargon, so the onus is upon me to clarify.

Firstly, I mentioned both tables and the "inet" family. If you search for inet in the man page, you should land in the ADDRESS FAMILY section, which indicates that the purpose of an address family is to define the type of packets that can be processed. It goes on to say that "all nftables objects exist in address family specific namespaces, therefore all identifiers include an address family".

Now, if we look at the defined grammar for creating tables in the TABLES section, it is - in part - presented as "{add | create} table [family] table". That shows that that the family can be specified at the time of creating a table. But wait, why is it in square brackets? It means that the argument specifying the family is optional. It goes on to say, "when no address family is specified, ip is used by default".

In summary, a table must always have an address family. If you do not explicitly specify the family at the time of creation, the family shall be "ip". If you specify "inet" as the family, the objects within the table (hooks, chains, rules etc) will be able to handle *both* IPv4 and IPv6 packets. That is what I meant by mixed.

Secondly, by mixed rules, I meant that generalised rules within an inet table can handle both IPv4 and IPv6 packets. Consider a very simple rule such as "tcp dport 22 accept". It will match both IPv4 and IPv6 without issue. As you well know, iptables is incapable of doing this.

Thirdly, by first-class, I meant that sets are an intrinsic feature of nftables. That is, they are not a feature bolted on by way of a separate kernel subsystem, along a separate userspace tool to manage them (ipset), requiring an iptables extension to glue them together. Consequently, it is possible to use sets in many interesting ways which are simply not possible in iptables. I am aware that this comes at the cost of some administrative complexity.

>
>> Granted, one cannot create a set that is typed in such a way that an
>> element can be either an IPv4 or IPv6 address/interval. Conversely,
>> iptables does not natively support sets at all, though it can
>> integrate with sets that are managed by ipset(8). Now, can an ipset
>> contain addresses of mixed types? No, it cannot.
>
> In ferm, a tool that has been available for over 20 years, you can
> (beginning ten years ago, I think) write things like:
>
> @def $h_cadencia=(192.168.251.9 2001:db8:42bc:a102::9:100);
> @def $h_chasse=(192.168.181.161 2001:db8:42bc:a181::a1:100);
> @def $g_dnsrec=($h_cadencia $h_chasse)
>
> domain (ip ip6) {
>   table filter {
>     chain FORWARD {
>       iface internal0 daddr $g_dnsrec proto (tcp udp) dport 53 ACCEPT;
>     }
>   }
> }

I would agree that fermi is a fine wrapper and that its author has put considerable thought into its syntax.

>
> which creates (if I calculated correctly) four IPv4 rules and four IPv6
> rules automatically. Ferm solves this trivially by dropping any
> generated rules where address type and domain doesn't match.
>
> This approach of course makes the sheer number of rules explode, but it
> makes writing rules easier. My time is precious, CPU time is generously
> available. In the situation where CPU time is precious as well, I might
> be willing to spend some more time writing _efficient_ rules but that's
> like 2 percent of all the cases and I am not willing to make my life
> harder in the other 98 percent.
>
>> As far as the present topic is concerned, the only tangible advantage
>> that ipset has is the ability to create a set whose sole purpose is to
>> act as a superset of other - potentially mixed - sets. This advantage
>> is rather diminished by the fact that one also has to two manage two
>> entirely separate rulesets with iptables and ip6tables,
>> notwithstanding that wrappers such as fermi exist.
>
> Of course one could have an nft preprocessor solving those issues, but
> given that nft is already open source, reads a text file and configures
> the nftables kernel backend, the natural approach would be to modify nft
> to not only translate input 1:1 to kernel entries, but also add some
> bells and whistles that makes life easier for those people writing
> firewall rules.
>
> With iptables, where people are encouraged to put their firewall rules
> into shell scripts, things were entirely different, and this approach
> was very inconvenient (proven by the fact that many iptables frontends
> didnt write iptables scripts but files that could be read by
> iptables-restore.
>
>> At any rate, the follow nftables ruleset is valid.
>> 
>> table inet filter {
>>         set block4 {
>>                 type ipv4_addr
>>         }
>>         set block6 {
>>                 type ipv6_addr
>>         }
>>         chain INPUT {
>>                 type filter hook input priority filter; policy accept
>>                 ip saddr @block4 drop
>>                 ip6 saddr @block6 drop
>>         }
>> }
>
> Isnt that clumsy! Wouldn't it be so much nicer to be able to write:

I don't find it particularly clumsy; it is rather low on my list of nftables-related grievances. I don't know whether you are a programmer yourself but, sometimes, I wonder whether there is a culture clash of sorts between programming admins and non-programming admins. Though I am no Netfilter hacker, it is intuitive to me that sets are strongly typed and that the protocols are different. That being said ...

>
> table inet filter {
>         set block46 {
>                 type ipv46_addr
>         }
>         chain INPUT {
>                 type filter hook input priority filter; policy accept
>                 ip46 saddr @block46 drop
>         }
> }
>
> Having to write distinct rules makes things more complex and
> error-prone.

... I can certainly appreciate this perspective and why it might ease the cognitive burden for maintaining some rulesets. 

-- 
Kerin Millar
