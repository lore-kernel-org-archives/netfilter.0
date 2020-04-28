From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: cannot create a nat type base (pre/post routing) chain
Date: Tue, 28 Apr 2020 15:38:30 +0200
Message-ID: <690dfdf6-8a72-f6a1-8b36-f92fcc458331@aimvalley.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>

Hi All,

For some reason I cannot create a base (pre/post routing) chain in my nat table.
I'm doing:

# nft list ruleset
table ip nat {
}

# nft add chain nat postrouting { type nat hook postrouting priority 100 \; }
Error: Could not process rule: No such file or directory
add chain nat postrouting { type nat hook postrouting priority 100 ; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
Error: Could not process rule: No such file or directory
add chain nat prerouting { type nat hook prerouting priority 0 ; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


I'm using:

# nft -v
nftables v0.9.3 (Topsy)
# uname -a
Linux OpenWrt 5.4.34 #0 SMP Thu Apr 23 16:39:48 2020 aarch64 GNU/Linux


and I'm following:

https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)


I guess all required kernel modules are loaded, see:
# lsmod | grep nf_table
nf_tables             122880 22 
nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_reject_ipv6,nft_reject_ipv4,nft_reject_inet,nft_reject,nft_redir,nft_quota,nft_objref,nft_numgen,nft_nat,nft_masq,nft_log,nft_limit,nft_hash,nft_fwd_netdev,nft_flow_offload,nft_dup_netdev,nft_ct,nft_counter,nf_tables_set
nf_tables_set          28672  0
nfnetlink              16384  1 nf_tables
# lsmod | grep nft_
nf_conntrack           86016  8 nft_redir,nft_nat,nft_masq,nft_flow_offload,nft_ct,nf_nat,nf_flow_table,nf_conntrack_rtcache
nf_dup_netdev          16384  2 nft_fwd_netdev,nft_dup_netdev
nf_flow_table          24576  5 nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_flow_offload,nf_flow_table_hw
nf_nat                 36864  3 nft_redir,nft_nat,nft_masq
nf_reject_ipv4         16384  2 nft_reject_ipv4,nft_reject_inet
nf_reject_ipv6         16384  2 nft_reject_ipv6,nft_reject_inet
nf_tables             122880 22 
nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_reject_ipv6,nft_reject_ipv4,nft_reject_inet,nft_reject,nft_redir,nft_quota,nft_objref,nft_numgen,nft_nat,nft_masq,nft_log,nft_limit,nft_hash,nft_fwd_netdev,nft_flow_offload,nft_dup_netdev,nft_ct,nft_counter,nf_tables_set
nft_counter            16384  0
nft_ct                 20480  0
nft_dup_netdev         16384  0
nft_flow_offload       16384  0
nft_fwd_netdev         16384  0
nft_hash               16384  0
nft_limit              16384  0
nft_log                16384  0
nft_masq               16384  0
nft_nat                16384  0
nft_numgen             16384  0
nft_objref             16384  0
nft_quota              16384  0
nft_redir              16384  0
nft_reject             16384  3 nft_reject_ipv6,nft_reject_ipv4,nft_reject_inet
nft_reject_inet        16384  0
nft_reject_ipv4        16384  0
nft_reject_ipv6        16384  0

iptable_nat module isn't loaded:
# lsmod | grep ipt
#


Anybody know what is wrong? or how I can (easily) find out what is wrong?

Thanks.

---
Norbert
