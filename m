From: Andrew Morton <akpm@digeo.com>
Subject: Re: An oops while running 2.5.65-mm2
Date: Thu, 20 Mar 2003 12:29:31 -0800
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030320122931.0d2f208f.akpm@digeo.com>
References: <3E7A1ABF.7050402@tmsusa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3E7A1ABF.7050402@tmsusa.com>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jjs <jjs@tmsusa.com>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

jjs <jjs@tmsusa.com> wrote:
>
> Greetings -
> 
> Here is some info about an oops from 2.5.65-mm2

It is not exactly an oops, but it is a warning of a fatal bug.

> Platform: Red Hat 8.0 + updates on genuine Intel mobo
> Celeron 1.2 Ghz, 512M RAM, 1x40GB IDE, 2 e100 nics
> 
> Workload: iptables firewall and squid proxy for local lan
> 
> 2.5.65-mm2 booted up and ran normally for 21-22 hours.
> internal hosts were natted properly, no complaints.
> 
> After 22 hours or so named went catatonic, and the squid
> proxy became unable to resolve URLS -
> 
> I restarted named and it resumed normal operation.
> 
> Within less than an hour, the oops appeared in the log -
> I took a quick look at /proc/meminfo and /proc/slabinfo
> and saved them before booting back into 2.4-ac
> 
> slabinfo, meminfo, the kernel log and the .config attached
> 
> Thanks for your time and patience -
> 

Look at this lovely trace:

Mar 19 12:17:54 jyro kernel: process `named' is using obsolete setsockopt SO_BSDCOMPAT
Mar 19 12:20:40 jyro last message repeated 5 times
Mar 19 12:31:24 jyro last message repeated 4 times
Mar 19 12:44:55 jyro last message repeated 5 times
Mar 19 12:57:16 jyro last message repeated 5 times
Mar 19 13:08:33 jyro last message repeated 5 times
Mar 19 13:21:03 jyro last message repeated 5 times
Mar 19 13:32:55 jyro last message repeated 5 times
Mar 19 13:47:52 jyro last message repeated 5 times
Mar 19 14:00:52 jyro last message repeated 5 times
Mar 19 14:01:07 jyro last message repeated 2 times

Mar 20 11:06:46 jyro kernel: Slab corruption: start=ceaa2234, expend=ceaa2377, problemat=ceaa22ac
Mar 20 11:06:46 jyro kernel: Last user: [<e0a12cb0>](destroy_conntrack+0xd0/0x140 [ip_conntrack])
Mar 20 11:06:46 jyro kernel: Data: ************************************************************************************************************************AC 22 AA CE AC 22 AA CE ***************************************************************************************************************************************************************************************************A5 
Mar 20 11:06:46 jyro kernel: Next: 71 F0 2C .B0 2C A1 E0 71 F0 2C .********************
Mar 20 11:06:46 jyro kernel: slab error in check_poison_obj(): cache `ip_conntrack': object was modified after freeing
Mar 20 11:06:46 jyro kernel: Call Trace:
Mar 20 11:06:46 jyro kernel:  [<c014ab9b>] check_poison_obj+0x15b/0x1b0
Mar 20 11:06:46 jyro kernel:  [<c014c9f2>] kmem_cache_alloc+0x132/0x170
Mar 20 11:06:46 jyro kernel:  [<e0a137d7>] init_conntrack+0x97/0x450 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<e0a19f20>] ip_conntrack_protocol_udp+0x0/0x40 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<e0a137d7>] init_conntrack+0x97/0x450 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<e0a19f20>] ip_conntrack_protocol_udp+0x0/0x40 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<e0a13db3>] ip_conntrack_in+0x223/0x2e0 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<e0a19f20>] ip_conntrack_protocol_udp+0x0/0x40 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<e0a19f20>] ip_conntrack_protocol_udp+0x0/0x40 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<c0340490>] skb_checksum_help+0x40/0xa0
Mar 20 11:06:46 jyro kernel:  [<e0a19a98>] ip_conntrack_local_out_ops+0x0/0x18 [ip_conntrack]
Mar 20 11:06:46 jyro kernel:  [<c034ae14>] nf_hook_slow+0x134/0x1b0
Mar 20 11:06:46 jyro kernel:  [<c0361490>] dst_output+0x0/0x30
Mar 20 11:06:46 jyro kernel:  [<c0360caa>] ip_push_pending_frames+0x3aa/0x400
Mar 20 11:06:46 jyro kernel:  [<c0361490>] dst_output+0x0/0x30
Mar 20 11:06:46 jyro kernel:  [<c0384d59>] udp_push_pending_frames+0x129/0x240
Mar 20 11:06:46 jyro kernel:  [<c03854dd>] udp_sendmsg+0x62d/0xf10
Mar 20 11:06:46 jyro kernel:  [<c0372c80>] tcp_rcv_established+0x280/0x7a0
Mar 20 11:06:46 jyro kernel:  [<c039078b>] inet_sendmsg+0x4b/0x60
Mar 20 11:06:46 jyro kernel:  [<c033724e>] sock_sendmsg+0x8e/0xb0
Mar 20 11:06:46 jyro kernel:  [<c014aa34>] fprob+0x34/0x40
Mar 20 11:06:46 jyro kernel:  [<c014aa7b>] check_poison_obj+0x3b/0x1b0
Mar 20 11:06:46 jyro kernel:  [<c014aa7b>] check_poison_obj+0x3b/0x1b0
Mar 20 11:06:46 jyro kernel:  [<c014c9f2>] kmem_cache_alloc+0x132/0x170
Mar 20 11:06:46 jyro kernel:  [<c0336cbb>] move_addr_to_kernel+0x6b/0x70
Mar 20 11:06:46 jyro kernel:  [<c0338b8e>] sys_sendto+0xde/0x100
Mar 20 11:06:46 jyro kernel:  [<c0337010>] sock_map_fd+0x120/0x140
Mar 20 11:06:46 jyro kernel:  [<c038e4d4>] inet_setsockopt+0x34/0x40
Mar 20 11:06:46 jyro kernel:  [<c0338d8c>] sys_setsockopt+0x6c/0xb0
Mar 20 11:06:46 jyro kernel:  [<c0339557>] sys_socketcall+0x197/0x270
Mar 20 11:06:46 jyro kernel:  [<c010a43b>] syscall_call+0x7/0xb
Mar 20 11:06:46 jyro kernel: 

This means that some code somewhere (we are not told where) modified an object from
the ip_conntrack cache after destroy_conntrack had freed it up.

Looking at the data pattern, it is probably an INIT_LIST_HEAD() against a
list_head field which is 120 bytes into the object.  (problemat - start).  Or
a list_del() against a different object which erroneously remains on a list
with this object.



Manfred has extra toys in the works which will be able to unmap slab objects
from the kernel virtual address space when they are freed.  When this debug
code is working (it will run slowly) we will get an oops at the site of the
bug.
