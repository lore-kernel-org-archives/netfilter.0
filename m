From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Seeking assistance for broken LOG target after upgrade
Date: Fri, 23 Jan 2004 12:10:09 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0401231209060.15698-100000@blackhole.kfki.hu>
References: <9E0E7DA2130F1D42861EC43B568E99FC09165D@mail1.cpbinc.in>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9E0E7DA2130F1D42861EC43B568E99FC09165D@mail1.cpbinc.in>
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
To: "Chris M. Gamble" <chris.gamble@cpbinc.com>
Cc: netfilter@lists.netfilter.org

On Thu, 22 Jan 2004, Chris M. Gamble wrote:

> I recently upgraded a redhat 7.3 base install to a new 2.4.24 kernel
> and upgraded the iptables to 1.2.9. Along with this, I implemented the
> pom base set to the kernel before installing.
>
> Now, everything works better than ever, except when I try to use the
> LOG target.
>
> When using the LOG target, I get the error that no such chain/target
> exists. Based on this, I tried to modprobe the ipt_LOG module, and
> attached is my error:
>
> /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: unresolved symbol nf_log_unregister
> /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: unresolved symbol nf_log_register
> /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: insmod /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o failed
> /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: insmod ipt_LOG failed

Did you recompile both the kernel and the modules after applying the base
patches? It seems to mee, only the modules were recompiled.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


