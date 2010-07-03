From: Alessandro Vesely <vesely@tana.it>
Subject: recv fails with ENOBUFS (was: Cannot destroy queue, ...
Date: Sat, 03 Jul 2010 13:15:22 +0200
Message-ID: <4C2F1BCA.2000003@tana.it>
References: <4C136D70.3050902@tana.it> <4C1567EE.2040802@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1278155722; bh=9ihJ8Pw3ZA9EJIghkm6V/sYAfE/p6RRNw/tD/tNFlXs=;
	l=2344;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=Ue3UlmeG+K1s8ADfTLZ/KcJqFRzA10KY00HgMm7JP3f6BVYozGq5LrRExs16J7JCU
	 o85CdN0ztUQ141QS52vqXRj4FZbFN9rXzwDe6evnlmtySaNs7G0NDvgSLAU3DId386
	 YWKAy9Ev3SYi9Aqua+hHxVMqw3HpLVeq92RGiE3g=
In-Reply-To: <4C1567EE.2040802@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 14/Jun/10 01:21, Pablo Neira Ayuso wrote:
> Alessandro Vesely wrote:
>>  it has happened again (previous time was 5 May 2010).
>>  This time I used gdb rather than strace, but still don't know what's wrong:
>>
>>  Calling recv on the nfq_fd had returned -512. (why?)
>>  At that point my daemon calls nfq_destroy_queue(), which does not return:
>>
>>  (gdb) bt
>>  #0  0x00007ff3b6e50450 in recvfrom () from /lib/libc.so.6
>>  #1  0x00007ff3b696105c in nfnl_talk () from /usr/lib/libnfnetlink.so.0
>>  #2  0x00007ff3b79a429f in __build_send_cfg_msg (h=0x6073a0, command=2 '\002', queuenum=<value optimized out>, pf=0)
>>      at libnetfilter_queue.c:112
>>  #3  0x00007ff3b79a430d in nfq_destroy_queue (qh=0x607410) at libnetfilter_queue.c:258
>>  #4  0x00000000004021f7 in daemon_loop (h=0x6073a0, db=0x606570) at ibd-judge.c:477
>>  #5  0x0000000000402a75 in main (argc=<value optimized out>, argv=<value optimized out>) at ibd-judge.c:739
>
> I think that this is fixed in:
>
> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commit;h=bc56a6becbd4c4edf743ca3bee32eb0329fc5e5a
>
> That fix is included in libnetfilter_queue-0.0.17. You seem to be using
> an older version since you point to nfnl_talk() which is not used
> anymore in the library.
>
> Upgrade and let us know if that fixes your problem.

Now I have found a log entry about recv returning -1.  I believe this 
was causing the previous issue, as on recv failures my program cleans 
up as if exiting, including destroying the queues, but then 
re-initializes everything and continues.  This time it has succeeded 
doing so, hence upgrading has fixed that.

Apparently, recv fails once every few weeks.  On March 15 I changed 
something and restarted the daemon.  Changes consisted mainly in 
having multiple queues (2) an filtering each packet rather than just 
sync ones.  On May 5 it crashed, and on June 12 again.  This last log 
entry is of June 28, so it would seem that the time roughly halves...

The log line only says "No buffer space available".  What does that 
mean?  I presume the packet(s) had been dropped.  I have a buffer of 
8192 and pass 20 as NFQNL_COPY_PACKET, for both queues, so I think 
it's probably some other buffer.  The host is usually plenty of 
memory, though.

Ideas?

TIA
