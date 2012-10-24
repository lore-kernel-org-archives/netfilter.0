From: JieYue Ma <xiaoma80.dev@gmail.com>
Subject: Re: Ebtables NFQUEUE Support
Date: Wed, 24 Oct 2012 13:16:57 +0800
Message-ID: <CAJ6iH_hB9WYyAuC7OmmkDbfm9YxqZ4hMO02xuSh75tEdiXqk_w@mail.gmail.com>
References: <37777.70.67.211.174.1350671579.squirrel@webmail.hs-esslingen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=c+iUVlxVqpusU8zNM4PK0J2Sw6rcCPRiHz0ynRkB3UQ=;
        b=f6l0nHS4iUNwvZ4jLRNb/pHQP63uDnrZzjAfR6ySqT5JNaQP7Cb9Q35krZ69N7cJcS
         LV8djQJiylcOp/jwgNfT7MJvrG7loG7vhaGTCA7Iq7vYTBkUn8GyLuLVVxDEyKOdtg+k
         vhu3HSuw2feWmuNbXitkafpwrpUucSDu6jTJEaQhk4NOWwSTHIbS1Gt06RDSlC991XQe
         cqFspKcflqZ3+d0Y2NrtEUT7m6W29ESxdCNjG3Ztbyr5FLslxUxCOY3cJmJrYHGOpsSB
         +2iDLoOszGnE5vgDdIY2HmOzz2excvCfcYeMD7i+/RFH+HwQPy8DlamLux1beYo9eOLD
         9TOA==
In-Reply-To: <37777.70.67.211.174.1350671579.squirrel@webmail.hs-esslingen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: B.Beckmeyer@stud.hs-esslingen.de
Cc: netfilter@vger.kernel.org

Well, I wrote the nfqueue patch for both ebtables and arptables a few
months ago, it did work well, so I think it is appropriate to release
these patches. Hope it will help you.

I am not sure if I understand the problem you raised correctly. I
guess it might be the netfilter sus-subsystem currently not supporting
queue verdict for bridge very well. As you can see, you need a
nf_afinfo structure to be registered before using netfilter queue
verdict for this protocol. Unfortunately, during initialization of
netfilter, it did register such nf_afinfo for ipv4, ipv6, maybe arp as
well.. but not for bridge. So in order to enable queue verdict to work
under bridge, you need to register it by yourself, maybe during
initialization of ebtables nfqueue target module

here is my patch for ebtables:


diff -upNr old/include/linux/netfilter_bridge/ebt_nfqueue.h
new/include/linux/netfilter_bridge/ebt_nfqueue.h
--- old/include/linux/netfilter_bridge/ebt_nfqueue.h    1969-12-31
19:00:00.000000000 -0500
+++ new/include/linux/netfilter_bridge/ebt_nfqueue.h    2012-05-29
23:59:06.940194206 -0400
@@ -0,0 +1,10 @@
+#ifndef __LINUX_BRIDGE_EBT_NFQUEUE_H
+#define __LINUX_BRIDGE_EBT_NFQUEUE_H
+#include <linux/types.h>
+
+struct xt_NFQ_info {
+        __u16 queuenum;
+        int target;
+};
+
+#endif
diff -upNr old/net/bridge/netfilter/ebtables.c
new/net/bridge/netfilter/ebtables.c
--- old/net/bridge/netfilter/ebtables.c 2012-05-27 08:48:00.095617214 -0400
+++ new/net/bridge/netfilter/ebtables.c 2012-05-27 08:57:27.644193954 -0400
@@ -252,6 +252,17 @@ letsreturn:
            return NF_DROP;
        }
 #endif
+       /*
+        * We add NFQUEUE support in ebtables here:
+        *
+        * If verdict is NF_QUEUE type, pass it to Netfilter. Netfilter will
+        * call nf_queue to handle this.
+        */
+       if (verdict > 0 && (verdict & NF_VERDICT_MASK) == NF_QUEUE) {
+           read_unlock_bh(&table->lock);
+           return verdict;
+       }
+
        /* jump to a udc */
        cs[sp].n = i + 1;
        cs[sp].chaininfo = chaininfo;

diff -upNr old/net/bridge/netfilter/ebt_nfqueue.c
new/net/bridge/netfilter/ebt_nfqueue.c
--- old/net/bridge/netfilter/ebt_nfqueue.c  1969-12-31 19:00:00.000000000 -0500
+++ new/net/bridge/netfilter/ebt_nfqueue.c  2012-05-27 08:58:58.511193378 -0400
@@ -0,0 +1,117 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/skbuff.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/netfilter.h>
+#include <linux/netfilter/x_tables.h>
+#include <linux/netfilter_bridge/ebtables.h>
+#include <linux/netfilter_bridge/ebt_nfqueue.h>
+
+MODULE_AUTHOR("alibaba");
+MODULE_DESCRIPTION("ebtables: forwarding to netlink");
+MODULE_LICENSE("GPL");
+
+static unsigned int ebt_nfqueue_tg(struct sk_buff *skb, const struct
xt_target_param *par) {
+   const struct xt_NFQ_info *info = par->targinfo;
+
+   return NF_QUEUE_NR(info->queuenum);
+}
+
+static bool ebt_nfqueue_tg_check(const struct xt_tgchk_param* par) {
+   const struct xt_NFQ_info *info = par->targinfo;
+
+   if (BASE_CHAIN && info->target == EBT_RETURN) {
+       printk(KERN_INFO"ebt_nfqueue: ebt_nfqueue_tg_check failed\n");
+       return false;
+   }
+
+   return true;
+}
+
+void dummy_from_user(void *dst, void *src) {
+}
+
+int dummy_to_user(void __user *dst, void *src) {
+   return 0;
+}
+
+static struct xt_target nfqueue_tg_reg __read_mostly = {
+   .name           = "nfqueue",
+   .revision   = 0,
+   .family     = NFPROTO_BRIDGE,
+   .table      = "filter",
+   .hooks      = (1 << NF_BR_NUMHOOKS) | (1 << NF_BR_LOCAL_IN) | (1
<< NF_BR_LOCAL_OUT) | (1 << NF_BR_FORWARD),
+        .target         = ebt_nfqueue_tg,
+        .checkentry     = ebt_nfqueue_tg_check,
+        .targetsize     = XT_ALIGN(sizeof(struct xt_NFQ_info)),
+   .compat_from_user = dummy_from_user,
+   .compat_to_user = dummy_to_user,
+        .me             = THIS_MODULE,
+};
+
+
+__sum16 nf_br_checksum(struct sk_buff* skb, unsigned int hook,
unsigned int dataoff, u_int8_t protocol) {
+   return 0;
+}
+
+static __sum16 nf_br_checksum_partial(struct sk_buff* skb, unsigned int hook,
+       unsigned int dataoff, unsigned int len,
+       u_int8_t protocol) {
+   return 0;
+}
+
+static int nf_br_route(struct dst_entry **dst, struct flowi *fl) {
+   return 0;
+}
+
+static void nf_br_saveroute(const struct sk_buff *skb, struct
nf_queue_entry *entry) {
+
+}
+
+static int nf_br_reroute(struct sk_buff *skb, const struct
nf_queue_entry *entry) {
+   return 0;
+}
+
+static const struct nf_afinfo nf_br_afinfo = {
+   .family     = NFPROTO_BRIDGE,
+   .checksum   = nf_br_checksum,
+   .checksum_partial = nf_br_checksum_partial,
+   .route      = nf_br_route,
+   .saveroute  = nf_br_saveroute,
+   .reroute    = nf_br_reroute,
+   .route_key_size = 0,
+};
+
+
+static int __init nfqueue_tg_init(void)
+{
+   int ret;
+   /*
+    * a tricky hack here, we forge a bridge nf_afinfo struct and register it
+    *
+    * We have to do this, coz currently netfilter subsystem doesn't
support bridge in nf_queue
+    */
+   ret = nf_register_afinfo(&nf_br_afinfo);
+   if (ret < 0) {
+       printk("[ebt_nfqueue] nf_register_afinfo failed, cannot
install ebt_nfqueue.ko\n");
+       return ret;
+   }
+
+   return xt_register_target(&nfqueue_tg_reg);
+}
+
+static void __exit nfqueue_tg_exit(void)
+{
+   nf_unregister_afinfo(&nf_br_afinfo);
+   xt_unregister_target(&nfqueue_tg_reg);
+}
+
+module_init(nfqueue_tg_init);
+module_exit(nfqueue_tg_exit);




On Sat, Oct 20, 2012 at 2:32 AM, Benjamin Beckmeyer
<B.Beckmeyer@stud.hs-esslingen.de> wrote:
> Hi all,
>
> I am trying to build an Ebtables NFQUEUE module to also move layer 2
> traffic to the NFQUEUE system provided by IPtables.  A few years ago a
> Pierre Chifflier provided 3 patches to Ebtables that appear to try and
> utilize the NFQUEUE xt_tables target within Ebtables to pass the layer 2
> data via nfnetlink_queue.
>
> Some background, I am trying to get this working on 2.6.26.5 kernel
> version and have applied the patches listed here:
>
> http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.devel/37859
> http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.devel/37862
>
> I have also patched the Ebtables (2.0.8) userspace utility to produce the
> shared object ebt_NFQUEUE.so with code also from Pierre, which can be
> found here:
>
> https://www.wzdftpd.net/downloads/ebt_NFQUEUE.c
>
> To get the patches to work for the ebt_nfqueue kernel object, due to an
> older kernel, I had to modify the target and check function arguments as
> the "const struct xt_action_param" does not exist in my kernel version:
>
> static int ebt_nfqueue_tg(const struct sk_buff *skb, const struct
> net_device *in,
>                                    const struct net_device *out, const void *data, unsigned int datalen)
> {
>     const struct ebt_nfqueue_info *info = data;
>     struct nf_loginfo li;
>     unsigned int verdict = NF_ACCEPT;
>
>     printk(KERN_NOTICE "ebt_NFQUEUE: returning EBT_QUEUE\n");
>     return EBT_QUEUE; // return -5
> }
>
> static struct ebt_target ebt_nfqueue __read_mostly = {
>     .name               = "NFQUEUE",
>     .target     = ebt_nfqueue_tg,
>     .check = ebt_nfqueue_check,
>     .me                 = THIS_MODULE,
> };
>
> +++++ VERSUS +++++
>
> static struct xt_target ebt_xt_nfqueue __read_mostly = {
>     .name               = "NFQUEUE",
>     .revision   = 0,
>     .family     = 7, // NFPROTO_BRIDGE
>     .target     = ebt_nfqueue_tg,
>     .checkentry = ebt_nfqueue_check,
>     .targetsize = sizeof(struct ebt_nfqueue_info),
>     .me                 = THIS_MODULE,
> };
>
> Nevertheless, the return value from this target is just the EBT_QUEUE (-5)
> to inform the Netfilter system of the queue number.  If I use the
> ebt_target rather than xt_target the kernel module will build and can be
> inserted into ebtables with no errors - the problem is that queuing does
> not work.  If I use the xt_target rather than the ebt_target then Ebtables
> userspace complains that it is not supported from this kernel version
> (error in communication.c in userspace and appears to fail on the
> "setsockopt" calls).
>
> I have printed out the entire contents of using the xt_target vs
> ebt_target and all data going into this call is identical, which boggles
> my mind as to why xt_target will trigger the error in the ebtables
> userspace program and ebt_target will not.
>
> I think that I MUST use the xt_target within ebtables to properly pass
> this data to the NFQUEUE system.  This comes from an earlier discussion:
>
> +++
>
> On 04.02.2011 14:40, Pierre Chifflier wrote:
>> On 02/04/2011 02:25 PM, Patrick McHardy wrote:
>>> On 03.02.2011 15:32, Pierre Chifflier wrote:
>>>> This adds support for sending bridge packets to userspace using
>>>> the NFQUEUE target with ebtables.
>>>
>>> I don't think we need a new target for this (and the EBT_QUEUE
>>> definition), just using xt_NFQUEUE should work fine.
>>
>> I thought ebtables did not support sending packet to xtables ? (that's
>> on the TODO list for ebtables).
>
> It can use xtables targets and matches if I'm not completely
> mistaken.
>
> +++
>
> It appears I can 'use' xtables targets, it will compile correctly, but
> ebtables will not actually allow me to insert the rules to jump to the
> NFQUEUE target, so I am unable to actually verify if packets would be
> queue'd by the system.
>
> When using the ebt_target I can insert my NFQUEUE rules into the nat
> PREROUTING table, and the packet counter will actually increment on layer
> 2 traffic, but the packets do not appear to actually hit any of the
> nfnetlink_queue functions (I have added a printk to every function). I
> even see that my target has been hit via a printk:
>
> user.notice kernel: ebt_NFQUEUE: returning EBT_QUEUE
>
> But then it appears that is as far as the packet goes.
>
> When queueing a packet from IPtables I see a huge amount of output:
>
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> __enqueue_entry
> user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_rcv
> user.notice kernel: BB: File: nfnetlink.c      Function: nfnl_lock
> user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_rcv_msg
> user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_get_subsys
> user.notice kernel: BB: File: nfnetlink.c      Function:
> nfnetlink_find_client
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> nfqnl_recv_verdict
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> instance_lookup
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> find_dequeue_entry
> user.notice kernel: BB: File: nfnetlink.c      Function: nfnl_unlock
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> nfqnl_enqueue_packet
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> instance_lookup
> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
> nfqnl_build_packet_message
> user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_unicast
>
> But from my ebtables -j NFQUEUE there are no calls to the nfnetlink.c or
> nfnetlink_queue.c functions.  It is almost like the target is hit then the
> packet is just mysteriously gone...or hits other functions unrelated to
> the queueing system.
>
> In summation, the problem is if using the ebt_target struct in the kernel
> module for ebtables, it will be inserted and can be utilized by the
> userspace Ebtables - but it doesnt appear to pass the packet to the
> IPtables nfqueue correctly.  If using the xt_target struct in the kernel
> module for ebtables, it will compile, but fails to be utilized by Ebtables
> userspace due to a "setsockopt error mentioned above.
>
> Any help or suggestions are greatly appreciated!
>
> Thank you, Benny
>
>
>
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
