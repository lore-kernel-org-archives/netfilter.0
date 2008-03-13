From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack can't delete more conntrack records
Date: Thu, 13 Mar 2008 16:51:35 +0100
Message-ID: <47D94D87.8050506@netfilter.org>
References: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz> <47D67370.6000103@netfilter.org> <slrnftde87.u6d.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrnftde87.u6d.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org

Petr Pisar wrote:
> On 2008-03-11, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> Petr Pisar wrote:
>>> cc1: warnings being treated as errors
>>> In file included from /usr/local/include/libnetfilter_conntrack/libnetfilter_conntrack.h:13,
>>>                  from ../include/conntrack.h:6,
>>>                  from conntrack.c:37:
>>> /usr/local/include/libnfnetlink/libnfnetlink.h:198: warning: declaration of `index' shadows a global declaration
>>> <built-in>:0: warning: shadowed declaration is here
>>> make[1]: *** [conntrack.o] Error 1
>>>
>>> (I've met this problem twice.)
>> Weird. It must be a global declaration of "index" somewhere in the
>> system,
> 
> yes, it's index(3).
> 
>> does the patch attached fix your problem?
> 
> Partially. Other problem is:
> 
> make[1]: Entering directory `/tmp/conntrack-tools-0.9.6/src'
> gcc -DPACKAGE_NAME=\"conntrack-tools\" -DPACKAGE_TARNAME=\"conntrack-tools\" -DPACKAGE_VERSION=\"0.9.6\" -DPACKAGE_STRING=\"conntrack-tools\ 0.9.6\" -DPACKAGE_BUGREPORT=\"pablo@netfilter.org\" -DPACKAGE=\"conntrack-tools\" -DVERSION=\"0.9.6\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DYYTEXT_POINTER=1 -DHAVE_LINUX_CAPABILITY_H=1 -DHAVE_LIBNFNETLINK=1 -DHAVE_LIBNETFILTER_CONNTRACK=1 -DHAVE_ARPA_INET_H=1 -DHAVE_INET_PTON=1 -DHAVE_INET_PTON_IPV6=1 -I.  -I../include   -std=gnu99 -W -Wall -Werror -Wmissing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-ret
 urn -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstrict-prototypes -Wundef -Wno-unused-parameter -g -O2   -MT sync-mode.o -MD -MP -MF .deps/sync-mode.Tpo -c -o sync-m
ode.o sync-mode.c
> cc1: warnings being treated as errors
> In file included from sync-mode.c:27:
> ../include/network.h:64: warning: declaration of `conf' shadows a global declaration
> ../include/conntrackd.h:144: warning: shadowed declaration is here

Already applied a patch for that, please get a working copy from SVN 
which includes these fixes. Let me know if it's OK for you.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
