From: Brskt <me@brskt.be>
Subject: Re: Which of these 2 rules will consume more CPU? Please guide.
Date: Thu, 01 Dec 2022 12:31:53 +0000
Message-ID: <em2a539bbd-3a83-48d0-8e9e-df4f6211c2e9@2c5303e8.com>
References: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
Reply-To: Brskt <me@brskt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brskt-be.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:reply-to
         :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFwsdB78tudZQfekZobt7pqS5qRpwUgSsN34tZi6NK8=;
        b=ZjB7Jw4ULlHjg21ZJCrA0GPOeF028h25/xAa9r8HSSHaBA/BnGsYeQ2EaifnYGF32k
         y6uF9ssbMhFZVEggqmdJXbopg7feBOW7gIGrUSl6520KxFxA1xy8oxJD/HRQ8GFUACor
         sjN4dZLW87r84uLrhBwd4Rhhplp5zAFCV/hHMhCiNW64LJ0c22CHyyaBtuOHiHX144Sw
         m3rOIUU54Ad9nuphXZhdEsJ4ULf5Zw6s9ObY4pGDdWw7NwZXdMCl19+c1GzBAjPe7jw8
         Q0T2la8ZSrywG3omWfMydI3uYM9g/2Dww/TCcbGyjMUZi9GZL0PulaGbqbOlvCTMX4vs
         rc9A==
In-Reply-To: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Amish <anon.amish@gmail.com>, netfilter <netfilter@vger.kernel.org>

Hi,

Using mangle table means that in any case, even if the packet is in the=20
NEW or any other state, it's in the conntrack.

The raw table is before mangle which does not have conntrack, it will=20
gain CPU usage and drop packets more efficiently.
