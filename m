From: Nic <nferrier@tapsellferrier.co.uk>
Subject: dazed and confused about building
Date: 13 Jul 2003 02:35:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87u19rp5sb.fsf@tapsellferrier.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a debian box with a 2.4.21 kernel on it. I was hoping to setup
source NAT. debian comes with iptables 1.6. I realize that's out of
date but I thought it would do "for now".

From reading the various bits of documentation on netfilter I _think_
that I have to set some the netfilter options in .config. I'm not sure
about that because menuconfig doesn't offer an interface and I found
this in Documentation/Changes:

  "The IP firewalling and NAT code has been replaced again.  The new
  netfilter software (including ipfwadm and ipchains backwards-
  compatible modules) is currently distributed separately."

But, the code for the modules is in the kernel tree so I'm not sure
that quote is correct (the file claims not to have been changed since
feb 2002).


So, I setup the following options in .config. These are based on the
netfilter tutorial:

CONFIG_PACKET=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_DEBUG is not set
CONFIG_FILTER=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_MULTIPLE_TABLES is not set
# CONFIG_IP_ROUTE_MULTIPATH is not set
# CONFIG_IP_ROUTE_TOS is not set
# CONFIG_IP_ROUTE_VERBOSE is not set
# CONFIG_IP_ROUTE_LARGE_TABLES is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_IP_PNP_BOOTP=y
CONFIG_IP_PNP_RARP=y
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set

#
#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_QUEUE=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_ARPTABLES=y
CONFIG_IP_NF_FTP=y
CONFIG_IP_NF_IRC=y
CONFIG_IP_NF_FILTER=y
CONFIG_IP_NF_NAT=y
CONFIG_IP_NF_MATCH_STATE=y
CONFIG_IP_NF_TARGET_LOG=y
CONFIG_IP_NF_MATCH_LIMIT=y
CONFIG_IP_NF_TARGET_MASQUERADE=y



But when I "make bzImage" I get a very clear compilation error:



  gcc -D__KERNEL__ -I/usr/src/linux-2.4.21/include -Wall 
      -Wstrict-prototypes -Wno-trigraphs -O2 
      -fno-strict-aliasing -fno-common -fomit-frame-pointer 
      -pipe -mpreferred-stack-boundary=2 -march=k6   -nostdinc 
      -iwithprefix include -DKBUILD_BASENAME=ip_nat_standalone  
      -DEXPORT_SYMTAB -c ip_nat_standalone.c
  ip_nat_standalone.c: In function `call_expect':
  ip_nat_standalone.c:58: error: structure has no member named `nat'
  ip_nat_standalone.c: In function `ip_nat_fn':
  ip_nat_standalone.c:112: error: structure has no member named `nat'
  ip_nat_standalone.c:122: error: structure has no member named `nat'
  ip_nat_standalone.c:123: error: structure has no member named `nat'
  ip_nat_standalone.c:159: error: structure has no member named `nat'
  ip_nat_standalone.c: In function `ip_nat_out':
  ip_nat_standalone.c:175: warning: comparison between signed and unsigned
  ip_nat_standalone.c: In function `ip_nat_local_fn':
  ip_nat_standalone.c:210: warning: comparison between signed and unsigned

This is spot on, the code is clearly wrong.


What's going on? 

Can someone tell me How I am supposed to build netfilter modules?


-- 
Nic Ferrier
http://www.tapsellferrier.co.uk


