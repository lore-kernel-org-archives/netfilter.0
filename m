From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:33:42 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org

On Saturday 2011-05-21 23:31, Jozsef Kadlecsik wrote:

>On Sat, 21 May 2011, Mr Dash Four wrote:
>
>> The above happens when I try to use restore with the same file (i.e. the file
>> contents does *not* change). On top of it all I also started getting this:
>> 
>> May 21 19:47:49 dmz1 kernel: [ 2103.322341] ipset[2827]: segfault at 0 ip
>> 004f6655 sp bf9125f0 error 4 in libmnl.so.0.0.1[4f4000+4000]
>
>I could not get such segfaults at all.

Nevertheless, I would recommend to mr-4 to have a ipset and libmnl 
compiled with debug info, point to it via LD_LIBRARY_PATH, and then feed 
it through valgrind with the same input. That may give some more 
insight.
