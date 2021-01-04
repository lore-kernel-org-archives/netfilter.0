From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Correction to nftables wiki
Date: Mon, 4 Jan 2021 11:18:12 +0000 (GMT)
Message-ID: <alpine.DEB.2.21.2101041043360.20603@piplus.local.jubileegroup.co.uk>
References: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>                 <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>                 <58b7d4f9-f7a7-dc06-01d9-d1bad5e3b8af@plushkava.net>        
 <6427cda436b129e110022c59830bb73a5c461543.camel@datahenge.com>         <alpine.DEB.2.21.2012310910060.20603@piplus.local.jubileegroup.co.uk> <f910012f0671e66d836f49dcd175e6fa921e2404.camel@datahenge.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=date:from:to:cc:subject:in-reply-to
        :message-id:references:mime-version:content-type; s=uk; bh=mWtz+
        z+6xomGmchbKXi4FbXG/XjTRTC5sA+Kwrt8XX0=; b=SoDTlSWluku8zp3Up1l3M
        nGHvaPPvvxEhdVD69j/rgqIxpLGDptiE6vC/y6/BJugAWIA1s5XwQMd+x0EYa0RT
        v2W/WlV7eRfrttDk2AeOMXKbsje/BeNNa+WZeTs1h8UG44yzR/2oVmf7pNMhk9fn
        D9Dwq3sQdmRqWYsaDIplXjOm5iHJ/rAHC30jVMP9CAoUBwhVMR5jUvWDo0wog0lK
        YOJ8byPI8tQoy+UgtJ6OS4MMGUxmIjdeqepGqLdsfBosSqLYdTAnyLlRa7LJ/fO/
        p5n6kEWFZ1xoIDeQeBq3oHtKZP0aPq4Vx2wiAFuKWdZN/k87//OXVwDd8/zH055M
        A==
In-Reply-To: <f910012f0671e66d836f49dcd175e6fa921e2404.camel@datahenge.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Brian Pond <brian@datahenge.com>
Cc: netfilter@vger.kernel.org

Hi Brian,

On Sat, 2 Jan 2021, Brian Pond wrote:

> * No default tables and chains. ...
> * Atomic rule activation.  ...
> * I love the built-in support for configuration files ...
> * The ability to "log" and "drop" on the same rule line ...
> * ... "inet" tables ... don't need to duplicate ... IPv4 and IPv6.
> * Named Sets ...

Thanks for that.  It seems that you and I use iptables very differently,
and that what's useful for you doesn't offer much to me.  Yes named sets
are great, but I use ipsets for the same reason and I have no complaints
about it apart from the timeout limitation which I think I've mentioned.
Otherwise, my firewall configurations don't usually change at all - from
one year to the next - so the dynamic aspects aren't an issue for me.

> ... a few nftables headaches ...

Only to be expected with new software, but the support is good.

I use Debian 10 or something derived from it on a bunch of machines,
but the firewalls aren't Debian, nor anything remotely like it.  There
are sets of (dynamic) iptables/ipsets rules on the individual (mostly
Debian-like) machines for specific purposes, like blocking SMTP and
HTTP attacks from China, and at the moment those rules do everything I
need with little effort from me now the scripting is all put to bed.
The main thing which exercises me is finding new ways to catch attacks
automatically; actually blocking them once identified is routine.

> Hope this email was helpful!

It was, very much so.  One of the things at the back of my mind was
that by being lazy I might be making some things harder for myself
than necessary, but you've reassured me a little on that score. :)

Thanks again Brian.

-- 

73,
Ged.
