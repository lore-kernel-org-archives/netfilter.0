From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: What is the maximum number of iptables rules on 32Bit 2.6
 kernel?
Date: Tue, 8 Nov 2011 11:48:18 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111081113120.26007@frira.zrqbmnf.qr>
References: <5805501fd74436397a85b5e1723882dc.squirrel@nmvrt01.netsim.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5805501fd74436397a85b5e1723882dc.squirrel@nmvrt01.netsim.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: sim@netmess.org
Cc: netfilter@vger.kernel.org

On Tuesday 2011-11-08 09:26, sim@netmess.org wrote:

>Dear All,
>
>Subject: What is the maximum number of iptables rules on 32Bit 2.6=20
>kernel?

The theoretical upper limit of maximum number of rules for a 32-bit
environment would be somewhere around 38 million, but you could also
construct a rule that is so crowded with matches that even it won't
fit, so the lower limit of max rules is 0.

>Even something simple like
><
># iptables -I INPUT -j ACCEPT
>iptables: Memory allocation problem.

You need to provision memory for the change request, since the old
table is not freed until the new one is loaded.

So in your case you will need an extra 284M (=C3=97 ncpus) kernel memor=
y.

>What memory does it use? I wrote a little script that parses
>/proc/vmalloc (see at the end). If I run it against all entries with
>"xt_alloc" in it (which seems to be the netfilter stuff) , it
>reports only 284M used kernel memory, while I have 512M kernel
>memory.

Yeah, /proc/vmallocinfo is a good idea. Whenever one copy of the rulese=
t=20
is larger than a page, xt switches from kmalloc to vmalloc (so you won'=
t=20
see ruleset copies less than a page size worth in /proc/vmallocinfo).

Now, given the appearance of xt_alloc in vmallocinfo, just sum up its
entries, and you know the rough size it takes. Keep in mind that some
extensions can allocate extra data structures via kmalloc.

>All entries in /proc/vmalloc matching against a grep with xt_alloc
>are eating up 284 MB of kernel Memory.
>The Kernel memory statistics are:
>
>VmallocTotal:     524288 kB
>VmallocUsed:      300868 kB
>VmallocChunk:     195832 kB
>
>[...] while I have 512M kernel memory. [...]

VmallocTotal has probably more to do with available address/AS reserved=
=20
for vmallocing, given its values on 64-bit arches:

VmallocTotal:   34359738367 kB
VmallocUsed:      274764 kB
VmallocChunk:   34359407588 kB
