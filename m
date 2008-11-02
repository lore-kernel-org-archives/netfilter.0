From: "Luigi Iotti" <luigi@iotti.biz>
Subject: Backporting TCPOPTSTRIP to 2.6.18
Date: Sun, 2 Nov 2008 17:32:40 +0100
Message-ID: <64853789CEFD4C26B4BA8F1C823511AA@iotti.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

I need to backport the TCPOPTSTRIP module introduced in linux-2.6.25 to the
Red Hat/CentOS kernel and iptables, which are respectively 2.6.18 and 1.3.5.
I have no particular experience in this topic, but looking at how other
modules evolved from 2.6.18 to 2.6.25 I produced a patch which seems
working, at least at first glance.
I would like if someone could review my patch before using it in some
production system.

For the kernel part, here is the diff. You can view the whole files, and
these patches, in http://repo.iotti.biz/TCPOPTSTRIP/

--- 2.6.25/xt_TCPOPTSTRIP.c     2008-11-02 17:11:02.000000000 +0100
+++ 2.6.18/xt_TCPOPTSTRIP.c     2008-11-02 17:11:57.000000000 +0100
@@ -29,8 +29,16 @@
                return opt[offset+1];
 }
 
+static u_int16_t
+cheat_check(u_int32_t oldvalinv, u_int32_t newval, u_int16_t oldcheck)
+{
+       u_int32_t diffs[] = { oldvalinv, newval };
+       return csum_fold(csum_partial((char *)diffs, sizeof(diffs),
+                                       oldcheck^0xFFFF));
+}
+
 static unsigned int
-tcpoptstrip_mangle_packet(struct sk_buff *skb,
+tcpoptstrip_mangle_packet(struct sk_buff **pskb,
                          const struct xt_tcpoptstrip_target_info *info,
                          unsigned int tcphoff, unsigned int minlen)
 {
@@ -39,20 +47,20 @@
        u_int16_t n, o;
        u_int8_t *opt;
 
-       if (!skb_make_writable(skb, skb->len))
+       if (!skb_make_writable(pskb, (*pskb)->len))
                return NF_DROP;
 
-       tcph = (struct tcphdr *)(skb_network_header(skb) + tcphoff);
+       tcph = (struct tcphdr *)(skb_network_header(*pskb) + tcphoff);
        opt  = (u_int8_t *)tcph;
 
        /*
         * Walk through all TCP options - if we find some option to remove,
         * set all octets to %TCPOPT_NOP and adjust checksum.
         */
-       for (i = sizeof(struct tcphdr); i < tcp_hdrlen(skb); i += optl) {
+       for (i = sizeof(struct tcphdr); i < tcp_hdrlen(*pskb); i += optl) {
                optl = optlen(opt, i);
 
-               if (i + optl > tcp_hdrlen(skb))
+               if (i + optl > tcp_hdrlen(*pskb))
                        break;
 
                if (!tcpoptstrip_test_bit(info->strip_bmap, opt[i]))
@@ -65,8 +73,9 @@
                                o <<= 8;
                                n <<= 8;
                        }
-                       inet_proto_csum_replace2(&tcph->check, skb,
htons(o),
-                                                htons(n), 0);
+                       tcph->check = cheat_check(htons(o)^0xFFFF,
+                                               htons(n),
+                                               tcph->check);
                }
                memset(opt + i, TCPOPT_NOP, optl);
        }
@@ -75,36 +84,35 @@
 }
 
 static unsigned int
-tcpoptstrip_tg4(struct sk_buff *skb, const struct net_device *in,
+tcpoptstrip_tg4(struct sk_buff **pskb, const struct net_device *in,
                const struct net_device *out, unsigned int hooknum,
-               const struct xt_target *target, const void *targinfo)
+               const struct xt_target *target, const void *targinfo, void
*userinfo)
 {
-       return tcpoptstrip_mangle_packet(skb, targinfo, ip_hdrlen(skb),
+       return tcpoptstrip_mangle_packet(pskb, targinfo, ip_hdrlen(*pskb),
               sizeof(struct iphdr) + sizeof(struct tcphdr));
 }
 
 #if defined(CONFIG_IP6_NF_MANGLE) || defined(CONFIG_IP6_NF_MANGLE_MODULE)
 static unsigned int
-tcpoptstrip_tg6(struct sk_buff *skb, const struct net_device *in,
+tcpoptstrip_tg6(struct sk_buff **pskb, const struct net_device *in,
                const struct net_device *out, unsigned int hooknum,
-               const struct xt_target *target, const void *targinfo)
+               const struct xt_target *target, const void *targinfo, void
*userinfo)
 {
-       struct ipv6hdr *ipv6h = ipv6_hdr(skb);
+       struct ipv6hdr *ipv6h = ipv6_hdr(*pskb);
        unsigned int tcphoff;
        u_int8_t nexthdr;
 
        nexthdr = ipv6h->nexthdr;
-       tcphoff = ipv6_skip_exthdr(skb, sizeof(*ipv6h), &nexthdr);
+       tcphoff = ipv6_skip_exthdr(*pskb, sizeof(*ipv6h), &nexthdr);
        if (tcphoff < 0)
                return NF_DROP;
 
-       return tcpoptstrip_mangle_packet(skb, targinfo, tcphoff,
+       return tcpoptstrip_mangle_packet(pskb, targinfo, tcphoff,
               sizeof(*ipv6h) + sizeof(struct tcphdr));
 }
 #endif
 
-static struct xt_target tcpoptstrip_tg_reg[] __read_mostly = {
-       {
+static struct xt_target tcpoptstrip_tg4_reg = {
                .name       = "TCPOPTSTRIP",
                .family     = AF_INET,
                .table      = "mangle",
@@ -112,9 +120,9 @@
                .target     = tcpoptstrip_tg4,
                .targetsize = sizeof(struct xt_tcpoptstrip_target_info),
                .me         = THIS_MODULE,
-       },
+       };
 #if defined(CONFIG_IP6_NF_MANGLE) || defined(CONFIG_IP6_NF_MANGLE_MODULE)
-       {
+static struct xt_target tcpoptstrip_tg6_reg = {
                .name       = "TCPOPTSTRIP",
                .family     = AF_INET6,
                .table      = "mangle",
@@ -122,20 +130,29 @@
                .target     = tcpoptstrip_tg6,
                .targetsize = sizeof(struct xt_tcpoptstrip_target_info),
                .me         = THIS_MODULE,
-       },
+       };
 #endif
-};
 
 static int __init tcpoptstrip_tg_init(void)
 {
-       return xt_register_targets(tcpoptstrip_tg_reg,
-                                  ARRAY_SIZE(tcpoptstrip_tg_reg));
+       int ret;
+       ret = xt_register_target(&tcpoptstrip_tg4_reg);
+#if defined(CONFIG_IP6_NF_MANGLE) || defined(CONFIG_IP6_NF_MANGLE_MODULE)
+       if (ret) {
+               xt_unregister_target(&tcpoptstrip_tg4_reg);
+               return ret;
+       }
+       ret = xt_register_target(&tcpoptstrip_tg6_reg);
+#endif
+       return ret;
 }
 
 static void __exit tcpoptstrip_tg_exit(void)
 {
-       xt_unregister_targets(tcpoptstrip_tg_reg,
-                             ARRAY_SIZE(tcpoptstrip_tg_reg));
+       xt_unregister_target(&tcpoptstrip_tg4_reg);
+#if defined(CONFIG_IP6_NF_MANGLE) || defined(CONFIG_IP6_NF_MANGLE_MODULE)
+       xt_unregister_target(&tcpoptstrip_tg6_reg);
+#endif
 }
 
 module_init(tcpoptstrip_tg_init);


For the userspace part, I split the original libxt_TCPOPTSTRIP.c into two
files, one for ipv4 and the other for ipv6. Here I show the patch from the
original file to the ipv4 part, since the ipv6 is very similar. Anyway, it
can be found in the link reported above.

--- 1.4.1/libxt_TCPOPTSTRIP.c   2008-06-10 08:15:20.000000000 +0200
+++ 1.3.5/libipt_TCPOPTSTRIP.c  2008-11-02 17:11:23.000000000 +0100
@@ -9,8 +9,8 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
-#include <xtables.h>
-#include <linux/netfilter/x_tables.h>
+#include <iptables.h>
+#include <linux/netfilter_ipv4/ip_tables.h>
 #include <linux/netfilter/xt_TCPOPTSTRIP.h>
 #ifndef TCPOPT_MD5SIG
 #      define TCPOPT_MD5SIG 19
@@ -25,7 +25,7 @@
        const unsigned int option;
 };
 
-static const struct option tcpoptstrip_tg_opts[] = {
+static struct option tcpoptstrip_tg_opts[] = {
        {.name = "strip-options", .has_arg = true, .val = 's'},
        { .name = NULL }
 };
@@ -55,7 +55,7 @@
                printf("    %-14s    strip \"%s\" option\n", w->name,
w->desc);
 }
 
-static void tcpoptstrip_tg_init(struct xt_entry_target *t)
+static void tcpoptstrip_tg_init(struct ipt_entry_target *t, unsigned int
*nfcache)
 {
        struct xt_tcpoptstrip_target_info *info = (void *)t->data;
 
@@ -101,8 +101,8 @@
 }
 
 static int tcpoptstrip_tg_parse(int c, char **argv, int invert,
-                                unsigned int *flags, const void *entry,
-                                struct xt_entry_target **target)
+                                unsigned int *flags, const struct ipt_entry
*entry,
+                                struct ipt_entry_target **target)
 {
        struct xt_tcpoptstrip_target_info *info = (void *)(*target)->data;
 
@@ -155,7 +155,7 @@
 }
 
 static void
-tcpoptstrip_tg_print(const void *ip, const struct xt_entry_target *target,
+tcpoptstrip_tg_print(const struct ipt_ip *ip, const struct ipt_entry_target
*target,
                      int numeric)
 {
        const struct xt_tcpoptstrip_target_info *info =
@@ -166,7 +166,7 @@
 }
 
 static void
-tcpoptstrip_tg_save(const void *ip, const struct xt_entry_target *target)
+tcpoptstrip_tg_save(const struct ipt_ip *ip, const struct ipt_entry_target
*target)
 {
        const struct xt_tcpoptstrip_target_info *info =
                (const void *)target->data;
@@ -175,38 +175,21 @@
        tcpoptstrip_print_list(info, true);
 }
 
-static struct xtables_target tcpoptstrip_tg_reg = {
-       .version       = XTABLES_VERSION,
+static struct iptables_target tcpoptstrip_tg_reg = {
+       .version       = IPTABLES_VERSION,
        .name          = "TCPOPTSTRIP",
-       .family        = AF_INET,
-       .size          = XT_ALIGN(sizeof(struct
xt_tcpoptstrip_target_info)),
-       .userspacesize = XT_ALIGN(sizeof(struct
xt_tcpoptstrip_target_info)),
-       .help          = tcpoptstrip_tg_help,
-       .init          = tcpoptstrip_tg_init,
-       .parse         = tcpoptstrip_tg_parse,
-       .final_check   = tcpoptstrip_tg_check,
-       .print         = tcpoptstrip_tg_print,
-       .save          = tcpoptstrip_tg_save,
+       .size          = IPT_ALIGN(sizeof(struct
xt_tcpoptstrip_target_info)),
+       .userspacesize = IPT_ALIGN(sizeof(struct
xt_tcpoptstrip_target_info)),
+       .help          = &tcpoptstrip_tg_help,
+       .init          = &tcpoptstrip_tg_init,
+       .parse         = &tcpoptstrip_tg_parse,
+       .final_check   = &tcpoptstrip_tg_check,
+       .print         = &tcpoptstrip_tg_print,
+       .save          = &tcpoptstrip_tg_save,
        .extra_opts    = tcpoptstrip_tg_opts,
 };
 
-static struct xtables_target tcpoptstrip_tg6_reg = {
-       .version       = XTABLES_VERSION,
-       .name          = "TCPOPTSTRIP",
-       .family        = AF_INET6,
-       .size          = XT_ALIGN(sizeof(struct
xt_tcpoptstrip_target_info)),
-       .userspacesize = XT_ALIGN(sizeof(struct
xt_tcpoptstrip_target_info)),
-       .help          = tcpoptstrip_tg_help,
-       .init          = tcpoptstrip_tg_init,
-       .parse         = tcpoptstrip_tg_parse,
-       .final_check   = tcpoptstrip_tg_check,
-       .print         = tcpoptstrip_tg_print,
-       .save          = tcpoptstrip_tg_save,
-       .extra_opts    = tcpoptstrip_tg_opts,
-};
-
-void _init(void)
+void __attribute((constructor)) my_init(void)
 {
-       xtables_register_target(&tcpoptstrip_tg_reg);
-       xtables_register_target(&tcpoptstrip_tg6_reg);
+       register_target(&tcpoptstrip_tg_reg);
 }


Thank you
Luigi Iotti

