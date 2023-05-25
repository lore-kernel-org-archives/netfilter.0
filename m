From: Tijs Van Buggenhout <tijs.van.buggenhout@axsguard.com>
Subject: [PATCH] netfilter: fix NULL pointer dereference in nf_confirm_cthelper
Date: Thu, 25 May 2023 16:24:07 +0200
Message-ID: <3757306.kQq0lBPeGt@itsj>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>

From: Tijs Van Buggenhout <tijs.van.buggenhout@axsguard.com>
Date: Thu, 25 May 2023 12:25:26 +0200
Subject: [PATCH] netfilter: fix NULL pointer dereference in nf_confirm_cthelper

An nf_conntrack_helper from nf_conn_help may become NULL after DNAT.

Observed when TCP port 1720 (Q931_PORT), associated with h323 conntrack
helper, is DNAT'ed to another destination port (e.g. 1730), while
nfqueue is being used for final acceptance (e.g. snort).

This happenned after transition from kernel 4.14 to 5.10.161.

Workarounds:
 * keep the same port (1720) in DNAT
 * disable nfqueue
 * disable/unload h323 NAT helper

$ linux-5.10/scripts/decode_stacktrace.sh vmlinux < /tmp/kernel.log
BUG: kernel NULL pointer dereference, address: 0000000000000084
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
CPU: 3 PID: 13041 Comm: snort Tainted: G          IO      5.10.161 #1
Hardware name: Supermicro Super Server/X11SSi-LN4F, BIOS 2.1a 03/08/2018
RIP: 0010:nf_conntrack_update (net/netfilter/nf_conntrack_core.c:2080 net/netfilter/nf_conntrack_core.c:2134) nf_conntrack
Code: 83 e5 07 49 8b 86 b8 00 00 00 48 85 c0 0f 84 e6 00 00 00 0f b6 10 84 d2 0f 84 db 00 00 00 48 01 d0 0f 84 d2 00 00 00 48 8b 00 <f6> 80 84 00 00 00 01 0f 84 c2 00 00 00 41 0f b7 46 32 66 83 f8 02
All code
========
   0:   83 e5 07                and    $0x7,%ebp
   3:   49 8b 86 b8 00 00 00    mov    0xb8(%r14),%rax
   a:   48 85 c0                test   %rax,%rax
   d:   0f 84 e6 00 00 00       je     0xf9
  13:   0f b6 10                movzbl (%rax),%edx
  16:   84 d2                   test   %dl,%dl
  18:   0f 84 db 00 00 00       je     0xf9
  1e:   48 01 d0                add    %rdx,%rax
  21:   0f 84 d2 00 00 00       je     0xf9
  27:   48 8b 00                mov    (%rax),%rax
  2a:*  f6 80 84 00 00 00 01    testb  $0x1,0x84(%rax)          <-- trapping instruction
  31:   0f 84 c2 00 00 00       je     0xf9
  37:   41 0f b7 46 32          movzwl 0x32(%r14),%eax
  3c:   66 83 f8 02             cmp    $0x2,%ax

Code starting with the faulting instruction
===========================================
   0:   f6 80 84 00 00 00 01    testb  $0x1,0x84(%rax)
   7:   0f 84 c2 00 00 00       je     0xcf
   d:   41 0f b7 46 32          movzwl 0x32(%r14),%eax
  12:   66 83 f8 02             cmp    $0x2,%ax
RSP: 0018:ffffc90000583890 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8881438fd600 RCX: 0000000000000000
RDX: 0000000000000060 RSI: ffff888151eb250c RDI: ffff888118f00000
RBP: ffffc90000583900 R08: 000000003198f1ab R09: ffffffff81ef7e40
R10: 0000000000000002 R11: ffff88815e4e8d80 R12: ffff888151eb2500
R13: 0000000000000002 R14: ffff888151eb2500 R15: ffffffff81ef7e40
FS:  00007f6c611f4380(0000) GS:ffff88827d380000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000084 CR3: 00000001550cc005 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
? nf_reinject (net/netfilter/nf_queue.c:366 (discriminator 1))
nfqnl_reinject (net/netfilter/nfnetlink_queue.c:237) nfnetlink_queue
? nfqnl_reinject (net/netfilter/nfnetlink_queue.c:237) nfnetlink_queue
nfqnl_recv_verdict (net/netfilter/nfnetlink_queue.c:1230) nfnetlink_queue
nfnetlink_rcv_msg (net/netfilter/nfnetlink.c:241) nfnetlink
? sched_clock_cpu (kernel/sched/clock.c:371)
? nfnetlink_net_exit_batch (net/netfilter/nfnetlink.c:184) nfnetlink
netlink_rcv_skb (net/netlink/af_netlink.c:2515)
nfnetlink_rcv (net/netfilter/nfnetlink.c:601) nfnetlink
? __netlink_lookup (net/netlink/af_netlink.c:510)
netlink_unicast (net/netlink/af_netlink.c:1313 net/netlink/af_netlink.c:1339)
netlink_sendmsg (net/netlink/af_netlink.c:1934)
? iovec_from_user.part.0 (lib/iov_iter.c:1701 lib/iov_iter.c:1736)
____sys_sendmsg (net/socket.c:651 net/socket.c:671 net/socket.c:2342)
? sendmsg_copy_msghdr (net/socket.c:2283 net/socket.c:2373)
___sys_sendmsg (net/socket.c:2398)
? __wake_up (kernel/sched/wait.c:143)
? netlink_recvmsg (net/netlink/af_netlink.c:361 net/netlink/af_netlink.c:2025)
? __sys_recvfrom (include/linux/file.h:33 net/socket.c:2047)
? __fget_files (fs/file.c:914)
? __fget_light (fs/file.c:979 fs/file.c:967)
__sys_sendmsg (include/linux/file.h:32 net/socket.c:2431)
? switch_fpu_return (arch/x86/include/asm/fpu/internal.h:489 arch/x86/include/asm/fpu/internal.h:506 arch/x86/kernel/fpu/core.c:406)
__x64_sys_sendmsg (net/socket.c:2436)
do_syscall_64 (arch/x86/entry/common.c:46)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:132)
RIP: 0033:0x7f6c615273fd
Code: 28 89 54 24 1c 48 89 74 24 10 89 7c 24 08 e8 9a d6 f7 ff 8b 54 24 1c 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 44 24 08 e8 ee d6 f7 ff 48
All code
========
   0:   28 89 54 24 1c 48       sub    %cl,0x481c2454(%rcx)
   6:   89 74 24 10             mov    %esi,0x10(%rsp)
   a:   89 7c 24 08             mov    %edi,0x8(%rsp)
   e:   e8 9a d6 f7 ff          call   0xfffffffffff7d6ad
  13:   8b 54 24 1c             mov    0x1c(%rsp),%edx
  17:   48 8b 74 24 10          mov    0x10(%rsp),%rsi
  1c:   41 89 c0                mov    %eax,%r8d
  1f:   8b 7c 24 08             mov    0x8(%rsp),%edi
  23:   b8 2e 00 00 00          mov    $0x2e,%eax
  28:   0f 05                   syscall
  2a:*  48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax         <-- trapping instruction
  30:   77 33                   ja     0x65
  32:   44 89 c7                mov    %r8d,%edi
  35:   48 89 44 24 08          mov    %rax,0x8(%rsp)
  3a:   e8 ee d6 f7 ff          call   0xfffffffffff7d72d
  3f:   48                      rex.W

Code starting with the faulting instruction
===========================================
   0:   48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax
   6:   77 33                   ja     0x3b
   8:   44 89 c7                mov    %r8d,%edi
   b:   48 89 44 24 08          mov    %rax,0x8(%rsp)
  10:   e8 ee d6 f7 ff          call   0xfffffffffff7d703
  15:   48                      rex.W
RSP: 002b:00007ffebd6673f0 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 000055d4b6815eb0 RCX: 00007f6c615273fd
RDX: 0000000000000000 RSI: 00007ffebd667430 RDI: 0000000000000003
RBP: 00007ffebd667490 R08: 0000000000000000 R09: 0000000000000301
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 000055d4b7bb0660
Modules linked in: xt_CLASSIFY sch_sfq sch_htb tun sha1_ssse3 sha1_generic jitterentropy_rng drbg echainiv hmac xfrm_interface ah6 ah4 esp6 esp4 xfrm4_tunnel ipcomp ipcomp6 xfrm6_tunnel tunnel6 xfrm_ipcomp chacha20poly1305 cmac camellia_generic camellia_x86_64 ctr gcm ccm ecb xcbc cbc md5 sha256_generic sha512_generic des_generic libdes aesni_intel crypto_simd cryptd glue_helper xfrm_user xfrm_algo ip_vti ip_gre xt_comment xt_ndpi(O) xt_NFQUEUE xt_condition(O) xt_connbytes xt_NETMAP xt_REDIRECT xt_nat xt_MASQUERADE xt_set xt_policy ip_set_hash_net ip_set ipip tunnel4 xt_multiport 8021q dummy xt_owner xt_connmark xt_TCPMSS nf_nat_sip nf_nat_pptp nf_nat_h323 nf_nat_ftp nf_nat_irc nf_conntrack_ftp nf_conntrack_netlink nf_conntrack_irc ts_kmp nf_conntrack_pptp nf_conntrack_netbios_ns nf_conntr
 ack_snmp nf_conntrack_broadcast nf_conntrack_h323 nf_conntrack_sane nf_conntrack_sip nf_log_ipv4 nf_log_common xt_conntrack xt_tcpudp xt_mark ipt_REJECT nf_reject_ipv4 xt_LOG xt_limit bpfilter
SYSLOG warning kernel  nfnetlink_queue nfnetlink ip6table_filter ip6_tables iptable_mangle iptable_nat nf_nat iptable_filter ip_tables x_tables nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ppp_deflate bsd_comp ppp_generic slhc e1000 e1000e igb(O) hwmon usbhid xhci_pci ohci_pci ehci_pci xhci_hcd uhci_hcd ohci_hcd ehci_hcd usbcore usb_common dm_mod dax [last unloaded: nf_conntrack_tftp]
CR2: 0000000000000084
---[ end trace 06e9eb3bd1c6368f ]---
RIP: 0010:nf_conntrack_update (net/netfilter/nf_conntrack_core.c:2080 net/netfilter/nf_conntrack_core.c:2134) nf_conntrack
Code: 83 e5 07 49 8b 86 b8 00 00 00 48 85 c0 0f 84 e6 00 00 00 0f b6 10 84 d2 0f 84 db 00 00 00 48 01 d0 0f 84 d2 00 00 00 48 8b 00 <f6> 80 84 00 00 00 01 0f 84 c2 00 00 00 41 0f b7 46 32 66 83 f8 02
All code
========
   0:   83 e5 07                and    $0x7,%ebp
   3:   49 8b 86 b8 00 00 00    mov    0xb8(%r14),%rax
   a:   48 85 c0                test   %rax,%rax
   d:   0f 84 e6 00 00 00       je     0xf9
  13:   0f b6 10                movzbl (%rax),%edx
  16:   84 d2                   test   %dl,%dl
  18:   0f 84 db 00 00 00       je     0xf9
  1e:   48 01 d0                add    %rdx,%rax
  21:   0f 84 d2 00 00 00       je     0xf9
  27:   48 8b 00                mov    (%rax),%rax
  2a:*  f6 80 84 00 00 00 01    testb  $0x1,0x84(%rax)          <-- trapping instruction
  31:   0f 84 c2 00 00 00       je     0xf9
  37:   41 0f b7 46 32          movzwl 0x32(%r14),%eax
  3c:   66 83 f8 02             cmp    $0x2,%ax

Code starting with the faulting instruction
===========================================
   0:   f6 80 84 00 00 00 01    testb  $0x1,0x84(%rax)
   7:   0f 84 c2 00 00 00       je     0xcf
   d:   41 0f b7 46 32          movzwl 0x32(%r14),%eax
  12:   66 83 f8 02             cmp    $0x2,%ax
RSP: 0018:ffffc90000583890 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8881438fd600 RCX: 0000000000000000
RDX: 0000000000000060 RSI: ffff888151eb250c RDI: ffff888118f00000
RBP: ffffc90000583900 R08: 000000003198f1ab R09: ffffffff81ef7e40
R10: 0000000000000002 R11: ffff88815e4e8d80 R12: ffff888151eb2500
R13: 0000000000000002 R14: ffff888151eb2500 R15: ffffffff81ef7e40
FS:  00007f6c611f4380(0000) GS:ffff88827d380000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000084 CR3: 00000001550cc005 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Signed-off-by: Tijs Van Buggenhout <tijs.van.buggenhout@axsguard.com>
---
 net/netfilter/nf_conntrack_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntrack_core.c
index c4ccfec6cb98..d119f1d4c2fc 100644
--- a/net/netfilter/nf_conntrack_core.c
+++ b/net/netfilter/nf_conntrack_core.c
@@ -2260,6 +2260,9 @@ static int nf_confirm_cthelper(struct sk_buff *skb, struct nf_conn *ct,
 		return 0;
 
 	helper = rcu_dereference(help->helper);
+	if (!helper)
+		return 0;
+
 	if (!(helper->flags & NF_CT_HELPER_F_USERSPACE))
 		return 0;
 
-- 
2.37.4



