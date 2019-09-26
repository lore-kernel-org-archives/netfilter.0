From: Fran Fitzpatrick <francis.x.fitzpatrick@gmail.com>
Subject: Re: Intermix ip,ip6 saddr
Date: Thu, 26 Sep 2019 06:52:58 -0500
Message-ID: <CALOK-Oe8=+M-d8beCZyn6=Zkxq_d0P=faO5AoAV3P5KY=bCRow@mail.gmail.com>
References: <20190925115451.ozhdsoykkkmdxnch@nisshoku>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1SMKG1+S2mc85nNJokqaBGmz0g8tsT4fTOemP3qaW88=;
        b=jVo8VIPlqubkX3YGR4xdlBf2LOoIp57JRABLF6/W9ChBQUjKgbqXUDxtSfUxVreD84
         xQXxarDhaXJIER/clvwBb8WRsGck2KpOFsWN8PH8zUf7+HoYVV/V0odPWU+Ya/rLueON
         3Tm/aLRX0OEaEP5N1Ctn0naSDj17ncUdivitYNvnqCs5FoAtFLoCqvfzbKHKeSFA5EcB
         MK1nydaiOGIgDrXqaXKM+4RmCM8+QjSsYrMhQQhfc8Q0WnmdgfQWGScdKIfQk8/NHlIF
         Qg9KUZ7r/a7orY6/BjswT/riwCcEtprclJDYsM4JApYbHmxIZIU+ca5V3u0bZvMTRcXP
         QczA==
In-Reply-To: <20190925115451.ozhdsoykkkmdxnch@nisshoku>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Rieger <rieger@jikken.de>
Cc: netfilter@vger.kernel.org

I don't think this is possible with nftables. When you create a
set/map, you need to give each element a type, so either `ipv4_addr`
or `ipv6_addr`.

If you do find out a way, please let me know, because I would also
like to do it. :-)

On Thu, Sep 26, 2019 at 4:31 AM Anton Rieger <rieger@jikken.de> wrote:
>
> Hi there,
>
> I'm trying to figure out the best way to apply a rule on a set of IP and IPv4 ranges.
> My current workaround is to do the following:
>
> RULE jump customnet
>
> chain customnet {
>   ip saddr {192.0.2.0/24, 198.51.100.0/24} drop
>   ip6 saddr {2001:DB8:4::/48, 2001:DB8:7::/48} drop
> }
>
>
> I think it might be possible to do this somehow with maps and meta nfproto expressions.
>
> BTW:
> It would be nice to have an ip4 alias to better match ip6/ip rules.
> Also resetting the default address family might be useful.
> For example I'm using more ip6 and inet than ip.
>
> Thank you,
> Anton
