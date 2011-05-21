From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 01:08:59 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
 <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org

On Sat, 21 May 2011, Jan Engelhardt wrote:

> On Saturday 2011-05-21 23:41, Mr Dash Four wrote:
> 
> >>> I could not get such segfaults at all.
> >>>    
> >>
> >> Nevertheless, I would recommend to mr-4 to have a ipset and libmnl compiled
> >> with debug info, point to it via LD_LIBRARY_PATH, and then feed it through
> >> valgrind with the same input. That may give some more insight.
> >>  
> > I am willing to help if you let me know what I need to do, though this will be
> > done in the coming days as I have other things I need to take care of and ran
> > out of time, unfortunately.
> 
> Get libmnl source (either git or tarball), and get ipset source 
> likewise, and for each, ./configure CFLAGS="-O0 -ggdb3" and make - no 
> install.
> 
> Subsequently (substitute by appropriate paths/actions):
> 
> LD_LIBRARY_PATH=$HOME/src/libmnl/src/.libs \
> libtool --mode=execute valgrind $HOME/src/ipset/src/ipset $action
> 
> Reasonable recipe for any program :)

With the original ipset-6.5 and restoring the privately sent test_ips it 
produces:

==2423== Memcheck, a memory error detector.
==2423== Copyright (C) 2002-2008, and GNU GPL'd, by Julian Seward et al.
==2423== Using LibVEX rev 1884, a library for dynamic binary translation.
==2423== Copyright (C) 2004-2008, and GNU GPL'd, by OpenWorks LLP.
==2423== Using valgrind-3.4.1-Debian, a dynamic binary instrumentation framework.
==2423== Copyright (C) 2000-2008, and GNU GPL'd, by Julian Seward et al.
==2423== For more details, rerun with: -v
==2423== 
==2423== Syscall param socketcall.sendto(msg) points to uninitialised byte(s)
==2423==    at 0x5118183: sendto (in /lib/libc-2.9.so)
==2423==    by 0x4E2DBDB: mnl_socket_sendto (socket.c:183)
==2423==    by 0x40CD06: ipset_mnl_query (mnl.c:95)
==2423==    by 0x40B032: build_send_private_msg (session.c:1567)
==2423==    by 0x40BAA1: ipset_cmd (session.c:1843)
==2423==    by 0x40C307: create_type_get (types.c:239)
==2423==    by 0x40C7DD: ipset_type_get (types.c:382)
==2423==    by 0x4067CA: ipset_parse_typename (parse.c:1389)
==2423==    by 0x40327E: parse_commandline (ipset.c:618)
==2423==    by 0x402414: restore (ipset.c:197)
==2423==    by 0x4033EF: parse_commandline (ipset.c:667)
==2423==    by 0x403695: main (ipset.c:742)
==2423==  Address 0x7ff000269 is on thread 1's stack
ipset v6.5: Error in line 2807: Element cannot be added to the set: it's already added
==2423== 
==2423== ERROR SUMMARY: 2 errors from 1 contexts (suppressed: 8 from 1)
==2423== malloc/free: in use at exit: 0 bytes in 0 blocks.
==2423== malloc/free: 17,327 allocs, 17,327 frees, 610,049 bytes allocated.
==2423== For counts of detected errors, rerun with: -v
==2423== Use --track-origins=yes to see where uninitialised values come from
==2423== All heap blocks were freed -- no leaks are possible.

The same one with the patched ipset-6.5:

==2229== Memcheck, a memory error detector.
==2229== Copyright (C) 2002-2008, and GNU GPL'd, by Julian Seward et al.
==2229== Using LibVEX rev 1884, a library for dynamic binary translation.
==2229== Copyright (C) 2004-2008, and GNU GPL'd, by OpenWorks LLP.
==2229== Using valgrind-3.4.1-Debian, a dynamic binary instrumentation framework.
==2229== Copyright (C) 2000-2008, and GNU GPL'd, by Julian Seward et al.
==2229== For more details, rerun with: -v
==2229== 
==2229== Syscall param socketcall.sendto(msg) points to uninitialised byte(s)
==2229==    at 0x5118183: sendto (in /lib/libc-2.9.so)
==2229==    by 0x4E2DBDB: mnl_socket_sendto (socket.c:183)
==2229==    by 0x40CD06: ipset_mnl_query (mnl.c:95)
==2229==    by 0x40B032: build_send_private_msg (session.c:1567)
==2229==    by 0x40BAA1: ipset_cmd (session.c:1843)
==2229==    by 0x40C307: create_type_get (types.c:239)
==2229==    by 0x40C7DD: ipset_type_get (types.c:382)
==2229==    by 0x4067CA: ipset_parse_typename (parse.c:1389)
==2229==    by 0x40327E: parse_commandline (ipset.c:618)
==2229==    by 0x402414: restore (ipset.c:197)
==2229==    by 0x4033EF: parse_commandline (ipset.c:667)
==2229==    by 0x403695: main (ipset.c:742)
==2229==  Address 0x7ff000269 is on thread 1's stack
ipset v6.5: Error in line 11191: Hash is full, cannot add more elements
==2229== 
==2229== ERROR SUMMARY: 2 errors from 1 contexts (suppressed: 8 from 1)
==2229== malloc/free: in use at exit: 0 bytes in 0 blocks.
==2229== malloc/free: 67,277 allocs, 67,277 frees, 2,385,155 bytes allocated.
==2229== For counts of detected errors, rerun with: -v
==2229== Use --track-origins=yes to see where uninitialised values come from
==2229== All heap blocks were freed -- no leaks are possible.

The uninitialized bytes are OK and there is no memory leak or corruption.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
