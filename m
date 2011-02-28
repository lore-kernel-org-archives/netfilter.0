From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Problem crosscompiling libnetfilter_conntrack-0.9.1
Date: Mon, 28 Feb 2011 18:32:10 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102281821070.24019@obet.zrqbmnf.qr>
References: <BCC8F5E1-33FB-4FEB-ABA5-CA0CB7EB3655@aol.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BCC8F5E1-33FB-4FEB-ABA5-CA0CB7EB3655@aol.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jobhunts02@aol.com
Cc: netfilter@vger.kernel.org

On Monday 2011-02-28 18:02, jobhunts02@aol.com wrote:

>I am trying to crosscompile libnetfilter_conntrack-0.9.1 on an i686-pc for use on a powerpc.  When I run make, I get the following error:
>
>In file included from api.c:13:../../include/internal/internal.h:24:39: 
>error: libnfnetlink/libnfnetlink.h: No such file or directory
>
>libnfnetlink.h is located at 
>/home/steve/libnfnetlink-1.0.0/include/libnfnetlink/libnfnetlink.h
>
>My configure command is:
>
>./configure --host=i686-pc-linux-gnu --target=ppc 
>CROSS_COMPILE=powerpc-linux- 
>PKG_CONFIG_PATH=/home/steve/libnfnetlink-1.0.0
>
>How do I correct this error?

You need to fix your configure line. First, CROSS_COMPILE= has no 
effect. Second, --target has no effect either, because 
libnetfilter_conntrack is not a code generator.

After running configure, see what the value of LIBNFNETLINK_CFLAGS is in 
the generated Makefile. It should include the output of pkg-config, i.e. 
-I/home/steve/libnfnetlink-1.0.0/include or similar.

Finally, please copy the gcc line that make emits. If need be, use
`make V=1` if your default verbosity isn't already high.
