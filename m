From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Match DF ( =?ISO-8859-1?Q?Don=B4t_Fragment=29_bit?=
Date: Fri, 25 Apr 2003 22:00:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA993E1.8030400@rtij.nl>
References: <OF0AE04567.652B900B-ONC1256D11.0042E920@guardianit.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_ma.rtij.nl-5320-1051300855-0001-2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF0AE04567.652B900B-ONC1256D11.0042E920@guardianit.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Mathias Sundman <Mathias.Sundman@sungard.se>
Cc: netfilter@lists.netfilter.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_ma.rtij.nl-5320-1051300855-0001-2
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mime-Autoconverted: from 8bit to quoted-printable by courier 0.40.2

Mathias Sundman wrote:

>I=B4m using vtun to create an encrypted ethernet bridge.
>
>My setup is like this:
>LocalNet1 - BRIDGE1 - Internet - BRIDGE2 - LocalNet2
>
>where BRIDGE1 and BRIDGE2 is linux mashines that bridge
>between one physical interface and a tap device created
>by vtun.
>
>This works great, however there is a problem with the MTU.
>
>If a mashine on LocalNet1 sends full size packets (1500b)
>to a mashine on LocalNet2, it will exceed 1500 bytes
>when it=B4s encrypted and sent over the internet. These packets
>will then be fragmented. This is fine as long as the fragments
>gets through...
>
>However, this is not always the case. Therefor I=B4ve tried to
>find a way to make the mashines understand that they can=B4t
>use that big packets when talking to mashines on the other side
>of the bridge.
>
>So I made a quick hack in netfilter/iptables which enabled me
>to return ICMP "dest-unreachable, fragementation needed but
>DF flag set" packets when a to large packet arrives.
>
>That seemed to do the trick, but I=B4d like to do this only if the
>original packet had the DF flag set, so my question is, is it
>possible to check whether the DF flag is set or not?
>
>  
>

This patch should do the trick, but the u32 patch can also be used.

HTH,
M4


--=_ma.rtij.nl-5320-1051300855-0001-2
Content-Type: text/plain; name="dontfrag.patch"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dontfrag.patch"

--- linux-2.4.19/net/ipv4/netfilter/ipt_dontfrag.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.4.19.dontfrag/net/ipv4/netfilter/ipt_dontfrag.c	2003-04-02 21:52:49.000000000 +0200
@@ -0,0 +1,61 @@
+/*
+  This is a module which is used to match the ipv4 DF bit.
+  This file is distributed under the terms of the GNU General Public
+  License (GPL). Copies of the GPL can be obtained from:
+  ftp://prep.ai.mit.edu/pub/gnu/GPL
+
+  01 apr 2003 Martijn Lievaart <m@rtij.nl> : No joke, initial development
+*/
+
+#include <linux/module.h>
+#include <linux/skbuff.h>
+#include <net/ip.h>
+
+#include <linux/netfilter_ipv4/ip_tables.h>
+
+MODULE_AUTHOR("Martijn Lievaart <m@rtij.nl>");
+MODULE_DESCRIPTION("IP tables dont-frag bit matching module ");
+MODULE_LICENSE("GPL");
+
+static int
+match(const struct sk_buff *skb,
+      const struct net_device *in,
+      const struct net_device *out,
+      const void *matchinfo,
+      int offset,
+      const void *hdr,
+      u_int16_t datalen,
+      int *hotdrop)
+{
+	const struct iphdr *iph = skb->nh.iph;
+        const __u16 frag_off = __constant_htons(iph->frag_off);
+	return (frag_off & IP_DF) != 0;
+}
+
+static int
+checkentry(const char *tablename,
+	   const struct ipt_ip *ip,
+	   void *matchinfo,
+	   unsigned int matchsize,
+	   unsigned int hook_mask)
+{
+	return 1;
+}
+
+static struct ipt_match dontfrag_match
+= { { NULL, NULL }, "dontfrag", &match, &checkentry, NULL, THIS_MODULE };
+
+static int __init init(void)
+{
+/* 	printk("ipt_dontfrag loading\n"); */
+	return ipt_register_match(&dontfrag_match);
+}
+
+static void __exit fini(void)
+{
+	ipt_unregister_match(&dontfrag_match);
+/* 	printk("ipt_dontfrag unloaded\n"); */
+}
+
+module_init(init);
+module_exit(fini);

--=_ma.rtij.nl-5320-1051300855-0001-2
Content-Type: text/plain; name="dontfrag.patch.config.in"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dontfrag.patch.config.in"

  dep_tristate '  TOS match support' CONFIG_IP_NF_MATCH_TOS $CONFIG_IP_NF_IPTABLES
  dep_tristate '  dontfrag match support' CONFIG_IP_NF_MATCH_DONTFRAG $CONFIG_IP_NF_IPTABLES

--=_ma.rtij.nl-5320-1051300855-0001-2
Content-Type: text/plain; name="dontfrag.patch.help"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dontfrag.patch.help"

Author: Martijn Lievaart <m@rtij.nl>
Status: ItWorksForMe(tm)

This patch adds CONFIG_IP_NF_MATCH_DONTFRAG which allows you to match
the ipv4 DF bit. This is useful with the FRAGNEEDED target to
investigate pmtud problems or to force pmtud when other parts of the
network don't NAT the icmp-fragmentation-needed messages correctly.

You probably want to use the length patch as well.

Example:
iptables -A INPUT -d x.x.x.x -m dontfrag -m length --length 1401: -j FRAGNEEDED --mtu 1400

--=_ma.rtij.nl-5320-1051300855-0001-2
Content-Type: text/plain; name="dontfrag.patch.makefile"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dontfrag.patch.makefile"

obj-$(CONFIG_IP_NF_MATCH_TOS) += ipt_tos.o
obj-$(CONFIG_IP_NF_MATCH_DONTFRAG) += ipt_dontfrag.o


--=_ma.rtij.nl-5320-1051300855-0001-2--

