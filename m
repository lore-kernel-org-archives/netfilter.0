From: Mathew Heard <mat999@gmail.com>
Subject: Assistance to troubleshoot nf_nat bug
Date: Fri, 4 Dec 2020 18:53:43 +1100
Message-ID: <CAE5sJtQ42uT8mLr0k5OQ49Q67Zwv70fW=pUa_b5N+f-FkaC26w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3THMAu6OYNnrRHkFv+nlQZ4gwWw8J0HHDdMT1YY332Q=;
        b=rMAhErZQPFVUUSQFU5l/T81aCOQUc9c/+i+iW4YwWDQTsRASOB0jf5xyVAoaIwROia
         3vDdOpLfr4OoJWOkUokDUYWs/BO2C2tDkHlbuSI0WWZm14slz3v1cRhpFnz3hFxear1k
         zEIjJj5ihh6mFukABi/ED7h4uAdg3jouSpeAB+JNF3+1mRBXMHMbWnv59Ve9N0Eu8/eL
         9eJ4kFBxE9/YbByMHYNEwWujKnuuk5XNmQFgEbSmdwqu6WhENtomzvzWv4b+LDWAHHaH
         wUn7tggqQHMsr4ku+drcrZGwU5MCtDBgPQllGG8ev9NVMgBszLmDzjN6qbM/SvbOaMqr
         SEaQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

First let me say thank you. I'm at my wits end with this one, 1 week
in with very little understanding of it.

Report
[23931.226534] general protection fault, probably for non-canonical
address 0x567a6d51644d6bd5: 0000 [#1] SMP NOPTI
[23931.226681] CPU: 7 PID: 0 Comm: swapper/7 Tainted: G           O
  5.7.5+ #2
[23931.226820] Hardware name: Supermicro Super Server/X11SSL-F, BIOS
1.0b 12/29/2015
[23931.226988] RIP: 0010:get_unique_tuple+0xc7/0x750 [nf_nat]
[23931.227156] Code: 75 22 e9 c3 00 00 00 4d 8b b6 98 00 00 00 4d 85
f6 0f 84 b3 00 00 00 49 81 ee 98 00 00 00 0f 84 a6 00 00 00 41 0f b6
44 24 26 <41> 38 46 46 75 d7 49 8b 4e 20 49 8b 46 28 49 33 0c 24 49 33
44 24
[23931.227516] RSP: 0018:ffffc90000224b10 EFLAGS: 00010202
[23931.227707] RAX: 0000000000000006 RBX: 0000000000000000 RCX: ffffc9000165a000
[23931.227908] RDX: ffffffff820f4300 RSI: 00000000e7e71126 RDI: 0000000069808c21
[23931.228145] RBP: ffffc90000224b80 R08: 0000000000000000 R09: 0000000000000000
[23931.228356] R10: 00000000000001ff R11: 0000000000000000 R12: ffffc90000224b90
[23931.228572] R13: ffffc90000224bb8 R14: 567a6d51644d6bd5 R15: ffffc90000224c38
[23931.228794] FS:  0000000000000000(0000) GS:ffff888467bc0000(0000)
knlGS:0000000000000000
[23931.229026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[23931.229262] CR2: 00007ffc1ac6ef0a CR3: 000000000200a002 CR4: 00000000003606e0
[23931.229508] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[23931.229758] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[23931.230037] Call Trace:
[23931.230290]  <IRQ>
[23931.230546]  ? check_preempt_curr+0x7a/0x90
[23931.230807]  ? hash_ipport4_test+0x12f/0x150 [ip_set_hash_ipport]
[23931.231079]  nf_nat_setup_info+0x8a/0x260 [nf_nat]
[23931.231353]  ? dsthash_find+0x133/0x140 [xt_hashlimit]
[23931.231632]  xt_sdnat_target_v1+0xc6/0xcd [xt_SDNAT]
[23931.231918]  ? ipt_do_table+0x30a/0x6f0 [ip_tables]
[23931.232263]  ? ipt_do_table+0x3ca/0x6f0 [ip_tables]
[23931.232553]  ? nf_nat_inet_fn+0xea/0x210 [nf_nat]
[23931.232847]  ? nf_nat_ipv4_in+0x25/0x60 [nf_nat]
[23931.233267]  ? nf_hook_slow+0x44/0xc0
[23931.233566]  ? ip_rcv+0x91/0xd0
[23931.233866]  ? ip_rcv_finish_core.isra.18+0x400/0x400
[23931.234173]  ? __netif_receive_skb_one_core+0x85/0xa0
[23931.234484]  ? process_backlog+0xaa/0x160
[23931.234823]  ? net_rx_action+0x149/0x3c0
[23931.235150]  ? __do_softirq+0xdf/0x2e5
[23931.235461]  ? handle_irq_event_percpu+0x6d/0x80
[23931.235872]  ? irq_exit+0xa3/0xb0
[23931.236264]  ? do_IRQ+0x56/0xe0
[23931.236681]  ? common_interrupt+0xf/0xf
[23931.236993]  </IRQ>
[23931.237303]  ? cpuidle_enter_state+0xbe/0x3f0
[23931.237617]  ? cpuidle_enter+0x29/0x40
[23931.237930]  ? do_idle+0x22b/0x260
[23931.238282]  ? cpu_startup_entry+0x19/0x20
[23931.238703]  ? start_secondary+0x169/0x1c0
[23931.239103]  ? secondary_startup_64+0xa4/0xb0


I am aware that this kernel is tainted, it's tainted by xt_SDNAT
(https://github.com/splitice/xt_SDNAT). Despite my best efforts I have
not yet been able to make this happen in a testing environment (with
or without tainting).

  get_unique_tuple+0xc7/0x750 corresponds to same_src in:

 /* Only called for SRC manip */
static int
find_appropriate_src(struct net *net,
                     const struct nf_conntrack_zone *zone,
                     const struct nf_conntrack_tuple *tuple,
                     struct nf_conntrack_tuple *result,
                     const struct nf_nat_range2 *range)
{
        unsigned int h = hash_by_src(net, tuple);
        const struct nf_conn *ct;

        hlist_for_each_entry_rcu(ct, &nf_nat_bysource[h], nat_bysource) {
                if (same_src(ct, tuple) &&
                    net_eq(net, nf_ct_net(ct)) &&
                    nf_ct_zone_equal(ct, zone, IP_CT_DIR_ORIGINAL)) {
                        /* Copy source part from reply tuple. */
                        nf_ct_invert_tuple(result,
                                       &ct->tuplehash[IP_CT_DIR_REPLY].tuple);
                        result->dst = tuple->dst;

                        if (in_range(result, range))
                                return 1;
                }
        }
        return 0;
}


Does anyone have any ideas about what this could be?

Regards,
Mathew
