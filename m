From: "Sashan Govender" <sashang@gmail.com>
Subject: Re: compiling extension modules with -std=c99 fails
Date: Wed, 1 Aug 2007 10:25:21 +1000
Message-ID: <23738f080707311725u5ccb4aabu676be3e1516725f6@mail.gmail.com>
References: <23738f080707301914p65be54c2o9ef6e840c86920e6@mail.gmail.com>
	<46AEA051.1@aesgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=tTA3IHeD35AM1Q4FL3lR35i/M4BywjaOOk6H1ejC4qJR5wUuDaAY+8nHWSQiGiXO103sBcixtTKx0D5tRDkvvx6LxMZx0ygSXqoBAyFlW/K5DvexfS5M52mXEJU6tKMBmgoGATcdmzhMs2qLCWccRmJIeWhfhxtmTK61c3y0ir0=
In-Reply-To: <46AEA051.1@aesgi.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Gregory Carter <gcarter@aesgi.com>
Cc: netfilter@lists.netfilter.org

I've tried compiling it using 2.6.18 and 2.6.20. Using gcc (GCC) 4.1.1
20070105 (Red Hat 4.1.1-51). A patch to iptables like this:

--- kernel-2.6.20/linux-2.6.20/include/linux/netfilter_ipv4/ip_tables.h
2007-02-05 05:44:54.000000000 +1100
+++ kernel-2.6.20-skg/linux-2.6.20/include/linux/netfilter_ipv4/ip_tables.h
  2007-07-31 14:22:41.000000000 +1000
@@ -16,7 +16,6 @@
 #define _IPTABLES_H

 #ifdef __KERNEL__
-#include <linux/if.h>
 #include <linux/types.h>
 #include <linux/in.h>
 #include <linux/ip.h>
@@ -24,7 +23,7 @@
 #endif
 #include <linux/compiler.h>
 #include <linux/netfilter_ipv4.h>
-
+#include <linux/if.h>
 #include <linux/netfilter/x_tables.h>

 #define IPT_FUNCTION_MAXNAMELEN XT_FUNCTION_MAXNAMELEN

allows me to compile the modules using -std=c99. The patch just
includes the file that contains the missing macro definition that gcc
was complaining about.

On 7/31/07, Gregory Carter <gcarter@aesgi.com> wrote:
> Lots of reasons.
>
> What version of kernel development shipped with your distro?
>
> What version of gcc are you using?
>
> -gc
>
> Sashan Govender wrote:
> > Hi
> >
> > Is there any reason why compiling the iptables extensions should fail
> > when using -std=c99?
> >
> > cc -O2 -Wall -Wunused
> > -I/usr/src/kernels/2.6.18-1.2798.fc6-i586/include -Iinclude/
> > -DIPTABLES_VERSION=\"1.3.5\"
> > -DIPT_LIB_DIR=\"/usr/local/lib/iptables\" -rdynamic -o iptables
> > iptables-standalone.c iptables.o libiptc/libiptc.a -ldl -lnsl -std=c99
> > In file included from include/libiptc/libiptc.h:6,
> >                  from include/iptables.h:5,
> >                  from iptables-standalone.c:38:
> > /usr/src/kernels/2.6.18-1.2798.fc6-i586/include/linux/netfilter_ipv4/ip_tables.h:43:
> > error: IFNAMSIZ undeclared here (not in a function)
> >
> >
> >
>

