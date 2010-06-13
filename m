From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Cannot destroy queue, nfnl_talk never returns
Date: Mon, 14 Jun 2010 01:21:18 +0200
Message-ID: <4C1567EE.2040802@netfilter.org>
References: <4C136D70.3050902@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C136D70.3050902@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

Alessandro Vesely wrote:
> Hi,
> it has happened again (previous time was 5 May 2010).
> This time I used gdb rather than strace, but still don't know what's wrong:
> 
> Calling recv on the nfq_fd had returned -512. (why?)
> At that point my daemon calls nfq_destroy_queue(), which does not return:
> 
> (gdb) bt
> #0  0x00007ff3b6e50450 in recvfrom () from /lib/libc.so.6
> #1  0x00007ff3b696105c in nfnl_talk () from /usr/lib/libnfnetlink.so.0
> #2  0x00007ff3b79a429f in __build_send_cfg_msg (h=0x6073a0, command=2 '\002', queuenum=<value optimized out>, pf=0)
>     at libnetfilter_queue.c:112
> #3  0x00007ff3b79a430d in nfq_destroy_queue (qh=0x607410) at libnetfilter_queue.c:258
> #4  0x00000000004021f7 in daemon_loop (h=0x6073a0, db=0x606570) at ibd-judge.c:477
> #5  0x0000000000402a75 in main (argc=<value optimized out>, argv=<value optimized out>) at ibd-judge.c:739
> 
> Any idea?

I think that this is fixed in:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commit;h=bc56a6becbd4c4edf743ca3bee32eb0329fc5e5a

That fix is included in libnetfilter_queue-0.0.17. You seem to be using
an older version since you point to nfnl_talk() which is not used
anymore in the library.

Upgrade and let us know if that fixes your problem.
