From: Alessandro Vesely <vesely@tana.it>
Subject: Cannot destroy queue, nfnl_talk never returns
Date: Sat, 12 Jun 2010 13:20:16 +0200
Message-ID: <4C136D70.3050902@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1276341617; bh=swMurrHnuqlZf9LP/RiJ0IPR30tTHBldWjMGWsvWaJg=;
	l=860;
	h=Message-ID:Date:From:MIME-Version:To:Content-Transfer-Encoding;
	b=XuAN9HAIxSyIMGFMJv1X4eKIVG6S9ZKQWHftuAl+DUf7RH95EwKj8taOhbfGC3awg
	 UQKgUtGU7Ef/e1nQl2Tga1MwsNmHOgcR7v/Muec3cYmGNfpjK0nutjphTJOGdzBfJO
	 r6zOTsf89ZOzjiziFhK6nbnDzGYP+Q7APW4eyEQg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
it has happened again (previous time was 5 May 2010).
This time I used gdb rather than strace, but still don't know what's wrong:

Calling recv on the nfq_fd had returned -512. (why?)
At that point my daemon calls nfq_destroy_queue(), which does not return:

(gdb) bt
#0  0x00007ff3b6e50450 in recvfrom () from /lib/libc.so.6
#1  0x00007ff3b696105c in nfnl_talk () from /usr/lib/libnfnetlink.so.0
#2  0x00007ff3b79a429f in __build_send_cfg_msg (h=0x6073a0, command=2 '\002', queuenum=<value optimized out>, pf=0)
    at libnetfilter_queue.c:112
#3  0x00007ff3b79a430d in nfq_destroy_queue (qh=0x607410) at libnetfilter_queue.c:258
#4  0x00000000004021f7 in daemon_loop (h=0x6073a0, db=0x606570) at ibd-judge.c:477
#5  0x0000000000402a75 in main (argc=<value optimized out>, argv=<value optimized out>) at ibd-judge.c:739

Any idea?

TIA
