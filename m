From: "robee" <mlody@elpec.com>
Subject: BUG: soft lockup detected on CPU#0!
Date: Tue, 6 Jun 2006 15:06:43 +0200
Message-ID: <008801c6896a$12e1bb80$0e01050a@robee>
Reply-To: robee <mlody@elpec.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

i'm using iptables-1.3.5 with kernel-2.6.16.18 with SMP, pppd-2.4.3, 
rp-pppoe-3.8 in kernel mode
Xeon 3GHz, 2GB RAM
iptables rules are present in /etc/ppp/ip-up.local
sometimes i get kernel log looks like:
<----
Jun  5 18:47:55 jowisz kernel: BUG: soft lockup detected on CPU#0!
Jun  5 18:47:55 jowisz kernel:
Jun  5 18:47:55 jowisz kernel: Pid: 14746, comm:                 pppd
Jun  5 18:47:55 jowisz kernel: EIP: 0060:[<f8c4f6c7>] CPU: 0
Jun  5 18:47:55 jowisz kernel: EIP is at ipt_do_table+0xc0/0x2ed [ip_tables]
Jun  5 18:47:55 jowisz kernel:  EFLAGS: 00000246    Not tainted  (2.6.16.18 
#3)
Jun  5 18:47:55 jowisz kernel: EAX: ffffffff EBX: f8c91600 ECX: 00000000 
EDX:
f7855001
Jun  5 18:47:55 jowisz kernel: ESI: f8dd2dc4 EDI: eedce038 EBP: 00000070 DS:
007b ES: 007b
Jun  5 18:47:55 jowisz kernel: CR0: 8005003b CR2: 08085d10 CR3: 026ffa20 
CR4:
000006f0
Jun  5 18:47:55 jowisz kernel:  [<f8962017>] ipt_hook+0x17/0x1c
[iptable_filter]
Jun  5 18:47:55 jowisz kernel:  [<c028a37c>] nf_iterate+0x2e/0x5f
Jun  5 18:47:55 jowisz kernel:  [<c0291ab8>] ip_forward_finish+0x0/0x31
Jun  5 18:47:55 jowisz kernel:  [<c028a460>] nf_hook_slow+0x38/0xc0
Jun  5 18:47:55 jowisz kernel:  [<c0291ab8>] ip_forward_finish+0x0/0x31
Jun  5 18:47:55 jowisz kernel:  [<c0291c81>] ip_forward+0x198/0x233
Jun  5 18:47:55 jowisz kernel:  [<c0291ab8>] ip_forward_finish+0x0/0x31
Jun  5 18:47:55 jowisz kernel:  [<c0290bb5>] ip_rcv+0x404/0x47f
Jun  5 18:47:55 jowisz kernel:  [<c02797a4>] netif_receive_skb+0x309/0x347
Jun  5 18:47:55 jowisz kernel:  [<c0279859>] process_backlog+0x77/0xe4
Jun  5 18:47:55 jowisz kernel:  [<c027827f>] net_rx_action+0x98/0x151
Jun  5 18:47:55 jowisz kernel:  [<c011eee8>] __do_softirq+0x58/0xc0
Jun  5 18:47:55 jowisz kernel:  [<c010525b>] do_softirq+0x46/0x4e
Jun  5 18:47:55 jowisz kernel:  =======================
Jun  5 18:47:55 jowisz kernel:  [<c011ebce>] local_bh_enable+0x5b/0x66
Jun  5 18:47:55 jowisz kernel:  [<c028cc3b>] rt_run_flush+0x63/0xad
Jun  5 18:47:55 jowisz kernel:  [<c02b339b>] ip_mc_dec_group+0x83/0x9c
Jun  5 18:47:55 jowisz kernel:  [<c02af76a>] inetdev_event+0x141/0x294
Jun  5 18:47:55 jowisz kernel:  [<c028b7d3>] ipv4_dst_ifdown+0x0/0x4c
Jun  5 18:47:55 jowisz kernel:  [<c02ce273>] notifier_call_chain+0x15/0x25
Jun  5 18:47:56 jowisz kernel:  [<c02776ec>] dev_close+0x5e/0x62
Jun  5 18:47:56 jowisz kernel:  [<c027751f>] dev_change_flags+0x46/0xe7
Jun  5 18:47:56 jowisz kernel:  [<c02afc5f>] devinet_ioctl+0x24b/0x561
Jun  5 18:47:56 jowisz kernel:  [<c026fb1c>] sock_ioctl+0x1e0/0x208
Jun  5 18:47:56 jowisz kernel:  [<c026f93c>] sock_ioctl+0x0/0x208
Jun  5 18:47:56 jowisz kernel:  [<c0163170>] do_ioctl+0x1c/0x5d
Jun  5 18:47:56 jowisz kernel:  [<c0163400>] vfs_ioctl+0x24f/0x262
Jun  5 18:47:56 jowisz kernel:  [<c0163459>] sys_ioctl+0x46/0x5d
Jun  5 18:47:56 jowisz kernel:  [<c0103337>] sysenter_past_esp+0x54/0x75
<----

anybody can help?

robert 


