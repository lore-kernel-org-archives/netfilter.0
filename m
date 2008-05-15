From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Re: conntrackd daemon stops: is conntrackd running?]
Date: Thu, 15 May 2008 16:14:42 +0200
Message-ID: <482C4552.5090300@netfilter.org>
References: <48297CFD.5090005@cica.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48297CFD.5090005@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Florencio <pabloflorencio@cica.es>
Cc: netfilter@vger.kernel.org

Pablo Florencio wrote:
> Thank you for your response, Max.
> 
> I have updated my getter.c function  with  the one at subversion but the
> problems is still in there. I am also using
> ALARM base synchronization working in a Red Hat EL 5 (64bits).
> 
> Please, take a look at this:
> 
> # gdb /usr/local/sbin/conntrackd
> (gdb) run
> Starting program: /usr/local/sbin/conntrackd
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x00000000004061f8 in compare (data1=0x6462b8, data2=0x7fff1243d8e0) at
> cache.c:120
> 120             return ((memcmp(nfct_get_attr(u1->ct, ATTR_ORIG_IPV6_SRC),
> (gdb) bt
> #0  0x00000000004061f8 in compare (data1=0x6462b8, data2=0x7fff1243d8e0)
> at cache.c:120
> #1  0x00000000004033f7 in hashtable_test (table=0x634e10,
> data=0x7fff1243d8e0) at hash.c:126
> #2  0x00000000004059b2 in __update (c=0x620160, ct=0x7fff1243d9c0) at
> cache.c:299
> #3  0x0000000000405c59 in cache_update_force (c=0x0, ct=0x0) at cache.c:356
> #4  0x00000000004075c3 in do_mcast_handler_step (net=0x7fff1243db94) at
> sync-mode.c:72
> #5  0x0000000000407680 in run_sync (readfds=<value optimized out>) at
> sync-mode.c:123
> #6  0x0000000000402d45 in run () at run.c:227
> #7  0x0000000000402967 in main (argc=1, argv=0x7fff1244eec8) at main.c:259
> (gdb) quit
> The program is running.  Exit anyway? (y or n) y
> 
> It seems that the problem is in function compare at cache.c, isn't is?
> Maybe with the attribute ATTR_ORIG_IPV6_SRC.
> IPv6 is full implemented at our network.

OK, this is a better clue, Thanks Pablo. Is the module nf_conntrack_ipv6
loaded?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
