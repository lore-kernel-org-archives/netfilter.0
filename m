From: sim@netmess.org
Subject: Re: What is the maximum number of iptables rules on 32Bit 2.6
 kernel?
Date: Tue, 8 Nov 2011 15:56:16 +0100
Message-ID: <32a09971476dd99250ad191c55b65d17.squirrel@nmvrt01.netsim.ch>
References: <5805501fd74436397a85b5e1723882dc.squirrel@nmvrt01.netsim.ch>
    <alpine.LNX.2.01.1111081113120.26007@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1111081113120.26007@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: sim@netmess.org, netfilter@vger.kernel.org

> You need to provision memory for the change request, since the old
> table is not freed until the new one is loaded.
>
> So in your case you will need an extra 284M (x ncpus) kernel memory.

Okay, so in my case (8 cores), I'd need 2272M to apply my 25000 rules,
then double as much to reapply it ( "since the old table is not freed
until the new one is loaded" ), makes 4544M.

Did i get that right?

I booted with maxcpus=2 now but the situation is almost the same.

> is larger than a page, xt switches from kmalloc to vmalloc (so you won't
> see ruleset copies less than a page size worth in /proc/vmallocinfo).

okay, I see plenty of them now. But this seems to be perfectly fine, isn't
it?

> Now, given the appearance of xt_alloc in vmallocinfo, just sum up its
> entries, and you know the rough size it takes. Keep in mind that some
> extensions can allocate extra data structures via kmalloc.

Meaning that iptables can eat more memory than displayed in
/proc/vmallocinfo?

> VmallocTotal has probably more to do with available address/AS reserved
> for vmallocing, given its values on 64-bit arches:
>
> VmallocTotal:   34359738367 kB
> VmallocUsed:      274764 kB
> VmallocChunk:   34359407588 kB
>

Yes, seems so :-)

I booted with different vmalloc= settings now. With 128M, i can insert
only around 6000 iptables rules with iptables-restore. With 512M its the
25000 I mentioned before. So I see a connection between vmalloc and the
number of rules I can place on my system. Unfortunately, if I set
vmalloc="1024M", the kernel crashes (and hangs) immediately after "Loading
Kernel.........." message.

Do you know why that happens? I didn't find any "max vmalloc size".. The
frustrating thing is that I can see 5G of free memory with free -m when
booted. I assume this has something to do with PAE, but I don't get the
way around it.

Thanks, Simon



