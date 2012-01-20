From: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Subject: Re: [xtables-addons] Oops in SYSRQ, BUG: unable to handle kernel
 paging request at ffffffffa01a90e0
Date: Fri, 20 Jan 2012 19:59:02 +0100
Message-ID: <c9933477d3435d4acdd00d7208d1c89f@mejor.pl>
References: <4F199ADB.5000204@mejor.pl>
 <alpine.LNX.2.01.1201201812130.29700@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version; bh=aUS9bz1YnqvCZvd6lM9kbKY0MX5c/rAVOQ1lVN6hSEE=;
	b=lMTrb61ZhPRg4AY8hj4QODhnnu6XU/dUTrutGmuJhgLjaeD8a5XqbJojSzd1o1EcKB3pad+B2CnHhJKS2aSPkHFLMQR28m0aCw2r+nL84A9QXubB/ar8QyTPqj1zkI3B;
In-Reply-To: <alpine.LNX.2.01.1201201812130.29700@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

W dniu 2012-01-20 18:14, Jan Engelhardt napisa=C5=82(a):
> You have a crappy module (indicated by the "C") loaded, and since=20
> it's
> zram, I don't know what effects that could have w.r.t. memory=20
> corruption.
> Is this reproducible without zram?

Hi Jan,
without zram/zcache oops still appears, new log:
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.235485] BUG:=20
unable to handle kernel paging request at ffffffffa01d80e
0
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.237586] IP:=20
[<ffffffff812a9451>] xt_find_target+0xa1/0x120
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.238616] PGD=20
1328067 PUD 132e063 PMD 1e29a063 PTE 0
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.240035] Oops:=20
0000 [#1] SMP
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.241398] CPU 0
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.241737] Modules=20
linked in: sit tunnel4 xt_TCPMSS ipt_REJECT xt_multipo
rt xt_set xt_TARPIT ip_set_hash_ip ip_set_hash_net sha1_generic=20
compat_xtables nf_conntrack_ipv6 nf_defrag_ipv6 ip6t_rt xt_st
ate xt_NOTRACK ip_set iptable_raw ip6table_mangle iptable_mangle=20
iptable_nat nf_nat nf_conntrack_ipv4 nf_conntrack nf_defrag_
ipv4 ip6table_filter ip6_tables iptable_filter ip_tables xfs exportfs=20
dm_mod ipv6 8139too evdev sr_mod cdrom 8139cp [last unl
oaded: xt_SYSRQ]
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436]
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] Pid:=20
4895, comm: iptables Not tainted 3.1.8-hardened #6 Xen HV
M domU
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] RIP:=20
0010:[<ffffffff812a9451>]  [<ffffffff812a9451>] xt_find_t
arget+0xa1/0x120
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] RSP:=20
0018:ffff880017f53c18  EFLAGS: 00010282
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] RAX:=20
ffffffffa01d80e0 RBX: ffff880017e59382 RCX: ffff880017e59
380
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] RDX:=20
0000000000000000 RSI: ffff880017e59388 RDI: ffff88001dcdf
e96
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] RBP:=20
ffff880017f53c68 R08: 0000000000000010 R09: ffff880017e59
758
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] R10:=20
0000000000000000 R11: 0000000000000010 R12: ffff88001dcdf
e80
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] R13:=20
ffff88001ea75910 R14: 0000000000000001 R15: 00000000fffff
ffe
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] FS: =20
000002c51ebe1700(0000) GS:ffff88001fc00000(0000) knlGS:00
00000000000000
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] CS: =20
0010 DS: 0000 ES: 0000 CR0: 0000000080050033
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] CR2:=20
ffffffffa01d80e0 CR3: 0000000001320000 CR4: 0000000000000
6b0
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] DR0:=20
0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] DR3:=20
0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] Process=20
iptables (pid: 4895, threadinfo ffff88001ebf6270, task ffff88001ebf5e80=
)
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] Stack:
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] =20
ffff880017f53c28 02a7b27e0ae1476c 00000000000000e0 ffff88001ea758e0
2012-01-20T18:54:48.808195+01:00 meteor kernel: [  115.243436] =20
ffff880017e59260 0000000000000002 ffff880017e59382 0000000000000001
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
0000000000000001 ffff88001d68c600 ffff880017f53c98 ffffffff812aa379
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] Call=20
Trace:
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff812aa379>] xt_request_find_target+0x29/0x80
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffffa0140389>] translate_table+0x389/0x660 [ip_tables]
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffffa0141e05>] do_ipt_set_ctl+0x1f5/0x2a0 [ip_tables]
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff812a8336>] nf_sockopt+0x66/0xc0
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff812a83cc>] nf_setsockopt+0x1c/0x30
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff812b9d34>] ip_setsockopt+0x94/0xb0
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff812d6fe5>] raw_setsockopt+0x25/0x50
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff8126e35c>] sock_common_setsockopt+0x1c/0x30
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff8126d237>] sys_setsockopt+0x87/0xf0
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] =20
[<ffffffff81311e7b>] system_call_fastpath+0x18/0x1d
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] Code: 4d=
=20
8b 24 24 4d 39 e5 74 71 49 8d 7c 24 10 48 89 de e8 d4 5c f2 ff 85 c0 75=
=20
e6 45 38 74 24 2d 75 d9 49 8b 44 24 58 48 85 c0 74 1e
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] RIP =20
[<ffffffff812a9451>] xt_find_target+0xa1/0x120
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436]  RSP=20
<ffff880017f53c18>
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] CR2:=20
ffffffffa01d80e0
2012-01-20T18:54:48.818199+01:00 meteor kernel: [  115.243436] ---[ end=
=20
trace cfa32e0ddddcd297 ]---

