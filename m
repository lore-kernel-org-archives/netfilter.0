From: "Benjamin Beckmeyer" <B.Beckmeyer@stud.hs-esslingen.de>
Subject: Re: Ebtables NFQUEUE Support
Date: Thu, 25 Oct 2012 01:39:52 +0200
Message-ID: <1bb094409be71ee7824b1cf5ff72a736.squirrel@webmail.hs-esslingen.de>
References: <37777.70.67.211.174.1350671579.squirrel@webmail.hs-esslingen.de>
    <CAJ6iH_hB9WYyAuC7OmmkDbfm9YxqZ4hMO02xuSh75tEdiXqk_w@mail.gmail.com>
    <CAJ6iH_gfXbxMK504OJHEGYXne96oRDjULfjdPkfyStgkKnxFdg@mail.gmail.com>
Reply-To: B.Beckmeyer@stud.hs-esslingen.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ6iH_gfXbxMK504OJHEGYXne96oRDjULfjdPkfyStgkKnxFdg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JieYue Ma <xiaoma80.dev@gmail.com>
Cc: b.beckmeyer@stud.hs-esslingen.de, netfilter@vger.kernel.org

Thank you JieYue Ma!

This is excellent.  Out of curiousity which kernel version and ebtables
version were you working against?

Benny

> I forgot the ebtables command patch, here it is..
>
> diff -upNr old/extensions/ebt_nfqueue.c new/extensions/ebt_nfqueue.c
> --- old/extensions/ebt_nfqueue.c    1970-01-01 08:00:00.000000000 +0800
> +++ new/extensions/ebt_nfqueue.c    2012-10-24 14:35:40.000000000 +0800
> @@ -0,0 +1,127 @@
> +/*
> + * Shared library add-on to ebtables for NFQ
> + *
> + * (C) 2012 by Ma Jie Yue <jieyue.majy@aliyun-inc.com>
> + *
> + * This program is distributed under the terms of GNU GPLv2, 1991
> + */
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <getopt.h>
> +#include <errno.h>
> +
> +#include "../include/ebtables_u.h"
> +#include <linux/netfilter/x_tables.h>
> +#include <linux/netfilter_bridge/ebt_nfqueue.h>
> +
> +#define NFQUEUE_QUEUENUM 0x1
> +#define NFQUEUE_QUEUEBALANCE 0x2
> +
> +static int string_to_number(const char *s, unsigned int min, unsigned
> int max, unsigned int *ret)
> +{
> +   long number;
> +   char *end;
> +   errno = 0;
> +   number = strtol(s, &end, 0);
> +
> +   if (*end == '\0' && end != s) {
> +       if (errno != ERANGE && min <= number && number <= max) {
> +           *ret = number;
> +           return 0;
> +       }
> +   }
> +   return -1;
> +}
> +
> +static void nfqueue_help(void)
> +{
> +   printf("NFQUEUE target options\n"
> +           "  --queue-num value       Send packet to QUEUE number
> <value>.\n"
> +           "                          Valid queue numbers are
> 0-65535\n");
> +}
> +
> +static void nfqueue_init(struct ebt_entry_target* target) {
> +   struct xt_NFQ_info* info = (struct xt_NFQ_info *)target->data;
> +
> +   info->queuenum = 0;
> +}
> +
> +static const struct option nfqueue_opts[] = {
> +   { "queue-num", 1, NULL, 'F' },
> +   { "queue-balance", 1, NULL, 'B' },
> +   { .name = NULL }
> +};
> +
> +static void parse_num(const char *s, struct xt_NFQ_info *tinfo)
> +{
> +   unsigned int num = 0;
> +   if (string_to_number(s, 0, 65535, &num) < 0) {
> +       ebt_print_error("Invalid queue number %s\n", s);
> +   }
> +
> +   tinfo->queuenum = num;
> +}
> +
> +static int nfqueue_parse(int c, char **argv, int argc,
> +       const struct ebt_u_entry *entry, unsigned int *flags,
> +       struct ebt_entry_target **target)
> +{
> +   struct xt_NFQ_info *tinfo = (struct xt_NFQ_info *)(*target)->data;
> +   tinfo->queuenum = 0;
> +
> +   switch (c) {
> +       case 'F':
> +           if (*flags)
> +               ebt_print_error2("NFQUEUE target: "
> +                               "Only use --queue-num ONCE!");
> +           *flags |= NFQUEUE_QUEUENUM;
> +           parse_num(optarg, tinfo);
> +           break;
> +
> +       case 'B':
> +           ebt_print_error2("NFQUEUE target: "
> +                           "--queue-balance not supported (kernel too
> old?)");
> +
> +       default:
> +           break;
> +   }
> +   return 1;
> +}
> +
> +static void nfqueue_print(const struct ebt_u_entry* entry, const
> struct ebt_entry_target *target) {
> +   struct xt_NFQ_info *tinfo = (struct xt_NFQ_info *)target->data;
> +
> +   printf("--queue-num %u ", tinfo->queuenum);
> +}
> +
> +static void nfqueue_check(const struct ebt_u_entry *entry,
> +               const struct ebt_entry_target *target, const char *name,
> +               unsigned int hookmask, unsigned int time) {
> +
> +}
> +
> +static int nfqueue_compare(const struct ebt_entry_target *t1, const
> struct ebt_entry_target *t2) {
> +   struct xt_NFQ_info *info1 = (struct xt_NFQ_info *)t1->data;
> +   struct xt_NFQ_info *info2 = (struct xt_NFQ_info *)t2->data;
> +
> +   return (info1->queuenum == info2->queuenum);
> +}
> +
> +static struct ebt_u_target nfqueue_target = {
> +   .name       = "nfqueue",
> +   .init       = nfqueue_init,
> +   .size       = sizeof(struct xt_NFQ_info),
> +   .help       = nfqueue_help,
> +   .parse      = nfqueue_parse,
> +   .print      = nfqueue_print,
> +   .final_check    = nfqueue_check,
> +   .compare    = nfqueue_compare,
> +   .extra_ops  = nfqueue_opts,
> +};
> +
> +void _init(void) {
> +   ebt_register_target(&nfqueue_target);
> +}
> +
> diff -upNr old/extensions/Makefile new/extensions/Makefile
> --- old/extensions/Makefile 2011-12-16 04:02:47.000000000 +0800
> +++ new/extensions/Makefile 2012-10-24 14:18:50.000000000 +0800
> @@ -1,7 +1,7 @@
>  #! /usr/bin/make
>
>  EXT_FUNC+=802_3 nat arp arpreply ip ip6 standard log redirect vlan
> mark_m mark \
> -          pkttype stp among limit ulog nflog
> +          pkttype stp among limit ulog nflog nfqueue
>  EXT_TABLES+=filter nat broute
>  EXT_OBJS+=$(foreach T,$(EXT_FUNC), extensions/ebt_$(T).o)
>  EXT_OBJS+=$(foreach T,$(EXT_TABLES), extensions/ebtable_$(T).o)
> diff -upNr old/include/linux/netfilter_bridge/ebt_nfqueue.h
> new/include/linux/netfilter_bridge/ebt_nfqueue.h
> --- old/include/linux/netfilter_bridge/ebt_nfqueue.h    1970-01-01
> 08:00:00.000000000 +0800
> +++ new/include/linux/netfilter_bridge/ebt_nfqueue.h    2012-10-24
> 14:17:02.000000000 +0800
> @@ -0,0 +1,11 @@
> +#ifndef __LINUX_BRIDGE_EBT_NFQUEUE_H
> +#define __LINUX_BRIDGE_EBT_NFQUEUE_H
> +
> +#include <linux/types.h>
> +
> +struct xt_NFQ_info {
> +   __u16 queuenum;
> +   int target;
> +};
> +
> +#endif
>
>
> On Wed, Oct 24, 2012 at 1:16 PM, JieYue Ma <xiaoma80.dev@gmail.com> wrote:
>> Well, I wrote the nfqueue patch for both ebtables and arptables a few
>> months ago, it did work well, so I think it is appropriate to release
>> these patches. Hope it will help you.
>>
>> I am not sure if I understand the problem you raised correctly. I
>> guess it might be the netfilter sus-subsystem currently not supporting
>> queue verdict for bridge very well. As you can see, you need a
>> nf_afinfo structure to be registered before using netfilter queue
>> verdict for this protocol. Unfortunately, during initialization of
>> netfilter, it did register such nf_afinfo for ipv4, ipv6, maybe arp as
>> well.. but not for bridge. So in order to enable queue verdict to work
>> under bridge, you need to register it by yourself, maybe during
>> initialization of ebtables nfqueue target module
>>
>> here is my patch for ebtables:
>>
>>
>> diff -upNr old/include/linux/netfilter_bridge/ebt_nfqueue.h
>> new/include/linux/netfilter_bridge/ebt_nfqueue.h
>> --- old/include/linux/netfilter_bridge/ebt_nfqueue.h    1969-12-31
>> 19:00:00.000000000 -0500
>> +++ new/include/linux/netfilter_bridge/ebt_nfqueue.h    2012-05-29
>> 23:59:06.940194206 -0400
>> @@ -0,0 +1,10 @@
>> +#ifndef __LINUX_BRIDGE_EBT_NFQUEUE_H
>> +#define __LINUX_BRIDGE_EBT_NFQUEUE_H
>> +#include <linux/types.h>
>> +
>> +struct xt_NFQ_info {
>> +        __u16 queuenum;
>> +        int target;
>> +};
>> +
>> +#endif
>> diff -upNr old/net/bridge/netfilter/ebtables.c
>> new/net/bridge/netfilter/ebtables.c
>> --- old/net/bridge/netfilter/ebtables.c 2012-05-27 08:48:00.095617214
>> -0400
>> +++ new/net/bridge/netfilter/ebtables.c 2012-05-27 08:57:27.644193954
>> -0400
>> @@ -252,6 +252,17 @@ letsreturn:
>>             return NF_DROP;
>>         }
>>  #endif
>> +       /*
>> +        * We add NFQUEUE support in ebtables here:
>> +        *
>> +        * If verdict is NF_QUEUE type, pass it to Netfilter. Netfilter
>> will
>> +        * call nf_queue to handle this.
>> +        */
>> +       if (verdict > 0 && (verdict & NF_VERDICT_MASK) == NF_QUEUE) {
>> +           read_unlock_bh(&table->lock);
>> +           return verdict;
>> +       }
>> +
>>         /* jump to a udc */
>>         cs[sp].n = i + 1;
>>         cs[sp].chaininfo = chaininfo;
>>
>> diff -upNr old/net/bridge/netfilter/ebt_nfqueue.c
>> new/net/bridge/netfilter/ebt_nfqueue.c
>> --- old/net/bridge/netfilter/ebt_nfqueue.c  1969-12-31
>> 19:00:00.000000000 -0500
>> +++ new/net/bridge/netfilter/ebt_nfqueue.c  2012-05-27
>> 08:58:58.511193378 -0400
>> @@ -0,0 +1,117 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/skbuff.h>
>> +#include <linux/kernel.h>
>> +#include <linux/types.h>
>> +#include <linux/netfilter.h>
>> +#include <linux/netfilter/x_tables.h>
>> +#include <linux/netfilter_bridge/ebtables.h>
>> +#include <linux/netfilter_bridge/ebt_nfqueue.h>
>> +
>> +MODULE_AUTHOR("alibaba");
>> +MODULE_DESCRIPTION("ebtables: forwarding to netlink");
>> +MODULE_LICENSE("GPL");
>> +
>> +static unsigned int ebt_nfqueue_tg(struct sk_buff *skb, const struct
>> xt_target_param *par) {
>> +   const struct xt_NFQ_info *info = par->targinfo;
>> +
>> +   return NF_QUEUE_NR(info->queuenum);
>> +}
>> +
>> +static bool ebt_nfqueue_tg_check(const struct xt_tgchk_param* par) {
>> +   const struct xt_NFQ_info *info = par->targinfo;
>> +
>> +   if (BASE_CHAIN && info->target == EBT_RETURN) {
>> +       printk(KERN_INFO"ebt_nfqueue: ebt_nfqueue_tg_check failed\n");
>> +       return false;
>> +   }
>> +
>> +   return true;
>> +}
>> +
>> +void dummy_from_user(void *dst, void *src) {
>> +}
>> +
>> +int dummy_to_user(void __user *dst, void *src) {
>> +   return 0;
>> +}
>> +
>> +static struct xt_target nfqueue_tg_reg __read_mostly = {
>> +   .name           = "nfqueue",
>> +   .revision   = 0,
>> +   .family     = NFPROTO_BRIDGE,
>> +   .table      = "filter",
>> +   .hooks      = (1 << NF_BR_NUMHOOKS) | (1 << NF_BR_LOCAL_IN) | (1
>> << NF_BR_LOCAL_OUT) | (1 << NF_BR_FORWARD),
>> +        .target         = ebt_nfqueue_tg,
>> +        .checkentry     = ebt_nfqueue_tg_check,
>> +        .targetsize     = XT_ALIGN(sizeof(struct xt_NFQ_info)),
>> +   .compat_from_user = dummy_from_user,
>> +   .compat_to_user = dummy_to_user,
>> +        .me             = THIS_MODULE,
>> +};
>> +
>> +
>> +__sum16 nf_br_checksum(struct sk_buff* skb, unsigned int hook,
>> unsigned int dataoff, u_int8_t protocol) {
>> +   return 0;
>> +}
>> +
>> +static __sum16 nf_br_checksum_partial(struct sk_buff* skb, unsigned int
>> hook,
>> +       unsigned int dataoff, unsigned int len,
>> +       u_int8_t protocol) {
>> +   return 0;
>> +}
>> +
>> +static int nf_br_route(struct dst_entry **dst, struct flowi *fl) {
>> +   return 0;
>> +}
>> +
>> +static void nf_br_saveroute(const struct sk_buff *skb, struct
>> nf_queue_entry *entry) {
>> +
>> +}
>> +
>> +static int nf_br_reroute(struct sk_buff *skb, const struct
>> nf_queue_entry *entry) {
>> +   return 0;
>> +}
>> +
>> +static const struct nf_afinfo nf_br_afinfo = {
>> +   .family     = NFPROTO_BRIDGE,
>> +   .checksum   = nf_br_checksum,
>> +   .checksum_partial = nf_br_checksum_partial,
>> +   .route      = nf_br_route,
>> +   .saveroute  = nf_br_saveroute,
>> +   .reroute    = nf_br_reroute,
>> +   .route_key_size = 0,
>> +};
>> +
>> +
>> +static int __init nfqueue_tg_init(void)
>> +{
>> +   int ret;
>> +   /*
>> +    * a tricky hack here, we forge a bridge nf_afinfo struct and
>> register it
>> +    *
>> +    * We have to do this, coz currently netfilter subsystem doesn't
>> support bridge in nf_queue
>> +    */
>> +   ret = nf_register_afinfo(&nf_br_afinfo);
>> +   if (ret < 0) {
>> +       printk("[ebt_nfqueue] nf_register_afinfo failed, cannot
>> install ebt_nfqueue.ko\n");
>> +       return ret;
>> +   }
>> +
>> +   return xt_register_target(&nfqueue_tg_reg);
>> +}
>> +
>> +static void __exit nfqueue_tg_exit(void)
>> +{
>> +   nf_unregister_afinfo(&nf_br_afinfo);
>> +   xt_unregister_target(&nfqueue_tg_reg);
>> +}
>> +
>> +module_init(nfqueue_tg_init);
>> +module_exit(nfqueue_tg_exit);
>>
>>
>>
>>
>> On Sat, Oct 20, 2012 at 2:32 AM, Benjamin Beckmeyer
>> <B.Beckmeyer@stud.hs-esslingen.de> wrote:
>>> Hi all,
>>>
>>> I am trying to build an Ebtables NFQUEUE module to also move layer 2
>>> traffic to the NFQUEUE system provided by IPtables.  A few years ago a
>>> Pierre Chifflier provided 3 patches to Ebtables that appear to try and
>>> utilize the NFQUEUE xt_tables target within Ebtables to pass the layer
>>> 2
>>> data via nfnetlink_queue.
>>>
>>> Some background, I am trying to get this working on 2.6.26.5 kernel
>>> version and have applied the patches listed here:
>>>
>>> http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.devel/37859
>>> http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.devel/37862
>>>
>>> I have also patched the Ebtables (2.0.8) userspace utility to produce
>>> the
>>> shared object ebt_NFQUEUE.so with code also from Pierre, which can be
>>> found here:
>>>
>>> https://www.wzdftpd.net/downloads/ebt_NFQUEUE.c
>>>
>>> To get the patches to work for the ebt_nfqueue kernel object, due to an
>>> older kernel, I had to modify the target and check function arguments
>>> as
>>> the "const struct xt_action_param" does not exist in my kernel version:
>>>
>>> static int ebt_nfqueue_tg(const struct sk_buff *skb, const struct
>>> net_device *in,
>>>                                    const struct net_device *out, const
>>> void *data, unsigned int datalen)
>>> {
>>>     const struct ebt_nfqueue_info *info = data;
>>>     struct nf_loginfo li;
>>>     unsigned int verdict = NF_ACCEPT;
>>>
>>>     printk(KERN_NOTICE "ebt_NFQUEUE: returning EBT_QUEUE\n");
>>>     return EBT_QUEUE; // return -5
>>> }
>>>
>>> static struct ebt_target ebt_nfqueue __read_mostly = {
>>>     .name               = "NFQUEUE",
>>>     .target     = ebt_nfqueue_tg,
>>>     .check = ebt_nfqueue_check,
>>>     .me                 = THIS_MODULE,
>>> };
>>>
>>> +++++ VERSUS +++++
>>>
>>> static struct xt_target ebt_xt_nfqueue __read_mostly = {
>>>     .name               = "NFQUEUE",
>>>     .revision   = 0,
>>>     .family     = 7, // NFPROTO_BRIDGE
>>>     .target     = ebt_nfqueue_tg,
>>>     .checkentry = ebt_nfqueue_check,
>>>     .targetsize = sizeof(struct ebt_nfqueue_info),
>>>     .me                 = THIS_MODULE,
>>> };
>>>
>>> Nevertheless, the return value from this target is just the EBT_QUEUE
>>> (-5)
>>> to inform the Netfilter system of the queue number.  If I use the
>>> ebt_target rather than xt_target the kernel module will build and can
>>> be
>>> inserted into ebtables with no errors - the problem is that queuing
>>> does
>>> not work.  If I use the xt_target rather than the ebt_target then
>>> Ebtables
>>> userspace complains that it is not supported from this kernel version
>>> (error in communication.c in userspace and appears to fail on the
>>> "setsockopt" calls).
>>>
>>> I have printed out the entire contents of using the xt_target vs
>>> ebt_target and all data going into this call is identical, which
>>> boggles
>>> my mind as to why xt_target will trigger the error in the ebtables
>>> userspace program and ebt_target will not.
>>>
>>> I think that I MUST use the xt_target within ebtables to properly pass
>>> this data to the NFQUEUE system.  This comes from an earlier
>>> discussion:
>>>
>>> +++
>>>
>>> On 04.02.2011 14:40, Pierre Chifflier wrote:
>>>> On 02/04/2011 02:25 PM, Patrick McHardy wrote:
>>>>> On 03.02.2011 15:32, Pierre Chifflier wrote:
>>>>>> This adds support for sending bridge packets to userspace using
>>>>>> the NFQUEUE target with ebtables.
>>>>>
>>>>> I don't think we need a new target for this (and the EBT_QUEUE
>>>>> definition), just using xt_NFQUEUE should work fine.
>>>>
>>>> I thought ebtables did not support sending packet to xtables ? (that's
>>>> on the TODO list for ebtables).
>>>
>>> It can use xtables targets and matches if I'm not completely
>>> mistaken.
>>>
>>> +++
>>>
>>> It appears I can 'use' xtables targets, it will compile correctly, but
>>> ebtables will not actually allow me to insert the rules to jump to the
>>> NFQUEUE target, so I am unable to actually verify if packets would be
>>> queue'd by the system.
>>>
>>> When using the ebt_target I can insert my NFQUEUE rules into the nat
>>> PREROUTING table, and the packet counter will actually increment on
>>> layer
>>> 2 traffic, but the packets do not appear to actually hit any of the
>>> nfnetlink_queue functions (I have added a printk to every function). I
>>> even see that my target has been hit via a printk:
>>>
>>> user.notice kernel: ebt_NFQUEUE: returning EBT_QUEUE
>>>
>>> But then it appears that is as far as the packet goes.
>>>
>>> When queueing a packet from IPtables I see a huge amount of output:
>>>
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> __enqueue_entry
>>> user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_rcv
>>> user.notice kernel: BB: File: nfnetlink.c      Function: nfnl_lock
>>> user.notice kernel: BB: File: nfnetlink.c      Function:
>>> nfnetlink_rcv_msg
>>> user.notice kernel: BB: File: nfnetlink.c      Function:
>>> nfnetlink_get_subsys
>>> user.notice kernel: BB: File: nfnetlink.c      Function:
>>> nfnetlink_find_client
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> nfqnl_recv_verdict
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> instance_lookup
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> find_dequeue_entry
>>> user.notice kernel: BB: File: nfnetlink.c      Function: nfnl_unlock
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> nfqnl_enqueue_packet
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> instance_lookup
>>> user.notice kernel: BB: File: nfnetlink_queue.c        Function:
>>> nfqnl_build_packet_message
>>> user.notice kernel: BB: File: nfnetlink.c      Function:
>>> nfnetlink_unicast
>>>
>>> But from my ebtables -j NFQUEUE there are no calls to the nfnetlink.c
>>> or
>>> nfnetlink_queue.c functions.  It is almost like the target is hit then
>>> the
>>> packet is just mysteriously gone...or hits other functions unrelated to
>>> the queueing system.
>>>
>>> In summation, the problem is if using the ebt_target struct in the
>>> kernel
>>> module for ebtables, it will be inserted and can be utilized by the
>>> userspace Ebtables - but it doesnt appear to pass the packet to the
>>> IPtables nfqueue correctly.  If using the xt_target struct in the
>>> kernel
>>> module for ebtables, it will compile, but fails to be utilized by
>>> Ebtables
>>> userspace due to a "setsockopt error mentioned above.
>>>
>>> Any help or suggestions are greatly appreciated!
>>>
>>> Thank you, Benny
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

