From: u1_amd@dslr.net
Subject: connlimit is broken since jan?
Date: Thu, 17 Mar 2005 14:48:29 -0500
Message-ID: <101685057968.20050317144829@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Ok I'm confused...

latest "stable" kernel 2.6 from kernel.org, netfilter 1.3.1, latest
patch-o-matic distro

I applied patches (pending, then selected ones from extra). Note:
pending says several patches are "not already appplied" but then gives
errors when you attempt to apply them. huh? Ok, i guess they are already
in 2.6 mainline but patch-o-matic is broken in not figuring that out.

Now build kernel.

  CC [M]  net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
net/ipv4/netfilter/ipt_connlimit.c:74: structure has no member named `ctrack'
net/ipv4/netfilter/ipt_connlimit.c:94: structure has no member named `ctrack'
net/ipv4/netfilter/ipt_connlimit.c:100: structure has no member named `ctrack'
net/ipv4/netfilter/ipt_connlimit.c:107: structure has no member named `ctrack'
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2

Now I go off to google and find that ctrack structure field has been
removed, according to a netfilter patch 9/11 posted to the mailing list
*in january*.

http://lists.netfilter.org/pipermail/netfilter-devel/2005-January/018147.html

Now I'm really confused. If this is a patch to remove ctrack, does this
mean connlimit has been borked since then? connlimit is a very useful
module.

It would be much better if one page listed certain "safe" combinations
of kernel/netfilter/patch-o-matic releases that, while perhaps out of
date, were not internally inconsistent and at least compiled?

thanks


