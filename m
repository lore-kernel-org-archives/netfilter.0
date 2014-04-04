From: Slava Bendersky <volga629@networklab.ca>
Subject: geoip
Date: Fri, 4 Apr 2014 10:25:13 -0400 (EDT)
Message-ID: <1635200393.3403823.1396621513872.JavaMail.zimbra@skillsearch.ca>
References: <395765389.3403708.1396621479269.JavaMail.zimbra@skillsearch.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <395765389.3403708.1396621479269.JavaMail.zimbra@skillsearch.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello Everyone,
My system rhel 6.5. Trying run xtables addons version 1.47. Module geoip constantly crash kernel. Looking for suggestions about it. This is physical dell r410 server. Same kernel and same rpm xtables addons on vmware run fine no issues.

[root@ottprodsgw01 ~]# rpm -qa | grep xtables
xtables-addons-1.47.1-4.el6.x86_64

pr  3 22:56:36 ottprodsgw01 kernel: [   12.926987] ip6_tables: (C) 2000-2006 Netfilter Core Team
Apr  3 22:56:36 ottprodsgw01 kernel: [   12.983747] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.193231] Disabling lock debugging due to kernel taint
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195045] vmalloc: allocation failure: 0 bytes
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195050] iptables-restor: page allocation failure: order:0, mode:0xd2
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195054] Pid: 913, comm: iptables-restor Tainted: G           O 3.2.2-10.nl.el6.x8
6_64 #1
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195057] Call Trace:
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195066]  [<ffffffff8114a273>] warn_alloc_failed+0xf3/0x160
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195072]  [<ffffffff81060cc3>] ? __wake_up+0x53/0x70
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195078]  [<ffffffffa00df641>] ? xt_geoip_mt_checkentry+0x161/0x2bc [xt_geoip]
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195084]  [<ffffffff8117ab26>] __vmalloc_node_range+0x1a6/0x250
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195090]  [<ffffffff811683dc>] ? might_fault+0x5c/0xb0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195095]  [<ffffffff8117ac05>] __vmalloc_node+0x35/0x40
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195100]  [<ffffffffa00df641>] ? xt_geoip_mt_checkentry+0x161/0x2bc [xt_geoip]
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195104]  [<ffffffff8117ae3c>] vmalloc+0x2c/0x30
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195109]  [<ffffffffa00df641>] xt_geoip_mt_checkentry+0x161/0x2bc [xt_geoip]
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195116]  [<ffffffff81574564>] ? xt_find_match+0x44/0x260
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195121]  [<ffffffff815750fc>] xt_check_match+0xac/0x1e0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195125]  [<ffffffff8157463f>] ? xt_find_match+0x11f/0x260
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195131]  [<ffffffff810a84bf>] ? local_clock+0x6f/0x80
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195137]  [<ffffffff815d41f4>] translate_table+0x4d4/0x6c0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195142]  [<ffffffff815d600e>] do_ipt_set_ctl+0x13e/0x1b0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195147]  [<ffffffff8157314b>] nf_sockopt+0x5b/0xa0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195151]  [<ffffffff815731d1>] nf_setsockopt+0x21/0x30
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195157]  [<ffffffff81587c6c>] ip_setsockopt+0x8c/0xa0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195162]  [<ffffffff815a8f16>] raw_setsockopt+0x16/0x30
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195168]  [<ffffffff8152b954>] sock_common_setsockopt+0x14/0x20
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195173]  [<ffffffff81527baf>] sys_setsockopt+0x7f/0xe0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195179]  [<ffffffff81670f02>] system_call_fastpath+0x16/0x1b
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195182] Mem-Info:
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195185] Node 0 DMA per-cpu:
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195188] CPU    0: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195191] CPU    1: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195194] CPU    2: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195197] CPU    3: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195199] CPU    4: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195202] CPU    5: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195205] CPU    6: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195207] CPU    7: hi:    0, btch:   1 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195210] Node 0 DMA32 per-cpu:
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195213] CPU    0: hi:  186, btch:  31 usd: 174
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195216] CPU    1: hi:  186, btch:  31 usd: 175
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195219] CPU    2: hi:  186, btch:  31 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195222] CPU    3: hi:  186, btch:  31 usd:  29
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195224] CPU    4: hi:  186, btch:  31 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195227] CPU    5: hi:  186, btch:  31 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195230] CPU    6: hi:  186, btch:  31 usd:  30
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195232] CPU    7: hi:  186, btch:  31 usd:   0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195235] Node 0 Normal per-cpu:
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195238] CPU    0: hi:  186, btch:  31 usd: 180
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195241] CPU    1: hi:  186, btch:  31 usd: 183
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195244] CPU    2: hi:  186, btch:  31 usd: 167
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195246] CPU    3: hi:  186, btch:  31 usd:  10
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195249] CPU    4: hi:  186, btch:  31 usd: 156
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195252] CPU    5: hi:  186, btch:  31 usd:  99
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195255] CPU    6: hi:  186, btch:  31 usd:  54
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195258] CPU    7: hi:  186, btch:  31 usd: 112
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195264] active_anon:610 inactive_anon:35 isolated_anon:0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195265]  active_file:1939 inactive_file:3611 isolated_file:0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195267]  unevictable:426 dirty:18 writeback:0 unstable:0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195268]  free:1970745 slab_reclaimable:5004 slab_unreclaimable:13204
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195269]  mapped:892 shmem:40 pagetables:105 bounce:0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195272] Node 0 DMA free:15876kB min:128kB low:160kB high:192kB active_anon:0kB in
active_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:15652kB mlock
ed:0kB dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:32kB kernel_stack:0kB pagetables:
0kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195286] lowmem_reserve[]: 0 3235 8023 8023
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195292] Node 0 DMA32 free:3287884kB min:27200kB low:34000kB high:40800kB active_a
non:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:331
3380kB mlocked:0kB dirty:0kB writeback:0kB mapped:4kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:0kB kernel_stack:0kB
pagetables:0kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195305] lowmem_reserve[]: 0 0 4788 4788
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195311] Node 0 Normal free:4579220kB min:40252kB low:50312kB high:60376kB active_
anon:2440kB inactive_anon:140kB active_file:7756kB inactive_file:14444kB unevictable:1704kB isolated(anon):0kB isolated(file)
:0kB present:4902912kB mlocked:0kB dirty:72kB writeback:0kB mapped:3564kB shmem:160kB slab_reclaimable:20016kB slab_unreclaim
able:52784kB kernel_stack:928kB pagetables:420kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
 no
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195325] lowmem_reserve[]: 0 0 0 0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195331] Node 0 DMA: 1*4kB 0*8kB 0*16kB 0*32kB 2*64kB 1*128kB 1*256kB 0*512kB 1*10
24kB 1*2048kB 3*4096kB = 15876kB
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195347] Node 0 DMA32: 9*4kB 7*8kB 7*16kB 4*32kB 8*64kB 2*128kB 7*256kB 2*512kB 5*
1024kB 5*2048kB 798*4096kB = 3287884kB
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195362] Node 0 Normal: 19*4kB 6*8kB 7*16kB 96*32kB 77*64kB 41*128kB 27*256kB 22*5
12kB 9*1024kB 2*2048kB 1107*4096kB = 4579244kB
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195378] 6021 total pagecache pages
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195381] 0 pages in swap cache
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195383] Swap cache stats: add 0, delete 0, find 0/0
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195386] Free swap  = 8175612kB
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.195388] Total swap = 8175612kB
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.220356] 2097136 pages RAM
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.220359] 73500 pages reserved
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.220361] 2984 pages shared
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.220363] 49320 pages non-shared
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.220379] xt_geoip: unable to load 'CN' into memory: -12
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.944626] bnx2 0000:01:00.1: em2: using MSIX
Apr  3 22:56:36 ottprodsgw01 kernel: [   13.946210] ADDRCONF(NETDEV_UP): em2: link is not ready
Apr  3 22:56:37 ottprodsgw01 kernel: [   17.693977] bnx2 0000:01:00.1: em2: NIC Copper Link is Up, 1000 Mbps full duplex
Apr  3 22:56:37 ottprodsgw01 kernel: [   17.695253] ADDRCONF(NETDEV_CHANGE): em2: link becomes ready
Apr  3 22:56:42 ottprodsgw01 kamailio: WARNING: <core> [socket_info.c:1397]: fix_hostname(): WARNING: fix_hostname: could not
 rev. resolve 10.237.249.16
Apr  3 22:56:42 ottprodsgw01 kamailio: WARNING: <core> [socket_info.c:1397]: fix_hostname(): WARNING: fix_hostname: could not
 rev. resolve 10.237.249.16
Apr  3 22:56:42 ottprodsgw01 kamailio: INFO: <core> [tcp_main.c:4836]: init_tcp(): init_tcp: using epoll_lt as the io watch m
ethod (auto detected)
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: rr [../outbound/api.h:54]: ob_load_api(): Failed to import bind_
ob
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: rr [rr_mod.c:159]: mod_init(): outbound module not available
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: usrloc [hslot.c:53]: ul_init_locks(): locks array size 512
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: <core> [udp_server.c:176]: probe_max_receive_buffer(): INFO: udp
_init: SO_RCVBUF is initially 229376
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: <core> [udp_server.c:227]: probe_max_receive_buffer(): INFO: udp
_init: SO_RCVBUF is finally 262142
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: <core> [udp_server.c:176]: probe_max_receive_buffer(): INFO: udp
_init: SO_RCVBUF is initially 229376
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1238]: INFO: <core> [udp_server.c:227]: probe_max_receive_buffer(): INFO: udp
_init: SO_RCVBUF is finally 262142
Apr  3 22:56:42 ottprodsgw01 /usr/sbin/kamailio[1250]: INFO: ctl [io_listener.c:225]: io_listen_loop(): io_listen_loop:  usin
g epoll_lt io watch method (config)
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556782] vmalloc: allocation failure: 0 bytes
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556786] iptables-restor: page allocation failure: order:0, mode:0xd2
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556791] Pid: 1372, comm: iptables-restor Tainted: G           O 3.2.2-10.nl.el6.x
86_64 #1
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556794] Call Trace:
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556803]  [<ffffffff8114a273>] warn_alloc_failed+0xf3/0x160
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556809]  [<ffffffff81574564>] ? xt_find_match+0x44/0x260
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556816]  [<ffffffffa00df641>] ? xt_geoip_mt_checkentry+0x161/0x2bc [xt_geoip]
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556822]  [<ffffffff8117ab26>] __vmalloc_node_range+0x1a6/0x250
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556827]  [<ffffffff811683dc>] ? might_fault+0x5c/0xb0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556831]  [<ffffffff8117ac05>] __vmalloc_node+0x35/0x40
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556836]  [<ffffffffa00df641>] ? xt_geoip_mt_checkentry+0x161/0x2bc [xt_geoip]
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556841]  [<ffffffff8117ae3c>] vmalloc+0x2c/0x30
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556846]  [<ffffffffa00df641>] xt_geoip_mt_checkentry+0x161/0x2bc [xt_geoip]
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556851]  [<ffffffff81574564>] ? xt_find_match+0x44/0x260
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556856]  [<ffffffff815750fc>] xt_check_match+0xac/0x1e0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556860]  [<ffffffff8157463f>] ? xt_find_match+0x11f/0x260
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556866]  [<ffffffff815d41f4>] translate_table+0x4d4/0x6c0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556872]  [<ffffffff815d600e>] do_ipt_set_ctl+0x13e/0x1b0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556876]  [<ffffffff8157314b>] nf_sockopt+0x5b/0xa0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556881]  [<ffffffff815731d1>] nf_setsockopt+0x21/0x30
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556887]  [<ffffffff81587c6c>] ip_setsockopt+0x8c/0xa0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556892]  [<ffffffff815a8f16>] raw_setsockopt+0x16/0x30
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556899]  [<ffffffff8152b954>] sock_common_setsockopt+0x14/0x20
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556904]  [<ffffffff81527baf>] sys_setsockopt+0x7f/0xe0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556910]  [<ffffffff81670f02>] system_call_fastpath+0x16/0x1b
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556913] Mem-Info:
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556915] Node 0 DMA per-cpu:
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556919] CPU    0: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556922] CPU    1: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556925] CPU    2: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556927] CPU    3: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556930] CPU    4: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556933] CPU    5: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556935] CPU    6: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556938] CPU    7: hi:    0, btch:   1 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556940] Node 0 DMA32 per-cpu:
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556944] CPU    0: hi:  186, btch:  31 usd: 174
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556947] CPU    1: hi:  186, btch:  31 usd: 175
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556949] CPU    2: hi:  186, btch:  31 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556952] CPU    3: hi:  186, btch:  31 usd:  29
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556955] CPU    4: hi:  186, btch:  31 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556958] CPU    5: hi:  186, btch:  31 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556960] CPU    6: hi:  186, btch:  31 usd:  30
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556963] CPU    7: hi:  186, btch:  31 usd:   0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556965] Node 0 Normal per-cpu:
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556969] CPU    0: hi:  186, btch:  31 usd:  96
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556972] CPU    1: hi:  186, btch:  31 usd: 137
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556974] CPU    2: hi:  186, btch:  31 usd: 124
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556977] CPU    3: hi:  186, btch:  31 usd: 108
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556980] CPU    4: hi:  186, btch:  31 usd: 120
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556982] CPU    5: hi:  186, btch:  31 usd: 125
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556985] CPU    6: hi:  186, btch:  31 usd: 103
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556988] CPU    7: hi:  186, btch:  31 usd: 160
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556994] active_anon:3256 inactive_anon:705 isolated_anon:0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556995]  active_file:3242 inactive_file:6981 isolated_file:0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556996]  unevictable:0 dirty:0 writeback:0 unstable:0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556998]  free:1958281 slab_reclaimable:5588 slab_unreclaimable:16296
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.556999]  mapped:2400 shmem:710 pagetables:1047 bounce:0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557002] Node 0 DMA free:15876kB min:128kB low:160kB high:192kB active_anon:0kB in
active_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:15652kB mlock
ed:0kB dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:32kB kernel_stack:0kB pagetables:
0kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557015] lowmem_reserve[]: 0 3235 8023 8023
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557039] Node 0 DMA32 free:3287884kB min:27200kB low:34000kB high:40800kB active_a
non:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:331
3380kB mlocked:0kB dirty:0kB writeback:0kB mapped:4kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:0kB kernel_stack:0kB
pagetables:0kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557059] lowmem_reserve[]: 0 0 4788 4788
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557073] Node 0 Normal free:4529364kB min:40252kB low:50312kB high:60376kB active_
anon:13024kB inactive_anon:2820kB active_file:12968kB inactive_file:27924kB unevictable:0kB isolated(anon):0kB isolated(file)
:0kB present:4902912kB mlocked:0kB dirty:0kB writeback:0kB mapped:9596kB shmem:2840kB slab_reclaimable:22352kB slab_unreclaim
able:65152kB kernel_stack:1176kB pagetables:4188kB unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimabl
e? no
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557094] lowmem_reserve[]: 0 0 0 0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557106] Node 0 DMA: 1*4kB 0*8kB 0*16kB 0*32kB 2*64kB 1*128kB 1*256kB 0*512kB 1*10
24kB 1*2048kB 3*4096kB = 15876kB
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557137] Node 0 DMA32: 9*4kB 7*8kB 7*16kB 4*32kB 8*64kB 2*128kB 7*256kB 2*512kB 5*
1024kB 5*2048kB 798*4096kB = 3287884kB
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557166] Node 0 Normal: 13*4kB 5*8kB 10*16kB 3*32kB 6*64kB 5*128kB 11*256kB 23*512
kB 10*1024kB 1*2048kB 1099*4096kB = 4529756kB
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557196] 10939 total pagecache pages
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557200] 0 pages in swap cache
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557205] Swap cache stats: add 0, delete 0, find 0/0
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557209] Free swap  = 8175612kB
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.557212] Total swap = 8175612kB
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.582387] 2097136 pages RAM
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.582390] 73500 pages reserved
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.582392] 13539 pages shared
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.582394] 59362 pages non-shared
Apr  3 22:58:22 ottprodsgw01 kernel: [  122.582411] xt_geoip: unable to load 'CA' into memory: -12

Slava.
