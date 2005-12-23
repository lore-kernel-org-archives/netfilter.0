From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: patch-o-matic help
Date: Fri, 23 Dec 2005 11:40:26 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0512231136500.10411@blackhole.kfki.hu>
References: <20051223044928.31767.qmail@web35912.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051223044928.31767.qmail@web35912.mail.mud.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noman Liaquat <khankhn1@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Thu, 22 Dec 2005, Noman Liaquat wrote:

> Operating system=REDHAT ENTERPRISE LINUX#ES
> kernel= linux-2.6.14.4
> iptables=iptables-1.3.2
>
> i downloaded the patch-o-matic
> svn co
> https://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng
>
> i tried 10 times after patching the kernel with
> patch-matic, but getting the same error.
[...]
> ---------------------------------ERROR---------------------------------
> scripts/Makefile.build:51: kbuild:
> net/ipv4/netfilter/Makefile - Usage of export-objs is
> obsolete in 2.6. Please fix!
>   CC [M]  net/ipv4/netfilter/ip_conntrack_standalone.o
> In file included from
> include/linux/netfilter_ipv4/ip_conntrack.h:157,
>                  from
> net/ipv4/netfilter/ip_conntrack_standalone.c:34:
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:7:43:

Do you really need the conntrack/nat helper for talk?

If not, simply do not apply the patch from pom-ng or do not select the
helper when configuring the kernel.

The talk helper in pom-ng is a relic and hasn't been updated for a long
time.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

