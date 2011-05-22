From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 17:00:15 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105221659170.11575@frira.zrqbmnf.qr>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
 <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr> <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org


On Sunday 2011-05-22 01:08, Jozsef Kadlecsik wrote:
>
>==2229== Syscall param socketcall.sendto(msg) points to uninitialised byte(s)
>==2229==    at 0x5118183: sendto (in /lib/libc-2.9.so)
>==2229==    by 0x4E2DBDB: mnl_socket_sendto (socket.c:183)
>==2229==    by 0x40CD06: ipset_mnl_query (mnl.c:95)
>==2229==    by 0x40B032: build_send_private_msg (session.c:1567)
>==2229==    by 0x40BAA1: ipset_cmd (session.c:1843)
>==2229==    by 0x40C307: create_type_get (types.c:239)
>==2229==    by 0x40C7DD: ipset_type_get (types.c:382)
>==2229==    by 0x4067CA: ipset_parse_typename (parse.c:1389)
>==2229==    by 0x40327E: parse_commandline (ipset.c:618)
>==2229==    by 0x402414: restore (ipset.c:197)
>==2229==    by 0x4033EF: parse_commandline (ipset.c:667)
>==2229==    by 0x403695: main (ipset.c:742)
>==2229==  Address 0x7ff000269 is on thread 1's stack
>ipset v6.5: Error in line 11191: Hash is full, cannot add more elements
>==2229== 
>==2229== ERROR SUMMARY: 2 errors from 1 contexts (suppressed: 8 from 1)
>==2229== malloc/free: in use at exit: 0 bytes in 0 blocks.
>==2229== malloc/free: 67,277 allocs, 67,277 frees, 2,385,155 bytes allocated.
>==2229== For counts of detected errors, rerun with: -v
>==2229== Use --track-origins=yes to see where uninitialised values come from
>==2229== All heap blocks were freed -- no leaks are possible.
>
>The uninitialized bytes are OK and there is no memory leak or corruption.

Uninitialized bytes are usually never OK when they are read upon.
There is a series on LWN to elaborate on that..
