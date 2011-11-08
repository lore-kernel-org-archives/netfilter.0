From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: What is the maximum number of iptables rules on 32Bit 2.6
 kernel?
Date: Tue, 8 Nov 2011 16:20:54 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111081607280.4533@frira.zrqbmnf.qr>
References: <5805501fd74436397a85b5e1723882dc.squirrel@nmvrt01.netsim.ch>    <alpine.LNX.2.01.1111081113120.26007@frira.zrqbmnf.qr> <32a09971476dd99250ad191c55b65d17.squirrel@nmvrt01.netsim.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <32a09971476dd99250ad191c55b65d17.squirrel@nmvrt01.netsim.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sim@netmess.org
Cc: netfilter@vger.kernel.org


On Tuesday 2011-11-08 15:56, sim@netmess.org wrote:

>> You need to provision memory for the change request, since the old
>> table is not freed until the new one is loaded.
>>
>> So in your case you will need an extra 284M (x ncpus) kernel memory.
>
>Okay, so in my case (8 cores), I'd need 2272M to apply my 25000 rules,
>then double as much to reapply it ( "since the old table is not freed
>until the new one is loaded" ), makes 4544M.
>
>Did i get that right?

Yeah. This is also why you are able to load it once (going from 0 -> 2272 ->
2272), but may not be able to make it over the "replace mountain"
(2272 -> 4544 (!) -> 2272).

>> is larger than a page, xt switches from kmalloc to vmalloc (so you won't
>> see ruleset copies less than a page size worth in /proc/vmallocinfo).
>
>okay, I see plenty of them now. But this seems to be perfectly fine, isn't
>it?

There should be one entry for each ruleset copy. I have 16 in
/proc/vmallocinfo, which accounts for the 8 hw threads, for two sets
(iptables, ip6tables). During a replace op, there can thus be up to
32 (or less) in /proc/vmallocinfo for a short period of time before
it drops down to 16 again.

>Meaning that iptables can eat more memory than displayed in
>/proc/vmallocinfo?

Yes. xt_geoip for example also loads its database (up to 2864 MB;
though just 1x rather than foreach CPU) using vmalloc - separately
from xt_alloc_table_info.

>I booted with different vmalloc= settings now. With 128M, i can insert
>only around 6000 iptables rules with iptables-restore. With 512M its the
>25000 I mentioned before. So I see a connection between vmalloc and the
>number of rules I can place on my system. Unfortunately, if I set
>vmalloc="1024M", the kernel crashes (and hangs) immediately after "Loading
>Kernel.........." message.
>
>Do you know why that happens?

I am no memory manager expert, but with 32 bit, it's easy to run into
limitations near 1G (lowmem) and then 4G (max VA space). Plenty of
pitfalls on 32-bit.

Options:
- reduce your rules
- we provide ways to reduce the number of copies (since some of them
  are known to be unnecessary)
- go 64-bit
