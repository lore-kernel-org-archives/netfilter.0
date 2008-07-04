From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack-0.0.95 compile error
Date: Fri, 04 Jul 2008 09:46:19 +0200
Message-ID: <486DD54B.9040902@netfilter.org>
References: <935fab200806300948y65018956ud5513d16cd93c9cd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200806300948y65018956ud5513d16cd93c9cd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave <finalglide@gmail.com>
Cc: netfilter@vger.kernel.org

Dave wrote:
> Just tried to update conntrack librarys to new version but error out.
> 0.94 compiles just fine though.
> 
> gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
> -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"libnetfilter_conntrack\" -DVERSION=\"0.0.95\"
> -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1
> -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
> -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
> -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DHAVE_ARPA_INET_H=1
> -DHAVE_INET_NTOP=1 -DHAVE_INET_NTOP_IPV6=1 -I.  -I../include    -g -O2
> -DLIBNETFILTER_CONNTRACK_DIR=\"/usr/local/lib/libnetfilter_conntrack/\"
> -I/usr/local/include   -MT conntrack_events.o -MD -MP -MF
> .deps/conntrack_events.Tpo -c -o conntrack_events.o conntrack_events.c
> conntrack_events.c: In function 'sk_set_filter':
> conntrack_events.c:44: error: invalid application of 'sizeof' to
> incomplete type 'struct nlattr'
> conntrack_events.c:66: error: invalid application of 'sizeof' to
> incomplete type 'struct nlattr'
> conntrack_events.c:92: error: invalid application of 'sizeof' to
> incomplete type 'struct nlattr'
> conntrack_events.c: At top level:
> conntrack_events.c:149: error: invalid application of 'sizeof' to
> incomplete type 'struct nlattr'
> conntrack_events.c:170: error: invalid application of 'sizeof' to
> incomplete type 'struct nlattr'
> conntrack_events.c:195: error: invalid application of 'sizeof' to
> incomplete type 'struct nlattr'
> make[1]: *** [conntrack_events.o] Error 1
> 
> 
> Any ideas?

You seem to have compiled a SVN snapshot. Please, try lastest svn
snapshot - the previous were broken as you have noticed - or the
official release 0.0.95.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
