From: dmclf@dmclf.org
Subject: netfilter/patch-o-matic
Date: Wed, 10 Dec 2003 17:16:56 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0312101710430.19781@fiordland.dmclf.org>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

anyone knows when there'll be a patch-o-matic for the 2.6.x kernel?
i'm wanting to include string-matching (and try/test some other not yet 
included)
i tried to manually add it, but that doesn't work >:)

== error == 
  CC      net/ipv4/netfilter/ipt_string.o
net/ipv4/netfilter/ipt_string.c: In function `search_sublinear':
net/ipv4/netfilter/ipt_string.c:55: warning: subscript has type `char'
net/ipv4/netfilter/ipt_string.c:80: warning: subscript has type `char'
net/ipv4/netfilter/ipt_string.c: In function `string_freeup_data':
net/ipv4/netfilter/ipt_string.c:166: `smp_num_cpus' undeclared (first use 
in this function)
net/ipv4/netfilter/ipt_string.c:166: (Each undeclared identifier is 
reported only once
net/ipv4/netfilter/ipt_string.c:166: for each function it appears in.)
net/ipv4/netfilter/ipt_string.c: At top level:
net/ipv4/netfilter/ipt_string.c:176: warning: initialization from 
incompatible pointer type
net/ipv4/netfilter/ipt_string.c: In function `init':
net/ipv4/netfilter/ipt_string.c:184: `smp_num_cpus' undeclared (first use 
in this function)
make[3]: *** [net/ipv4/netfilter/ipt_string.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2
== end ==

gcc 3.2.3
kernel 2.6.0-test11

regards,
-- 
(o<  DMcLF
//\  crop circles in the corn shell
V_/_ 

