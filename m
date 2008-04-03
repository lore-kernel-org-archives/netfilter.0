From: Bgs <bgs@bgs.hu>
Subject: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 03 Apr 2008 14:08:14 +0200
Message-ID: <47F4C8AE.4050801@bgs.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


  Greetings,

I tried to compile the above setup but the compilation fails. I've seen 
this error with 2.6.23/2.6.24 kernels before but used 2.6.22.X in 
production. Has anything changed in the way to patch it?


   CC      net/ipv4/netfilter/ipt_connlimit.o
In file included from net/ipv4/netfilter/ipt_connlimit.c:23:
include/net/netfilter/nf_conntrack.h:99: error: field 'ct_general' has 
incomplete type
include/net/netfilter/nf_conntrack.h: In function 'nf_ct_get':
include/net/netfilter/nf_conntrack.h:160: error: 'const struct sk_buff' 
has no member named 'nfct'
include/net/netfilter/nf_conntrack.h: In function 'nf_ct_put':
include/net/netfilter/nf_conntrack.h:167: error: implicit declaration of 
function 'nf_conntrack_put'
include/net/netfilter/nf_conntrack.h: In function 'nf_ct_is_untracked':
include/net/netfilter/nf_conntrack.h:249: error: 'const struct sk_buff' 
has no member named 'nfct'
In file included from net/ipv4/netfilter/ipt_connlimit.c:24:
include/net/netfilter/nf_conntrack_core.h: In function 
'nf_conntrack_confirm':
include/net/netfilter/nf_conntrack_core.h:68: error: 'struct sk_buff' 
has no member named 'nfct'
net/ipv4/netfilter/ipt_connlimit.c: In function 'count_them':
net/ipv4/netfilter/ipt_connlimit.c:98: error: too many arguments to 
function 'nf_conntrack_find_get'
net/ipv4/netfilter/ipt_connlimit.c: At top level:
net/ipv4/netfilter/ipt_connlimit.c:312: warning: initialization from 
incompatible pointer type
net/ipv4/netfilter/ipt_connlimit.c:316: warning: initialization from 
incompatible pointer type
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2


Bye
Bgs


