From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Can't get ipset to compile - kernel-2.6.10, iptables-1.3.0...
Date: Sun, 16 Jan 2005 16:41:31 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0501161633260.6757@blackhole.kfki.hu>
References: <41E87FA2.9090308@intellitree.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E87FA2.9090308@intellitree.com>
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
To: henry <info@intellitree.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Fri, 14 Jan 2005, henry wrote:

> After the advice I got on using ipset for long lists of networks for ban
> lists, I set out to install it. I followed the instructions on the ipset
> webpage: Downloaded the latest kernel from kernel.org (2.6.10)
> downloaded the latest iptables (1.3.0) and downloaded the
> patch-o-matic-ng from the ipset link (patch-o-matic-ng-20041206.tar.bz2)
>
> I ran ./runme set and it installed the patch just fine. But when I try
> and compile the kernel, this is what is happening:
>
> <...>
>    CC [M]  net/ipv4/netfilter/ipt_comment.o
>    CC [M]  net/ipv4/netfilter/ip_nat_snmp_basic.o
>    CC [M]  net/ipv4/netfilter/ipt_CONNMARK.o
>    CC [M]  net/ipv4/netfilter/ipt_NOTRACK.o
>    CC [M]  net/ipv4/netfilter/ipt_SET.o
>    CC [M]  net/ipv4/netfilter/ip_set.o
> net/ipv4/netfilter/ip_set.c: In function `ip_set_find_in_hash':
> net/ipv4/netfilter/ip_set.c:86: error: structure has no member named
> `read_locked_map'

As a quick fix, disable debugging netfilter in the kernel configuration.
(Non-debugged definition of lock mixed with debugging instructions.)

I'll commit the fixed version in svn and update the webpage on Tuesday.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

