From: Aras Vaichas <arasv@magellan-technology.com>
Subject: getsockopt failed strangely: No such file or directory
Date: Sat, 13 May 2006 20:09:33 +1000
Message-ID: <4465B05D.6030009@magellan-technology.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi,

I'm cross-compiling a static version of iptables-1.3.5 for ARM, Linux 2.6.16.

The only change I made to the distribution was to uncomment the line in Makefile:
NO_SHARED_LIBS = 1

and I export my CC, LD and AR for cross-compiling before I call make.

When I run the binary on my target I get this strange error:

# iptables
getsockopt failed strangely: No such file or directory

I looked in the source code and I'm not sure why this is happening in this part.

I keep suspecting that maybe my kernel isn't configured correctly, but I've 
configured the basics:

CONFIG_PACKET=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=y
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_CONNTRACK_NETLINK=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_MATCH_IPRANGE=y
CONFIG_IP_NF_MATCH_MULTIPORT=y
CONFIG_IP_NF_MATCH_ADDRTYPE=y
CONFIG_IP_NF_FILTER=y
CONFIG_IP_NF_RAW=y

Any ideas?

The funny thing is, initially I didn't set the NO_SHARED_LIBS flag and iptables 
  started up and gave me help, etc. But when I tried to set up a chain, it 
would complain about no static libraries (as I would expect). Strange why it 
doesn't work in NO_SHARED_LIBS mode.

I tried commenting out the exit() call from the offending line in iptables.c 
and iptables seems to work OK. e.g.

--- iptables.c.orig     2006-05-13 19:41:49.000000000 +1000
+++ iptables.c  2006-05-13 19:42:16.000000000 +1000
@@ -1084,7 +1084,8 @@
                 } else {
                         fprintf(stderr, "getsockopt failed strangely: %s\n",
                                 strerror(errno));
-                       exit(1);
+                               return (0);
                 }
         }
         close(sockfd);

regards,

Aras Vaichas

