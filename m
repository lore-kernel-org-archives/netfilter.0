From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: cannot create a nat type base (pre/post routing) chain
Date: Wed, 29 Apr 2020 11:36:13 +0200
Message-ID: <daa384d8-51eb-adfa-4872-fcc188c2b931@aimvalley.nl>
References: <690dfdf6-8a72-f6a1-8b36-f92fcc458331@aimvalley.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <690dfdf6-8a72-f6a1-8b36-f92fcc458331@aimvalley.nl>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hmmm. when I builtin nf_tables in the kernel, it works, see:


root@OpenWrt:~# gzip -dc /proc/config.gz | grep NFT_
CONFIG_NFT_NUMGEN=y
CONFIG_NFT_CT=y
CONFIG_NFT_FLOW_OFFLOAD=m
CONFIG_NFT_COUNTER=y
CONFIG_NFT_CONNLIMIT=y
CONFIG_NFT_LOG=y
CONFIG_NFT_LIMIT=y
CONFIG_NFT_MASQ=y
CONFIG_NFT_REDIR=y
CONFIG_NFT_NAT=y
CONFIG_NFT_TUNNEL=y
CONFIG_NFT_OBJREF=y
CONFIG_NFT_QUOTA=y
CONFIG_NFT_REJECT=y
CONFIG_NFT_REJECT_INET=y
CONFIG_NFT_HASH=y
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_REJECT_IPV4=y
# CONFIG_NFT_DUP_IPV4 is not set
# CONFIG_NFT_FIB_IPV4 is not set
CONFIG_NFT_REJECT_IPV6=y
# CONFIG_NFT_DUP_IPV6 is not set
# CONFIG_NFT_FIB_IPV6 is not set
# CONFIG_NFT_BRIDGE_META is not set
# CONFIG_NFT_BRIDGE_REJECT is not set
root@OpenWrt:~# gzip -dc /proc/config.gz | grep NF_T
CONFIG_NF_TABLES=y
CONFIG_NF_TABLES_SET=y
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
# CONFIG_NF_TPROXY_IPV4 is not set
CONFIG_NF_TABLES_IPV4=y
# CONFIG_NF_TABLES_ARP is not set
# CONFIG_NF_TPROXY_IPV6 is not set
CONFIG_NF_TABLES_IPV6=y
CONFIG_NF_TABLES_BRIDGE=y
root@OpenWrt:~# lsmod | grep nf_table
root@OpenWrt:~# lsmod | grep nft_
nf_dup_netdev          16384  2 nft_fwd_netdev,nft_dup_netdev
nf_flow_table          24576  5 nft_flow_offload,nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nf_flow_table_hw
nft_dup_netdev         16384  0
nft_flow_offload       16384  0
nft_fwd_netdev         16384  0
root@OpenWrt:~# lsmod | grep ipt
root@OpenWrt:~# uname -a
Linux OpenWrt 5.4.34 #0 SMP Thu Apr 23 16:39:48 2020 aarch64 GNU/Linux
root@OpenWrt:~# nft list ruleset
table ip nat {
	chain postrouting {
		type nat hook postrouting priority srcnat; policy accept;
	}

	chain prerouting {
		type nat hook prerouting priority filter; policy accept;
	}
}
root@OpenWrt:~#


I guess it's some kind of openwrt nf_tables (module) build/incompatibility problem!?




On 2020-04-28 15:38, Norbert van Bolhuis wrote:
> Hi All,
> 
> For some reason I cannot create a base (pre/post routing) chain in my nat table.
> I'm doing:
> 
> # nft list ruleset
> table ip nat {
> }
> 
> # nft add chain nat postrouting { type nat hook postrouting priority 100 \; }
> Error: Could not process rule: No such file or directory
> add chain nat postrouting { type nat hook postrouting priority 100 ; }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> # nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
> Error: Could not process rule: No such file or directory
> add chain nat prerouting { type nat hook prerouting priority 0 ; }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> 
> I'm using:
> 
> # nft -v
> nftables v0.9.3 (Topsy)
> # uname -a
> Linux OpenWrt 5.4.34 #0 SMP Thu Apr 23 16:39:48 2020 aarch64 GNU/Linux
> 
> 
> and I'm following:
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)
> 
> 
> I guess all required kernel modules are loaded, see:
> # lsmod | grep nf_table
> nf_tables             122880 22 
> nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_reject_ipv6,nft_reject_ipv4,nft_reject_inet,nft_reject,nft_redir,nft_quota,nft_objref,nft_numgen,nft_nat,nft_masq,nft_log,nft_limit,nft_hash,nft_fwd_netdev,nft_flow_offload,nft_dup_netdev,nft_ct,nft_counter,nf_tables_set 
> 
> nf_tables_set          28672  0
> nfnetlink              16384  1 nf_tables
> # lsmod | grep nft_
> nf_conntrack           86016  8 nft_redir,nft_nat,nft_masq,nft_flow_offload,nft_ct,nf_nat,nf_flow_table,nf_conntrack_rtcache
> nf_dup_netdev          16384  2 nft_fwd_netdev,nft_dup_netdev
> nf_flow_table          24576  5 nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_flow_offload,nf_flow_table_hw
> nf_nat                 36864  3 nft_redir,nft_nat,nft_masq
> nf_reject_ipv4         16384  2 nft_reject_ipv4,nft_reject_inet
> nf_reject_ipv6         16384  2 nft_reject_ipv6,nft_reject_inet
> nf_tables             122880 22 
> nf_flow_table_ipv6,nf_flow_table_ipv4,nf_flow_table_inet,nft_reject_ipv6,nft_reject_ipv4,nft_reject_inet,nft_reject,nft_redir,nft_quota,nft_objref,nft_numgen,nft_nat,nft_masq,nft_log,nft_limit,nft_hash,nft_fwd_netdev,nft_flow_offload,nft_dup_netdev,nft_ct,nft_counter,nf_tables_set 
> 
> nft_counter            16384  0
> nft_ct                 20480  0
> nft_dup_netdev         16384  0
> nft_flow_offload       16384  0
> nft_fwd_netdev         16384  0
> nft_hash               16384  0
> nft_limit              16384  0
> nft_log                16384  0
> nft_masq               16384  0
> nft_nat                16384  0
> nft_numgen             16384  0
> nft_objref             16384  0
> nft_quota              16384  0
> nft_redir              16384  0
> nft_reject             16384  3 nft_reject_ipv6,nft_reject_ipv4,nft_reject_inet
> nft_reject_inet        16384  0
> nft_reject_ipv4        16384  0
> nft_reject_ipv6        16384  0
> 
> iptable_nat module isn't loaded:
> # lsmod | grep ipt
> #
> 
> 
> Anybody know what is wrong? or how I can (easily) find out what is wrong?
> 
> Thanks.
> 
> ---
> Norbert
