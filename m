Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339024642B
	for <netfilter@vger.kernel.org>; Mon,  6 May 2024 03:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714967878; cv=none; b=AsoN2moimIIjCXgkRNwquRqSqZ/ePkAz2diasMh9tycrn3wiNY//G4Cs6J2m7RoPRaXe6oC2c0xTlvzLxKPE8icaw1ERjnr6vgmioia1NyCKfjuhchZOynUvnn2aYB+XrYlgEzDjjUcGoSl+RkDFrZSZ74N+SovB/tX4YOfszUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714967878; c=relaxed/simple;
	bh=WNb9pk+29uoiMnrZmVIK37c25sNu0kr1WJTSXCRboU8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tU46M5cxMaQW8OseNpMp9st7TGNdnEl6HoqBvb2ogTVDzFwHuhDa5of3TUJFXSriQsbi2a+/U2mhXNlqqCIWzsFg0GqdKKUcONRujLWtaL7TtWDKDXGK6qDNLwuTHcagLpd2LEAwI6EzWYNo/H1maCCQmi6MNhqMcq80lF2zKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQKV7WGS; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQKV7WGS"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so18606261fa.3
        for <netfilter@vger.kernel.org>; Sun, 05 May 2024 20:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714967874; x=1715572674; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T8CnCe9Aagz33Dtnds2ZhakGAa2yZWBwDruHZCH9IWc=;
        b=NQKV7WGSOVaYwNIVPvuNH/2y05hwgbXUDFr5A6qoYZNBmVmYAAOvefcrUDvASrUiZ/
         rSdLQHOemTFBi8HU34YVo238U+VqdureE3/m1+djJHNp9C8HmtGunLBh4m2a1FKv+RUK
         vAid3KrSDndO9e5bZiwPWk0Z4sprfdzu8BrciNPdfHJoXJv04KJxbW5tGZXjXpXvdDro
         mM8enAeIrznfFT4fjhykdu0IjLf0JUTLG+aqx4TYmsLnk93cZ2BHSSljSXw+ZTXoZAty
         OzneQxqO6IK1RKcULL9qoEh5dqcK7PsIxe6f78BTxxabgG5J+vBPLok1WItHV2MPLcik
         8s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714967874; x=1715572674;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8CnCe9Aagz33Dtnds2ZhakGAa2yZWBwDruHZCH9IWc=;
        b=nLHU7K6UVzhp9IF0Sxk0GMrDu0N6nWzBud9IuubEvBlE7ZT6Bgr6h5auCmmKz9NsIb
         VJQ5UwukCo5R36wWniGokkV5dvyQifVFWIwW3EADzqe2KlnlGYckGqGiA8Fw59N8gOwQ
         VWXaBH5NBce9TPFA1b0Z4RMTJz1SM+YRydWxLcQR+6ZI5HcbXh/5EkPUV/aKyP17WfWl
         9Zva9Kms29g97DmAjgD5EqPPNr4ywLE+m7wqr12s48V975nO141Db1Glcp5WIRXmOIl1
         42nsAGmFzq64xsgyFHbu23ray5xCdwxfgEB3X11mNkYZF8rMQiwIxFDofSPKShyWtSYE
         s+mg==
X-Gm-Message-State: AOJu0YxsxzTRKJIxwauMMwtdIjnblYP2ayswXE6IF+bPDpcLrM4KZXDD
	Bhx7ibIv/+vKck9dUJobNw6LhQz6CdKbJsKHTuFzDEvfOcMZ4dhUvEtv3mB+1wbAfPe2KBdOK8S
	2E57UKPKYR/ZxTa3aX6xukIDxObUKYWk2ZosW3w==
X-Google-Smtp-Source: AGHT+IGfn7w5Cp8RozhhrWnoCBjSeT4atpYAri/yX269A3sEF7SOdwroT4kdQZK1viHI+Z9gtfsC1juxHd781vpNpTo=
X-Received: by 2002:a2e:9557:0:b0:2dd:ae3d:dcee with SMTP id
 t23-20020a2e9557000000b002ddae3ddceemr4541910ljh.51.1714967873819; Sun, 05
 May 2024 20:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: shibu samuel <msshibu@gmail.com>
Date: Mon, 6 May 2024 09:27:43 +0530
Message-ID: <CAKon4rta5-Nynqh71LCHVo6mJKKD+ZNz447NebsjMnoNuz6Ogg@mail.gmail.com>
Subject: Kernel panic in nf_nat_setup_info, with re injected packet from libnfml
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello All,

We are seeing a kernel panic, while using application which
"reinjects" packets to kernel using, libnfml.

Below the brief view of the setup. Linux 5.14 Kernel, libnfml version 1.0.4)

- an LXC container based application is listening for certain packets,
using libnfml netlink sockets.
- In the HOST iptables rule, certain rules are written to push to the
queue via below iptables actions
   "-j NFQUEUE --queue-num 0 --queue-bypass"
- The container based application examines the packet and then either
a) Drops the packet by setting NF_DROP verdit
or
b) Reinjects back to kernel with NF_REPAT verdict.


The issue is randomly reproducible, the setup has various sort of
traffic (DNS, HTTP, HTTPS and multicast)

Below is the call stack we got from the Kernel Panic. (include the
KASAD dump as well)

root@Beacon 10:/# [ 8927.212608]
==================================================================
[ 8927.212650] BUG: KASAN: wild-memory-access in
nf_nat_setup_info+0x170/0xb10 [nf_nat]
[ 8927.218715] Read of size 1 at addr 646f636e652031de by task fstunnel/5303
[ 8927.226609]
[ 8927.233293] CPU: 3 PID: 5303 Comm: fstunnel Tainted: P        W
    5.4.164 #0
[ 8927.234858] Hardware name: Qualcomm Technologies, Inc.
IPQ9574/AP-AL02-C2 (DT)
[ 8927.242234] Call trace:
[ 8927.249441]  dump_backtrace+0x0/0x1a8
[ 8927.251784]  show_stack+0x14/0x1c
[ 8927.255604]  dump_stack+0xe0/0x138
[ 8927.258902]  __kasan_report+0x18c/0x1c4
[ 8927.262197]  kasan_report+0xc/0x14
[ 8927.265931]  __asan_load1+0x58/0x60
[ 8927.269409]  nf_nat_setup_info+0x170/0xb10 [nf_nat]
[ 8927.272792]  nf_nat_masquerade_ipv4+0x198/0x1d0 [nf_nat]
[ 8927.277653]  0xffffffd00a1100fc
[ 8927.283208]  ipt_do_table+0x740/0xa50 [ip_tables]
[ 8927.286071]  0xffffffd009d1003c
[ 8927.290933]  nf_nat_inet_fn+0x184/0x67c [nf_nat]
[ 8927.293887]  nf_nat_icmp_reply_translation+0x2e0/0x804 [nf_nat]
[ 8927.298748]  nf_nat_icmp_reply_translation+0x6fc/0x804 [nf_nat]
[ 8927.304389]  nf_hook_slow+0x54/0xdc
[ 8927.310290]  ip_output+0x1e0/0x23c
[ 8927.313761]  ip_forward_finish+0xe4/0xf8
[ 8927.317233]  nf_reinject+0x220/0x2b0
[ 8927.321313]  0xffffffd009f58188
[ 8927.324870]  0xffffffd009f59560
[ 8927.327740]  nfnetlink_unicast+0x324/0x500 [nfnetlink]
[ 8927.330865]  netlink_rcv_skb+0xdc/0x16c
[ 8927.336073]  nfnetlink_subsys_register+0xb54/0xb80 [nfnetlink]
[ 8927.339805]  netlink_unicast+0x1d4/0x2a4
[ 8927.345706]  netlink_sendmsg+0x3c8/0x460
[ 8927.349787]  sock_sendmsg+0x4c/0x68
[ 8927.353690]  __sys_sendto+0xcc/0x118
[ 8927.356902]  __arm64_sys_sendto+0x74/0x8c
[ 8927.360725]  el0_svc_common.constprop.0+0xdc/0x188
[ 8927.364630]  el0_svc_compat_handler+0x2c/0x38
[ 8927.369317]  el0_svc_compat+0x8/0x18
[ 8927.373741] ==================================================================
[ 8927.377448] Unable to handle kernel paging request at virtual
address 006f636e652031de
[ 8927.384443] Mem abort info:
[ 8927.392341]   ESR = 0x96000004
[ 8927.395010]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 8927.398142]   SET = 0, FnV = 0
[ 8927.403617]   EA = 0, S1PTW = 0
[ 8927.406466] Data abort info:
[ 8927.409504]   ISV = 0, ISS = 0x00000004
[ 8927.412649]   CM = 0, WnR = 0
[ 8927.416190] [006f636e652031de] address between user and kernel address ranges
[ 8927.419320] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[ 8927.426434] Modules linked in: nf_nat_pptp nf_nat_rtsp nf_nat_sip
nf_nat_h323 nf_nat_tftp nf_nat_ftp ecm_wifi_plugin ecm_ovs ecm
smart_antenna(P) ath_pog(P) monitor wifi_3_0 qca_ol qca_spectral umac
qdf mem_manager nf_flow_table_ipv6 nf_flow_table_ipv4
nf_flow_table_inet ipt_REJECT ebtable_nat ebtable_fir ebtable_broute
xt_time xt_tcpudp xt_tcpmss xt_string xt_statistic xt_state xt_recent
xt_quota xt_policy xt_pkttype xt_physdev xt_owner xt_nat
xt_multipoxt_mark xt_mac xt_limit xt_length xt_iprange xt_hl xt_helper
xt_hashlimit xt_esp xt_ecn xt_dscp xt_conntrack xt_connmark
xt_connlimit xt_connbytes xt_comm xt_bpf xt_addrtype xt_TCPMSS
xt_REDIRECT xt_NFQUEUE xt_NFLOG xt_MASQUERADE xt_LOG xt_IPMARK xt_HL
xt_FLOWOFFLOAD xt_DSCP xt_CT xt_CLASSIFY wireguard ts_fts_bm pppoe
ppp_mppe ppp_async nft_reject_ipv6 nft_reject_ipv4 nft_reject_inet
nft_reject nft_redir nft_quota nft_numgen nft_nat nft_masq nft_log
nft_limift_fwd_netdev nft_flow_offload nft_dup_netdev nft_ct
nft_counter
[ 8927.426555]  nfnetlink_queue nfnetlink_log nf_tables nf_reject_ipv4
nf_nat_snmp_basic nf_nat_irc nf_nat_amanda nf_log_ipv4
nf_flow_table_hw nf_flow_tabnf_dup_netdev nf_conntrack_tftp
nf_conntrack_snmp nf_conntrack_sip nf_conntrack_rtsp
nf_conntrack_rtcache nf_conntrack_pptp nf_conntrack_netlink
nf_conntr_irc nf_conntrack_h323 nf_conntrack_ftp
nf_conntrack_broadcast ts_kmp nf_conntrack_amanda l2tp_ppp iptable_raw
iptable_nat iptable_mangle iptable_filter iah ipt_TRIGGER ipt_ECN
ip6table_raw ip_tables ebtables ebt_vlan ebt_stp ebt_snat ebt_redirect
ebt_pkttype ebt_mark_m ebt_mark ebt_limit ebt_ip6 ebt_ip ebtat
ebt_arpreply ebt_arp ebt_among ebt_802_3 compat_xtables
arptable_filter arpt_mangle arp_tables sch_teql sch_sfq sch_red
sch_prio sch_pie sch_multiq sched sch_fq sch_dsmark sch_codel sch_cake
em_text em_nbyte em_meta em_cmp act_simple act_police act_pedit
act_ipt act_gact act_csum act_connmark sch_tbf schgress sch_htb
sch_hfsc em_u32 cls_u32 cls_tcindex cls_route
[ 8927.497197]  cls_matchall cls_fw cls_flow cls_basic act_skbedit
act_mirred ledtrig_singletimer qca_nss_macsec qca_mcs diagchar
usb_f_diag crc_ccitt qcas_ppe_bridge_mgr qca_nss_ppe_vlan
hyfi_bridging libcomposite qca_ovsmgr openvswitch nf_nat nf_conncount
libcrc32c emesh_sp cryptodev xt_set
ip_set_list_sep_set_hash_netportnet ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_netiface ip_set_hash_net
ip_set_hash_mac ip_set_hash_ipportnet
ip_set_hash_ipportip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6t_rt ip6t_mh ip6t_ipv6hea ip6t_hbh ip6t_frag ip6t_eui64
ip6t_ah nf_log_ipv6 nf_log_common ip6table_mangle ip6table_filter
ip6_tables ip6t_REJECT x_tables nf_reject_ipv6 msdos bond ip6_gre
ip_gre ifb nat46 sit l2tp_netlink l2tp_core ip6_tunnel qca_nss_dp
tunnel6 tunnel4 ip_tunnel veth tun qca_ssdk xfrm_algo hcfg_core vfat
fat ntfs es_drv cfg80211 nls_utf8 nls_iso8859_1 nls_cp437 vxlan
udp_tunnel
[ 8927.584351]  ip6_udp_tunnel nsh qseecom qca_nss_sfe md5 authenc
kmsg fuse ipq_cnss2 uas usb_storage leds_gpio bootconfig xhci_plat_hcd
xhci_pci xhci_hcwc3 dwc3_qcom phy_qcom_qusb2 ahci libahci libata
sd_mod scsi_mod ops_conntrack6 ops_conntrack4 nf_conntrack pptp pppox
ppp_generic slhc nf_defrag_ipv6 nf_rag_ipv4 gre gpio_button_hotplug
button_hotplug input_core nandri udc_core usbcore nls_base usb_common
[last unloaded: nf_nat_pptp]
[ 8927.710548] CPU: 3 PID: 5303 Comm: fstunnel Tainted: P    B   W
    5.4.164 #0
[ 8927.732774] Hardware name: Qualcomm Technologies, Inc.
IPQ9574/AP-AL02-C2 (DT)
[ 8927.740327] pstate: 60400005 (nZCv daif +PAN -UAO)
[ 8927.747539] pc : nf_nat_setup_info+0x174/0xb10 [nf_nat]
[ 8927.752307] lr : nf_nat_setup_info+0x170/0xb10 [nf_nat]
[ 8927.757423] sp : ffffff80003a7230
[ 8927.762631] x29: ffffff80003a7230 x28: ffffff8004509a4c
[ 8927.766105] x27: ffffff8004509a4f x26: ffffff8004509ac0
[ 8927.771486] x25: ffffff80003a73a8 x24: 0000000000000003
[ 8927.776781] x23: 646f636e652031b8 x22: 0000000000000000
[ 8927.782076] x21: ffffffd0111f3fc0 x20: ffffff8004509a40
[ 8927.787371] x19: 646f636e65203198 x18: 0000000000000000
[ 8927.792665] x17: 0000000000000000 x16: 0000000000000000
[ 8927.797960] x15: 0000000000000000 x14: 3d3d3d3d3d3d3d3d
[ 8927.803257] x13: 3d3d3d3d3d3d3d3d x12: 3d3d3d3d3d3d3d3d
[ 8927.808552] x11: ffffffca0224e924 x10: 1ffffffa0224e924
[ 8927.813846] x9 : dfffffd000000000 x8 : ffffff80003a6eb8
[ 8927.819142] x7 : ffffffd011274927 x6 : 0000000000000000
[ 8927.824436] x5 : ffffffca0224e925 x4 : ffffffca0224e925
[ 8927.829732] x3 : ffffffd0100b28fc x2 : 0000000000000000
[ 8927.835028] x1 : 55d45a1ef4433200 x0 : 0000000000000006
[ 8927.840322] Call trace:
[ 8927.845624]  nf_nat_setup_info+0x174/0xb10 [nf_nat]
[ 8927.847793]  nf_nat_masquerade_ipv4+0x198/0x1d0 [nf_nat]
[ 8927.852653]  0xffffffd00a1100fc
[ 8927.858208]  ipt_do_table+0x740/0xa50 [ip_tables]
[ 8927.861071]  0xffffffd009d1003c
[ 8927.865933]  nf_nat_inet_fn+0x184/0x67c [nf_nat]
[ 8927.868886]  nf_nat_icmp_reply_translation+0x2e0/0x804 [nf_nat]
[ 8927.873749]  nf_nat_icmp_reply_translation+0x6fc/0x804 [nf_nat]
[ 8927.879390]  nf_hook_slow+0x54/0xdc
[ 8927.885291]  ip_output+0x1e0/0x23c
[ 8927.888761]  ip_forward_finish+0xe4/0xf8
[ 8927.892232]  nf_reinject+0x220/0x2b0
[ 8927.896314]  0xffffffd009f58188
[ 8927.899871]  0xffffffd009f59560
[ 8927.902739]  nfnetlink_unicast+0x324/0x500 [nfnetlink]
[ 8927.905864]  netlink_rcv_skb+0xdc/0x16c
[ 8927.911071]  nfnetlink_subsys_register+0xb54/0xb80 [nfnetlink]
[ 8927.914804]  netlink_unicast+0x1d4/0x2a4
[ 8927.920705]  netlink_sendmsg+0x3c8/0x460
[ 8927.924786]  sock_sendmsg+0x4c/0x68
[ 8927.928689]  __sys_sendto+0xcc/0x118
[ 8927.931902]  __arm64_sys_sendto+0x74/0x8c
[ 8927.935726]  el0_svc_common.constprop.0+0xdc/0x188
[ 8927.939633]  el0_svc_compat_handler+0x2c/0x38
[ 8927.944318]  el0_svc_compat+0x8/0x18
[ 8927.948750] Code: 91008277 91011a60 95a6f714 39431ba0 (39409ae1)
[ 8927.952392] ---[ end trace a8a9907564c52b89 ]---
========================================================================================================

In certail other instances we have seen use-after-free also

[ 5756.382147] ==================================================================
[ 5756.382189] BUG: KASAN: use-after-free in
nf_nat_setup_info+0x170/0xb10 [nf_nat]
[ 5756.388252] Read of size 1 at addr ffffff8000034686 by task fstunnel/23409
[ 5756.395800]
[ 5756.402484] CPU: 0 PID: 23409 Comm: fstunnel Tainted: P        W
     5.4.164 #0
[ 5756.404136] Hardware name: Qualcomm Technologies, Inc.
IPQ9574/AP-AL02-C2 (DT)
[ 5756.411513] Call trace:
[ 5756.418807]  dump_backtrace+0x0/0x1a8
[ 5756.421149]  show_stack+0x14/0x1c
[ 5756.424968]  dump_stack+0xe0/0x138
[ 5756.428266]  print_address_description.isra.5+0x30/0x330
[ 5756.431564]  __kasan_report+0x174/0x1c4
[ 5756.437032]  kasan_report+0xc/0x14
[ 5756.440591]  __asan_load1+0x58/0x60
[ 5756.444068]  nf_nat_setup_info+0x170/0xb10 [nf_nat]
[ 5756.447453]  nf_nat_masquerade_ipv4+0x198/0x1d0 [nf_nat]
[ 5756.452314]  0xffffffd00a0b00fc
[ 5756.457868]  ipt_do_table+0x740/0xa50 [ip_tables]
[ 5756.460732]  0xffffffd009ce003c
[ 5756.465594]  nf_nat_inet_fn+0x184/0x67c [nf_nat]
[ 5756.468546]  nf_nat_icmp_reply_translation+0x2e0/0x804 [nf_nat]
[ 5756.473408]  nf_nat_icmp_reply_translation+0x6fc/0x804 [nf_nat]
[ 5756.479049]  nf_hook_slow+0x54/0xdc
[ 5756.484950]  ip_output+0x1e0/0x23c
[ 5756.488421]  ip_forward_finish+0xe4/0xf8
[ 5756.491893]  nf_reinject+0x220/0x2b0
[ 5756.495976]  0xffffffd009790188
[ 5756.499531]  0xffffffd009791560
[ 5756.502400]  nfnetlink_unicast+0x324/0x500 [nfnetlink]
[ 5756.505525]  netlink_rcv_skb+0xdc/0x16c
[ 5756.510733]  nfnetlink_subsys_register+0xb54/0xb80 [nfnetlink]
[ 5756.514466]  netlink_unicast+0x1d4/0x2a4
[ 5756.520367]  netlink_sendmsg+0x3c8/0x460
[ 5756.524447]  sock_sendmsg+0x4c/0x68
[ 5756.528351]  __sys_sendto+0xcc/0x118
[ 5756.531562]  __arm64_sys_sendto+0x74/0x8c
[ 5756.535385]  el0_svc_common.constprop.0+0xdc/0x188
[ 5756.539290]  el0_svc_compat_handler+0x2c/0x38
[ 5756.543977]  el0_svc_compat+0x8/0x18
[ 5756.548402]
[ 5756.552046] The buggy address belongs to the page:
[ 5756.553527] page:fffffffeffe00d00 refcount:0 mapcount:-128
mapping:0000000000000000 index:0x0
[ 5756.558130] flags: 0x0()
[ 5756.566722] raw: 0000000000000000 ffffffff003f4008 ffffffff00892708
0000000000000000
[ 5756.569329] raw: 0000000000000000 0000000000000002 00000000ffffff7f
0000000000000000
[ 5756.577051] page dumped because: kasan: bad access detected
[ 5756.584774]
[ 5756.590066] Memory state around the buggy address:
[ 5756.591808]  ffffff8000034580: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[ 5756.596412]  ffffff8000034600: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[ 5756.603615] >ffffff8000034680: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[ 5756.610819]                    ^
[ 5756.618021]  ffffff8000034700: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[ 5756.621411]  ffffff8000034780: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[ 5756.628439] ==================================================================


Some debugging from our side shows the that memory violation has
happened in below function
while using the tuple fetched from ct tuplehash.

nf_nat_setup_info->get_unique_tuple->find_appropriate_src->same_src

This suggests that there could be a corrupted/already freed entry in
nat_bysource table.


Can anybody help in this regards?
- Any suggestions to further narrow the problem
- Similar known problems or any patches in later versions?


Regards,
Shibu
