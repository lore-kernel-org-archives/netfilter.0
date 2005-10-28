From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPset_iptree with timeouts on Fedora Core 4
Date: Fri, 28 Oct 2005 15:24:11 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510281256550.3365@blackhole.kfki.hu>
References: <436041CF.7090009@tfc.cz>
	<Pine.LNX.4.58.0510272129210.2649@blackhole.kfki.hu>
	<4361776C.5070706@tfc.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4361776C.5070706@tfc.cz>
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
To: Radek Hladik <rhladik@tfc.cz>
Cc: netfilter@lists.netfilter.org

On Fri, 28 Oct 2005, Radek Hladik wrote:

> What I mean is that when I create iptree without default timeout:
>
> ipset -N test iptree
>
> and now I try to add member with timeout:
>
> ipset -A test 1.2.3.4%60
>
> but the timeout is not working and IP 1.2.3.4 stays in the iptree
> forever. According to log messages:
> kernel: net/ipv4/netfilter/ip_set_iptree.c: ip_tree_gc (DBG): gc: 1 2 3
> 4: expires 1 jiffies 9992264
> The garbage collector is called but expires value is set to 1. I think
> that it is because of the line
> ipt_set_iptree.c:141    dtree->expires[d] = map->timeout ? (timeout * HZ
> + jiffies) : 1;
> which sets expires to 1 when adding member with timeout to non-timeout
> iptree. I think it would not break backward compatibility as old
> commands do not use the ip%timeout notation.

There are two possibilites:

- The set is created with a default timeout value, in which case
  all the entries time out. They can be added with specific timeout values
  by using ipset or with the default value via the SET target.
- The set is created without a timeout value (this is the default),
  when the entries do not time out. The set element which is actually
  added to the set is denoted by '1' in the line above.
  In this case there is no way to have got entries which do time out,
  not without bloating the structures, which I do not want to do.

> And I've found another issue I want to ask about. Is there any
> possibility to set timeout different from default timeout via ipt_SET
> target?

No, the SET target is totally generic and has no notion whatsoever on the
underlying set types.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

