From: "Jim Gifford" <maillist@jg555.com>
Subject: Patch-o-matic NG problems
Date: Fri, 13 Feb 2004 16:45:54 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09d001c3f293$e77a92b0$d300a8c0@W2RZ8L4S02>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Linux 2.6.2

    Connection tracking modules I get the following error.

In file included from net/ipv4/netfilter/ip_conntrack_standalone.c:26:
include/linux/netfilter_ipv4/ip_conntrack.h:90: error: field `ct_talk_info'
has incomplete type
include/linux/netfilter_ipv4/ip_conntrack.h:91: error: field `ct_mms_info'
has incomplete type
make[4]: *** [net/ipv4/netfilter/ip_conntrack_standalone.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2

Any suggestions

----
Jim Gifford
maillist@jg555.com


