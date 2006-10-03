From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: Pleeeeeeeeeeease help me with u32 module
Date: Tue, 03 Oct 2006 09:45:32 -0500
Message-ID: <1159886732.28977.156.camel@mfarooq-1.tango-networks.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

I need help very badly. I want to use u32 kernel module which is
unfortunately not part of the iptables core set. When I tried to compile
this module with redhat enterprise which is using kernel 2.6.9, it
failed with the following error:

net/ipv4/netfilter/ipt_u32.c:127: warning: "struct xt_match" declared
inside parameter list
net/ipv4/netfilter/ipt_u32.c:127: warning: its scope is only this
definition or declaration, which is probably not what you want
net/ipv4/netfilter/ipt_u32.c:210: warning: "struct xt_match" declared
inside parameter list
net/ipv4/netfilter/ipt_u32.c:219: warning: initialization from
incompatible pointer type
net/ipv4/netfilter/ipt_u32.c:220: error: unknown field `matchsize'
specified in initializer
net/ipv4/netfilter/ipt_u32.c:220: warning: initialization makes pointer
from integer without a cast
net/ipv4/netfilter/ipt_u32.c:221: warning: initialization from
incompatible pointer type
make[3]: *** [net/ipv4/netfilter/ipt_u32.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

I solve this compile error by adding the matchsize variable in the
ipt_match structure in
the /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h

Now I can compile without any compile error but when I try to run
iptables command:
iptables -A INPUT -m u32 --u32 "2&0xffff=0x2" -j ACCEPT
iptables: Invalid argument

I get "Invalid argument" error. I am stuck right now. I am not a kernel
hacker and have no clue how to move forward. I would appreciate if some
kind soul point me to the right direction. Thanks in advance.

MF




