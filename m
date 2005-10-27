From: Radek Hladik <rhladik@tfc.cz>
Subject: IPset_iptree with timeouts on Fedora Core 4
Date: Thu, 27 Oct 2005 04:56:15 +0200
Message-ID: <436041CF.7090009@tfc.cz>
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
To: netfilter@lists.netfilter.org

Greetings all,
    I have two questions regarding running ipset_iptree on Fedora Core 
4. Kernel module compilation was successful and everything was working 
on the first try except timeouts.

I tried:
ipset -N testip iptree
ipset -A testip 1.2.3.4%30
The second command produced this error in system log:

Oct 27 02:42:58 radek kernel: Debug: sleeping function called from 
invalid context at mm/slab.c:2126
Oct 27 02:42:58 radek kernel: in_atomic():1, irqs_disabled():0
Oct 27 02:42:58 radek kernel:  [<c015c27e>] kmem_cache_alloc+0x3c/0x49
Oct 27 02:42:58 radek kernel:  [<e0c8836e>] addip+0x1ae/0x1e0 
[ip_set_iptree]
Oct 27 02:42:58 radek kernel:  [<e0ca2a2c>] __ip_set_addip+0x3c/0x70 
[ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2a60>] ip_set_addip+0x0/0x10 [ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca4164>] 
ip_set_sockfn_set+0x1a4/0x4c0 [ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2a60>] ip_set_addip+0x0/0x10 [ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2a70>] ip_set_delip+0x0/0x50 [ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2ac0>] ip_set_testip+0x0/0x50 [ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2b10>] ip_set_bindip+0x0/0x170 [ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2c80>] ip_set_unbindip+0x0/0x330 
[ip_set]
Oct 27 02:42:58 radek kernel:  [<e0ca2fb0>] ip_set_testbind+0x0/0x130 
[ip_set]
Oct 27 02:42:58 radek kernel:  [<c0312f31>] nf_sockopt+0xc1/0x11f
Oct 27 02:42:58 radek kernel:  [<c0312faf>] nf_setsockopt+0x20/0x25
Oct 27 02:42:58 radek kernel:  [<c032eac1>] ip_setsockopt+0xa8/0xbc5
Oct 27 02:42:58 radek kernel:  [<e082666e>] 
__ext3_journal_stop+0x19/0x34 [ext3]
Oct 27 02:42:58 radek kernel:  [<c01ab838>] __mark_inode_dirty+0x28/0x2f0
Oct 27 02:42:58 radek kernel:  [<c01281e4>] current_fs_time+0x4e/0x69
Oct 27 02:42:58 radek kernel:  [<c0157573>] buffered_rmqueue+0xb8/0x31b
Oct 27 02:42:58 radek kernel:  [<c01576e0>] buffered_rmqueue+0x225/0x31b
Oct 27 02:42:58 radek kernel:  [<c015398d>] filemap_nopage+0x2c9/0x379
Oct 27 02:42:58 radek kernel:  [<c0165707>] do_wp_page+0x22f/0x627
Oct 27 02:42:58 radek kernel:  [<c021216c>] vsnprintf+0x32e/0x5f6
Oct 27 02:42:58 radek kernel:  [<c0199b3e>] d_alloc+0x1c/0x309
Oct 27 02:42:58 radek kernel:  [<c019b56a>] d_rehash+0xad/0x2e9
Oct 27 02:42:58 radek kernel:  [<c02fd132>] sock_map_file+0x90/0x126
Oct 27 02:42:58 radek kernel:  [<c0301499>] sock_common_setsockopt+0x20/0x26
Oct 27 02:42:58 radek kernel:  [<c02fe973>] sys_setsockopt+0x65/0xae
Oct 27 02:42:58 radek kernel:  [<c02ff0d0>] sys_socketcall+0x228/0x290
Oct 27 02:42:58 radek kernel:  [<c0103a51>] syscall_call+0x7/0xb

After googling for a while I've discovered some guy having similar 
problem with his own netfilter module and he was told to use flag 
GFP_ATOMIC instead of GFP_KERNEL in kmalloc function.
So I've changed this flag on lines 164 and 349 in file ip_set_iptree.c 
in kernel source code. This solved the problem but I'm wondering whether 
is this correct way to fix the problem?

But iptree still had not members removed after specified timeout. I have 
"discovered" (after reading the source code)  that the iptree set need 
to have set the default timeout value (with --timeout option). Is this 
true or am I doing something wrong?

I'm running kernel 2.6.11-1.1369_FC4, iptables 1.3.0 and ipset v2.2.5 
Protocol version 2.


                                                                         
                                                   Radek Hladik

