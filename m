From: Dan Cook <dan.cook@illum.io>
Subject: Simple libipset program fails to link on Ubuntu 12.04 (precise)
Date: Mon, 10 Jun 2013 14:15:00 -0700
Message-ID: <CADpubdra9zEtSZkz+-vJXcm0eAXqXt2asXnvRDWJ+redFneEWA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Greetings,

I am trying to write a very simple ipset program using libipset on
Ubuntu 12.04 (precise).  I have libipset-dev installed and the
following program fails to link.

#include <assert.h>     /* assert */
#include <ctype.h>      /* isspace */
#include <errno.h>      /* errno */
#include <stdarg.h>     /* va_* */
#include <stdbool.h>      /* bool */
#include <stdio.h>      /* fprintf, fgets */
#include <stdlib.h>     /* exit */
#include <string.h>     /* str* */

#include <libipset/data.h>    /* enum ipset_data */
#include <libipset/parse.h>   /* ipset_parse_* */
#include <libipset/session.h>   /* ipset_session_* */
#include <libipset/types.h>   /* struct ipset_type */
#include <libipset/ui.h>    /* core options, commands */
#include <libipset/utils.h>   /* STREQ */

int main(int argc, char *argv[]) {

  struct ipset_session *session;

  session = ipset_session_init(printf);
  if (session == NULL) {
    fprintf(stderr, "Cannot initialize ipset session, aborting.\n");
    return -1;
  }

  ipset_session_fini(session);

  return 0;
}

$ gcc ipsetTest.c -lipset -lmnl -o ipsetTest
/usr/lib/gcc/x86_64-linux-gnu/4.6/../../../x86_64-linux-gnu/libipset.so:
undefined reference to `ipset_port_usage'
collect2: ld returned 1 exit status

I can not install a new kernel module or over write the system library
of libipset, this has to work with the kernel modules already
installed on customer machines.

I could however build a custom version of the library and reference it
from our executable, but it has to be compatible with the kernel
version installed in 12.04.

Is libipset broken on 12.04?  How do I fix it - can I patch a version
to work w/ 12.04?
12.04 reports ipset version 6.11 protocol version 6.

Regards,
Dan
