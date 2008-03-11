From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack can't delete more conntrack records
Date: Tue, 11 Mar 2008 12:56:32 +0100
Message-ID: <47D67370.6000103@netfilter.org>
References: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010707070600060309080906"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------010707070600060309080906
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Petr Pisar wrote:
> Hello,
> 
> I'm trying to remove all conntrack records for one source IP address. If
> I specify only source IP address it will fail:
> 
> $ conntrack -D -s 10.0.0.179
> Operation failed: such conntrack doesn't exist

This is not supported yet but it will in the next release 0.9.7.

> However removing only one specific record using full trasport
> source/destinaton address works:
> 
> $ conntrack -D -s 10.0.0.179 -d X.23.55.166 -p tcp --sport 4369 --dport 6881
> 
> I'm using latest conntrack-tools and dependend libraries
> (conntrack-tools-0.9.6.tar.bz2.sig
> libnetfilter_conntrack-0.0.89.tar.bz2.sig
> libnfnetlink-0.0.33.tar.bz2.sig).
> 
> The only problem I met during compilation of conntrack-tools was about
> shaddowing of global declaration which I've worked around by removing -Werror
> compilar option:
> 
> make[1]: Entering directory `/tmp/conntrack-tools-0.9.6/src'
> gcc -DPACKAGE_NAME=\"conntrack-tools\" -DPACKAGE_TARNAME=\"conntrack-tools\" -DPACKAGE_VERSION=\"0.9.6\" -DPACKAGE_STRING=\"conntrack-tools\ 0.9.6\" -DPACKAGE_BUGREPORT=\"pablo@netfilter.org\" -DPACKAGE=\"conntrack-tools\" -DVERSION=\"0.9.6\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DYYTEXT_POINTER=1 -DHAVE_LINUX_CAPABILITY_H=1 -DHAVE_LIBNFNETLINK=1 -DHAVE_LIBNETFILTER_CONNTRACK=1 -DHAVE_ARPA_INET_H=1 -DHAVE_INET_PTON=1 -DHAVE_INET_PTON_IPV6=1 -I.  -I../include   -std=gnu99 -W -Wall -Werror -Wmissing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-ret
 urn -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstrict-prototypes -Wundef -Wno-unused-parameter -g -O2  -I/usr/local/include   -MT conntrack.o -MD -MP -MF .deps/conn
track.Tpo -c -o conntrack.o conntrack.c
> cc1: changing search order for system directory "/usr/local/include"
> cc1:   as it has already been specified as a non-system directory
> cc1: warnings being treated as errors
> In file included from /usr/local/include/libnetfilter_conntrack/libnetfilter_conntrack.h:13,
>                  from ../include/conntrack.h:6,
>                  from conntrack.c:37:
> /usr/local/include/libnfnetlink/libnfnetlink.h:198: warning: declaration of `index' shadows a global declaration
> <built-in>:0: warning: shadowed declaration is here
> make[1]: *** [conntrack.o] Error 1
> 
> (I've met this problem twice.)

Weird. It must be a global declaration of "index" somewhere in the
system, does the patch attached fix your problem?

> So, my question is: Can conntrack remove subset of conntrack table? Is it a bug
> or a feature?

It will be a feature anytime soon due to popular demand.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

--------------010707070600060309080906
Content-Type: text/plain;
 name="x"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="x"

Index: include/libnfnetlink/libnfnetlink.h
===================================================================
--- include/libnfnetlink/libnfnetlink.h	(revisi���n: 7400)
+++ include/libnfnetlink/libnfnetlink.h	(copia de trabajo)
@@ -195,7 +195,7 @@
 int nlif_query(struct nlif_handle *nlif_handle);
 int nlif_catch(struct nlif_handle *nlif_handle);
 int nlif_index2name(struct nlif_handle *nlif_handle, 
-		    unsigned int index, 
+		    unsigned int if_index, 
 		    char *name);
 
 /* Pablo: What is the equivalence of be64_to_cpu in userspace?

--------------010707070600060309080906--
