From: "Benjamin Beckmeyer" <B.Beckmeyer@stud.hs-esslingen.de>
Subject: Ebtables NFQUEUE Support
Date: Fri, 19 Oct 2012 20:32:59 +0200 (CEST)
Message-ID: <37777.70.67.211.174.1350671579.squirrel@webmail.hs-esslingen.de>
Reply-To: B.Beckmeyer@stud.hs-esslingen.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I am trying to build an Ebtables NFQUEUE module to also move layer 2
traffic to the NFQUEUE system provided by IPtables.  A few years ago a
Pierre Chifflier provided 3 patches to Ebtables that appear to try and
utilize the NFQUEUE xt_tables target within Ebtables to pass the layer 2
data via nfnetlink_queue.

Some background, I am trying to get this working on 2.6.26.5 kernel
version and have applied the patches listed here:

http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.devel/37859
http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.devel/37862

I have also patched the Ebtables (2.0.8) userspace utility to produce the
shared object ebt_NFQUEUE.so with code also from Pierre, which can be
found here:

https://www.wzdftpd.net/downloads/ebt_NFQUEUE.c

To get the patches to work for the ebt_nfqueue kernel object, due to an
older kernel, I had to modify the target and check function arguments as
the "const struct xt_action_param" does not exist in my kernel version:

static int ebt_nfqueue_tg(const struct sk_buff *skb, const struct
net_device *in,
				   const struct net_device *out, const void *data, unsigned int datalen)
{
    const struct ebt_nfqueue_info *info = data;
    struct nf_loginfo li;
    unsigned int verdict = NF_ACCEPT;

    printk(KERN_NOTICE "ebt_NFQUEUE: returning EBT_QUEUE\n");
    return EBT_QUEUE; // return -5
}

static struct ebt_target ebt_nfqueue __read_mostly = {
    .name 		= "NFQUEUE",
    .target 	= ebt_nfqueue_tg,
    .check = ebt_nfqueue_check,
    .me 		= THIS_MODULE,
};

+++++ VERSUS +++++

static struct xt_target ebt_xt_nfqueue __read_mostly = {
    .name 		= "NFQUEUE",
    .revision   = 0,
    .family     = 7, // NFPROTO_BRIDGE
    .target 	= ebt_nfqueue_tg,
    .checkentry = ebt_nfqueue_check,
    .targetsize = sizeof(struct ebt_nfqueue_info),
    .me 		= THIS_MODULE,
};

Nevertheless, the return value from this target is just the EBT_QUEUE (-5)
to inform the Netfilter system of the queue number.  If I use the
ebt_target rather than xt_target the kernel module will build and can be
inserted into ebtables with no errors - the problem is that queuing does
not work.  If I use the xt_target rather than the ebt_target then Ebtables
userspace complains that it is not supported from this kernel version
(error in communication.c in userspace and appears to fail on the
"setsockopt" calls).

I have printed out the entire contents of using the xt_target vs
ebt_target and all data going into this call is identical, which boggles
my mind as to why xt_target will trigger the error in the ebtables
userspace program and ebt_target will not.

I think that I MUST use the xt_target within ebtables to properly pass
this data to the NFQUEUE system.  This comes from an earlier discussion:

+++

On 04.02.2011 14:40, Pierre Chifflier wrote:
> On 02/04/2011 02:25 PM, Patrick McHardy wrote:
>> On 03.02.2011 15:32, Pierre Chifflier wrote:
>>> This adds support for sending bridge packets to userspace using
>>> the NFQUEUE target with ebtables.
>>
>> I don't think we need a new target for this (and the EBT_QUEUE
>> definition), just using xt_NFQUEUE should work fine.
>
> I thought ebtables did not support sending packet to xtables ? (that's
> on the TODO list for ebtables).

It can use xtables targets and matches if I'm not completely
mistaken.

+++

It appears I can 'use' xtables targets, it will compile correctly, but
ebtables will not actually allow me to insert the rules to jump to the
NFQUEUE target, so I am unable to actually verify if packets would be
queue'd by the system.

When using the ebt_target I can insert my NFQUEUE rules into the nat
PREROUTING table, and the packet counter will actually increment on layer
2 traffic, but the packets do not appear to actually hit any of the
nfnetlink_queue functions (I have added a printk to every function). I
even see that my target has been hit via a printk:

user.notice kernel: ebt_NFQUEUE: returning EBT_QUEUE

But then it appears that is as far as the packet goes.

When queueing a packet from IPtables I see a huge amount of output:

user.notice kernel: BB: File: nfnetlink_queue.c        Function:
__enqueue_entry
user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_rcv
user.notice kernel: BB: File: nfnetlink.c      Function: nfnl_lock
user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_rcv_msg
user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_get_subsys
user.notice kernel: BB: File: nfnetlink.c      Function:
nfnetlink_find_client
user.notice kernel: BB: File: nfnetlink_queue.c        Function:
nfqnl_recv_verdict
user.notice kernel: BB: File: nfnetlink_queue.c        Function:
instance_lookup
user.notice kernel: BB: File: nfnetlink_queue.c        Function:
find_dequeue_entry
user.notice kernel: BB: File: nfnetlink.c      Function: nfnl_unlock
user.notice kernel: BB: File: nfnetlink_queue.c        Function:
nfqnl_enqueue_packet
user.notice kernel: BB: File: nfnetlink_queue.c        Function:
instance_lookup
user.notice kernel: BB: File: nfnetlink_queue.c        Function:
nfqnl_build_packet_message
user.notice kernel: BB: File: nfnetlink.c      Function: nfnetlink_unicast

But from my ebtables -j NFQUEUE there are no calls to the nfnetlink.c or
nfnetlink_queue.c functions.  It is almost like the target is hit then the
packet is just mysteriously gone...or hits other functions unrelated to
the queueing system.

In summation, the problem is if using the ebt_target struct in the kernel
module for ebtables, it will be inserted and can be utilized by the
userspace Ebtables - but it doesnt appear to pass the packet to the
IPtables nfqueue correctly.  If using the xt_target struct in the kernel
module for ebtables, it will compile, but fails to be utilized by Ebtables
userspace due to a "setsockopt error mentioned above.

Any help or suggestions are greatly appreciated!

Thank you, Benny







