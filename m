From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Problem compiling Iptables 1.2.11 on Kernel 2.6.7 <Resolved,
 but other problem>
Date: Thu, 8 Jul 2004 00:21:23 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0407080018070.13450-100000@blackhole.kfki.hu>
References: <035101c46432$19e49650$800101df@lvl.digidyne.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <035101c46432$19e49650$800101df@lvl.digidyne.ca>
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
To: Eric Poulin <epoulin@onepost.net>
Cc: netfilter@lists.netfilter.org

On Wed, 7 Jul 2004, Eric Poulin wrote:

> Hum, I'm getting a new problem thought while compiling iptables as modules
> inside my new kernel...
>
> net/ipv4/netfilter/ip_conntrack_standalone.c:222: error: redefinition of
> `ip_conntrack_defrag'
> net/ipv4/netfilter/ip_conntrack_standalone.c:202: error:
> `ip_conntrack_defrag' previously defined here
> net/ipv4/netfilter/ip_conntrack_standalone.c:303: error: redefinition of
> `ip_conntrack_defrag_local_out_ops'
> net/ipv4/netfilter/ip_conntrack_standalone.c:295: error:
> `ip_conntrack_defrag_local_out_ops' previously defined here
> net/ipv4/netfilter/ip_conntrack_standalone.c:202: warning:
> `ip_conntrack_defrag' defined but not used
> net/ipv4/netfilter/ip_conntrack_standalone.c:295: warning:
> `ip_conntrack_defrag_local_out_ops' defined but not used
> {standard input}: Assembler messages:
> {standard input}:745: Error: symbol `ip_conntrack_defrag_local_out_ops' is
> already defined
> make[3]: *** [net/ipv4/netfilter/ip_conntrack_standalone.o] Error 1
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2

I'm unable to reproduce this. Linux 2.6.7 kernel patched with
08_linux-2.6.7-user_attr.patch (which does not touch
ip_conntrack_standalone.c at all) from pom-ng cvs compiles cleanly.

What do you *exactly* do?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


