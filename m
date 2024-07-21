Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4E715FCE5
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721565011; cv=none; b=IFDU7s41teiXELivxYCis1MBZxjyadej9pixzNoJ/5LB4E5wtpVKFj5tShqBgmKn8lb2kGVk/bzd53wbZhiPY6cf3b79huMMzg2J/Rcn3WLwHXbWm2TKYk8VqSYzD8fm6XrH8E6vB4XL2tcKMUUhaBsDEQ/A0r2viG7z+RmK0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721565011; c=relaxed/simple;
	bh=lFELNKNFPJROcyv5JCZFjYjO2XEbloWbJPMVG9wwKV4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=nijnr/pMjdr4Ny9D16eo5iOzrC7l/kJRm29B3nZCqTE+DQH9WOj0JmcIJawVMNYobWCcSa737iVvndrKbg1Sf80a5rS8T1oPMJ9oVA/ttEjzrxYgrtPntYSQ6PDyg9WBy6ARBlBouAGQ3/cL9rCXGS475yK+uFhY8KYaQlprhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=LtUXc2A0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SlihD9IH; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="LtUXc2A0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SlihD9IH"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6C74D138068C;
	Sun, 21 Jul 2024 08:30:08 -0400 (EDT)
Received: from wimap25 ([10.202.2.85])
  by compute5.internal (MEProxy); Sun, 21 Jul 2024 08:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721565008;
	 x=1721651408; bh=WZ0oH3q0d1vU2G+sYvHDyNEVjlBAMqvEFrnNUyHmAsw=; b=
	LtUXc2A00H13F2nKPuIJB4c48OuVlrDQH1OCAGa5bTz2/ym5KEzSN23Unr/HbrlI
	NJkFGR1Qt2IhlijYZBA839qb/GMzsKfdDpYUZQP4NRr9Kvi5IYFlMXUi7Neqru/3
	Mu5sJnHszISv4rAe3O1dRBRxXNr4YXY4QkEkzIhBvnU6af8Cc3qkU2WanCOXwy32
	3//z1lfKYMbZqVZKlGTTzoD2iRsrbpMlhnjQB5grlJkISQUYyfr0ThoFEojGR+RG
	riPx+QAIkpZN7Y7sbWhQrM5oD25tt894QIhr8z4+Aa3SOYVwN40ZxSUBK5I8+e6T
	uw9dQA4/RzXG5JsCBm7QnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721565008; x=
	1721651408; bh=WZ0oH3q0d1vU2G+sYvHDyNEVjlBAMqvEFrnNUyHmAsw=; b=S
	lihD9IHH0SRl0nEL/tKkM7eQ3Z8EmEd5VUKwn3sPbnbZ5OP270V6Uc0TR27WU7Jf
	fzQZoWbUjmd9XS21y/bhQfLOXQp3WqzWg7FfLPIqfnpNfOiJObHTjbAI6ucJmRC2
	hScNRQ+VECeklxRTO6YhV6ZFInejtL+EZ+SdYqE1f1zxQQxqrCTnGL+1NTIaKeL1
	qmmHhRIOlSWSfm0HuFndLVlaOaw6nscoz3UeNOSRzfgcrdNCnIILg04aKUKQjioU
	lJptdEAapi4D1cyZHRwqHMe4eMGKjbE62sk6Alm60FEoQdUsW5coKkYV7mscE0ek
	v30HQjmY5+Mk6ZE72mejw==
X-ME-Sender: <xms:T_-cZvIcEm6ssv-afCWiJSviA62s6jJWjT2_jpfCatpiUdFFEVVQEQ>
    <xme:T_-cZjLbxfaqPldl9GZabvdvqdl_zXqeSKbzCf4_xAgFdBN1jRBRIfWa3TXGtGK-D
    QLBdRZbzP1qhlWk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheehgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfmvghr
    ihhnucfoihhllhgrrhdfuceokhhfmhesphhluhhshhhkrghvrgdrnhgvtheqnecuggftrf
    grthhtvghrnheptdfgudefhfffveevffefgfduhfelvdetueethfekjeevleefieffudel
    leegteetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:T_-cZnuYpTov__oE1ZsPDgOkts_xz4rzMgSDrOlW8QvBBhvfPDFA8Q>
    <xmx:T_-cZobaxz_SphKFOriSDJQYp4SIv7QL_BXZ_r-rEL4jd9jGTS5lSg>
    <xmx:T_-cZmYzOJoqdwPnfl8YJBJAambKiQ1rQ7bKh2FKmknG2_fnxBd1tQ>
    <xmx:T_-cZsAiCn-08W1DqRvf-9OkWjB6DdJnKODREqkLaDeb6fdYG1Wb-g>
    <xmx:UP-cZpxwMUS89yxJp3eIpM3uAa-s4jZO532lgsW431wXw0ZtV03G7Arr>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9919E1040061; Sun, 21 Jul 2024 08:30:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
In-Reply-To: <20240721132337.29d2fbc9@bonifac.skk>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
 <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
 <20240721132337.29d2fbc9@bonifac.skk>
Date: Sun, 21 Jul 2024 13:29:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 21 Jul 2024, at 12:23 PM, Slavko wrote:
> Hi,
>
> D=C5=88a Sun, 21 Jul 2024 10:58:30 +0100 "Kerin Millar" <kfm@plushkava=
.net>
> nap=C3=ADsal:
>
>> Firstly, you should not use "delete element". It will never be
>
> I am aware of this, but AFAIK the "destroy" is available from kernel 6=
.3
> and i am on 5.15, thus i am out of luck. With any luck, the timeout wi=
ll
> not happen during update (due timeout value and set update interval),
> thus in my case it can work reliable.

I see.

>
>> Secondly, though you could handle each element one by one, I would
>> not recommend it.
>
> OK, i was in doubt.
>
>> Yes, grouping elements in this way is sensible. Note that there is no
>> need to worry about the ARG_MAX constraint because nft is being made
>> to read from the standard input rather than use the -c option.
>
> I hope in that, don't worry about -c option, i can understand the point
> of answer ;-)
>
>> However, I would suggest generating one element per line because the
>> way in which nft reports errors is atrocious in the case of long
>> lines.
>
> Of course, it was simplified example in mail... Beside of nft errors,
> it is more readable in any case...
>
>> {
>>    echo "add element ... {"
>>    sed 's/$/,/'
>>    echo "}"
>> } | nft -f -
>
> Eh, that looks really nice (simple), but IMO it is good for (nonexiste=
nt
> yet) update command. As one needs any IP twice/thrice, thus list must =
be
> read into memory in script, or i miss something?

You have a point. If on a severely RAM-constrained system, you may prefe=
r to avoid the use of asynchronous pipelines and generate temporary file=
s instead. Doing so would minimise RAM consumption.

#!/bin/sh
set -e
tmpfile1=3D
tmpfile2=3D
trap 'rm -f -- "$tmpfile1" "$tmpfile2"' EXIT
tmpfile1=3D$(mktemp)
tmpfile2=3D$(mktemp)
cat > "$tmpfile1"
{
   echo "delete element $* {"; sed 's/$/,/' "$tmpfile1"; echo "}"
   echo "add    element $* {"; sed 's/$/,/' "$tmpfile1"; echo "}"
} > "$tmpfile2"
nft -f "$tmpfile2"

In case you are unaware, $* joins the positional parameters by the first=
 character of IFS, which is the space character by default. In other wor=
ds, the above script consumes newline-delimited addresses from the stand=
ard input while expecting to be given the qualified set name as its argu=
ments. Further, it does not require that the input be piped. From a shel=
l, "the-script < address-list.txt" would also work.

>
>> add element ... { <existing-ip> timeout <new-timeout> }
>> add element ... { <existing-ip> expires <new-timeout> }
>
> In case of existing IP i understand the "add element" as noop (does
> nothing) command, thus this is IMO expected.
>
>> I doubt it. Perhaps we need a new "update element" command to act
>> similarly to the set statement bearing the same name.
>
> Yes, and while it is possible to update timeout from packet path, it is
> surprising, that it is impossible from command line, the code itself
> must exists, just user interface is missing?

So it would appear.

>
>> Mind you, it gets worse. While the nft utility supports a JSON output
>> mode to ease parsing, its output is less accurate than the
>> conventional output mode in so far as all "timeout" and "expires"
>> values are truncated to integer seconds and conveyed as JSON integers.
>
> I am fain with that timeout precision, mostly because i am not
> interested on per element timeouts :-D
>
> I start to play with jq in shell for that, it seems as possible, but
> that is in only on my "playing" machine, where i use nftables already.
>
> I am curios why is not possible to directly use ipsets from nftables.
> Yes, the nftables's sets are powerful and becomes better, but still are
> not direct replacement of ipsets in some cases. Perhaps someone
> competent can provide answer (other than "nobody coded it").

You are definitely not the only one to think so. Indeed, the matter came=
 up again on IRC just recently. Another complaint that I have frequently=
 encountered is that there is no way to atomically swap sets by name.

--=20
Kerin Millar
