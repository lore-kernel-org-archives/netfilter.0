From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: compile problem with 1.2.10
Date: Thu, 17 Jun 2004 14:27:29 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406171423130.21411-100000@blackhole.kfki.hu>
References: <40D18AB4.4070101@nucdc.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D18AB4.4070101@nucdc.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Pratt <jamie@nucdc.org>, =?ISO-8859-2?Q?=5BISO-8859-1=5D_G=FCnter_Zimmermann?= <guenter@guenter-zimmermann.com>
Cc: netfilter@lists.netfilter.org

On Thu, 17 Jun 2004, Jamie Pratt wrote:

> Hi, I'm trying to compile 1.2.10 on a RH 7.2 box, running kernel 2.4.26.
> (The prior version is 1.2.9, no POM or anything fancy, just the default
> stuff..)
>
> I get the following error upon running 'make KERNEL_DIR=/usr/src/linux' :
>
> cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
> -DIPTABLES_VERSION=\"1.2.10\"  -DIPT_LIB_DIR=\"/usr/local/lib/iptables\"
> -rdynamic -o iptables iptables-standalone.c iptables.o libiptc/libiptc.a
> -ldl -lnsl
> /bin/sh: -c: line 1: syntax error near unexpected token `;'
> /bin/sh: -c: line 1: `if [ -n "" ]; then  for ext in ; do  echo ".SS
> $ext (not supported, see Patch-O-Matic)" ; cat
> extensions/libipt_$ext.man ; done ; fi >>extensions/libipt_matches.man'
> make: *** [extensions/libipt_matches.man] Error 2
> rm libiptc/libip6tc.o libiptc/libip4tc.o

The bug has been fixed in the iptables cvs. The new iptables release will
be issued soon.

Thank you for the reporting: iptables-1.2.10 was compiled countless times,
but the possibility you tripped over never came out for the developers
:-(.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



