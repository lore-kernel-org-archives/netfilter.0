From: =?UTF-8?B?UGF3ZcWCIFN0YXN6ZXdza2k=?= <pstaszewski@artcom.pl>
Subject: some problems
Date: Fri, 07 Oct 2005 14:09:38 +0200
Message-ID: <43466582.7000307@artcom.pl>
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
To: nf-hipac@lists.sourceforge.net, netfilter@lists.netfilter.org, hno@marasystems.com, michael@marasystems.com

Hello
I have linux with hf-hipac v0.9.0 installed on kernel 2.6.13-r3
and i have 97 vlan interfaces on machine.
When i try to add:

<fw.sh>
#!/bin/sh

vlans="999 100 101 102 103 104 105 106 107 108 109 110 111 112 113 300 
114 450 401 402 301 302 303 304 305 306 307 308 309 310 311 312 313 403 
314 315 316 317 318 404 405 115 406 116 500 501 319 320 321 322 323 324 
325 326 327 328 329 330 331 332 333 334 335 336 337 117 118 119 120 121 
122 407 408 409 451 452 453 454 455 456 457 458 459 461 202 460 462 463 
464 203 503 504"

nf-hipac -F
nf-hipac -X

nf-hipac -X permit10-services
nf-hipac -N permit10-services

nf-hipac -A permit10-services -s 10.0.234.12 -j ACCEPT
nf-hipac -A permit10-services -s 10.0.230.0/24 -j ACCEPT
nf-hipac -A permit10-services -s 10.202.40.2 -j ACCEPT
nf-hipac -A permit10-services -s 10.4.120.195 -p tcp --dport 666 -j ACCEPT
nf-hipac -A permit10-services -p udp --dport 67:68 -s 10.0.0.0/8 -j ACCEPT

for vlans in $vlans
do
nf-hipac -A INPUT -i vlan0$vlans -s 10.0.0.0/8 -j permit10-services
done
<fw.sh>

dmesg shows me:

NF_HiPAC: too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!<3>NF_HiPAC: 
too much interfaces UP at the same time. Please increase 
NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and 
recompile!<3>net/ipv4/netfilter/nf-hipac/global.c:hp_free:97: pointer 
ffff81007c331880 not in memhash
Trying to vfree() bad address (ffff81007bae4860)
Badness in __vunmap at mm/vmalloc.c:300

Call Trace:<ffffffff8034d84e>{hp_free+484} 
<ffffffff80350eaf>{rlp_free_rec+204}
       <ffffffff80350e59>{rlp_free_rec+118} 
<ffffffff80350e59>{rlp_free_rec+118}
       <ffffffff80350e59>{rlp_free_rec+118} 
<ffffffff80355665>{dimtree_flush+122}
       <ffffffff8035b66d>{hipac_flush_chain+130} 
<ffffffff803685f6>{nlhp_thread_func+4430}
       <ffffffff80143bbd>{autoremove_wake_function+0} 
<ffffffff80143bbd>{autoremove_wake_function+0}
       <ffffffff8010e69e>{child_rip+8} 
<ffffffff803674a8>{nlhp_thread_func+0}
       <ffffffff8010e696>{child_rip+0}
Trying to vfree() bad address (ffff81007c331800)
Badness in __vunmap at mm/vmalloc.c:300

Call Trace:<ffffffff8034d84e>{hp_free+484} 
<ffffffff80350eb7>{rlp_free_rec+212}
       <ffffffff80350e59>{rlp_free_rec+118} 
<ffffffff80350e59>{rlp_free_rec+118}
       <ffffffff80355665>{dimtree_flush+122} 
<ffffffff8035b66d>{hipac_flush_chain+130}
       <ffffffff803685f6>{nlhp_thread_func+4430} 
<ffffffff80143bbd>{autoremove_wake_function+0}
       <ffffffff80143bbd>{autoremove_wake_function+0} 
<ffffffff8010e69e>{child_rip+8}
       <ffffffff803674a8>{nlhp_thread_func+0} 
<ffffffff8010e696>{child_rip+0}

net/ipv4/netfilter/nf-hipac/global.c:hp_free:97: pointer 
ffff81007b95c560 not in memhash
Trying to vfree() bad address (ffff81007bf92400)
Badness in __vunmap at mm/vmalloc.c:300

Call Trace:<ffffffff8034d84e>{hp_free+484} 
<ffffffff80350e6c>{rlp_free_rec+137}
       <ffffffff80350e59>{rlp_free_rec+118} 
<ffffffff80350e59>{rlp_free_rec+118}
       <ffffffff80355665>{dimtree_flush+122} 
<ffffffff8035b66d>{hipac_flush_chain+130}
       <ffffffff803685f6>{nlhp_thread_func+4430} 
<ffffffff80143bbd>{autoremove_wake_function+0}
       <ffffffff80143bbd>{autoremove_wake_function+0} 
<ffffffff8010e69e>{child_rip+8}
       <ffffffff803674a8>{nlhp_thread_func+0} 
<ffffffff8010e696>{child_rip+0}

Trying to vfree() bad address (ffff81007babf100)
Badness in __vunmap at mm/vmalloc.c:300

Call Trace:<ffffffff8034d84e>{hp_free+484} 
<ffffffff80350eb7>{rlp_free_rec+212}
       <ffffffff80350e59>{rlp_free_rec+118} 
<ffffffff80350e59>{rlp_free_rec+118}
       <ffffffff80350e59>{rlp_free_rec+118} 
<ffffffff80355665>{dimtree_flush+122}
       <ffffffff8035b66d>{hipac_flush_chain+130} 
<ffffffff803685f6>{nlhp_thread_func+4430}
       <ffffffff80143bbd>{autoremove_wake_function+0} 
<ffffffff80143bbd>{autoremove_wake_function+0}
       <ffffffff8010e69e>{child_rip+8} 
<ffffffff803674a8>{nlhp_thread_func+0}
       <ffffffff8010e696>{child_rip+0}
net/ipv4/netfilter/nf-hipac/global.c:hp_free:97: pointer 
ffff81007d9214c0 not in memhash
net/ipv4/netfilter/nf-hipac/global.c:hp_free:97: pointer 
ffff81007bf92620 not in memhash
net/ipv4/netfilter/nf-hipac/global.c:hp_free:97: pointer 
ffff81007b950e80 not in memhash
net/ipv4/netfilter/nf-hipac/global.c:hp_free:97: pointer 
ffff81007bbecc80 not in memhash
general protection fault: 0000 [1] SMP
CPU 0
Modules linked in: cls_u32 acenic e1000 bonding
Pid: 776, comm: nf_hipac Not tainted 2.6.13-gentoo-r3
RIP: 0010:[<ffffffff80351dda>] 
<ffffffff80351dda>{dimtree_insrec_rule_elem+2222}
RSP: 0018:ffff81007fa67928  EFLAGS: 00010246
RAX: 006200610060005f RBX: 0000000000000000 RCX: 0000000000000000
RDX: 00000000000000c0 RSI: ffff81007bb61be8 RDI: ffff81007bb61bf0
RBP: ffffc20003408000 R08: ffff81007bb61bf0 R09: 0000000000000000
R10: 00000000000000a1 R11: ffff81007bbecdc0 R12: ffff81007fa679b8
R13: ffff81007b4a0b00 R14: ffff81007bbecde0 R15: ffff81007b4a0b3c
FS:  0000000000000000(0000) GS:ffffffff80533800(0000) knlGS:0000000000000000
CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
CR2: 00000000005c63a0 CR3: 000000007bb05000 CR4: 00000000000006e0
Process nf_hipac (pid: 776, threadinfo ffff81007fa66000, task 
ffff81007f848800)
Stack: ffff81007bb59c80 01ffffff00000001 ffff81007d3364d0 ffff81007d1cea60
       ffff81007d2c3b40 ffff81007bab4980 ffff81007bbecdc0 ffffc20003408000
       ffffc20000606000 0200000000000010
Call Trace:<ffffffff8034d611>{hp_alloc+485} 
<ffffffff80353504>{dimtree_insrec+3653}
       <ffffffff8034c6f9>{ihash_insert+1746} 
<ffffffff8034c4ef>{ihash_insert+1224}
       <ffffffff8034bd48>{ihash_func_val+0} 
<ffffffff8034bf29>{ihash_new+271}
       <ffffffff80355e81>{dimtree_insert+1883} 
<ffffffff8034dd28>{hp_realloc+1107}
       <ffffffff8035791a>{insert_into_dt+1699} 
<ffffffff803595ad>{insert_jump_rec+1268}
       <ffffffff8035dfc0>{hipac_append+4158} 
<ffffffff8037c084>{thread_return+88}
       <ffffffff8036857a>{nlhp_thread_func+4306} 
<ffffffff80143bbd>{autoremove_wake_function+0}
       <ffffffff80143bbd>{autoremove_wake_function+0} 
<ffffffff8010e69e>{child_rip+8}
       <ffffffff803674a8>{nlhp_thread_func+0} 
<ffffffff8010e696>{child_rip+0}


Code: 8b 10 41 8b 45 00 c1 ea 06 c1 e8 06 39 c2 3e 7e 1b 8b 74 24
RIP <ffffffff80351dda>{dimtree_insrec_rule_elem+2222} RSP <ffff81007fa67928>


So i increase the max interfaces in file:
/usr/src/linux/net/ipv4/netfilter/nf-hipac/nfhp_dev.h
from 63 to 255
#define NF_HIPAC_MAX_UP_INTERFACES 255

and then i recompile the kernel and re-make the nf-hipac userspace binary.


reboot

and when i try to run fw.sh script then :)

net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:296: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
net/ipv4/netfilter/nf-hipac/ihash.c:ihash_insert:279: ihash bucket full 
after rehash -> try again with more buckets
general protection fault: 0000 [1] SMP
CPU 0
Modules linked in: cls_u32 acenic e1000 bonding
Pid: 776, comm: nf_hipac Not tainted 2.6.13-gentoo-r3
RIP: 0010:[<ffffffff80207716>] <ffffffff80207716>{strcmp+0}
RSP: 0018:ffff81007fa67d50  EFLAGS: 00010206
RAX: 0000000000000044 RBX: 0000000000000430 RCX: 0000000000000003
RDX: 0000000000000037 RSI: ffff81007d2d8458 RDI: 66660a3561303034
RBP: 0000000000000048 R08: 0000000000000000 R09: 0000000000000000
R10: ffff81007d2d8550 R11: 0000000000000009 R12: ffff81007c0d6600
R13: 0000000000000043 R14: 0000000000000040 R15: ffff81007d2d8458
FS:  0000000000000000(0000) GS:ffffffff80543800(0000) knlGS:0000000000000000
CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
CR2: 00002aaaaae53f7c CR3: 000000007bfa4000 CR4: 00000000000006e0
Process nf_hipac (pid: 776, threadinfo ffff81007fa66000, task 
ffff81007f848800)
Stack: ffffffff803643e2 000000007f8f5600 0000000000000000 ffff81007c4e9800
       ffffffff80487460 ffff81007d2d8478 0000000000000001 ffff81007d2d8520
       ffffffff80367b81 0000000000000000
Call Trace:<ffffffff803643e2>{nf_hipac_dev_get_vindex+234} 
<ffffffff80367b81>{nlhp_thread_func+1753}
       <ffffffff80143bbd>{autoremove_wake_function+0} 
<ffffffff80143bbd>{autoremove_wake_function+0}
       <ffffffff8010e69e>{child_rip+8} 
<ffffffff803674a8>{nlhp_thread_func+0}
       <ffffffff8010e696>{child_rip+0}

Code: 0f b6 17 89 d0 2a 06 48 83 c6 01 84 c0 75 08 48 83 c7 01 84
RIP <ffffffff80207716>{strcmp+0} RSP <ffff81007fa67d50>



So any help ??? :)

