From: mj <mj50300@yahoo.es>
Subject: Cannot compile iptables + kernel 2.6.5
Date: Fri, 13 Aug 2004 09:45:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408130945.45711.mj50300@yahoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello all,

Sorry if this problem has been posted yet, I'm new at the list, searched the 
archive but couldn't find nothing ... I'm having trouble when compiling 
iptables 1.29 with kernel 2.6.5-7.104. I'm running suse 9.1. I do:

#make KERNEL_DIR=/usr/src/linux BINDIR=/usr/sbin LIBDIR=/usr/lib 
MANDIR=/usr/man install

And get the following redefinition warnings and errors, here is part of the 
log:

Extensions found: IPv4:recent IPv6:REJECT IPv6:ah IPv6:esp IPv6:frag 
IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.9\"  -fPIC -o extensions/libipt_ah_sh.o -c 
extensions/libipt_ah.c
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:25:1: warning: "IFNAMSIZ" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:128:1: warning: this is the location of the previous 
definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:29:1: warning: "IFF_UP" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:46:1: warning: this is the location of the previous 
definition
	.
	.
	.
	.
	(some more similar warnings within the same files)
	.
	.
	.
	.
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:92: error: redefinition of `struct ifmap'
/usr/src/linux/include/linux/if.h:128: error: redefinition of `struct ifreq'
/usr/src/linux/include/linux/if.h:178: error: redefinition of `struct ifconf'
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:31: error: redefinition of `struct 
in6_addr'
/usr/src/linux/include/linux/in6.h:52: error: redefinition of `struct 
sockaddr_in6'
/usr/src/linux/include/linux/in6.h:60: error: redefinition of `struct 
ipv6_mreq'
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:129:1: warning: "IPPROTO_HOPOPTS" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:36:1: warning: this is the location of the previous 
definition
	.	
	.
	.
	.
In file included from /usr/src/linux/include/net/protocol.h:30,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/ipv6.h:19: error: redefinition of `struct 
in6_pktinfo'
In file included from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/net/protocol.h:39: warning: `struct sk_buff' declared 
inside parameter list
/usr/src/linux/include/net/protocol.h:39: warning: its scope is only this 
definition or declaration, which is probably not what you want
/usr/src/linux/include/net/protocol.h:40: error: parse error before "u32"
/usr/src/linux/include/net/protocol.h:40: warning: `struct sk_buff' declared 
inside parameter list
/usr/src/linux/include/net/protocol.h:48: warning: `struct sk_buff' declared 
inside parameter list
/usr/src/linux/include/net/protocol.h:53: warning: `struct inet6_skb_parm' 
declared inside parameter list
/usr/src/linux/include/net/protocol.h:53: warning: `struct sk_buff' declared 
inside parameter list
/usr/src/linux/include/net/protocol.h:63: error: field `list' has incomplete 
type
make: *** [extensions/libipt_ah_sh.o] Error 1

I have been compiling iptables 1.2.9 against kernel 2.6.3 and 2.6.4 without 
any problem. Please, any help and suggestions will be welcomed, I searched 
everywhere and founded nothing :-( . Is there some important patch that I 
should apply? 

Best regards

Maria

