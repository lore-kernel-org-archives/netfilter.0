From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Simple libipset program fails to link on Ubuntu 12.04
 (precise)
Date: Tue, 11 Jun 2013 21:13:49 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1306112105580.16569@blackhole.kfki.hu>
References: <CADpubdra9zEtSZkz+-vJXcm0eAXqXt2asXnvRDWJ+redFneEWA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADpubdra9zEtSZkz+-vJXcm0eAXqXt2asXnvRDWJ+redFneEWA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Cook <dan.cook@illum.io>
Cc: netfilter@vger.kernel.org

On Mon, 10 Jun 2013, Dan Cook wrote:

> I am trying to write a very simple ipset program using libipset on
> Ubuntu 12.04 (precise).  I have libipset-dev installed and the
> following program fails to link.
> 
> #include <assert.h>     /* assert */
> #include <ctype.h>      /* isspace */
> #include <errno.h>      /* errno */
> #include <stdarg.h>     /* va_* */
> #include <stdbool.h>      /* bool */
> #include <stdio.h>      /* fprintf, fgets */
> #include <stdlib.h>     /* exit */
> #include <string.h>     /* str* */
> 
> #include <libipset/data.h>    /* enum ipset_data */
> #include <libipset/parse.h>   /* ipset_parse_* */
> #include <libipset/session.h>   /* ipset_session_* */
> #include <libipset/types.h>   /* struct ipset_type */
> #include <libipset/ui.h>    /* core options, commands */
> #include <libipset/utils.h>   /* STREQ */
> 
> int main(int argc, char *argv[]) {
> 
>   struct ipset_session *session;
> 
>   session = ipset_session_init(printf);
>   if (session == NULL) {
>     fprintf(stderr, "Cannot initialize ipset session, aborting.\n");
>     return -1;
>   }
> 
>   ipset_session_fini(session);
> 
>   return 0;
> }
> 
> $ gcc ipsetTest.c -lipset -lmnl -o ipsetTest
> /usr/lib/gcc/x86_64-linux-gnu/4.6/../../../x86_64-linux-gnu/libipset.so:
> undefined reference to `ipset_port_usage'
> collect2: ld returned 1 exit status

This compiles cleanly with a more recent ipset library.
 
> I can not install a new kernel module or over write the system library
> of libipset, this has to work with the kernel modules already
> installed on customer machines.
> 
> I could however build a custom version of the library and reference it
> from our executable, but it has to be compatible with the kernel
> version installed in 12.04.

Yes, you can install a custom library for example in /usr/local and use 
it. The userspace ipset library and program is independent from the kernel 
part modules: they'll negotiate the best common functionality and will use 
that.
 
> Is libipset broken on 12.04?  How do I fix it - can I patch a version
> to work w/ 12.04?
> 12.04 reports ipset version 6.11 protocol version 6.

The function ipset_port_usage was missing from the library, it was fixed 
in 6.12. You can find the patch in git, but it's easier to use a more 
recent package and the library from it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
