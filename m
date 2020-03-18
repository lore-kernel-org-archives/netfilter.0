From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2 | kernel 4.19.93] flowtable throws error on
 deployment (not on check however)
Date: Wed, 18 Mar 2020 16:46:08 +0000
Message-ID: <513b3942-8b97-bb22-c608-6076c932c4f7@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584549956;
        bh=oPo68t/lX//ekBdCvH37gx09vs/EMOZbFGPXkoZEJD0=;
        h=X-UI-Sender-Class:Reply-To:From:Subject:To:Date;
        b=I+4vYcyPzVCVdNJVhcIqCwtyXyLyB9esvh2+lfbMZiWExvnFzd8xjfz/WEtydwscK
         KJXc84RUZ/h9PWUrbMw9AJwOBZ3GOLmdKLoEn9EqJS3qAgQ8o9de8xIRlVYkwxQlyd
         d1TKVW4D/NAaplo3rFW4jKxqSSouWyCFsrt5yxuY=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Trying to get flowtables to work but hitting a bit of a snag. Whilst nft
-cf /path/to/conf (strangely) does not produce any error on deployment
nft -f /path/to/conf it throws this error however:

Error: Could not process rule: Not supported
ip protocol tcp flow offload @ft
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

table inet filter {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flowtable f {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 hook ingress priority filter
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 devices =3D { pppoe-wan, lan0, lan1, lan2, lan3, lan4,
br-lan }
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 type filter hook input priority filter; policy drop;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ip protocol tcp flow offload @f
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ct state established,related accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ct state invalid drop
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
}

_________

kernel conf

CONFIG_NFT_FLOW_OFFLOAD=3Dm
CONFIG_NF_FLOW_TABLE_INET=3Dm
CONFIG_NF_FLOW_TABLE=3Dm
CONFIG_NF_FLOW_TABLE_HW=3Dm
CONFIG_NETFILTER_XT_TARGET_FLOWOFFLOAD=3Dm
CONFIG_NF_FLOW_TABLE_IPV4=3Dm
CONFIG_NF_FLOW_TABLE_IPV6=3Dm
CONFIG_NET_CLS_FLOW=3Dm
CONFIG_NET_CLS_FLOWER=3Dm
CONFIG_NET_FLOW_LIMIT=3Dy

_________

lsmod | grep flow

cls_flow=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 20480=C2=A0 0
nf_conntrack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8=
1920 44
nf_nat_pptp,nf_conntrack_pptp,xt_state,xt_nat,xt_helper,xt_conntrack,xt_co=
nnmark,xt_connlimit,xt_connbytes,xt_REDIRECT,xt_CT,nft_redir_ipv6,nft_redi=
r_ipv4,nft_redir,nft_nat,nft_masq_ipv6,nft_masq_ipv4,nft_masq,nft_flow_off=
load,nft_ct,nf_nat_tftp,nf_nat_snmp_basic,nf_nat_sip,nf_nat_irc,nf_nat_ipv=
6,nf_nat_ipv4,nf_nat_h323,nf_nat_ftp,nf_nat_amanda,nf_nat,nf_flow_table,nf=
_conntrack_tftp,nf_conntrack_snmp,nf_conntrack_sip,nf_conntrack_proto_gre,=
nf_conntrack_netlink,nf_conntrack_irc,nf_conntrack_h323,nf_conntrack_ftp,n=
f_conntrack_broadcast,nf_conntrack_amanda,nf_conncount,sch_cake,nf_conntra=
ck_rtcache
nf_flow_table=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24576=
=C2=A0 6
nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,xt_FLOWOFFLOAD,nf=
t_flow_offload,nf_flow_table_hw
nf_flow_table_hw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=A0 1
nf_flow_table_inet=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=A0 0
nf_flow_table_ipv4=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=A0 0
nf_flow_table_ipv6=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=A0 0
nf_tables=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 98304 32
nft_fib_inet,nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_=
reject_ipv6,nft_reject_ipv4,nft_reject_inet,nft_reject_bridge,nft_reject,n=
ft_redir_ipv6,nft_redir_ipv4,nft_redir,nft_quota,nft_numgen,nft_nat,nft_ma=
sq_ipv6,nft_masq_ipv4,nft_masq,nft_log,nft_limit,nft_fwd_netdev,nft_flow_o=
ffload,nft_fib_ipv6,nft_fib_ipv4,nft_fib,nft_dup_netdev,nft_ct,nft_counter=
,nft_chain_route_ipv6,nft_chain_route_ipv4,nft_chain_nat_ipv6,nft_chain_na=
t_ipv4
nft_flow_offload=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=A0 0

