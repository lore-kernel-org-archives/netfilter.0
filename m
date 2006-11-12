From: "=?ISO-8859-1?Q?Fran=E7ois_Barel?=" <frabar666@gmail.com>
Subject: CONNMARK target's dependency on MANGLE table
Date: Sun, 12 Nov 2006 22:16:54 +0100
Message-ID: <168561c90611121316n6286e055mbc80463882fd93d2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi list,

My setup is:
  - kernel 2.6.18.2, iptables 1.3.5,
  - only IPv4, no IPv6,
  - kernel .config includes CONFIG_IP_NF_MANGLE=n (no mangle table).

I simply want to use the CONNMARK target (and the associated connmark
match) in the filter table (OUTPUT chain).
I'm aware that I won't be able to use the "--restore-mark" option
since I won't be in the mangle table (I saw that
net/netfilter/xt_CONNMARK.c's checkentry prevents it -- unless I'm
missing something, that's the only mangle-related thing in that file).
But I should be able to use the "--set-mark" option in the filter
table, shouldn't I?


Unfortunately, the kernel configurator doesn't let me select the
CONNMARK target: in net/netfilter/Kconfig,
NETFILTER_XT_TARGET_CONNMARK has a dependency on IP_NF_MANGLE ||
IP6_NF_MANGLE (both of which are "n" here, so no CONNMARK target for
me).

I was wondering, what is the reason for this? It feels weird having to
activate the mangle table when I don't want it, only in order to be
allowed to compile xt_CONNMARK.c...

Thanks,
Francois

