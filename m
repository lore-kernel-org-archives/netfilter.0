From: aspenbr <aspenbr@yahoo.com.br>
Subject: Erro for compiler
Date: 14 Mar 2005 18:14:55 -0300
Message-ID: <1110834895.27483.104.camel@maclinux.lotus>
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
To: NetFilter <netfilter@lists.netfilter.org>

Helow I am trying to install I modulate it of netfilter IPP2p and I do
not obtain already I made diverse modifications, and without success,
all had failed to follow placed the message that appears when I give
to the command "make"

 make

gcc -O3 -Wall -DIPTABLES_VERSION=\"1.2.8\" -I/usr/include/iptables -fPIC
-c libipt_ipp2p.c
libipt_ipp2p.c:9:22: iptables.h: No such file or directory
libipt_ipp2p.c:78: warning: `struct ipt_entry_match' declared inside
parameter list
libipt_ipp2p.c:78: warning: its scope is only this definition or
declaration, which is probably not what you want
libipt_ipp2p.c: In function `init':
libipt_ipp2p.c:80: dereferencing pointer to incomplete type
libipt_ipp2p.c:82: `NFC_UNKNOWN' undeclared (first use in this function)
libipt_ipp2p.c:82: (Each undeclared identifier is reported only once
libipt_ipp2p.c:82: for each function it appears in.)
libipt_ipp2p.c: At top level:
libipt_ipp2p.c:96: warning: `struct ipt_entry_match' declared inside
parameter list
libipt_ipp2p.c:96: warning: `struct ipt_entry' declared inside parameter
list
libipt_ipp2p.c: In function `parse':
libipt_ipp2p.c:98: dereferencing pointer to incomplete type
libipt_ipp2p.c:103: warning: implicit declaration of function
`exit_error'
libipt_ipp2p.c:103: `PARAMETER_PROBLEM' undeclared (first use in this
function)
libipt_ipp2p.c: In function `final_check':
libipt_ipp2p.c:395: `PARAMETER_PROBLEM' undeclared (first use in this
function)
libipt_ipp2p.c: At top level:
libipt_ipp2p.c:404: warning: `struct ipt_entry_match' declared inside
parameter list
libipt_ipp2p.c:404: warning: `struct ipt_ip' declared inside parameter
list
libipt_ipp2p.c: In function `print':
libipt_ipp2p.c:406: dereferencing pointer to incomplete type
libipt_ipp2p.c: At top level:
libipt_ipp2p.c:433: warning: `struct ipt_entry_match' declared inside
parameter list
libipt_ipp2p.c:433: warning: `struct ipt_ip' declared inside parameter
list
libipt_ipp2p.c: In function `save':
libipt_ipp2p.c:435: dereferencing pointer to incomplete type
libipt_ipp2p.c: At top level:
libipt_ipp2p.c:462: variable `ipp2p' has initializer but incomplete type
libipt_ipp2p.c:462: warning: excess elements in struct initializer
libipt_ipp2p.c:462: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:463: warning: excess elements in struct initializer
libipt_ipp2p.c:463: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:464: warning: excess elements in struct initializer
libipt_ipp2p.c:464: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:465: warning: implicit declaration of function
`IPT_ALIGN'
libipt_ipp2p.c:465: warning: excess elements in struct initializer
libipt_ipp2p.c:465: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:466: warning: excess elements in struct initializer
libipt_ipp2p.c:466: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:467: warning: excess elements in struct initializer
libipt_ipp2p.c:467: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:468: warning: excess elements in struct initializer
libipt_ipp2p.c:468: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:469: warning: excess elements in struct initializer
libipt_ipp2p.c:469: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:470: warning: excess elements in struct initializer
libipt_ipp2p.c:470: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:471: warning: excess elements in struct initializer
libipt_ipp2p.c:471: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:472: warning: excess elements in struct initializer
libipt_ipp2p.c:472: warning: (near initialization for `ipp2p')
libipt_ipp2p.c:474: warning: excess elements in struct initializer
libipt_ipp2p.c:474: warning: (near initialization for `ipp2p')
libipt_ipp2p.c: In function `_init':
libipt_ipp2p.c:480: warning: implicit declaration of function
`register_match'
libipt_ipp2p.c: At top level:
libipt_ipp2p.c:462: storage size of `ipp2p' isn't known
make: *** [libipt_ipp2p.so] Error 1


Thank 




