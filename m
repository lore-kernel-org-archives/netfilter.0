From: Andrew Beverley <andy@andybev.com>
Subject: Connlimit and linux-2.6.17
Date: Sun, 16 Jul 2006 22:53:34 +0100
Message-ID: <44BAB55E.4010501@andybev.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I am having trouble using connlimit with kernel 2.6.17.4 and
iptables-1.3.5-20060508. When I run:

iptables -t mangle -A PREROUTING -p tcp -i eth0 -m \
	connlimit --connlimit-above 5 -j LOG

I get "iptables: Invalid argument"

The kernel and iptables are patched with patch-o-matic-ng-20060626,
which in turn is patched as per
http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=3456 to
uupdate the connlimit patch

I have noticed that when compiling the kernel I get error messages as
follows when compiling connlimit:

net/ipv4/netfilter/ipt_connlimit.c:211: warning: initialization from
incompatible pointer type
net/ipv4/netfilter/ipt_connlimit.c:212: warning: initialization from
incompatible pointer type
net/ipv4/netfilter/ipt_connlimit.c:213: warning: initialization from
incompatible pointer type

The above error messages do not appear when using 2.6.15, and connlimit
works.

Any ideas?

On another note, will connlimit ever form part of the stable kernel? It
is a real pain having to mess around patching each time I get a new
kernel, especially as currently the patch-o-matic also requires patching!

Andy Beverley


