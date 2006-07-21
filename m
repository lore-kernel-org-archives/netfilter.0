From: "David Burrow" <dnburrow@gmail.com>
Subject: ipset with SUSE 10.0
Date: Thu, 20 Jul 2006 21:07:23 -0600
Message-ID: <edc15fb60607202007r3b289385pc977f2d2ca4b83ca@mail.gmail.com>
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

All,

I'm attempting to install ipset via the instructions at
ipset.netfilter.org on a SuSE 10.0 box.  I've gotten as far as the
step where I run:

KERNEL_DIR=/usr/src/linux make

in the iptables directory.  The first time I tried this I got an error
about missing dependencies that suggested I try running "make clean,"
so I did.  Now when I try running the instructed command, I get the
following:

linux:/usr/src/iptables # KERNEL_DIR=/usr/src/linux make
Extensions found: IPv4:CLUSTERIP IPv4:recent IPv4:set IPv4:SET IPv6:ah
IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:REJECT
IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.3.5\"  -fPIC -o extensions/libipt_ah_sh.o -c
extensions/libipt_ah.c
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:26:1: warning: "IFNAMSIZ" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:128:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:30:1: warning: "IFF_UP" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:46:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:31:1: warning: "IFF_BROADCAST" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:48:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:32:1: warning: "IFF_DEBUG" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:50:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:33:1: warning: "IFF_LOOPBACK" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:52:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:34:1: warning: "IFF_POINTOPOINT" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:54:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:35:1: warning: "IFF_NOTRAILERS" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:56:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:36:1: warning: "IFF_RUNNING" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:58:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:37:1: warning: "IFF_NOARP" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:60:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:38:1: warning: "IFF_PROMISC" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:62:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:39:1: warning: "IFF_ALLMULTI" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:66:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:41:1: warning: "IFF_MASTER" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:69:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:42:1: warning: "IFF_SLAVE" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:71:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:44:1: warning: "IFF_MULTICAST" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:74:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:48:1: warning: "IFF_PORTSEL" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:77:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:49:1: warning: "IFF_AUTOMEDIA" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/net/if.h:79:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/if.h:95: error: redefinition of 'struct ifmap'
/usr/src/linux/include/linux/if.h:131: error: redefinition of 'struct ifreq'
/usr/src/linux/include/linux/if.h:181: error: redefinition of 'struct ifconf'
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:31: error: redefinition of 'struct in6_addr'
/usr/src/linux/include/linux/in6.h:54: error: redefinition of 'struct
sockaddr_in6'
/usr/src/linux/include/linux/in6.h:62: error: redefinition of 'struct ipv6_mreq'
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:131:1: warning: "IPPROTO_HOPOPTS" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:36:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:132:1: warning: "IPPROTO_ROUTING" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:58:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:133:1: warning: "IPPROTO_FRAGMENT" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:60:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:134:1: warning: "IPPROTO_ICMPV6" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:70:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:135:1: warning: "IPPROTO_NONE" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:72:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:136:1: warning: "IPPROTO_DSTOPTS" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/netinet/in.h:74:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:166:1: warning:
"IPV6_ADD_MEMBERSHIP" redefined
In file included from /usr/include/netinet/in.h:345,
                 from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/bits/in.h:137:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/in6.h:167:1: warning:
"IPV6_DROP_MEMBERSHIP" redefined
In file included from /usr/include/netinet/in.h:345,
                 from /usr/include/netdb.h:28,
                 from extensions/libipt_ah.c:3:
/usr/include/bits/in.h:138:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux/include/net/protocol.h:30,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/ipv6.h:19: error: redefinition of 'struct
in6_pktinfo'
In file included from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/net/protocol.h:38: warning: 'struct sk_buff'
declared inside parameter list
/usr/src/linux/include/net/protocol.h:38: warning: its scope is only
this definition or declaration, which is probably not what you want
/usr/src/linux/include/net/protocol.h:39: error: syntax error before 'u32'
/usr/src/linux/include/net/protocol.h:47: warning: 'struct sk_buff'
declared inside parameter list
/usr/src/linux/include/net/protocol.h:52: warning: 'struct
inet6_skb_parm' declared inside parameter list
/usr/src/linux/include/net/protocol.h:52: warning: 'struct sk_buff'
declared inside parameter list
/usr/src/linux/include/net/protocol.h:62: error: field 'list' has
incomplete type
make: *** [extensions/libipt_ah_sh.o] Error 1

I'm fairly lost at this point, and am wondering if anyone has any tips
as to what I did wrong?

Thanks,

David

