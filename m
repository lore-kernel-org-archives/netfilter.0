From: funny guy <asteriskmail@yahoo.com>
Subject: Multiple PPTP clients behind NAT
Date: Tue, 14 Sep 2004 22:37:17 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040915053717.40755.qmail@web52510.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Rob, everyone,

ok I remember know why I couldn't use a more recent
patch: I did not succeed in compiling any kernel with
patch-o-matic-ng-20040621 or the one just before.
Sorry I had forgotten, but I tried so many avenues for
this recently!

Here's my configuration: fresh linux-2.4.26,
patch-o-matic-ng-20040621, When running patch-o-matic,
I only apply the PPTP, RTSP conntrack and transparent
proxy patches. They seem to apply without problem.

When I compile, I get the following error:
make[2]: Entering directory
`/usr/src/linux-2.4.26/net/ipv4/netfilter'
ld -m elf_i386 -r -o ip_conntrack.o
ip_conntrack_standalone.o ip_conntrack_core.o
ip_conntrack_proto_generic.o ip_conntrack_proto_tcp.o
ip_conntrack_proto_udp.o ip_conntrack_proto_icmp.o
gcc -D__KERNEL__ -I/usr/src/linux-2.4.26/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2
-fno-strict-aliasing -fno-common -fomit-frame-pointer
-pipe -mpreferred-stack-boundary=2 -march=i686
-DMODULE -DMODVERSIONS -include
/usr/src/linux-2.4.26/include/linux/modversions.h 
-nostdinc -iwithprefix include
-DKBUILD_BASENAME=ip_nat_proto_gre  -c -o
ip_nat_proto_gre.o ip_nat_proto_gre.c
ip_nat_proto_gre.c: In function `gre_unique_tuple':
ip_nat_proto_gre.c:108: too few arguments to function
`ip_nat_used_tuple_R20700d95'
make[2]: *** [ip_nat_proto_gre.o] Error 1
make[2]: Leaving directory
`/usr/src/linux-2.4.26/net/ipv4/netfilter'



I notice someone else has had this error, but got no
reply to his email on the mailing list:
http://msgs.securepoint.com/cgi-bin/get/netfilter-0408/216.html

I cannot use a 2.6 kernel at the moment for other
reasons. Any idea? Thanks a lot !

My .config contains the snippet bellow.

# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_MMAP is not set
# CONFIG_NETLINK_DEV is not set
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_DEBUG is not set
CONFIG_FILTER=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_FWMARK=y
CONFIG_IP_ROUTE_NAT=y
# CONFIG_IP_ROUTE_MULTIPATH is not set
CONFIG_IP_ROUTE_TOS=y
# CONFIG_IP_ROUTE_VERBOSE is not set
# CONFIG_IP_PNP is not set
CONFIG_NET_IPIP=m
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set

#
#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=m
CONFIG_IP_NF_FTP=m
CONFIG_IP_NF_CT_PROTO_GRE=m
CONFIG_IP_NF_PPTP=m
CONFIG_IP_NF_PPTP_DEBUG=y
# CONFIG_IP_NF_AMANDA is not set
CONFIG_IP_NF_TFTP=m
CONFIG_IP_NF_IRC=m
CONFIG_IP_NF_RTSP=m
CONFIG_IP_NF_IPTABLES=m
# CONFIG_IP_NF_MATCH_LIMIT is not set
CONFIG_IP_NF_MATCH_MAC=m
CONFIG_IP_NF_MATCH_PKTTYPE=m
CONFIG_IP_NF_MATCH_MARK=m
CONFIG_IP_NF_MATCH_MULTIPORT=m
CONFIG_IP_NF_MATCH_TOS=m
CONFIG_IP_NF_MATCH_RECENT=m
# CONFIG_IP_NF_MATCH_ECN is not set
CONFIGCONFIG_IP_NF_MATCH_AH_ESP=m
# CONFIG_IP_NF_MATCH_LENGTH is not set
# CONFIG_IP_NF_MATCH_TTL is not set
# CONFIG_IP_NF_MATCH_TCPMSS is not set
# CONFIG_IP_NF_MATCH_HELPER is not set
CONFIG_IP_NF_MATCH_STATE=m
CONFIG_IP_NF_MATCH_CONNTRACK=m
CONFIG_IP_NF_FILTER=m
# CONFIG_IP_NF_TARGET_REJECT is not set
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_NAT_LOCAL=y
# CONFIG_IP_NF_NAT_NRES is not set
CONFIG_IP_NF_NAT_PPTP=m
CONFIG_IP_NF_NAT_PROTO_GRE=m
CONFIG_IP_NF_NAT_IRC=m
CONFIG_IP_NF_NAT_FTP=m
CONFIG_IP_NF_NAT_TFTP=m
CONFIG_IP_NF_TPROXY=m
CONFIG_IP_NF_TARGET_TPROXY=m
CONFIG_IP_NF_MATCH_TPROXY=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_TOS=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_DSCP=m
CONFIG_IP_NF_TARGET_MARK=m
# CONFIG_IP_NF_TARGET_LOG is not set
# CONFIG_IP_NF_TARGET_ULOG is not set
# CONFIG_IP_NF_TARGET_TCPMSS is not set
# CONFIG_IP_NF_ARPTABLES is not set
# CONFIG_IP_NF_COMPAT_IPCHAINS is not set
# CONFIG_IP_NF_COMPAT_IPFWADM is not set
_IP_NF_MATCH_DSCP=m





		
__________________________________
Do you Yahoo!?
Y! Messenger - Communicate in real time. Download now. 
http://messenger.yahoo.com

