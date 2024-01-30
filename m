Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B5821105
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706627923; cv=none; b=mj+DqruTXdJwZZC5GRGoO3EKVS+EiTCN8dN08ao3vBBwaA5m2H5esx1PYKC3ZVfYzuCG1uATlrr4o/HeoLx5uZ3rv8uoKaeDPzY+5lFRCqncBTLNVt19cYl28hYkqshT0V3YZV5OjJQziX+T4twpX/dWo+KEoTQ9l7g1P3ccfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706627923; c=relaxed/simple;
	bh=qUjkTWqtcMzMwk+PE/4e3pnNuSAtNwlq2S8S3UeHMHY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=BnT5wHM+pdXQCzM1h7adi9T97bFR6Y98DI/ulUVMZ3o1naQ35tpGQshNfZa6KhJpY1AB3uTl7NiciJt2I/FMCUhR/DstQORoBKwB1yo03p/HGMsdL3xubGXeWv8X8mt3hjs9LrBeJZLbYOawFgDZ1tnmYbAeBvfbvGcR0uJreto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=qHkmbHkX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C32Duq2W; arc=none smtp.client-ip=64.147.123.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="qHkmbHkX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C32Duq2W"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 923323200AE8;
	Tue, 30 Jan 2024 10:18:40 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 30 Jan 2024 10:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1706627920; x=1706714320; bh=34hMqG6Kk2
	xuDOqF2NdWG89J4EgSUzbOu16Zv1ToJEs=; b=qHkmbHkXRSKiOdMM9l5x43cKks
	TPeM4yxyv5qlMjz9ArAo4YvBsxGal4ly+z/YgCUdMt4q4E4foXwQy5X/quuhTBZZ
	4R3ay8sCOWbPgw/2KZJK/F8iysaPPyCF8ufv9e+9szDqeGlCDuQ9GrEyw4md8E1g
	4DLIKZjEEw1tJ4UlEZDNg1VGUbt0OlmCIR9+CUamk0g42+cQsSJSTTs2ZyZ+wfAt
	ZTdQTdAkisRSxmV7Uvr7Z8URrzOFrJjdRuvtc11hTS9NI0KuhCaatrmfGONvly43
	dPH64QaKer+nFtcsIdx03UKHGWulvYCeBkNVeWvrUzTf4QbdMSy/ZSWl6Ilw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706627920; x=1706714320; bh=34hMqG6Kk2xuDOqF2NdWG89J4EgS
	UzbOu16Zv1ToJEs=; b=C32Duq2WNhvT3vFJNtjye45Bc+dcMNEkPWI+3Mw2KVw/
	vhKh47IHusIABE+ZRCSfWh6rSvcjcfAVE03QvtKfOxG7dgiEDPMXxuqgUFfMvjmV
	a0WAOqvC+zQ3GxBca5F62XGVR3ydCCde9iDk+wokc7cldnfLzsmH8feaLLcxPu3A
	Ah8EBb9ZxoO1I49RVpS4heJG9R/kNLcYpNuetWh4GZ7TXDdpXbAi0jk3UxYgSgl/
	iYLCCpCQbsZmHfQZt4MQJQqOJSF5nfq8kUeaAyko02e94e0PB7dnGp995WGFwEaA
	aqR4axXM0Ldt6vGATrCd5nFSjF84IIW//3+Dp5lIMw==
X-ME-Sender: <xms:TxO5Zdz-f4gOyH6VK9X6Lrvnpe-EozIzyjPwgWE7RI9igKNsc_-IeQ>
    <xme:TxO5ZdRHPyCGWaeQ6ucx2fBWGhqrzglfw4Iaf6ppZ2calOm2ifZ7cU6gJPwotkDdD
    jHTcV55k93t8S4T>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtjedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnhepkeehfffftefgudeigfekvdefudfhhfefhfekffdvvdefkedutdfhffei
    geegvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:TxO5ZXVlSpzY-NKfYfuuzRwCpNeseIjWQWvti15-N6fuK0eqqDWlbA>
    <xmx:TxO5Zfi8k6VFRYXO6GBg15dkpB-64eidPJPPCfJyxtSxA9o-1515Ww>
    <xmx:TxO5ZfAJkryO93pUCCkfH_OZOPWo8Y4-uJ3lCm9mttbb5yCJYaH-5Q>
    <xmx:UBO5ZSrc0Ne1ARjLSNNtsHOqH_wAh2VPxIvfpN6eQEvB0x7KkNC5cg>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A53631700097; Tue, 30 Jan 2024 10:18:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
In-Reply-To: <Zbj04V-90zpQwEzl@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
Date: Tue, 30 Jan 2024 15:17:32 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Marc Haber" <mh+netfilter@zugschlus.de>,
 "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain

On Tue, 30 Jan 2024, at 1:08 PM, Marc Haber wrote:
> On Tue, Jan 30, 2024 at 10:39:57AM +0000, Kerin Millar wrote:
>> On Tue, 30 Jan 2024, at 10:17 AM, Daniel wrote:
>> > Hi,
>> >
>> > nft 1.06 Debian12. Is it possible in a set to combine ipv4 and ipv6 ? If 
>> > not, does it exist another method to do this ?
>> 
>> Combining is impossible.
>
> This is one of my pet peeves with nft, actually. For iptables, there was
> tooling like ferm which made it possible to write dual-stack rule sets
> very easily. This kind of tooling seems to be completely missing in the
> nftables world. Am I missing something here?

Quite possibly. Currently, nftables supports:

- mixed rulesets (using tables bearing the "inet" family)
- mixed rules (wherever it makes sense)
- first-class sets of any kind (irrespective of the type of table enclosing them)

Granted, one cannot create a set that is typed in such a way that an element can be either an IPv4 or IPv6 address/interval. Conversely, iptables does not natively support sets at all, though it can integrate with sets that are managed by ipset(8). Now, can an ipset contain addresses of mixed types? No, it cannot.

# ipset create myset hash:ip
# ipset add myset 127.0.0.1
# ipset add myset ::1
ipset v7.19: Syntax error: cannot parse ::1: resolving to IPv4 address failed

# ipset destroy myset
# ipset create myset hash:ip family inet6
# ipset add myset ::1
# ipset add myset 127.0.0.1
ipset v7.19: Syntax error: cannot parse 127.0.0.1: resolving to IPv6 address failed

As far as the present topic is concerned, the only tangible advantage that ipset has is the ability to create a set whose sole purpose is to act as a superset of other - potentially mixed - sets. This advantage is rather diminished by the fact that one also has to two manage two entirely separate rulesets with iptables and ip6tables, notwithstanding that wrappers such as fermi exist. At any rate, the follow nftables ruleset is valid.

table inet filter {
        set block4 {
                type ipv4_addr
        }
        set block6 {
                type ipv6_addr
        }
        chain INPUT {
                type filter hook input priority filter; policy accept
                ip saddr @block4 drop
                ip6 saddr @block6 drop
        }
}

>
>> However, the value of an ipv6_addr element is permitted to be an IPv4-mapped IPv6 address.
>
> Does nft have a function to convert an IPv4 address to an IPv4-mapped
> address? Will the rule set do the intended thing? Is an ipv6 rule with
> an IPv4 mapped address fully equivalent with a proper IPv4 rule?

I do not know, as I have not yet attempted to use them in an ipv6_addr set (it would waste memory). That said, my expectation would be that they have to be specified in the appropriate format and that they would only be applicable to dual-stack applications. In that case, they might sometimes prove helpful, particularly as Linux defaults to having the "net.ipv6.bindv6only" sysctl be set to "0".

-- 
Kerin Millar
