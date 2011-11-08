From: sim@netmess.org
Subject: Re: What is the maximum number of iptables rules on 32Bit 2.6
 kernel?
Date: Tue, 8 Nov 2011 17:00:36 +0100
Message-ID: <01c47c45702709b8ab5ef2d92f8fd777.squirrel@nmvrt01.netsim.ch>
References: <5805501fd74436397a85b5e1723882dc.squirrel@nmvrt01.netsim.ch>
    <alpine.LNX.2.01.1111081113120.26007@frira.zrqbmnf.qr>
    <32a09971476dd99250ad191c55b65d17.squirrel@nmvrt01.netsim.ch>
    <alpine.LNX.2.01.1111081607280.4533@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1111081607280.4533@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

> There should be one entry for each ruleset copy. I have 16 in
> /proc/vmallocinfo, which accounts for the 8 hw threads, for two sets
> (iptables, ip6tables). During a replace op, there can thus be up to
> 32 (or less) in /proc/vmallocinfo for a short period of time before
> it drops down to 16 again.

Then, why is there no difference when booting with maxcpus=2?

>>Meaning that iptables can eat more memory than displayed in
>>/proc/vmallocinfo?
>
> Yes. xt_geoip for example also loads its database (up to 2864 MB;
> though just 1x rather than foreach CPU) using vmalloc - separately
> from xt_alloc_table_info.

okay, that I didn't expect. Interesting though.

> I am no memory manager expert, but with 32 bit, it's easy to run into
> limitations near 1G (lowmem) and then 4G (max VA space). Plenty of
> pitfalls on 32-bit.
>
> Options:
> - reduce your rules

unfortunately, this is not possible

> - we provide ways to reduce the number of copies (since some of them
>   are known to be unnecessary)

how can I do that?

> - go 64-bit

possible, within a year or so. But the firewall is needed sooner. Although
there is no other way for the future of course.

