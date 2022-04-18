From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: Proper way to ipsec filtering
Date: Mon, 18 Apr 2022 22:41:13 +0200
Message-ID: <8735ia86qe.fsf@alfa.kjonca>
References: <878rs48bb8.fsf@alfa.kjonca>
        <20220418101444.GB15183@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1650314475; bh=cQ9KA25/6EnN7h8a/T7wqHverlrQq3eeIq+7bOCuj+Y=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=Rq1bSreNOXpVBmL/Ea22yiSMv6P6ftB6Up5U8YbGZa/TqizuuIcrwT0btm44JybDS
         0T/5irgnsojMeebeAcmTKIui3iQ80ZPHgvytKc8+R7HYGOcyr4NTkIXLQ8P2JCBSJb
         0W/ZCfB3i87nqGEddj4GVjMJ/h05TbWwXUUUxoJA=
In-Reply-To: <20220418101444.GB15183@breakpoint.cc> (Florian Westphal's
        message of "Mon, 18 Apr 2022 12:14:44 +0200")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Florian Westphal <fw@strlen.de> writes:

[...]
> Thats a bug / missing feature, it should be possible to use reqid in concatenated keys
> too.  I've sent a patch for this:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20220418100924.5669-2-fw@strlen.de/
>

Well, I cloned repo, and compiled against my debian test sid box. Seems to
work as expected.

Thank you.
So now I have to wait when debian adopt it. :)
Thanks again.

KJ

-- 
http://wolnelektury.pl/wesprzyj/teraz/
