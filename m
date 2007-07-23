From: pud <pud@safeTpin.homeunix.org>
Subject: ipset and kernel 2.6.22
Date: Mon, 23 Jul 2007 12:24:20 +0200
Message-ID: <20070723102420.GA5224@safeTpin.homeunix.org>
Reply-To: pud@subnet666.de
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi list,

just wanted to ask if i'm the only one who is unable to compile
an ipset-patched kernel 2.6.22...
(any of the devs around? - can't find any contact address at the
ipset website)

  CC [M]  net/ipv4/netfilter/ipt_SET.o
net/ipv4/netfilter/ipt_SET.c:25:46: error: linux/netfilter_ipv4/ip_nat_rule.h: No such file or directory
net/ipv4/netfilter/ipt_SET.c:40: warning: 'struct xt_target' declared inside parameter list
net/ipv4/netfilter/ipt_SET.c:40: warning: its scope is only this definition or declaration, which is probably not what you want
net/ipv4/netfilter/ipt_SET.c: In function 'target':
net/ipv4/netfilter/ipt_SET.c:54: error: 'IPT_CONTINUE' undeclared (first use in this function)
net/ipv4/netfilter/ipt_SET.c:54: error: (Each undeclared identifier is reported only once
net/ipv4/netfilter/ipt_SET.c:54: error: for each function it appears in.)
net/ipv4/netfilter/ipt_SET.c: At top level:
net/ipv4/netfilter/ipt_SET.c:71: warning: 'struct xt_target' declared inside parameter list
net/ipv4/netfilter/ipt_SET.c:117: warning: 'struct xt_target' declared inside parameter list
net/ipv4/netfilter/ipt_SET.c:134: error: variable 'SET_target' has initializer but incomplete type
net/ipv4/netfilter/ipt_SET.c:135: error: unknown field 'name' specified in initializer
net/ipv4/netfilter/ipt_SET.c:135: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:135: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c:137: error: unknown field 'family' specified in initializer
net/ipv4/netfilter/ipt_SET.c:137: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:137: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c:139: error: unknown field 'target' specified in initializer
net/ipv4/netfilter/ipt_SET.c:139: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:139: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c:141: error: unknown field 'targetsize' specified in initializer
net/ipv4/netfilter/ipt_SET.c:141: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:141: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c:143: error: unknown field 'checkentry' specified in initializer
net/ipv4/netfilter/ipt_SET.c:143: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:143: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c:144: error: unknown field 'destroy' specified in initializer
net/ipv4/netfilter/ipt_SET.c:144: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:144: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c:145: error: unknown field 'me' specified in initializer
net/ipv4/netfilter/ipt_SET.c:146: warning: excess elements in struct initializer
net/ipv4/netfilter/ipt_SET.c:146: warning: (near initialization for 'SET_target')
net/ipv4/netfilter/ipt_SET.c: In function 'ipt_SET_init':
net/ipv4/netfilter/ipt_SET.c:159: warning: implicit declaration of function 'xt_register_target'
net/ipv4/netfilter/ipt_SET.c: In function 'ipt_SET_fini':
net/ipv4/netfilter/ipt_SET.c:164: warning: implicit declaration of function 'xt_unregister_target'
make[3]: *** [net/ipv4/netfilter/ipt_SET.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2


anyone?


tia,

=;p/ud aka nerdpunk

-- 
gpg-key #C3B04767

