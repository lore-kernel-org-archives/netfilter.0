From: "Daniel De Graaf" <danieldegraaf@gmail.com>
Subject: Fwd: iptables random support
Date: Sun, 30 Jul 2006 20:20:34 -0500
Message-ID: <427c54c0607301820y1582458aq29e3ebe0ab62ecb1@mail.gmail.com>
References: <5B0731A8753509478386ED3D6513B2D101AE6CBB@isp-per-exch01.win2k.iinet.net.au>
	<427c54c0607301802h40c9f934l679e822899cf5c61@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427c54c0607301802h40c9f934l679e822899cf5c61@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

(Sorry if you get this twice; I forgot to cc: the list before)
On 7/30/06, Daniel Williams <danielw@staff.iinet.net.au> wrote:
>
> Hi,
>
> I have been trying to get iptables -m random support working to very
> little success.
>
> Does anyone have a modern 2.6 kernel with iptables -m random working ?
>
> I tried using the random and nth patches from patch-o-matic-ng-20050918,
> with 2.6.17.7 and iptables 1.2.11 and 1.3.5.
>
> The modules are loaded:
> root@server2:/usr/src# lsmod | grep ipt
> iptable_nat             8196  0
> ip_nat                 17580  1 iptable_nat
> iptable_filter          3968  0
> ipt_random              3200  0
> ipt_nth                 3584  0
> iptable_mangle          3968  0
> ip_tables              14580  3
> iptable_nat,iptable_filter,iptable_mangle
> x_tables               14724  5
> xt_tcpudp,iptable_nat,ipt_random,ipt_nth,ip_tables
>
>
> When I type a command that uses random or nth I get:
> # iptables -A INPUT -m random --average 1 -j ACCEPT
> iptables: Invalid argument
> # iptables -A INPUT -m nth --every 2 -j ACCEPT
> iptables: Invalid argument
> with iptables 1.2.11 and with iptables 1.3.5:
> # iptables -A INPUT -m nth --every 2 -j ACCEPT
> iptables: Unknown error 4294967295
> # iptables -A INPUT -m random -j ACCEPT
> iptables: Unknown error 4294967295
>
>
> I realize the 'unknown error' is a known, unrelated bug.
>
> I have some complicated routing requirements that I plan to use random
> in combination with mark/fwmark routing.
>
> I am also interested if anyone has this setup and can tell me the
> performance of there setup.
>
> Daniel
>

Patching the source code for -m random is very simple if you know C:
just change the function definitions of match and checkentry to the
ones below, and add ".matchsize = sizeof(ipt_rand_info)" to the struct
ipt_match definition. The same can be done to ipt_nth.

These two modules are unified in the 2.6.18 mainline as xt_statistic.

- Daniel De Graaf

static int match(const struct sk_buff *skb,
             const struct net_device *in,
             const struct net_device *out,
             const struct xt_match *match,
             const void *matchinfo,
             int offset,
             unsigned int protoff,
             int *hotdrop)

static int checkentry(const char *tablename,
              const void *ip,
              const struct xt_match *match,
              void *matchinfo,
              unsigned int matchinfosize,
              unsigned int hook_mask)

