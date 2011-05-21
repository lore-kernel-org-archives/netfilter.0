From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:52:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
 <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD83187.2060301@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

On Saturday 2011-05-21 23:41, Mr Dash Four wrote:

>
>>> I could not get such segfaults at all.
>>>    
>>
>> Nevertheless, I would recommend to mr-4 to have a ipset and libmnl compiled
>> with debug info, point to it via LD_LIBRARY_PATH, and then feed it through
>> valgrind with the same input. That may give some more insight.
>>  
> I am willing to help if you let me know what I need to do, though this will be
> done in the coming days as I have other things I need to take care of and ran
> out of time, unfortunately.

Get libmnl source (either git or tarball), and get ipset source 
likewise, and for each, ./configure CFLAGS="-O0 -ggdb3" and make - no 
install.

Subsequently (substitute by appropriate paths/actions):

LD_LIBRARY_PATH=$HOME/src/libmnl/src/.libs \
libtool --mode=execute valgrind $HOME/src/ipset/src/ipset $action

Reasonable recipe for any program :)
