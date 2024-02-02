Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63BB7765D
	for <netfilter@vger.kernel.org>; Fri,  2 Feb 2024 20:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706907404; cv=none; b=pikoJPW3yDdSsPKOTmqRq2uISfwEivH2CEkYM+wOjpq5YI3QMZzBhGpUSvCJ45eItdED8w14srSaysyaakZeuOcgkesXMbZJqYvvYCZbZ+lFP7oenDViOuQiLAKR/OkM1y3k8WI8uOo2wyhOcYg1TWgjoC4eci0qt3sLRScGgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706907404; c=relaxed/simple;
	bh=QLP8SHtOgLvzwfCZ3Nv7uFRKs9YXWJhQs1yaX/tgjXA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=Mf0RAijxqDOPWPQZjy8AmMii7zK/6b/ECrU4XDkcqPJazdl+EeI5vIslD7c5j6A0rsVVHq8Jvkjh/fVMXKFYLiPFFaevw8NCeuWu90jfgb2a74a7a+AEvJ3brJtrG09EjrtNyjfY9g9lzgYwuqV0ptuSiZFL8BkeCg0gHpasrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=P1CX25ry; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H/JZFY8e; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="P1CX25ry";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H/JZFY8e"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id A3F7C180006E;
	Fri,  2 Feb 2024 15:56:40 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Fri, 02 Feb 2024 15:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1706907400; x=1706993800; bh=/wPvIaoTO4
	pftExUYa7ey8mNIwU0G6u7u1nxp4RdcVs=; b=P1CX25ryeR4FUbWvL+I94Ny1tE
	EvOfTmIH9FAKskRKNF6aZUlhnWikKLQ5vSHFkXg6T4v06XaYOMfSa7Q5qrElcWF8
	2q2GifLx5Wi2sIcW7u7CE3jX+5WXrAmfVtIzPD/L2Tybn5HK+Oh1Sddkld/qQYRG
	3OgX30RdzqemgyOWtcTwKALEvvhIZrHSkNp40IFG0O5AAJpguljCgzJ8bN2ZzgZd
	9InfrC4mQSejFUD6MweTQQmhsp3zU1jbI1o0piSrlofP7Sc9KR+HEPPmkD0JbA8s
	E0tSowppK36RjqU8VD4Il5fuy6VbtwENVdIvaQy5VTm14dviS87igVmKWlsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706907400; x=1706993800; bh=/wPvIaoTO4pftExUYa7ey8mNIwU0
	G6u7u1nxp4RdcVs=; b=H/JZFY8emgYP/qPu1mtd1NGn8C4kZ+3vsCCohe+NUf58
	R/8rliacXEpt0gkk7WCEyYBvA1xzoxi2iOB5rA3AcL1tR2GK45wGffQ044Urdm1L
	pxrlKH6IvVxQU39mNxhH2qEz9vKd6KiJ0HwAvo3ACPhM3DJBDpgaYmpyClibDWGZ
	cbtKjLQj+JLr7BKeUWzE10R8QyK83S4AUR5FBKxPeviubSpIEG9je69DHuWM5PQF
	pcC+KfiSXmX27YRQg3YdKg6xLLi4XHTfe4X5oQCvE4CkS/yahXJ86XJMK/rDB+zl
	TerAkZmF4lxpNlzYDSe0k4gLffQImBPUpj+Mvf/8qg==
X-ME-Sender: <xms:B1e9Zcj9NXGdbtlaM2TZpxwRNWYTRcBrTA0TEXpfJOgGDAZD4Y0FoQ>
    <xme:B1e9ZVDaVGLvDKLLVHMY8QM4jVLNUKb5L4prx0WL7QwcO1fynfc0vhu4Km75R2kyr
    B8mS_ld1Jf4qreE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedugedgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpeekheffffetgfduiefgkedvfeduhffhfefhkeffvddvfeekuddthfff
    ieeggedvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:B1e9ZUEsZbPGPJMw8s6QZGG3aDUOvDTDACHitxo_Glqi1D9vKQIWKg>
    <xmx:B1e9ZdSppbaW_-GkP3jGS3_VTz5n1NCtPg9NiKIHqxJjEQpnPWuSDA>
    <xmx:B1e9ZZyL0T5AJ-GiCvDPby0Mj_uq5WH8Uan9qCbffXy1edlVmJ5q1A>
    <xmx:CFe9Zaqb0MJTPRve9K4mgYZdWIXN70yec73G0wxLqTR2gfh36JGH1_rH8G8>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C735C1700093; Fri,  2 Feb 2024 15:56:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <eff144d4-cd13-48da-9f3e-213e19d18821@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.20.2402022057110.2274@mail.home>
References: <alpine.DEB.2.20.2401302150460.27550@mail.home>
 <20240201203448.a7b1957192995e4553be546c@plushkava.net>
 <alpine.DEB.2.20.2402022057110.2274@mail.home>
Date: Fri, 02 Feb 2024 20:55:20 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: "Timo Lindfors" <timo.lindfors@iki.fi>,
 "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Analyzing firewall rules programmatically
Content-Type: text/plain

On Fri, 2 Feb 2024, at 7:05 PM, Timo Lindfors wrote:
> On Thu, 1 Feb 2024, Kerin Millar wrote:
>> Given that the rule is supposed to have been created with iptables-nft, I am surprised that it is presented in that way at all (the line you are showing doesn't match "handle 247" either).
>
> ah, I might have made an error while trying to format the lines for 80 
> characters. Here's a fresh new situation:
>
> $ sudo nft -a list ruleset | grep "handle 125"
> # Warning: table ip filter is managed by iptables-nft, do not touch!
>  		fib daddr type broadcast counter packets 33859 bytes 6322835 jump 

This gives the initial impression that iptables-nft was enlightened enough to generate a native nft rule for its input. It can do that in some cases and not others.

> ufw-skip-to-policy-input # handle 125
> # Warning: table ip6 filter is managed by iptables-nft, do not touch!
>  	chain ufw6-user-logging-output { # handle 125
> # Warning: table ip nat is managed by iptables-nft, do not touch!
> # Warning: table ip mangle is managed by iptables-nft, do not touch!
>
> $ sudo nft -a --json list ruleset | jq . | grep -B5 -A19 '"handle": 125'
>      {
>        "rule": {
>          "family": "ip",
>          "table": "filter",
>          "chain": "ufw-after-input",
>          "handle": 125,
>          "expr": [
>            {
>              "xt": {
>                "type": "match",
>                "name": "addrtype"
>              }
>            },
>            {
>              "counter": {
>                "packets": 33859,
>                "bytes": 6322835
>              }
>            },
>            {
>              "jump": {
>                "target": "ufw-skip-to-policy-input"
>              }
>            }
>          ]

Yet, the above output indicates the use of an xtables match. Here's how it should look for a native rule.

# nft 'table t { chain c { fib daddr type broadcast counter; }; }'
# nft -j list ruleset
{
  "nftables": [
    {
      "metainfo": {
        "version": "1.0.9",
        "release_name": "Old Doc Yak #3",
        "json_schema_version": 1
      }
    },
    {
      "table": {
        "family": "ip",
        "name": "t",
        "handle": 2
      }
    },
    {
      "chain": {
        "family": "ip",
        "table": "t",
        "name": "c",
        "handle": 1
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "t",
        "chain": "c",
        "handle": 2,
        "expr": [
          {
            "match": {
              "op": "==",
              "left": {
                "fib": {
                  "result": "type",
                  "flags": [
                    "daddr"
                  ]
                }
              },
              "right": "broadcast"
            }
          },
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          }
        ]
      }
    }
  ]
}

>
>
>
> $ sudo iptables -nvL | grep 33859
> 33859 6323K ufw-skip-to-policy-input  0    --  *      *       0.0.0.0/0 
>            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST
>
>
>
>> # uname -r; nft -V | head -n1
>> 6.7.2-arch1-2
>> nftables v1.0.9 (Old Doc Yak #3)
>> # nft flush ruleset
>> # iptables-nft -A INPUT -m addrtype --dst-type LOCAL
>> # nft list ruleset 2>/dev/null | sed -n 4p
>> 		xt match "addrtype" counter packets 8 bytes 778
>
> I get different output on Debian 12:
>
> # uname -r; nft -V | head -n1
> 6.1.0-17-amd64
> nftables v1.0.6 (Lester Gooch #5)
> # nft flush ruleset
> # iptables-nft -A INPUT -m addrtype --dst-type LOCAL
> # nft list ruleset 2>/dev/null | sed -n 4p
>  		fib daddr type local counter packets 24 bytes 16144
>
> Is this perhaps a regression?

It might be that iptables-nft is supposed to generate a native rule and that we are both experiencing a regression in that respect.

On the other hand, it might be the opposite. That is, even though iptables-nft could, in principle, generate a native rule for "-m addrtype --dst-type BROADCAST", it might be that it has never been able to and that the output of "nft list ruleset" is simply misleading in your case.

Presently, it is unclear to me.

>
>>> 4) Create separate tools for parsing iptables and netfilter rules and
>>> hope that no system mixes these two.
>>
>> As things stand, this seems more realistic to me. Perhaps one of the developers would have a better idea, though.
>
> Ok, thanks for the insights. If I built the tool for netfilter first, 
> which of the three formats should I try to analyze? netlink, text or json?

It's difficult for me to make a recommendation because I only fully understand the output of iptables-save, nft list ruleset, nft -j list ruleset etc. However, I would say that structured data is helpful, meaning that I would prefer "nft -j list ruleset" over "nft list ruleset".

-- 
Kerin Millar
